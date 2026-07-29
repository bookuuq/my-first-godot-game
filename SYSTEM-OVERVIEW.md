# Game Developer Factory — 大项目全景

> 最后更新: 2026-07-29 | 来源: Claude 全系统摸底

## 一、项目性质

这不是一个 Game Project。这是一个 **Game Developer Factory**——独立的游戏创作体系，包含三条生产线：

1. **游戏产线**: Godot 2D 项目 — 从零学开发，做游戏
2. **素材产线**: 生图 MCP — 像素画、角色、道具、场景
3. **知识产线**: 笔记 + 研究 + 复盘 — 把学习变成资产

三条线由中枢 (`roadmap.json`) 串成一个回环：学习 → 研究 → 编码 → 复盘 → 存档 → 再生产。

## 二、三条产线详细

### 产线 1: 游戏

```
Godot 4.7.1 (D:\Godot_v4.7.1\Project\learn\, 本地)
│
├── Player    ✅ 紫色 ColorRect, 方向键, clamp 边界
├── Enemy     ✅ 红色 ColorRect, 追踪玩家, speed=200
│
├── 碰撞检测   📝 笔记有 🔴 代码无 (m3)
├── 敌人生成   📝 笔记有 🔴 代码无 (m3)
│
├── 计分      🔜 ns3
├── 生命/血条  🔜 ns4
├── HUD UI    🔜 ns5
├── 游戏结束   🔜 ns6
│
└── GitHub: learn/ (active), 根目录 (stale 重复)
```

**下一步**: 实现碰撞检测 + 敌人生成 (m3)，把笔记变成代码。

### 产线 2: 素材

```
image-gen MCP (D:\Claude work\mcp-image-gen\image_gen_mcp.py)
│
├── API 中转: wawazz.xyz/v1 (当前), wawapii.com (已停用)
├── 生图模型: gpt-image-2
├── 像素管线: 1024×1024 → NEAREST 缩放 → 色板量化 → 放大展示
├── Aseprite: Steam 版, subprocess 非阻塞打开
├── 输出目录: D:\图片\ai生图\
│
└── Artifact: pixel-workbench (生图/画廊/设置)
```

**下一步**: MCP config 切到 wawazz.xyz，暂不需要代码改动。

### 产线 3: 知识

```
notes/ (GitHub) ← godot-research 产出
├── 碰撞检测.md (2026-07-26, researched, m3)
└── enemy-spawning.md (2026-07-26, researched, m3)

learningLog (roadmap.json)
├── 07-24: Godot 基础 2h
├── 07-26: 碰撞检测 1h
└── 07-26: 敌人生成 1h

skillTree (roadmap.json)
├── gdscript  Lv.1  ██░░░
├── godot     Lv.1  ██░░░
├── gameDesign Lv.0 ░░░░░
├── art        Lv.0 ░░░░░
└── tools     Lv.2  ████░
```

**下一步**: 笔记和代码之间有 gap——碰撞检测和敌人生成研究完了但没落地，learn-review 核心回路还没修。

## 三、配套系统

```
协议层 (GitHub protocol/)
├── PROTOCOL.md         AI 入口 (<50行)
├── 00-identity.md      身份 + 偏好
├── 01-architecture.md  架构 + 技能注册表
├── 02-roadmap-schema.md 数据契约
├── 03-skills/          技能说明书 (4文件)
├── 04-tools.md         工具 + API 清单
├── 05-changelog.md     变更历史
├── 06-operations.md    操作手册 + 交叉验证
└── proposals/          方案审核 (2文件)

技能层 (Claude 本地 8 个)
├── learn-review    🔴 待重写
├── quick-save      🟡 缺中枢更新
├── godot-research  🟡 缺中枢更新
├── wawazz          🟢 正常 (新建)
├── canvas-design   🟢 正常
├── find-skills     🟢 正常
├── skill-creator   🟢 正常
└── profile-distill 🟢 正常

自动化层 (scheduled)
├── daily-game-dev-news  每日 9:00
└── auto-sync-godot      每晚 23:00

记忆层 (memory/)
├── user-profile.md
├── godot-learning-project.md
├── image-gen-mcp.md
└── arch-changelog.md

展示层 (Artifacts)
├── game-dev-dashboard   游戏开发仪表盘 (数据源断裂)
├── pixel-workbench      像素图工作台
└── daily-attention-briefing  每日简报
```

## 四、健康度评估

| 维度 | 得分 | 说明 |
|------|------|------|
| 协议体系 | 9/10 | 完整，路由清晰，支持多 AI |
| 中枢数据 | 7/10 | roadmap.json 存在但 learn-review 未接 |
| 技能回路 | 5/10 | 4个核心技能 3个半断 |
| 游戏代码 | 3/10 | 2周前水平，笔记→代码 gap |
| 素材管线 | 8/10 | MCP 正常，待切端点 |
| 自动化 | 7/10 | 2个定时任务，无交叉验证自动化 |
| 展示层 | 4/10 | 3个 Artifact，数据源均断裂需重建 |

## 五、优先级 (P0→P3)

- [ ] **P0**: 重写 `learn-review` — 修复核心回路，笔记→代码 gap
- [ ] **P0**: 落地 m3 代码 — 碰撞检测 + 敌人生成
- [ ] **P1**: 生图 MCP 端点从 wawapii 切到 wawazz (config 改动)
- [ ] **P1**: `godot-research` 接中枢 — 笔记产出自动更新 roadmap
- [ ] **P1**: `quick-save` 接中枢 — 代码推送自动更新 codebase 清单
- [ ] **P2**: 清理 GitHub 根目录 stale 文件
- [ ] **P2**: 重建 game-dev-dashboard Artifact，数据源接 roadmap.json
- [ ] **P3**: `profile-distill` 联动 roadmap skillTree
- [ ] **P3**: 交叉验证自动化 (定时运行)

## 六、外部协作面

- **其他 AI**: 读 PROTOCOL.md → 按需读 protocol/ → 独立干活 → 跑交叉验证
- **验证 AI**: 读 proposals/ → 判断可行性 → 返回修改意见
- **用户**: 决策、编码、学习 — 中枢自动跟踪进度
