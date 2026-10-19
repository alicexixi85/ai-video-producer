---
name: gemini-full-stack-mastery
description: "Guide practical, cost-aware creative work in Gemini web, AI Studio, Flow and NotebookLM: model selection, image/video/music/TTS generation, downloading and validating outputs, account quota checks, skill use and troubleshooting."
metadata:
  source-version: "v1"
  edition: "public-generalized-2026-10-19"
---
# Gemini Full-Stack Mastery — v1, public edition

> A generalized, privacy-cleared edition of a field-tested Gemini workflow compiled on **2026-10-17**. Screens, labels, model availability and entitlements may change. Treat all model names, limits, menu locations and empirical examples as **dated observations, not guaranteed product specifications**. This is a community workflow, not official Google documentation.

## What this skill does

Choose the right Gemini surface for text, image, video, music, TTS and research; convert an idea into a reproducible prompt; generate, download and verify each artifact; report quota state without guessing. Use the linked guides for deeper feature instructions.

## 1. Before opening a generation workflow

1. Confirm which account and subscription you are using and whether the chosen feature is available on that account. Record only a **redacted account label** in public reports; never expose emails or login slots.
2. Use a stable, single-account browser profile for the task. Avoid confusing sessions and mixing quota readings across accounts. Private browsing is optional rather than a platform requirement.
3. Check the account's **actual displayed** current and longer-horizon usage, reset times and any model-specific lockout before planning a batch. The historical source observed five-hour and weekly indicators; other accounts may differ.
4. For uncertain capabilities, check the live interface, cross-check authoritative documentation and run a bounded low-cost test. Record the source date and whether a result is verified or still open.
5. A queued or animated generation is not a completed file. Require a **real download** and inspect the artifact.

See `references/entitlements.md`, `references/quota-facts.md`, and `references/open-slots.md`.

## 2. Select task and interface

| Task | Practical route | Check before action |
| --- | --- | --- |
| General Q&A or information lookup | A suitable fast / general model, with search where available | Avoid high-cost reasoning for a trivial factual query |
| Complex scripts or storyboard planning | A capable reasoning model, high effort when justified | Split output into reviewable sections and export it |
| Still images | Gemini image mode or another image feature available on the account | Aspect ratio, rights, subject consistency, output resolution |
| Sequential AI video clips | Flow if available, otherwise account-supported video tools | Duration, frame ratio, sound, quota, final render quality |
| Music | Supported music interface such as Lyria | Style, voice, duration, actual download |
| Speech / TTS | AI Studio speech controls where available | Language, chosen voice, levels, downloadable audio |
| Long research | Deep Research or linked sources | Source dates, completeness and citation validity |
| Workspace documents or prototypes | Appropriate editing surface | Exportability, version tracking and access |

The original notes used model labels such as Flash, Pro and Argon. **Do not infer that a historical name or feature remains available today**; select from the current account UI. Model preference is workload-dependent, not a universal ranking.

## 3. Image workflow: idea → prompt → output → quality review

1. **Describe the intended visual** in plain language: subject, setting, action, composition, lighting, materials, aspect ratio, forbidden elements and intended distribution.
2. **Draft a structured image prompt** with a capable text model, or revise an existing user-authored prompt. One subject/action per prompt; state the style and constraints explicitly.
3. **Generate in the image interface**, inspecting visual continuity, brands, readable text, anatomy, and artifacts.
4. If an enhanced/regenerate option exists, use it deliberately. The October field notes saw some regeneration UI options disappear when revisiting an earlier result; **availability is not guaranteed**.
5. **Download and count**. Compare successful generations with real local files; inspect dimensions and visually audit the result. Mark draft/rejected/approved versions separately.

For a batch, ask the system for multiple **distinct creative directions** first; review for duplicate angles before generating each image. Keep prompt and generation IDs paired.

## 4. Video workflow

Pick the supported video route based on the account UI and target format; do not conflate Gemini's chat video action with Flow or the AI Studio model selector. Convert a script to short shots with explicit action, scene motion, camera motion, lighting, ratio and intended duration. Validate the final output rather than relying on the preview. The October internal tests included a talking-animal video template; treat it as an **illustrative dated example** rather than guaranteed UI.

Detailed Flow guidance: `references/flow.md`.

## 5. Music and speech workflow

**Music:** first write a concise music brief (mood, genre, arrangement, duration, vocals/language and use rights); then use the account's available music generation interface. Do not assume a specific model name, quota or duration is guaranteed. Download the finished audio immediately and confirm it is a playable file.

**Speech/TTS:** in the account's available studio interface, choose language, voice and performance style; generate; download; audit intelligibility, distortion, sample rate and clipping. If final publishing involves mixing, apply the production's audio loudness and true-peak target. A field-test target was roughly −16 LUFS integrated / true peak no more than −1 dBTP for dialogue, but this is a **workflow target**, not a platform rule.

See `references/studio.md` for the original UI-observation-based procedure.

## 6. Downloads and project tracking

- Never treat a download-button click or a history entry as proof of delivery.
- Wait until the generated asset finishes loading, save it, and inspect the actual file path, size, duration/resolution and playback.
- Keep two counters: `generated_count` and `verified_download_count`; reconcile them before reporting completion.
- Keep source prompt, model label as displayed, date, permissions and any costs or quota observations together with each artifact.

## 7. Skills, custom tools and research

Find the actual skill/customization entry point in the current UI; read its install constraints and try a harmless sample task. The original field notes documented multiple invocation patterns including explicit selection and automatic triggering; do not make those patterns universal requirements. Review any imported Skill for secrets, local paths, unsupported network actions and package dependencies before use. See `references/open-slots.md` for unresolved or stale behavior.

## 8. Reporting and failure handling

Use a compact report: `account_alias | service/surface | model shown | task | generated | verified_downloads | visible quota status | blockers`. Redact personal identifiers and do not invent absent usage numbers.

For a failure, capture exact error wording, timestamp, model and action, whether a file exists, then retry only when appropriate under platform rules. Avoid automatic mass retries and unsupported anti-abuse claims. Distinguish **UI not available**, **account not entitled**, **API billing needed**, and **download failed** — they are different problems.

## Reference index

- `references/entitlements.md` — subscription / feature matrix, dated and provisional
- `references/studio.md` — Studio audio, music, visual and output verification
- `references/flow.md` — short-form video workflow
- `references/notebooklm-labs.md` — notebook and lab feature workflows
- `references/quota-facts.md` — quotas, evidence quality and rate-limit records
- `references/forbidden.md` — cost, privacy, credentials and publishing safeguards
- `references/open-slots.md` — unresolved details needing recheck

## Provenance and version integrity

This is the **sanitized public adaptation of source version v1**, not a byte-identical historical mirror. Private account readings, staff identities, internal records, project-specific examples and internal links were excluded. Preserve the original historical v1 unchanged in its private archive. Changes in a future public version should be documented independently rather than relabeling old content as new.
