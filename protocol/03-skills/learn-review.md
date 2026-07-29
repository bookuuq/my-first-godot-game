# protocol/03-skills/learn-review

## 元信息
- 状态: 🟢 正常（已重写）
- 中枢: 读写 roadmap.json (progress, skillTree, learningLog)
- 副作用: 更新 README.md, 更新 user-profile.md

## 触发条件
用户说「复盘」「学完了」「记录一下」或一轮学习结束

## 输入
- 对话内容（用户学了什么、做了什么、多久）
- 当前 roadmap.json (GitHub, 含 SHA)

## 输出

### roadmap.json 更新字段
- `progress.completedMilestones`: 完成 → 追加 {date, id, title, desc}
- `progress.currentMilestone`: 推进 → 替换
- `progress.nextSteps`: 新增/移除
- `progress.totalHoursSpent`: 累加
- `skillTree.*.topics/nextTopics/level`: 按规则更新
- `learningLog`: 追加 {date, topic, duration, summary}
- `meta.lastUpdated`: 更新

### 其他文件
- README.md: 从 roadmap.json 重新渲染
- user-profile.md: 知识水平变化时更新

## 操作流程
1. 对话提取 → 2. GitHub 读 roadmap.json + SHA → 3. 更新目标字段 → 4. push（带 SHA）→ 5. 渲染 README → push → 6. 检查画像 → 7. 交叉验证 → 8. 总结回复

## 约束
- 只改目标字段，不整文件重写 roadmap.json
- commit: `[learn-review] 摘要`
- 必须跑交叉验证
