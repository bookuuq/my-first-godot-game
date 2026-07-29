# PROPOSAL — 重写 learn-review（核心回路修复）

> 提案者: Claude | 阶段: ⏳ 待验证 | 日期: 2026-07-29

## 背景

当前 learn-review 指向已死的旧 session 路径写假仪表盘，实际无产出。核心回路断裂。

roadmap.json 已有完整数据（milestones / skillTree / learningLog），learn-review 应该直接读写它。

## 设计

### 新流程

```
用户学完一轮
  │
  ├─ 1. 对话提取: 学了什么、多久、什么代码/笔记
  │
  ├─ 2. 读 roadmap.json (GitHub, 获取 SHA)
  │
  ├─ 3. 更新:
  │   ├── progress.completedMilestones (如完成 → 追加)
  │   ├── progress.currentMilestone (如推进 → 更新)
  │   ├── progress.nextSteps (新增/完成移除)
  │   ├── progress.totalHoursSpent (累加)
  │   ├── skillTree.*.topics/nextTopics/level (如进阶)
  │   ├── learningLog (追加新条目)
  │   └── meta.lastUpdated
  │
  ├─ 4. push roadmap.json (带 SHA 防冲突)
  │
  ├─ 5. 重新渲染 README.md → push
  │
  ├─ 6. 检查 user-profile.md (如知识水平变化)
  │
  └─ 7. 跑交叉验证 (protocol/06-operations 10项)
```

### 技术实现

- 不再依赖本地文件路径
- 所有读写通过 mcp__github__push_files（带 SHA）
- 与 quick-save、godot-research 共享 roadmap.json 数据契约

## 改动清单

| 文件 | 操作 |
|------|------|
| skills/learn-review/SKILL.md | 重写 (save_skill overwrite) |
| protocol/03-skills/learn-review.md | 更新协议文档 |
| protocol/01-architecture.md | 状态 🔴→🟢 |
| protocol/05-changelog.md | 记录 |

## 风险

- SHA 冲突: 如果两个技能同时写 roadmap.json → 用 SHA 乐观锁，失败重试
- 提取不准: 从对话提取学习内容可能遗漏 → 对话确认步保留

## 验证

```
□ learn-review 执行后 roadmap.json meta.lastUpdated 更新
□ README.md 的完成/进行中/下一步 与 roadmap.json 一致
□ 交叉验证 10 项全绿
□ skillTree 修改只影响对应维度
```

## 回滚

save_skill 恢复旧版 SKILL.md + GitHub revert protocol 改动。
