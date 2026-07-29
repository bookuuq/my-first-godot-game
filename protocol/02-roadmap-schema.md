# protocol/02 — roadmap.json 数据契约

> 这是所有技能读写的中枢文件。任何修改此文件的操作必须符合本契约。

## 路径
`bookuuq/my-first-godot-game/roadmap.json` (GitHub, main 分支)

## 结构

### meta（不可删改字段名）
- `version`: 契约版本，大改时递增
- `lastUpdated`: ISO 8601，每次写操作必须更新
- `projectName`, `repo`, `godotVersion`: 常量

### progress（learn-review 读写）
- `completedMilestones[]`: 已完成里程碑，只增不删。每个: { date(YYYY-MM-DD), id(mN), title, desc }
- `currentMilestone`: 当前进行中，只能有一个
- `nextSteps[]`: 待办，按 priority 排序
- `totalHoursSpent`: 累计学习时长（数字）

### skillTree（learn-review 读写，profile-distill 可读）
5 个维度: `gdscript`, `godot`, `gameDesign`, `art`, `tools`
每维: { level(0-5), maxLevel(5), description, topics[], nextTopics[] }

升级规则：当 nextTopics 中某个话题被实现到代码里，将其移入 topics，level 按进度递增。

### codebase（quick-save 写入）
- `scripts[]`: { path, role, status(active|stale), lastModified(YYYY-MM-DD) }
- `scenes[]`: { path, role, status(active|stale), lastModified(YYYY-MM-DD) }
约束：path 必须是 GitHub 上实际路径。status 为 stale 的表示旧副本。

### notes（godot-research 写入）
每个: { path, topic, date(YYYY-MM-DD), status(researched|implemented), linkedMilestone(mN) }
约束：path 必须与 notes/ 目录一致。linkedMilestone 指向 progress 中的 milestone id。

### learningLog（learn-review + godot-research 写入）
每个: { date(YYYY-MM-DD), topic, duration(Xh), summary }
约束：按日期倒序排列。

## 操作约束

- 只修改目标字段，不要整文件重写（保留未改字段不变）
- 每次写操作必须更新 meta.lastUpdated
- commit message 格式: `[技能名] 更新内容摘要`
- 不允许在 JSON 中添加注释
