# protocol/03-skills/wawazz

## 元信息
- 状态: 🟢 正常
- 中枢: 不直接读写 roadmap.json（辅助性技能）
- 副作用: 通过 bash curl 调用 wawazz.xyz 文本模型

## 触发条件
- 用户需要翻译、概念解释、代码审查、命名建议、创意发散
- 用户说「用 wawazz」
- 系统内其他技能需要文本模型辅助

## 输入
- 用户的自然语言请求
- 可选: 指定模型（默认 gpt-5.5）

## 输出
- 文本回复，提取自 `choices[0].message.content`

## 技术路径
```
bash curl → https://wawazz.xyz/v1/chat/completions
  - 模型: gpt-5.5 (默认)
  - max_tokens: 2000 (硬上限)
  - timeout: 60s
  - 必带头: User-Agent, Accept
```

## 使用场景
| 场景 | 示例 |
|------|------|
| 概念解释 | Godot API 中文通俗解释 |
| 翻译 | 英文教程段落翻译 |
| 代码审查 | GDScript 检查 |
| 命名建议 | 变量/函数/场景命名 |
| 创意发散 | 玩法设计、关卡建议 |

## 不适用场景
- 生图 → image-gen MCP
- 搜索 → WebSearch
- 文件 I/O → Read/Write/Edit
- 超大文本 >8K tokens
- 实时流式

## 约束
- max_tokens ≤ 2000
- 必带 User-Agent + Accept 头（Cloudflare 反爬）
- API key 走环境变量 WAWAZZ_API_KEY
- 错误时告知用户具体原因

## 关联
- protocol/04-tools.md — wawazz.xyz 端点信息
- protocol/proposals/03-wawazz-skill.md — 方案与验证记录
