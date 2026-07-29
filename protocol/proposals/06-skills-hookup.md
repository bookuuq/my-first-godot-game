# PROPOSAL — quick-save + godot-research 接中枢

> 提案者: Claude | 阶段: 🔄 需修改 | 日期: 2026-07-29

## gpt-5.5 验证结论

**判断: ⚠️ 可行，但需修改**

核心问题: 三个技能各自读改写 roadmap.json，SHA 乐观锁只能发现冲突不能解决。godot-research 更新面大（notes + learningLog + skillTree），容易写乱。

gpt-5.5 建议:
1. 抽出一个共享的 `updateRoadmap(patchFn)` 逻辑，不要三个技能各自实现
2. SHA 冲突后必须有重拉→重新合并→重试策略
3. 定义精确的更新语义（去重键、幂等、append-only vs 覆盖）
4. quick-save 先接（风险小），godot-research 在规则定义清楚后再接

## 修订后的设计

### 核心: 统一 roadmap 更新器

每个技能不再直接操作 roadmap.json，而是调用同一个模式：

```
技能完成文件 push
→ 拉取最新 roadmap.json + SHA
→ 应用 patch（技能定义的合并函数）
→ 校验 schema
→ push with SHA
→ 冲突 → 重拉 → 重算 → 重试
→ 超过 3 次失败 → 报错让用户处理
```

### quick-save patch（先接）
- 读取本地文件列表 → 与 codebase 对比 → 新增/更新 path + role + lastModified
- 以 path 为唯一键去重
- 状态标记: 新文件 active，旧文件如不存在则 stale

### godot-research patch（后接）
- notes[]: 以 path 为唯一键，不重复新增
- learningLog[]: 以 date + topic 为唯一键，append-only
- skillTree: 只追加 topics/nextTopics，不降级

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

- 重试上限 3 次 → 超过则告知用户手动处理
- skillTree 合并规则要谨慎 → 只增不减
