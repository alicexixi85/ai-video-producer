# Quota measurement and reporting

The source v1 recorded account-specific percentages, resets and isolated model trials on 2026-10-17. Those **private examples were removed** from this public edition; they are not portable usage limits.

## Read, don't infer

1. Confirm the currently active account; log only an anonymous alias.
2. Record the actual displayed **short-window**, **long-window** and **model-specific** limits or lockouts *when present*. Write `not displayed` for missing metrics.
3. Note the UI's timezone and reset timestamp. Weekly percentages are not a universal daily budget. Never infer a fixed 'jobs per day' from an unrelated model or account.
4. For each generation test, record the difference between before and after usage indicators, number of attempts and successful saved outputs.
5. Handle transient errors and throttling separately from an explicit quota-exceeded message. Do not repeatedly submit the same prompt to probe a suspected limit.

Example redacted record:

```text
account_alias=test-account-A
service=Gemini web
model=as-shown-in-current-UI
window_usage=not displayed
weekly_usage=not displayed
reset=not displayed
attempts=1
verified_downloads=1
source=local UI, YYYY-MM-DD
```

All numeric entitlement claims must be dated and linked to current documentation or a reproducible, properly scoped observation.
