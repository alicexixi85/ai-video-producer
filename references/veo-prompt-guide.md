# Veo 3.1 提示词指南精华（实战版）

> 提炼自 Google Cloud Blog《Ultimate prompting guide for Veo 3.1》，经 EP1 五条镜头实战验证。

## 五段式公式（硬规则）

`[Cinematography] + [Subject] + [Action] + [Context] + [Style & Ambiance]`

1. **Cinematography**（运镜＋景别，写最前）：如 `Vertical 9:16, 8-second cinematic photorealistic footage shot on Arri Alexa. At 00:00, the camera begins a slow macro push-in...`
2. **Subject**（主体/人物）
3. **Action**（动作节拍，用 timestamp 分段写，不要模糊动词）
4. **Context**（环境细节）
5. **Style & Ambiance**（美学、光影、情绪）

**最重要的元素前置**，模型优先处理靠前内容。提示词一律英文。

## 运镜写法

写"从哪到哪"的完整机械动作，不要只写 "camera moves"：
- dolly shot（推拉）、tracking shot（跟拍）、crane shot（摇臂）、aerial view（航拍）、slow pan（慢摇）、POV（主观视角）
- wide shot / close-up / extreme close-up / low angle / two-shot
- shallow depth of field（浅景深）、macro lens（微距）、rack focus（变焦对焦）

例：`At 00:00, a Steadicam pushes forward at moderate speed. At 00:04, it executes a smooth mechanical tilt-down, ending with a rapid rack focus at 00:06.`

## Timestamp 分段（8 秒内多 beat）

单条 8 秒内做多镜头序列，用时间戳分段，每段独立动作：

```
00:00-00:02: A hand scratches ink onto a notepad, rips the paper, and flicks it upward.
00:02-00:05: Mid-air, the paper combusts into a spiraling vortex of warm amber light particles.
00:05-00:08: The embers ascend, morphing into a digital document that typesets itself.
```

注意：Gemini 网页端会吞方括号时间戳，写提示词时用无括号纯文本时间戳（`00:00-00:02:` / `At 00:02,`）。

## 声音写法

- 对话：`A woman says, "We have to leave now."`（引号精确台词）
- 音效：`SFX: thunder cracks in the distance.`
- 环境音：`Ambient noise: the quiet hum of a starship bridge.`
- 实战建议：旁白/对白不要在 Veo 里生成，后期配 TTS；Veo 只负责画面＋环境音。

## Negative Prompt

不要堆否定词，要**正面描述排除后的画面**：`a desolate landscape with no buildings or roads`。

## 高级工作流（按需）

1. **首尾帧转场**：Nano Banana 生成首/尾帧 → Veo first/last frame 补中间过渡。适合镜头间高级转场。
2. **Ingredients to Video**：喂人物/场景参考图，多镜头人物一致性最强。适合系列短视频固定主角。
3. **提示词不够细**：官方明确建议用 Gemini 把简单提示词扩写成电影语言（EP1 的 v3 提示词就是这么来的）。
