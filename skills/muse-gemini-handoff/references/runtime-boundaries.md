# Real runtime boundaries: files, polling, sessions and memory

- A shared file store persists job definitions, receipts and production artifact pointers. It is **not automatically a live messaging system**.
- A scheduler can poll at a supported frequency and discover files. `POLL_DISCOVERED` means only that a polling process found a file, not that an AI session opened it.
- Agent sessions require a real host-supported notification, webhook, inbox, action or manual open to receive and acknowledge instructions. If a host offers no native wakeup, mark that hop as unsupported.
- Chat memory is only a navigation aid. Restore objective, current revision, last correction, evidence pointers, next recipient and known blockers as a compact context pack. Fetch original text when proving facts.
- Use one authoritative current-state record plus append-only transition events. Do not let many agents overwrite the same status row concurrently.
- Keep artifacts in their production location; handoffs store pointers, not uncontrolled copies of source video or confidential work.
- On timeouts, report `STATE_UNKNOWN` until the receiver or external platform can be checked. Check before retrying irreversible publication or payment calls.
- Never claim a production system is installed, that all users are online, or that files were opened unless a real execution trace proves it.
