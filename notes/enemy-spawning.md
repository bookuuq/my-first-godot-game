# 敌人自动生成（Enemy Spawning）

> 学习日期：2026-07-26

## 核心概念

### 为什么要做成独立场景？

现在的 Enemy 是直接放在主场景里的一个节点。要让敌人自动生成，需要把 Enemy 做成**独立场景**（.tscn 文件），就像一个「敌人模板」—— 刷怪的时候，用这个模板复制出一个个敌人。

**比喻**：Enemy.tscn 是一个印章，每次盖一下就在屏幕上印出一个新的红色方块。

### 三个关键步骤

1. **preload** — 把敌人场景预先装进内存（只加载一次，不重复读硬盘）
2. **instantiate()** — 用模板「复制」出一个敌人实例
3. **add_child()** — 把复制出来的敌人放进场景树（不放进去它就不会出现）

### Timer 节点

Timer 就像一个闹钟：到了设定时间，就发出 `timeout` 信号。我们在这时生成一个敌人。

关键属性：
- **Wait Time**：等几秒响一次（比如 2.0 = 每 2 秒生一个敌人）
- **One Shot**：只响一次还是循环（默认关 = 一直循环）
- **Autostart**：场景加载时自动开始计时

## 实战代码

### 步骤 1：把 Enemy 做成独立场景

右键场景面板里的 Enemy 节点 → 「将分支另存为场景」→ 保存为 `enemy.tscn`

### 步骤 2：创建 Spawner

主场景中新建 `Node2D`，命名为 `EnemySpawner`，添加子节点 `Timer`。

### 步骤 3：Spawner 脚本

```gdscript
extends Node2D

# 预加载敌人模板
var enemy_scene = preload("res://enemy.tscn")

@onready var timer = $Timer

func _ready():
    # 每 2 秒生成一个敌人
    timer.wait_time = 2.0
    timer.start()

func _on_timer_timeout():
    # 1. 复制模板
    var enemy = enemy_scene.instantiate()
    # 2. 放到场景里
    add_child(enemy)
    # 3. 随机位置：x 在 50~1100，y 在 50~600（根据窗口调）
    enemy.position = Vector2(randf_range(50, 1100), randf_range(50, 600))
```

### 步骤 4：连接信号

选中 Timer → 右侧 Node 面板 → 双击 `timeout()` 信号 → 连接到 EnemySpawner → 自动生成 `_on_timer_timeout()` 函数。

### 进阶：限制最大敌人数

```gdscript
var max_enemies = 10
var enemy_count = 0

func _on_timer_timeout():
    if enemy_count >= max_enemies:
        timer.stop()
        return
    
    var enemy = enemy_scene.instantiate()
    add_child(enemy)
    enemy.position = Vector2(randf_range(50, 1100), randf_range(50, 600))
    enemy_count += 1
```

## 新手常见错误

| 问题 | 原因 | 解决 |
|------|------|------|
| 没报错但看不到敌人 | 忘了 `add_child()` | 检查脚本有没有写这行 |
| Timer 不触发 | 没连接信号或没 `start()` | 检查信号连接 + `_ready()` 里有没有 `timer.start()` |
| 敌人出现在奇怪位置 | 坐标超出屏幕 | 调 `randf_range` 参数，匹配你的窗口大小 |
| 敌人不会追踪玩家 | Enemy 脚本里 `get_node("../Player")` 路径变了 | 如果用 SpawnedEnemies 包裹，改为 `get_node("../../Player")` 或 `get_tree().get_first_node_in_group("Player")` |

## 参考链接

- [Godot Forum: how to make spawner in my 2D game](https://forum.godotengine.org/t/how-to-make-spawner-in-my-2d-game/80065/4)
- [GDscript spawner - StackOverflow](https://stackoverflow.com/questions/77500479/gdscript-spawner)
- [Godot 官方文档: 你的第一个 2D 游戏 - 主场景](https://docs.godotengine.org/zh-cn/4.3/getting_started/first_2d_game/05.the_main_game_scene.html)
