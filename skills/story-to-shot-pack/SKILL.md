---
name: story-to-shot-pack
description: Turn a finished microdrama or dynamic-comic script into a frame-timed storyboard production pack with shot prompts, character and clue continuity, audio cues, and executable JSON validation. Use when producing AI-assisted vertical drama or animation from an existing script.
metadata:
  version: "0.2.0"
---
# Story to Shot Pack

Transform a completed story script into a reproducible, visually actionable shot package. Do not change the canon, invent plot turns, or claim finished media when only a plan exists.

## Inputs
- Locked or reviewable script with scene order and dialogue.
- Story bible: cast identity, wardrobe, location and allowed knowledge; may be an empty ledger if unavailable.
- Target duration, aspect ratio, frame rate, language and art direction.
- Licensed audio/image asset references, if any.

## Workflow
1. Extract facts into a `continuity` ledger: each character's visual identity, scene-specific appearance, exact location, story rule, and the clue's first appearance.
2. Create an ordered shot list, each with one primary action, stable cast IDs, framing, camera movement, light, concrete image prompt and video prompt.
3. Allocate `start_s` and `duration_s` as non-overlapping contiguous ranges. Derive `start_frame` and `end_frame` at target fps; require full target-length coverage.
4. Copy dialogue faithfully into speaking shots. Add audio and caption cues with timings; do not merge two incompatible performances in one generated shot.
5. Validate using `python scripts/validate_shotlist.py <shotlist.json>`. Correct errors; report warnings and unfilled placeholders.
6. Produce `shotlist.json`, continuity ledger, audio/caption plan, unresolved assumptions, and a plain-language quality report.

## Production constraints
- One shot = one dominant visual action. Explicitly describe subject, movement, environment, camera and lighting.
- Keep cast descriptions and IDs stable across shots; changes need script evidence.
- All clues, rules and POV knowledge must match the script and bible. Missing canon cannot be filled by improvising.
- Make characters act visibly instead of describing abstract feelings.
- The plan is **not** a rendered video or evidence of external publication.
- External paid tools, distribution and use of personal assets require separate user authorization.

## Validation and examples
- See [quality gates](references/quality-gates.md) for continuity and audiovisual checks.
- Follow [example JSON](examples/shotlist.example.json) for the JSON shape.
- Use the [local validator](scripts/validate_shotlist.py) for duration, ordering, IDs, timing and dialogue checks.
