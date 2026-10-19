# Account/session and storage checklist (generic public example)

The private original v1.1 carried a full real account map and cloud folder IDs. **Those tables and IDs are intentionally excluded from this public derivative.**

## Before starting

- Confirm the intended account **locally** in its own account menu. Use an alias such as `creative-account-A` in portable logs; never record or publish an email address or session token in this repository.
- When multiple profiles are in use, make sure the active profile and current tab both match the intended account. A successful sign-in is not confirmed until the live product UI shows the intended account.
- If login confirmation or two-factor approval is required, let the account holder perform it; never ask an agent to bypass authentication or reuse browser secrets.
- After login or unexpected redirect, reload the authenticated product page and independently recheck the active account before generating.

## Portable output layout

```text
workspace/
  source/                 # user-supplied inputs
  prompts/                # versioned prompt drafts
  generated/images/       # downloaded and inspected assets
  generated/audio/
  generated/video/
  reviews/                # quality notes and checksums
```

A local save or a successful browser click does not prove that a file is present: check the actual downloaded file, media format, length and quality before reporting completion.
