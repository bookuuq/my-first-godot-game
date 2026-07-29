# PROPOSAL — 生图 MCP 多端点支持

> 状态: ⏳ 待验证 | 日期: 2026-07-29 | 提案者: Claude

## 当前状态
- **主端点**: wawapii.com
- **新资源**: wawazz.xyz (用户提供 key)
- **MCP 代码**: `image_gen_mcp.py` 只支持单端点

## 变更目标
让生图 MCP 在 wawapii.com 不可用时自动切到 wawazz.xyz

## 改动点

### 1. claude_desktop_config.json
新增两个环境变量:
- `IMAGE_MCP_API_KEY_BACKUP`
- `IMAGE_MCP_BASE_URL_BACKUP`: https://wawazz.xyz

### 2. image_gen_mcp.py — 配置区
新增 `API_KEY_BACKUP`, `BASE_URL_BACKUP`, `HAS_BACKUP` 三个变量，提取 `_normalize_url` 函数

### 3. image_gen_mcp.py — call_openai_api
函数签名加 `use_backup=False`，主端点 HTTP 失败时若 `HAS_BACKUP` 则切 key/url 重试一次

## 不影响
- 6 个 MCP 工具定义不变
- 像素后处理、Aseprite、Artifact 不变
- 不设备用端点时行为完全一致

## 验证清单

```
□ claude_desktop_config.json 中 IMAGE_MCP_API_KEY_BACKUP 存在
□ IMAGE_MCP_BASE_URL_BACKUP = https://wawazz.xyz
□ image_gen_mcp.py call_openai_api 有 use_backup 参数
□ image_gen_mcp.py HAS_BACKUP 变量存在
□ 备用端点 list_models 调用 → 连通确认
□ protocol/04-tools.md 已更新备用端点信息
```

## 回滚
删除 config.json 中两个 BACKUP env var 即可。
