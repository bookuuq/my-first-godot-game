# protocol/03-skills/quick-save

## 元信息
- 状态: 🟢 正常（已接中枢）
- 中枢: 写 roadmap.json (codebase)
- 副作用: 推送 .gd/.tscn 到 GitHub learn/

## 触发条件
用户说「存档」「推送」「上传代码」或代码改动后

## 输入
- 用户确认的 commit message
- 本地文件: D:\Godot_v4.7.1\Project\learn\*.gd, *.tscn
- 当前 roadmap.json (GitHub)

## 输出
1. GitHub push: learn/ 下有变化的文件
2. roadmap.json codebase 更新 (path 去重、幂等)
3. SHA 冲突重试 3 次
4. 简短确认

## 操作流程
1. 确认 commit message
2. 读本地文件 + 对比 GitHub SHA
3. push_files 推送有变化的文件
4. updateRoadmap: 更新 codebase.scripts/scenes
5. 确认

## 约束
- 不推送未改动的文件
- codebase 以 path 为唯一键去重
- SHA 冲突重试上限 3 次，超限告警
