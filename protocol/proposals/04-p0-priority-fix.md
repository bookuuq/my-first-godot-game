# PROPOSAL — P0 优先级修正：回路优于产物

> 提案者: Claude | 阶段: ⏳ 待验证 | 日期: 2026-07-29

## 问题

SYSTEM-OVERVIEW.md 当前的 P0 把 learn-review 重写和 m3 代码落地并列。这是错的——learn-review 是架构回路，m3 是这条回路产出的第一个产物。没修引擎先造车，顺序不对。

## 修正

```
P0 true order:

Step 1: 重写 learn-review
  → 让"复盘"成为真实可工作的操作
  → 对话提取 → 更新 roadmap.json → 更新 README → 更新 user-profile
  → 验证: 跑一次空复盘，确认中枢文件更新成功

Step 2: 落地 m3 碰撞检测代码（作为 learn-review 的首次实战）
  → 用户写碰撞检测代码（或用户学、Claude 帮写）
  → quick-save 推送到 GitHub
  → learn-review 做复盘: 里程碑 m3→完成, skillTree godot Lv.1→Lv.2
  → 交叉验证: codebase 清单、learningLog、completedMilestones 全部一致

Step 3: 落地 m3 敌人生成代码（同理）
  → 同样的 learn-review 回路再来一遍
```

这样 m3 不只是代码落地，更是**架构的首次实弹测试**——完整链路: 学习 → 编码 → 复盘 → 中枢更新 → 交叉验证。

## 改动

| 文件 | 改动 |
|------|------|
| SYSTEM-OVERVIEW.md | P0 分拆为 Step 1/2/3 |
| protocol/03-skills/learn-review.md | 按新协议重写 |
| learn-review SKILL.md | 重写（save_skill） |

## 影响

- 不涉及其他 7 个技能
- 不涉及 roadmap.json 结构
- 不涉及生图 MCP

## 验证项

```
□ learn-review 新技能文件输入/输出/副作用与 protocol/03-skills 一致
□ 空复盘流程中枢更新可验证（GitHub commit diff）
□ m3 代码 + 复盘完整链路可验证（codebase + milestone + skillTree 一致性）
```