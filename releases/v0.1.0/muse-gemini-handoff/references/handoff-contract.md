# Task and handoff contract — generic example

## Required task fields

```yaml
task_id: EXAMPLE-0042
owner_role: script-editor
recipient_role: video-producer
recipient_session: confirmed-session-alias
input_uri: shared://fictional-project/episode-01/story.md
objective: convert the locked script to a five-shot draft
deliverable_uri: shared://fictional-project/episode-01/shotlist.json
acceptance: five ordered shots, cast identifiers, image/video prompts, audio cues
constraints: no unapproved publishing; do not add worldbuilding rules
due_at: 2026-11-01T12:00:00+08:00
reviewer_role: quality-reviewer
report_to: production-coordinator
state: QUEUED_FOR_DELIVERY
```

## Delivery ≠ read receipt

Log separately: (1) task saved; (2) notification route worked; (3) recipient actually opened it; (4) recipient wrote ACK; (5) executed; (6) reviewer verified the artifact; (7) destination accepted output.

## Minimum ACK

```yaml
task_id: EXAMPLE-0042
source_revision: example-r4
recipient_session: confirmed-session-alias
ack_status: ACKED_BY_SESSION
next_action: review scene constraints and generate shotlist
expected_delivery: 2026-11-01T12:00:00+08:00
```

The collector should not fabricate an ACK on behalf of the recipient. Reference complete instructions when resuming rather than using a summary as proof.
