# my-first-godot-game

零基础新手用 Godot 标准版学做 2D 游戏 —— 成为独立游戏开发者的第一步。

> 📋 详细进度、技能树、学习日志见 [roadmap.json](roadmap.json) — 这是项目的中枢神经文件。

## 已完成

- ✅ 创建 2D 场景 (Node2D)
- ✅ Player 角色：紫色 ColorRect，方向键移动 (speed=400)
- ✅ 边界限制 (clamp)
- ✅ Enemy 角色：红色 ColorRect，自动追踪玩家 (speed=200)
- 📝 研究：碰撞检测 (CharacterBody2D + Area2D) — [笔记](notes/碰撞检测.md)
- 📝 研究：敌人生成 (preload + instantiate + Timer) — [笔记](notes/enemy-spawning.md)

## 进行中

- 🔄 碰撞检测 + 敌人生成代码落地

## 下一步

- 🔜 计分 / 生命系统
- 🔜 HUD UI
- 🔜 游戏结束 + 重新开始

## 技能树

| 领域 | 等级 | 进度 |
|------|------|------|
| GDScript | Lv.1 | ██░░░ |
| Godot 引擎 | Lv.1 | ██░░░ |
| 游戏设计 | Lv.0 | ░░░░░ |
| 美术 | Lv.0 | ░░░░░ |
| 工具链 | Lv.2 | ████░ |

## 项目结构

```
/
├── learn/           # Godot 项目 (.gd, .tscn, project.godot)
├── notes/           # 学习笔记 (.md)
├── roadmap.json     # 中枢神经文件 — 进度、技能树、日志
└── README.md        # 本文件
```
