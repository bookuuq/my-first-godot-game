# gpt-5.5 使用记录

## 2026-07-29 — gpt-5.5 验证调用 + 模型行为观察

### 测试 1: gpt-5.5 (默认)

**prompt**: "review the learn-review skill. Compare old vs new, identify any gaps or improvements needed. Be concise."

**结果**: ⚠️ 模型产生推理链 (reasoning_tokens: 980) 并尝试生成工具调用，而非直接回答。completion_tokens 中 1306 大部分是内部推理。

**结论**: gpt-5.5 可能是推理型模型 (reasoning model)，prompt 需要明确指示"直接输出，不要推理链"。

### 测试 2: gpt-5.4-mini (轻量)

**prompt**: "直接回答，不要尝试调用工具..." + 明确中文简短要求

**结果**: ✅ 正常返回 258 tokens 的分析回答，列出鉴权、并发、回退、一致性、测试、速率 6 个遗漏点。

**结论**: gpt-5.4-mini 适合直接问答。gpt-5.5 需加 `system` 消息抑制推理。

## 模型选择策略

| 模型 | 适用 | 不适用 |
|------|------|--------|
| gpt-5.5 | 需深度推理的复杂任务 | 直接问答 (会出推理链) |
| gpt-5.4-mini | 快速问答、翻译、建议 | 复杂分析 |
| gpt-5.4 | 中等复杂度 | — |

## 后续

更新 wawazz SKILL.md: gpt-5.5 使用时加 `system` 消息 "直接输出最终答案，不要生成推理链。不要尝试调用工具。"
