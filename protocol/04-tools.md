# protocol/04 — 工具清单

## MCP 服务器

| 服务 | 用途 | 关键工具 |
|------|------|----------|
| github | 读写 GitHub | push_files, get_file_contents, create_or_update_file |
| workspace | 命令行 | bash, web_fetch |
| cowork | 桌面集成 | request_cowork_directory, create_artifact, save_skill |
| image-gen | AI 生图 | generate_image, open_in_aseprite |
| scheduled-tasks | 定时任务 | create/update/list/delete_scheduled_task |
| session_info | 会话信息 | list_sessions |

## 关键路径

| 用途 | 路径 |
|------|------|
| Godot 项目 | `D:\Godot_v4.7.1\Project\learn\` |
| Aseprite | `E:\SteamLibrary\steamapps\common\Aseprite\Aseprite.exe` |
| AI 生图输出 | `D:\图片\ai生图\` |
| Memory 目录 | `C:\Users\bookus\AppData\Local\Claude-3p\...\memory\memory\` |
| 技能目录 | `C:\Users\bookus\AppData\Local\Claude-3p\...\skills\` |

## GitHub 仓库

- `bookuuq/my-first-godot-game` — 主仓库
  - 分支: main
  - 关键文件: roadmap.json, README.md, PROTOCOL.md
  - 目录: learn/, notes/, protocol/

## API 中转站

### wawapii.com
- 端点: https://wawapii.com/v1
- 用途: 生图 MCP 后端
- 模型: gpt-image-2
- 状态: 已停用（余额不足，2026-07-29 确认）

### wawazz.xyz
- 端点: https://wawazz.xyz/v1
- 用途: 通用 API 中转（文本 + 生图）
- 已确认模型: gpt-5.5, gpt-5.4, gpt-5.4-mini, gpt-5.3-codex-spark, gpt-5.6-sol, gpt-5.6-terra, gpt-5.6-luna
- 生图: /v1/images/generations 可用（传入 gpt-image-2 正常返回）
- 注意: 需 User-Agent + Accept 头
- 状态: 当前使用中（2026-07-29）
