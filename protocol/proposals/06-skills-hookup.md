# PROPOSAL — quick-save + godot-research 接中枢

> 提案者: Claude | 阶段: ⏳ 待验证 | 日期: 2026-07-29

## 背景

两个技能目前半断：
- `quick-save`: 能推代码，但不更新 roadmap.json codebase
- `godot-research`: 能推笔记，但不更新 roadmap.json notes + learningLog

## 设计

### quick-save 补接

在现有「推送文件→确认完成」流程中间插入一步：

```
push_files 完成 → 读 roadmap.json → 更新 codebase.scripts/scenes → push roadmap.json → 确认
```

### godot-research 补接

在现有「push 笔记→总结回复」流程中间插入一步：

```
push 笔记完成 → 读 roadmap.json → 更新 notes[] + learningLog[] + skillTree → push roadmap.json → 总结回复
```

## 改动清单

| 文件 | 操作 |
|------|------|
| skills/quick-save/SKILL.md | 更新 (save_skill overwrite) |
| skills/godot-research/SKILL.md | 更新 (save_skill overwrite) |
| protocol/03-skills/quick-save.md | 更新 |
| protocol/03-skills/godot-research.md | 更新 |
| protocol/01-architecture.md | 状态 🟡→🟢 |
| protocol/05-changelog.md | 记录 |

## 风险

- roadmap.json SHA 冲突（与 learn-review 同时写）→ SHA 乐观锁
- 两个技能改动小，风险低

## 验证

```
□ quick-save 推送新脚本后 roadmap.json.codebase 有对应条目
□ godot-research 推送笔记后 roadmap.json.notes 有对应条目
□ 交叉验证 10 项通过
```

## 回滚

save_skill 恢复旧版 + GitHub revert protocol 改动。
