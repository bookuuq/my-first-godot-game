# PROPOSAL — 生图 MCP 端点切换到 wawazz.xyz

> 提案者: Claude | 阶段: ⏳ 待验证 | 日期: 2026-07-29

## 背景

- wawapii.com 余额不足，不可用（已确认: `INSUFFICIENT_BALANCE`）
- wawazz.xyz 已验证连通，支持 images/generations + chat/completions
- 当前 MCP image-gen config 仍指向 wawapii

## 变更

### claude_desktop_config.json

```diff
"image-gen": {
  "env": {
-   "IMAGE_MCP_API_KEY": "sk-4228...",
-   "IMAGE_MCP_BASE_URL": "https://wawapii.com",
+   "IMAGE_MCP_API_KEY": "sk-51e0...",
+   "IMAGE_MCP_BASE_URL": "https://wawazz.xyz",
    "IMAGE_MCP_OUTPUT_DIR": "D:\\图片\\ai生图"
  }
}
```

### 不改

- image_gen_mcp.py — 0 行代码改动，兼容 OpenAI 协议
- pixel-workbench Artifact
- wawazz skill

## 影响

| 组件 | 影响 |
|------|------|
| 生图链路 | 切到 wawazz 后恢复正常 |
| 像素后处理 | 不变 |
| Aseprite | 不变 |
| Claude Desktop | 需重启 MCP |

## 验证

```
□ config.json diff 行数 ≤ 4
□ 重启后 mcp__image-gen__list_models 返回正常
□ generate_image 成功保存到 D:\\图片\\ai生图\\
```

## 回滚

改回 wawapii 的 key + URL（但已不可用）。
