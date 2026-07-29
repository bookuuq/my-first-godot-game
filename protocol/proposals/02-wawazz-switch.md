# PROPOSAL — 生图 MCP 切换到 wawazz.xyz

> 提案者: Claude | 阶段: 待验证 | 日期: 2026-07-29

## 背景

- wawapii.com 账户余额不足（已确认: `INSUFFICIENT_BALANCE`）
- 用户提供了新的中转站 wawazz.xyz
- 当前 MCP image-gen 仍指向 wawapii，实际不可用

## 变更内容

### 1. claude_desktop_config.json — 切换端点

```json
"image-gen": {
  "env": {
    "IMAGE_MCP_API_KEY": "sk-51e0...",
    "IMAGE_MCP_BASE_URL": "https://wawazz.xyz"
  }
}
```

### 2. image_gen_mcp.py — 确认兼容性

当前代码无需修改：
- `_normalize_url` 自动补齐 /v1
- `call_openai_api` 使用标准 OpenAI 协议
- wawazz.xyz 已确认支持 images/generations 接口

### 3. protocol/04-tools.md — 已更新 ✅

wawapii 标记为已停用，wawazz 标记为当前使用中

## 影响范围

| 组件 | 影响 |
|------|------|
| MCP image-gen 服务器 | 重启后生效，需重启 Claude Desktop |
| 像素后处理管线 | 无影响 |
| Aseprite 集成 | 无影响 |
| Artifact 工作台 | 无影响 |

## 验证项

```
□ wawazz.xyz images/generations 返回正常 (已确认)
□ config.json 新 key 写入后重启 MCP 不报错
□ 执行一次 generate_image → 成功保存到 D:\图片\ai生图\
□ 执行一次 open_in_aseprite → 正常打开
```

## 风险
- 低。wawazz 已验证连通，代码无需改动。回滚改回旧 key 即可。
