# AI 短视频制作 Skill

一句话进、成片出：用户只说一句"做一支 XX 视频"，自动完成分镜、Veo 提示词、Flow 镜头生成、验片重生、TTS 旁白、BGM、Remotion 组装渲染，交付可直接发布的 9:16 竖屏成片。

## 它是怎么来的

2026-10-01 实战验证：《用 AI 生活管家 Muse，消灭你的日常琐碎》EP1——
Gemini 写 v3 提示词 → Flow 全自动生成 5 条 8 秒 9:16 镜头（Veo 3.1 Lite，全部一次通过，50 点）→
TTS 旁白 → Lyria BGM → Remotion 组装渲染 1080×1920 / 43 秒成片。

## 核心理念

- **用户零参与**：分镜/提示词/生成/验片/重生/旁白/BGM/剪辑全由 agent 完成，用户只验最终成片
- **导演标准**：每条镜头＝人物动作＋场景动态＋真实运镜；前三秒必须有视觉钩子
- **点数纪律**：不浪费是原则，不设硬上限；先 Lite 验证，该上 Quality 不抠门

## 目录结构

```
ai-video-producer/
├── SKILL.md                    # 主文档：理念＋全流程＋失败模式＋诚实边界
├── references/
│   ├── veo-prompt-guide.md     # Veo 3.1 官方提示词指南精华
│   └── flow-auto-method.md     # Flow 全自动操作法（中转复制法）
├── examples/
│   ├── ep1-shot-prompts.md     # EP1 五条 v3 提示词实录
│   └── ep1-narration.md        # EP1 旁白文案 v2 实录
└── scripts/
    ├── render.sh               # Remotion 渲染脚本
    └── check-audio.sh          # 音频验片：分段音量＋响度
```

## 使用

把整个目录放进你的 agent 的 skills 目录，读 `SKILL.md` 当契约执行。

> 写作方法来自 [女娲 · Skill造人术](https://github.com/alchaincyf/nuwa-skill)。
