# PROPOSAL — wawazz.xyz 可调用 Skill

> 提案者: Claude | 阶段: ✅ 通过 | 日期: 2026-07-29

## 背景

- wawazz.xyz 是用户当前使用的 OpenAI 兼容 API 中转站
- 其信息已录入 `protocol/04-tools.md`
- 但 Claude 系统并未真正"知道"它的存在——需要做成 skill，触发特定任务时自动调用

## 验证记录

### Claude 验证 (2026-07-29)
```
□ wawazz.xyz curl chat/completions → ✅ (gpt-5.5, 17 tokens)
□ wawazz.xyz /v1/models → ✅ (7 模型)
```

### 验证 AI 审查 (2026-07-29)
```
□ 技术路径可行 → ✅
□ 改动清单与现有系统无冲突 → ✅
□ 使用/不适用场景边界清晰 → ✅
□ API Key 安全策略合理 → ✅
□ 需补充: SKILL.md 中强制要求 User-Agent + Accept 头 → 🔧 已修复
□ 需补充: 改动清单区分 GitHub 仓库 vs 本地技能目录 → 🔧 已修复
□ 需补充: 显式风险/回滚段 → 🔧 已修复
```

**最终结论: ✅ 通过**

## 目标

创建一个 `wawazz` skill，让 Claude 知道这个中转站的存在和使用方式。触发场景：
- 用户需要文本生成/翻译/摘要/代码审查等任务
- 用户说"用 wawazz 帮我做 X"
- 系统内技能需要文本模型辅助（如 godot-research 的概念解释、代码注释翻译）

### 使用场景（明确化）

| 场景 | 示例 |
|------|------|
| 概念解释 | Godot 某个 API 用中文通俗解释 |
| 翻译 | 英文教程段落翻译 |
| 代码审查 | GDScript 代码检查 |
| 命名建议 | 变量/函数/场景命名 |
| 创意发散 | 玩法设计思路、关卡建议 |

### 不适用场景（边界）

| 场景 | 理由 | 替代 |
|------|------|------|
| 生图 | 已有 image-gen MCP | 用 mcp__image-gen__generate_image |
| 搜索资料 | 已有 WebSearch | 用 WebSearch |
| 文件读写 | 已有 workspace | 用 Read/Write/Edit |
| 超大文本 (>8K tokens) | 单次 curl 不经济 | 分片或走其他通道 |
| 实时流式 | bash curl 不支持 SSE | 后续封装 MCP 时再支持 |

## 设计

### Skill 文件: `wawazz/SKILL.md`

核心内容：
1. **API 端点**: https://wawazz.xyz/v1
2. **可用模型**: gpt-5.5, gpt-5.4, gpt-5.4-mini, gpt-5.3-codex-spark, gpt-5.6-sol, gpt-5.6-terra, gpt-5.6-luna
3. **调用方式**: 通过 `mcp__workspace__bash` 执行 curl，符合 OpenAI /v1/chat/completions 协议
4. **强制要求**: 每次 curl 必须带 `User-Agent: Mozilla/5.0...` 和 `Accept: application/json` 请求头（Cloudflare 反爬，04-tools.md 已记录）
5. **使用场景**: 见上表
6. **不适用场景**: 见上表
7. **约束**: 单次 max_tokens ≤ 2000（硬上限），curl --max-time 60s，key 走环境变量不写入 skill 明文

### 技术路径

```
用户触发 → skill 识别 → bash curl → wawazz.xyz/v1/chat/completions → 返回文本
```

不写新 MCP 服务器（现阶段）：
- 方案轻量，不需要重启 Claude Desktop
- curl + bash 已有现成工具
- 后续如需高频调用再封装 MCP 工具

## 改动清单

| 文件 | 位置 | 操作 | 说明 |
|------|------|------|------|
| `wawazz/SKILL.md` | Claude 本地 skills 目录 (save_skill) | 新建 | skill 指令文件 |
| `protocol/03-skills/wawazz.md` | GitHub 仓库 | 新建 | 技能协议文档 |
| `protocol/01-architecture.md` | GitHub 仓库 | 更新 | 技能注册表新增 wawazz |
| `protocol/05-changelog.md` | GitHub 仓库 | 更新 | 记录变更 |

## 风险与回滚

| 风险 | 概率 | 影响 | 缓解 |
|------|------|------|------|
| 中转站余额耗尽 | 中 | 调用失败，任务中断 | 错误处理中检测 balance 字段，提示用户充值 |
| 中转站服务不稳定 | 低 | curl 超时 | --max-time 60s + 超时后给出明确错误信息 |
| 模型响应格式变化 | 低 | 解析失败 | 检查 choices[0].message.content 字段存在性 |

**回滚**: `save_skill` 删除 wawazz skill + GitHub revert 3 个 protocol 文件改动。操作简单，零数据风险。

## 不影响
- 现有 7 个技能
- 生图 MCP
- roadmap.json

## 下一步

1. 写 SKILL.md → save_skill
2. 写 protocol/03-skills/wawazz.md → push GitHub
3. 更新 protocol/01-architecture.md → push GitHub
4. 实测一次 wawazz 调用 → 确认链路通
5. 更新 protocol/05-changelog.md → push GitHub
