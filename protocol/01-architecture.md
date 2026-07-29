# protocol/01 — 系统架构

> 最后更新: 2026-07-29

## 数据流

```
roadmap.json (GitHub) ← 唯一真实来源
  ↑ 读/写            ↑ 读/写           ↑ 读/写          ↑ 读
learn-review      quick-save      godot-research   profile-distill
  ↓                  ↓               ↓                ↓
更新里程碑/技能树   更新 codebase    更新 notes/log    更新用户画像

wawazz.xyz ← 文本模型能力（辅助层）
  ↑ 调用
godot-research / 翻译 / 代码审查 / 命名

gpt-5.5 ← 方案验证（跨 AI 协作）
  ↑ 验证
proposals/ 目录下的方案
```

## 技能注册表

| 技能 | 协议文件 | 状态 | 作用 | 修改文件 |
|------|----------|------|------|----------|
| learn-review | `protocol/03-skills/learn-review.md` | 🟢 正常 | 学习复盘 | roadmap.json, README.md |
| quick-save | `protocol/03-skills/quick-save.md` | 🟢 正常 | 推送代码 | learn/*, roadmap.json |
| godot-research | `protocol/03-skills/godot-research.md` | 🟢 正常 | 搜索教程 | notes/*, roadmap.json |
| wawazz | `protocol/03-skills/wawazz.md` | 🟢 正常 | 文本模型调用 | — |
| canvas-design | — | 🟢 | 视觉素材 | — |
| find-skills | — | 🟢 | 发现技能 | — |
| skill-creator | — | 🟢 | 创建技能 | — |
| profile-distill | — | 🟢 | 蒸馏画像 | user-profile.md |

## 文件结构 (GitHub)

```
my-first-godot-game/
├── PROTOCOL.md              ← AI 入口
├── SYSTEM-OVERVIEW.md       ← 大项目全景
├── roadmap.json             ← 数据中枢
├── README.md                ← 人类入口
├── ARCHITECTURE.md          ← 旧版（保留参考）
├── protocol/                ← 协议文件目录
│   ├── 00-identity.md
│   ├── 01-architecture.md
│   ├── 02-roadmap-schema.md
│   ├── 03-skills/
│   │   ├── learn-review.md
│   │   ├── quick-save.md
│   │   ├── godot-research.md
│   │   └── wawazz.md
│   ├── 04-tools.md
│   ├── 05-changelog.md
│   └── 06-operations.md
├── learn/                   ← Godot 项目 (.gd, .tscn)
├── notes/                   ← 学习笔记 (.md)
└── assets/                  ← 预留：游戏素材
```

## 外部协作

- **验证 AI (gpt-5.5)**: 读 proposals/ 目录方案 → 判断可行性 → 返回修改意见
- **其他 AI**: 读 PROTOCOL.md 入口 → 按需读 protocol/ → 独立执行 → 跑交叉验证

## 自动化

- `daily-game-dev-news`: 每日 9:00，抓取游戏/GitHub 新闻
- `auto-sync-godot`: 每晚 23:00，检测 Godot 改动推送
