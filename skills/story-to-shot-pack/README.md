# Story to Shot Pack

A compact, installable Agent Skill for turning a finished microdrama or dynamic-comic script into frame-timed visual shots. It is a self-contained, sanitized, offline-first community extension.

**Current:** v0.2.0 (continuity ledger, audio/caption cues, example JSON, offline validator).
**History:** v0.1.0 (minimal script-to-shots).

Both public versions were created on 2026-10-19. These labels do not invent private release history.

## Install and test

Copy the complete `skills/story-to-shot-pack/` directory into the skills folder of your compatible AI agent.

Run:
```bash
python scripts/validate_shotlist.py examples/shotlist.example.json
```
The tool only validates structure/timing. It does not generate imagery, run paid services, publish to platforms, or establish commercial usage rights to supplied media.

[中文说明](README.zh-CN.md) · [Version changes](VERSIONS.md)
