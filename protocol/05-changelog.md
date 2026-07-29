# protocol/05 — 变更日志

## 2026-07-29 — learn-review 重写

**类型**: 技能重写
**触发**: 旧版指向已死 session 路径，核心回路断裂。按 proposal/05 方案重写。

**变更**:
- learn-review SKILL.md 重写 (save_skill overwrite)
  - 旧: 读本地假仪表盘 JSON/HTML → 写已死 session 路径
  - 新: 读 GitHub roadmap.json (带 SHA) → 更新 → push → 渲染 README → 交叉验证
- protocol/03-skills/learn-review.md 更新
- protocol/01-architecture.md 技能状态: 🔴→🟢

**影响**: 中枢核心回路恢复。用户学完后复盘自动归类到 roadmap.json，READ  ME 实时同步。

---

## 2026-07-29 — 新增 wawazz skill

**类型**: 功能新增
**触发**: 用户提供 wawazz.xyz API 中转站，要求做成可调用 skill

**新增**:
- wawazz skill (save_skill + protocol/03-skills/wawazz.md)
- protocol/proposals/03-wawazz-skill.md — 方案 + 验证记录
- protocol/04-tools.md 更新 — wawazz.xyz 端点 + wawapii 标记停用

**影响**:
- 技能总数 7 → 8
- wawazz 为辅助层，不直接读写 roadmap.json
- godot-research 未来可通过 wawazz 做概念解释/翻译

---

## 2026-07-29 — 协议体系初始化

**类型**: 架构变更
**新增**: PROTOCOL.md + protocol/00-06 全部文件 + ARCHITECTURE.md 降级为旧版

---

## 2026-07-29 — 中枢神经系统初始化

**类型**: 架构变更
**新增**: roadmap.json, user-profile.md, profile-distill 技能, README.md 重构
