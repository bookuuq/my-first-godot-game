# PROPOSAL — quick-save + godot-research 接中枢

> 提案者: Claude | 验证: gpt-5.5 | 阶段: ✅ 通过 | 日期: 2026-07-29

## 验证历程

### 初审 (gpt-5.5)
⚠️ 可行但需修改: 三个技能各自读改写会写乱中枢，需要统一更新器 + 幂等规则

### 修订
- 抽共享 updateRoadmap(patchFn) 模式
- SHA 冲突重试 3 次
- quick-save 先接（风险小），godot-research 后接

### 复审 (gpt-5.5)
✅ 通过，附带 6 个实施条件:
1. patchFn 必须是纯函数，冲突重试时不可产生重复副作用
2. 3 次重试失败 → 明确错误提示，不静默
3. skillTree 按稳定 id 合并，只增不减，已有字段只补空值
4. notes path 写入前 normal 化
5. learningLog date 固定 YYYY-MM-DD 本地时区
6. 两个技能最终都只能通过 updateRoadmap 写，不留旧路径

## 最终设计

```
技能 push 完成
→ updateRoadmap(current => {
    // 纯函数 patch
    return { ...current, field: merged }
  })
→ 内部: 拉最新 + 应用 patch + schema 校验 + push
→ SHA 冲突 → 重拉重算重试 (max 3)
→ 失败 → 报 RoadmapUpdateConflictError
```

### quick-save patch
- codebase.scripts/scenes: path 去重，status active/stale

### godot-research patch
- notes[]: normalized path 去重
- learningLog[]: date(YYYY-MM-DD) + topic 去重，append-only
- skillTree: id 去重，只增不删，已有节点只补空值

## 改动清单

| 文件 | 操作 |
|------|------|
| skills/quick-save/SKILL.md | 更新 |
| skills/godot-research/SKILL.md | 更新 |
| protocol/03-skills/quick-save.md | 更新 |
| protocol/03-skills/godot-research.md | 更新 |
| protocol/01-architecture.md | 🟡→🟢 |
| protocol/05-changelog.md | 记录 |

## 实施顺序
1. quick-save 先接 (codebase 更新, 风险小)
2. godot-research 后接 (notes + log + skillTree, 规则复杂)
