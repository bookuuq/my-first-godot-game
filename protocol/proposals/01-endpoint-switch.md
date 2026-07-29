# PROPOSAL — 生图 MCP 端点切换

> 状态: ✅ 已验证 | 日期: 2026-07-29

## 当前状态
- **主端点 wawapii.com**: ❌ 余额不足 (`INSUFFICIENT_BALANCE`)
- **新端点 wawazz.xyz**: ✅ list_models + images/generations 均正常

## 变更目标
生图 MCP 从 wawapii.com 切到 wawazz.xyz

## 验证结果 (2026-07-29)

```
□ wawapii.com HTTP 200 → API /v1/models → INSUFFICIENT_BALANCE
□ wawazz.xyz HTTP 200 → API /v1/models → 7 models listed
□ wawazz.xyz /v1/images/generations → b64_json returned ✅
```

wawazz.xyz 可用模型: gpt-5.5, gpt-5.4, gpt-5.4-mini, gpt-5.3-codex-spark, gpt-5.6-sol, gpt-5.6-terra, gpt-5.6-luna

注: wawazz 模型列表中未见 gpt-image-2，但 images/generations 接口实际可用（传入 gpt-image-2 成功返回 b64_json）。

## 改动点

### claude_desktop_config.json
```json
"image-gen": {
  "command": "python",
  "args": ["D:\\Claude work\\mcp-image-gen\\image_gen_mcp.py"],
  "env": {
    "IMAGE_MCP_API_KEY": "sk-51e0...",
    "IMAGE_MCP_BASE_URL": "https://wawazz.xyz",
    "IMAGE_MCP_OUTPUT_DIR": "D:\\图片\\ai生图"
  }
}
```

### protocol/04-tools.md
更新中转站地址: wawapii.com → wawazz.xyz

### memory/image-gen-mcp.md
主地址改为 wawazz.xyz，wawapii.com 降为备用（已无余额）

## 不影响
- 6 个 MCP 工具定义不变
- 像素后处理管线不变
- Aseprite 集成不变

## 回滚
改回 wawapii.com 的 key + URL 即可（但已无余额，不可用）
