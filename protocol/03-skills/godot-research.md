# protocol/03-skills/godot-research

## 元信息
- 状态: 🟢 正常（已接中枢）
- 中枢: 写 roadmap.json (notes, learningLog, skillTree)
- 副作用: 推送笔记到 GitHub notes/, WebSearch 调用

## 触发条件
用户说「研究」「查资料」「学习」并指定 Godot 话题

## 输入
- 用户指定的话题
- 当前 roadmap.json (GitHub)

## 输出
1. WebSearch → 结构化笔记
2. GitHub push: notes/[话题].md
3. roadmap.json 更新:
   - notes[]: path 去重
   - learningLog[]: date+topic 去重, append-only
   - skillTree: id 去重, 只增不减
4. 总结回复

## 搜索策略
- EN: "Godot [topic] tutorial"
- CN: "Godot [话题] 教程"
- 不足: "Godot [topic] best practice 2026"

## 笔记格式
定义 > 比喻 > 代码 > 常见错误 > 参考链接

## 约束
- notes path: normalized 相对路径, 去重键
- linkedMilestone: 对应 roadmap.json 中存在的 milestone id
- learningLog date: YYYY-MM-DD 本地时区
- skillTree: 按稳定 key 合并，不删不覆盖
- SHA 冲突重试 3 次
