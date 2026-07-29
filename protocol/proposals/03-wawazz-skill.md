# PROPOSAL — wawazz.xyz 可调用 Skill

> 提案者: Claude | 阶段: ⏳ 待验证 | 日期: 2026-07-29

## 背景

- wawazz.xyz 是用户当前使用的 OpenAI 兼容 API 中转站
- 其信息已录入 `protocol/04-tools.md`
- 但 Claude 系统并未真正"知道"它的存在——需要做成 skill，触发特定任务时自动调用

## 目标

创建一个 `wawazz` skill，让 Claude 知道这个中转站的存在和使用方式。触发场景：
- 用户需要文本生成/翻译/摘要/代码审查等任务
- 用户说"用 wawazz 帮我做 X"
- 系统需要在工具链中用到文本模型能力

## 设计

### Skill 文件: `wawazz/SKILL.md`

核心内容：
1. **API 端点**: https://wawazz.xyz/v1
2. **可用模型**: 从已验证的 list_models 结果列出
3. **调用方式**: 通过 `mcp__workspace__bash` 执行 curl，符合 OpenAI /v1/chat/completions 协议
4. **使用场景**: 翻译、写作、代码解释、快速搜索整理等
5. **约束**: 单次调用控制 token 量、超时处理、错误重试策略

### 技术路径

```
用户触发 → skill 识别 → bash curl → wawazz.xyz/v1/chat/completions → 返回文本
```

不写新 MCP 服务器，原因：
- 方案轻量，不需要重启 Claude Desktop
- curl + bash 已有现成工具
- 后续如需高频调用再封装 MCP 工具

## 改动清单

| 文件 | 操作 | 说明 |
|------|------|------|
| `skills/wawazz/SKILL.md` | 新建 | skill 指令文件 |
| `protocol/03-skills/wawazz.md` | 新建 | 技能协议文档 |
| `protocol/01-architecture.md` | 更新 | 技能注册表新增 wawazz |

## 不影响
- 现有 7 个技能
- 生图 MCP
- roadmap.json

## 验证项

```
□ wawazz.xyz 单次 curl chat/completions 调用成功
□ skill 文件描述与 protocol/03-skills 一致
□ 方案覆盖了错误处理（超时/余额不足/格式异常）
□ 方案明确了使用场景和触发条件
□ 方案明确了不适用场景（如大批量、实时流式等）
```

## 风险与局限

| 风险 | 处理 |
|------|------|
| bash curl 每次新连接无会话保持 | 单次任务用，不做长对话 |
| 大文本可能超时 | 限制输出 token 上限 |
| API key 在 skill 文件明文 | key 不写入 skill，从环境变量或用户提供 |

## 下一步（如通过）

1. 写 SKILL.md → save_skill
2. 写 protocol 文档 → push GitHub
3. 实测一次调用 → 确认链路通
4. 更新 changelog
