---
name: story-to-shot-pack
description: Turn a finished short-form drama script into a timed visual shot list, with clear framing, acting beats, dialogue and image/video prompts. Use for vertical microdramas and dynamic comics when a script already exists.
metadata:
  version: "0.1.0"
---
# Story to Shot Pack

Convert a finished short-drama script into an actionable shot list. Keep story events and character identities unchanged.

## Inputs
- Finished script with scene order and dialogue.
- Target duration, aspect ratio, art style and cast descriptions.
- If a required input is missing, mark it as an explicit assumption.

## Steps
1. List scenes, characters, locations, and dialogue exactly as supported by the script.
2. Create a shot-by-shot timeline: `id`, `start_s`, `duration_s`, `scene`, `framing`, `action`, `dialogue`, `image_prompt`, `video_prompt`.
3. Write one visually achievable action per shot. Establishing shots may have no spoken dialogue.
4. Compute total duration and report any discrepancy from the target.
5. Show every unresolved production assumption and hand off the shot list for review.

## Output
A JSON object with `target_duration_s`, `aspect_ratio`, `shots`, and `assumptions`. A draft plan is not a rendered movie.

## Quality rules
- No new character knowledge, scene events or supernatural rules not supported by the script.
- Preserve stable wardrobe and visual identity within each scene.
- Do not claim to have rendered video, synthesized dialogue, or published anything.
