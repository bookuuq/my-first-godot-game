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

- wawapii.com/v1
- 模型: gpt-image-2
- 注意: 需 User-Agent + Accept 头
