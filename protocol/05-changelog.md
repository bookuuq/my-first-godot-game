# protocol/05 — 变更日志

## 2026-07-29 — quick-save + godot-research 接中枢

**类型**: 技能重写
**触发**: 按 proposal/06 方案，gpt-5.5 两轮验证通过后实施

**变更**:
- quick-save: 推送代码后自动更新 roadmap.json codebase (path 去重，SHA 乐观锁)
- godot-research: 推送笔记后自动更新 roadmap.json notes + learningLog + skillTree
- 统一 updateRoadmap 模式: 拉取 → patch → 校验 → push → 冲突重试 3 次
- protocol/01-architecture.md: quick-save 🟡→🟢, godot-research 🟡→🟢

**影响**: 三条核心回路（learn-review + quick-save + godot-research）全部接入中枢。所有技能产出物自动归档到 roadmap.json。

---

## 2026-07-29 — learn-review 重写

**类型**: 技能重写
**变更**:
- 旧版读写已死 session 路径 → 新版直接读写 GitHub roadmap.json
- protocol/01-architecture.md: 🔴→🟢

---

## 2026-07-29 — 新增 wawazz skill

**类型**: 功能新增
**新增**: wawazz skill (bash curl → wawazz.xyz), gpt-5.5 验证 pipeline

---

## 2026-07-29 — 协议体系初始化

**类型**: 架构变更
**新增**: PROTOCOL.md + protocol/00-06 全部

---

## 2026-07-29 — 中枢神经系统初始化

**类型**: 架构变更
**新增**: roadmap.json, user-profile.md, profile-distill
