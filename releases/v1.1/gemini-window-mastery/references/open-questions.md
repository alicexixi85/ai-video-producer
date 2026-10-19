# Dated product unknowns and revalidation procedure

As of the original observation date **2026-10-17**, several issues were unresolved or conflicted across field tests. The public edition preserves their *unknown* status instead of presenting one team's account state as universal:

- Model labels and model-selector placement vary; check the current UI before documenting any tier name or ordering.
- Image/music/video quotas, reset periods and costs depend on entitlement and may change; measure the receiving account.
- AI Studio UI access is not identical to API billing or quota availability. Confirm the actual product and current route.
- Flow generation modes, upload controls, image/video export and previews require hands-on verification.
- Skill creation and invocation UI controls can change; test a harmless invocation in the current client rather than hardcoding `@` or `/`.
- Download or clipboard failures can be profile/session or UI issues. Reproduce once, record the visible error, and use normal supported export methods.

For each claim: log `feature | UI date | account tier | test step | observed result | evidence | confidence | next recheck date`. Only upgrade an observation to `VERIFIED_ON_ACCOUNT` when independently reproduced on that particular account.
