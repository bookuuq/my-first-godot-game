# PROPOSAL — 重写 learn-review（核心回路修复）

> 提案者: Claude | 阶段: ✅ 已完成 | 日期: 2026-07-29

## 背景

旧版 learn-review 指向已死的旧 session 路径写假仪表盘，实际无产出。核心回路断裂。

## 实施 (2026-07-29)

### 已变更

1. **learn-review SKILL.md** — save_skill overwrite
   - 旧: 读写本地假仪表盘 JSON/HTML → 已死的 session 路径
   - 新: 读 GitHub roadmap.json (带 SHA) → 更新 → push → 渲染 README → 交叉验证

2. **protocol/03-skills/learn-review.md** — 更新协议文档

3. **protocol/01-architecture.md** — 技能状态: 🔴→🟢

4. **protocol/05-changelog.md** — 记录变更

### 新流程

```
对话提取 → 读 roadmap.json (GitHub, SHA) → 更新目标字段
→ push (带 SHA) → 渲染 README → push → 检查画像 → 交叉验证 → 总结
```

### 影响
- 中枢核心回路恢复
- 用户复盘后进度自动归档到 roadmap.json
- README.md 实时同步
