---
name: muse-gemini-handoff
description: "Coordinate multiple AI work sessions and Gemini creative workflows through source-backed task handoffs, acknowledgement, review evidence, context recovery, and careful separation of assigned, delivered, approved, and published states. Use when a team passes work across AI chat sessions or needs an auditable Gemini task pipeline."
metadata:
  version: "0.1.0-public-candidate"
  sources: "workflow draft 2026-10-12 and operations handbook 2026-10-14"
---
# Muse + Gemini: source-backed collaboration (public candidate)

This Skill **packages reusable methods** from two earlier team documents: a 2026-10-12 design draft and a 2026-10-14 operating handbook. The source documents were not originally published as one standalone, signed Skill. Therefore this is a **new public packaging candidate**, not a claim that historical `muse-gemini-handoff v1` ever existed. It is not an official Muse or Google product integration, and it does not implement a native message-injection or wakeup API.

## Purpose and supported conditions

Use this for multi-session teams coordinating creative tasks through a shared file store or a connected task service. The central problem is evidence continuity: a stored instruction is not equivalent to a recipient reading it, and a generation command is not equivalent to a reviewed deliverable.

## Minimal working sequence

1. **Identify the task.** Record stable task ID, objective, owner, actual recipient session, inputs, deliverable, acceptance criteria, constraints, deadline, reviewer and reporting route; use `references/handoff-contract.md`.
2. **Check tools and authority.** Verify recipient capabilities and their live Gemini account UI where relevant. Separate Gemini web, AI Studio, Flow, other agents and automation APIs. See `references/gemini-routing.md`.
3. **Deliver an instruction to a real access path.** Save the complete task or handoff in the shared folder/service. Record the source path/URI, revision, summary and delivery event. Do not assume a stored file wakes an inactive agent.
4. **Acknowledge using evidence.** The receiving session must actually open the instruction and write an ACK containing task ID, source revision, next action and genuine contact/session identity. If no live ACK arrives, use `WAITING_FOR_RECIPIENT`; never invent acceptance.
5. **Perform and save work.** Store artifacts in the production asset location; link them from the handoff. Avoid retaining private account tokens or customer data in a public log. Record Gemini feature/model choice and observable quota cost where applicable.
6. **Review independently.** A reviewer checks deliverables against acceptance criteria and exact files. Store the review result separately; a maker's claim is not final QA.
7. **Publish only with authorization.** Mark `PUBLIC_VERIFIED` only when an actual platform URL/object ID is available, and verify that the intended account and artifact were published. Avoid automatic retry of uncertain publish actions.
8. **Recover context.** For new sessions, restore only the current task, latest corrections and evidence pointers before loading full history; use `references/runtime-boundaries.md`.

## Truthful state vocabulary

`DRAFT` → `QUEUED_FOR_DELIVERY` → `DELIVERED_TO_STORE` → `ACKED_BY_SESSION` → `IN_PROGRESS` → `ARTIFACT_SUBMITTED` → `REVIEW_APPROVED` → `TRANSFERRED_TO_NEXT_STAGE` → `CLOSED`.

Exception states: `WAITING_FOR_RECIPIENT`, `BLOCKED`, `REVIEW_REJECTED`, `CANCELLED`, `STATE_UNKNOWN`, `PUBLISH_UNKNOWN`. An automatic polling process may discover new files, but unless there is a proven delivery mechanism it cannot mark `ACKED_BY_SESSION`.

## Documentation

- `references/handoff-contract.md`: reusable job fields and handoff/ACK examples
- `references/runtime-boundaries.md`: shared data vs native session, polling and recovery
- `references/gemini-routing.md`: when/how to route to Gemini creative tools
- `references/verification.md`: acceptance tests and zero-fabrication metrics

## Security and provenance

This is an anonymized workflow model only. No real employee/account roster, passwords, Drive folder IDs, internal paths, customer records or private media filenames belong in public examples. Nothing here grants an agent new permissions. Production use requires testing the actual host and approving platform actions per the operator's policy.
