# AI Studio: operational observations and validation procedure

This summarizes field-tested procedures from a 2026-10-17 v1 source. Labels and model catalog names may change. **Not an official feature list.**

## Start a test

1. Open the current Google AI Studio product, review the selected project and whether the task is available in the browser UI.
2. Select the service category (text, image, video, audio/speech, music) and the exact model that is **currently visible**.
3. Distinguish the playground's Run action from paid API calls. A `Paid` label may refer to an API price; an actual billing/key requirement must be validated by the operation's UI message.
4. Use a tiny non-sensitive test to establish output, quality and whether a real download is possible.

## Speech and voice

If the interface offers speech synthesis, choose the text and **explicit output language**, speaker or voice, style/expression and model. Test a short excerpt before a long script. Verify downloaded file format, duration, sample rate and audible distortion. The original source observed very different audio quality between a browser-generated result and an API-produced result, so do not presume one route is equivalent to another. Normalize dialogue to your *own project's* audio specification.

## Music

For a supported music model: compose prompt → choose available model → generate → listen → immediately download → verify file. The field notes observed that music History was unreliable for retrieving past outputs; therefore save immediately. Quota limits observed in a one-day batch are not a reliable general daily maximum, because transient throttling and quota caps can look similar.

## Video and images

Choose video format, size, aspect ratio and length, then test availability with the current account. Do not treat an example model listed by a prior release as presently entitled. If a model requires a billing-enabled project, report that exact limitation instead of trying to route around it.

## Essential run log

`date | surface | category/model shown | paid-key requirement observed? | generated file type/duration | verified local download? | errors | source URL`.

Do not record API key strings, project identifiers, private file paths, email addresses or personal usage data in public documentation.
