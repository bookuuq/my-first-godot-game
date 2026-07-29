# 项目架构与变更日志

> 最后更新：2026-07-29 | 作者：bookus + Claude
> 
> 本文档是「中枢神经系统」的说明书——记录架构全貌、技能清单、数据流，以及每一次变更的原因和内容。

---

## 一、项目目标

以独立游戏开发者为目标，从零开始学习。不是学完一个教程就换下一个，而是建立一个**闭环的、可长期维护的个人创作基础设施**——代码、笔记、技能、进度、画像，全部相互呼应，不丢不散。

---

## 二、架构总览

```
                    ┌───────────────────────────┐
                    │    roadmap.json (GitHub)   │
                    │    唯一真实来源 (SSOT)       │
                    │    进度 / 技能树 / 日志      │
                    └─────┬─────┬─────┬─────────┘
                   读/写   读/写   读/写   读
                     │       │      │      │
              ┌──────┴──┐ ┌──┴───┐ ┌┴────┐ ┌┴──────┐
              │ learn-  │ │quick-│ │godot│ │profile-│
              │ review  │ │save  │ │research│distill│
              └────┬────┘ └──┬───┘ └──┬──┘ └───┬───┘
                   │         │        │         │
                   ↓         ↓        ↓         ↓
              ┌────────┐ ┌───────┐ ┌──────┐ ┌────────┐
              │ 看板/   │ │Godot  │ │笔记  │ │用户画像 │
              │ README │ │代码   │ │文档  │ │memory  │
              └────────┘ └───────┘ └──────┘ └────────┘

  自动化层 (scheduled)
  ├── daily-game-dev-news (每日 9:00)
  └── auto-sync-godot    (每晚 23:00)
```

### 数据流向

```
学习/实战
  │
  ├─→ godot-research ─→ notes/*.md ─→ roadmap.json (notes[]) ─→ GitHub
  │
  ├─→ 写代码 ─→ quick-save ─→ learn/*.gd → GitHub
  │                              └─→ roadmap.json (codebase[])
  │
  └─→ learn-review ─→ roadmap.json (milestones, skillTree, learningLog)
       └─→ README.md ←── 从 roadmap.json 渲染
       └─→ memory/user-profile.md
```

---

## 三、技能清单与接入状态

| 技能 | 状态 | 中枢接入 | 说明 |
|------|------|----------|------|
| `learn-review` | 🔴 待修 | 否 | 核心回路断裂，指着已死的旧 session 路径 |
| `quick-save` | 🟡 半接 | 否 | 能推代码但不更新 roadmap.json |
| `godot-research` | 🟡 半接 | 否 | 能推笔记但不更新 roadmap.json |
| `canvas-design` | 🟢 正常 | 否 | 产出素材，后续接美术技能树 |
| `find-skills` | 🟢 正常 | 不适用 | 元技能，不需要接中枢 |
| `skill-creator` | 🟢 正常 | 不适用 | 元技能，不需要接中枢 |
| `profile-distill` | 🟢 正常 | 否 | 蒸馏画像，后续应同步检查 roadmap.json |

---

## 四、中枢文件 `roadmap.json` 结构

```
root/
├── meta               项目元信息（版本、更新时间、仓库）
├── progress           进度追踪
│   ├── completedMilestones[]   已完成里程碑
│   ├── currentMilestone        当前进行中
│   └── nextSteps[]             待办清单（含优先级）
├── skillTree          五维技能树（gdscript/godot/gameDesign/art/tools）
│   └── each: { level, maxLevel, topics[], nextTopics[] }
├── codebase           代码清单
│   ├── scripts[]              { path, role, status, lastModified }
│   └── scenes[]               { path, role, status, lastModified }
├── notes              笔记清单
│   └── each: { path, topic, date, status, linkedMilestone }
├── learningLog        学习日志
│   └── each: { date, topic, duration, summary }
```

---

## 五、变更日志

### 2026-07-29 — 中枢神经系统初始化

**背景**：用户要求构建用户画像 + 蒸馏机制。摸底发现 learn-review 技能依赖的仪表盘文件 session 已死，看板不存在；README 是静态旧快照；笔记与代码之间无关联。整个系统"有骨架但缺肉"，回路断裂。

**变更内容**：

1. **新建 `roadmap.json`** — 推送至 `bookuuq/my-first-godot-game` 根目录，作为项目唯一真实来源。包含：meta、progress（2 个已完成里程碑 + 1 个进行中 + 6 个下一步）、skillTree（5 维）、codebase（3 个脚本 + 3 个场景）、notes（2 条）、learningLog（3 条）。

2. **更新 `README.md`** — 不再手写静态内容，改为摘要 + 跳转到 roadmap.json 的指引。

3. **新建 `user-profile.md`** — 存入 memory，包含完整的用户画像：身份、项目、技能、工作流、沟通风格。新增"工作风格"板块（偏行动、系统思维）。

4. **新建 `profile-distill` 技能** — 从对话中蒸馏关键信息，持续更新画像。

5. **新建 `architecture-changelog.md`（本文档）** — 记录架构全貌和每一次变更。

**影响范围**：
- `learn-review`：需要重写，改用 roadmap.json
- `quick-save`：需要补齐，推送后更新 roadmap.json codebase
- `godot-research`：需要补齐，推送笔记后更新 roadmap.json notes + learningLog
- `profile-distill`：后续应同步检查 roadmap.json

**当前系统状态**：中枢已就位，3 条回路待接。TODO 序列见下一节。

---

## 六、待办

- [ ] **P0**：重写 `learn-review` — 核心回路。读 roadmap.json → 对话提取 → 写回 + GitHub 同步 → 更新 README
- [ ] **P1**：补接 `quick-save` — 推送代码后自动更新 roadmap.json codebase[]
- [ ] **P1**：补接 `godot-research` — 推送笔记后自动更新 roadmap.json notes[] + learningLog[]
- [ ] **P2**：补接 `profile-distill` — 蒸馏时同步检查 roadmap.json skillTree 是否有变化
- [ ] **P2**：清理 stale 文件 — GitHub 根目录的 color_rect.gd 和 node_2d.tscn 与 learn/ 下重复
