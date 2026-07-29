# protocol/03-skills/learn-review

## 元信息
- 状态: 🔴 待重写
- 中枢: 读写 roadmap.json (progress, skillTree, learningLog)
- 副作用: 更新 README.md, 更新 user-profile.md

## 触发条件
用户说「复盘」「学完了」「记录一下」或一轮学习结束

## 输入
- 对话内容（用户说了学了什么、做了什么）
- 当前 roadmap.json (GitHub)

## 输出
1. roadmap.json 更新:
   - `progress.completedMilestones`: 如完成当前里程碑，新增条目
   - `progress.currentMilestone`: 如推进到下一阶段，更新
   - `progress.nextSteps`: 如有新的下一步，追加或完成移除
   - `progress.totalHoursSpent`: 累加本次时长
   - `skillTree`: 如技能进阶，更新对应维度的 topics/nextTopics/level
   - `learningLog`: 追加新条目
   - `meta.lastUpdated`: 更新为当前时间
2. README.md 更新: 从 roadmap.json 渲染完成列表、进行中、下一步
3. user-profile.md 更新: 如知识水平有变化

## 操作流程
1. 用 GitHub API 获取 roadmap.json 最新内容和 SHA
2. 友好对话提取本轮学习内容
3. 生成更新后的 JSON（只改必要字段，保留其他不变）
4. 用 SHA 推送到 GitHub（防冲突）
5. 同样流程更新 README.md
6. 检查 user-profile.md 是否需要更新

## 约束
- 合规性: 任何修改必须通过 `protocol/06-operations.md` 的交叉验证检查
- 错误处理: GitHub 写入失败时告知用户，不静默丢弃
