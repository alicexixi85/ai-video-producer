# Non-fabrication acceptance checks

Check these independently on the intended runtime:

1. The receiving account can access the shared task artifact and its referenced input.
2. Save-only and live-recipient ACK states remain distinct; an offline recipient does not magically ACK.
3. Task has goal, owner, input, deliverable, constraints, reviewer, deadline and reporting route; any missing essential field is detected.
4. An instruction revision or correction is loaded in a resumed session before new work.
5. The actual Gemini mode was available and the account showed an allowed operation, not just an assumed label.
6. Generation output was saved locally or to a named store, the media file opens, and artifact URI is real.
7. A reviewer checked output against explicit criteria and recorded evidence, rather than only accepting the maker's statement.
8. Publishing shows a real destination object/URL. Timeout without verification yields `PUBLISH_UNKNOWN` and no blind retry.
9. Failed poller/webhook makes the delivery state unknown, rather than successful.
10. A changed session or no true wakeup route is reported as a limitation, not claimed to be working.

This document contains a test plan only. **Bundling these tests does not mean they were run on Muse, Gemini or any other live host.**
