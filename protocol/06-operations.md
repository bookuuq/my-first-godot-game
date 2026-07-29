# protocol/06 — 操作手册

> 场景化指南，任何 AI 按此执行。每个操作标注成本和依赖。

---

## 操作 1: 学习复盘 (learn-review)

**成本**: 中等 | **依赖**: 02, 03-skills/learn-review
**触发**: 用户说「复盘」「学完了」

1. 读 roadmap.json (GitHub API) — 获取当前 SHA
2. 对话提取: 学了什么、用了多久、有什么新代码/笔记
3. 按 03-skills/learn-review.md 的规则更新 roadmap.json
4. 推送 roadmap.json (带 SHA 防冲突)
5. 从 roadmap.json 渲染 README.md 并推送
6. 检查 user-profile.md 是否需要更新
7. 运行交叉验证

---

## 操作 2: 快速存档 (quick-save)

**成本**: 低 | **依赖**: 02, 03-skills/quick-save
**触发**: 用户说「存档」「推送」

1. 读 D:\Godot_v4.7.1\Project\learn\*.gd, *.tscn
2. 与 GitHub 上 learn/ 对比 SHA (只推有变化的)
3. push_files 到 GitHub
4. 读 roadmap.json, 更新 codebase 清单, 推送
5. 简短确认

---

## 操作 3: 研究话题 (godot-research)

**成本**: 高 (含搜索) | **依赖**: 02, 03-skills/godot-research
**触发**: 用户说「研究」「查资料」

1. WebSearch: "Godot [topic] tutorial" (英文) + "Godot [话题] 教程" (中文)
2. 整理笔记 (定义>比喻>代码>错误>链接)
3. push 笔记到 notes/
4. 读 roadmap.json, 更新 notes[] + learningLog[], 推送
5. 总结回复

---

## 操作 4: 交叉验证

**成本**: 低 | **触发**: 任何修改 roadmap.json 之后，或手动触发

运行以下检查清单，逐条报告 ✅/❌:

```
□ roadmap.json meta.lastUpdated 是否 ≤ 5 分钟前
□ 05-changelog.md 最新条目日期是否与 meta.lastUpdated 同天
□ codebase.scripts 列出的每个 path 是否在 GitHub 上实际存在
□ codebase.scenes 列出的每个 path 是否在 GitHub 上实际存在
□ notes[] 列出的每个 path 是否在 GitHub notes/ 目录下存在
□ notes[].linkedMilestone 是否指向 progress 中存在的 milestone id
□ completedMilestones 是否按 date 正序排列
□ learningLog 是否按 date 倒序排列
□ skillTree 各维度的 nextTopics 是否与 currentMilestone 相关
□ README.md 的完成/进行中/下一步 是否与 roadmap.json 一致
```

验证通过 = 系统健康。任何 ❌ = 记录到 05-changelog.md 并修复。

---

## 操作 5: 新 AI 加入

**成本**: 极低 (~1.5K tokens) | **触发**: 任何新 AI 第一次访问项目

1. 读 PROTOCOL.md (入口, ~50行)
2. 读 protocol/00-identity.md (身份, ~40行)
3. 读 protocol/01-architecture.md (架构, ~60行)
4. 根据任务按路由读对应文件
5. 如有任务涉及 roadmap.json, 读 protocol/02-roadmap-schema.md
6. 完成后运行操作 4 交叉验证

**不读**: ARCHITECTURE.md (旧版)、05-changelog.md (除非需要历史上下文)

---

## 操作 6: 中枢故障修复

**成本**: 高 | **触发**: 交叉验证发现多个 ❌ 或 roadmap.json 丢失/损坏

1. 读 05-changelog.md 了解最近变更
2. 从 GitHub commit 历史恢复最近的 roadmap.json
3. 逐个检查 codebase/notes 与实际文件是否匹配
4. 手动修复不一致项
5. 推送修复后运行交叉验证
6. 记录到 05-changelog.md
