# protocol/03-skills/godot-research

## 元信息
- 状态: 🟡 半接（缺 roadmap.json 更新）
- 中枢: 写 roadmap.json (notes, learningLog)
- 副作用: 推送 Markdown 笔记到 GitHub notes/

## 触发条件
用户说「研究」「查资料」「这个怎么做」并指定 Godot 话题

## 输入
- 用户指定的话题
- 当前 roadmap.json (GitHub)

## 输出
1. WebSearch 结果整理为结构化笔记
2. GitHub push: notes/[话题].md
3. roadmap.json 更新:
   - `notes`: 追加新条目 { path, topic, date, status: "researched", linkedMilestone }
   - `learningLog`: 追加新条目
   - `skillTree`: 如笔记涉及新话题，追加到对应维度的 topics 或 nextTopics
   - `meta.lastUpdated`: 更新
4. 总结回复（3-5 个最有价值资源 + 关键概念）

## 搜索策略
- 英文: "Godot [topic] tutorial"
- 中文: "Godot [话题] 教程"
- 如结果不足: "Godot [topic] best practice 2026"

## 笔记格式
- 定义 > 比喻 > 代码 > 常见错误 > 参考链接
- 代码示例完整可运行
- 中文为主，术语附英文

## 约束
- linkedMilestone 必须对应 roadmap.json 中存在的 milestone id
- 笔记文件名: 中文话题名.md
