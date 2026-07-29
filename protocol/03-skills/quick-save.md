# protocol/03-skills/quick-save

## 元信息
- 状态: 🟡 半接（缺 roadmap.json 更新）
- 中枢: 写 roadmap.json (codebase)
- 副作用: 推送文件到 GitHub learn/

## 触发条件
用户说「存档」「推送」「上传代码」或代码改动后

## 输入
- 用户确认的 commit message
- 本地文件: D:\Godot_v4.7.1\Project\learn\*.gd, *.tscn
- 当前 roadmap.json (GitHub)

## 输出
1. GitHub push: learn/ 下的所有改动的 .gd 和 .tscn 文件
2. roadmap.json 更新:
   - `codebase.scripts`: 如有新脚本或原有脚本修改，更新 path/role/status/lastModified
   - `codebase.scenes`: 同理
   - `meta.lastUpdated`: 更新
3. 简短确认回复

## 约束
- 推送前检查文件是否有实际变化（与 GitHub 上 sha 对比）
- 不推送未改动的文件
- commit message 格式: `[quick-save] 用户提供的描述`
