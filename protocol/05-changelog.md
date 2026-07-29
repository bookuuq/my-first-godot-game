# protocol/05 — 变更日志

## 2026-07-29 — 新增 wawazz skill

**类型**: 功能新增
**触发**: 用户提供 wawazz.xyz API 中转站，要求做成可调用 skill

**新增**:
- wawazz skill (save_skill + protocol/03-skills/wawazz.md)
- protocol/proposals/03-wawazz-skill.md — 方案 + 验证记录
- protocol/04-tools.md 更新 — wawazz.xyz 端点 + wawapii 标记停用

**验证流程**:
1. 方案入 proposals/ → 验证 AI 审查（3 处修改，1 处阻塞已修）→ 通过
2. SKILL.md 保存至 Claude 本地 skills 目录
3. protocol 文档同步更新

**影响**:
- 技能总数 7 → 8
- wawazz 为辅助层，不直接读写 roadmap.json
- godot-research 未来可通过 wawazz 做概念解释/翻译

---

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
