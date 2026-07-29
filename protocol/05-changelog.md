# protocol/05 — 变更日志

## 2026-07-29 — 协议体系初始化

**类型**: 架构变更
**触发**: 用户要求文档 AI 可路由、支持交叉验证、降低 token 成本

**新增**:
- PROTOCOL.md — AI 路由入口（<50 行）
- protocol/00-identity.md — 用户身份
- protocol/01-architecture.md — 系统架构 + 技能注册表
- protocol/02-roadmap-schema.md — 数据契约
- protocol/03-skills/learn-review.md — 技能输入输出规范
- protocol/03-skills/quick-save.md — 技能输入输出规范
- protocol/03-skills/godot-research.md — 技能输入输出规范
- protocol/04-tools.md — 工具和路径清单
- protocol/05-changelog.md — 本文件
- protocol/06-operations.md — 操作手册

**保留**:
- ARCHITECTURE.md — 旧版，仍可读但不作为 AI 入口

**影响**:
- 所有 AI 首次进入只需读 PROTOCOL.md + 00-identity + 01-architecture
- 具体任务时按路由读取对应的 protocol/ 文件
- 交叉验证逻辑写入了 06-operations.md

**待接回路**:
- learn-review: 🔴 P0 重写
- quick-save: 🟡 P1 补接
- godot-research: 🟡 P1 补接
- profile-distill: 🟢 P2 补接

---

## 2026-07-29 — 中枢神经系统初始化

**类型**: 架构变更
**触发**: 用户要求构建画像 + 蒸馏机制

**新增**:
- roadmap.json — 项目数据中枢
- user-profile.md (memory) — 完整用户画像
- profile-distill 技能 — 持续蒸馏用户画像
- README.md 更新 — 改为摘要 + roadmap.json 跳转

**影响**:
- 看板从死了的 session 路径迁移到 GitHub SSOT
- learn-review、quick-save、godot-research 需要重写以接入中枢
