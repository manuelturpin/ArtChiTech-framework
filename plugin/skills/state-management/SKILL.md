---
name: state-management
description: This skill should be used when the user needs to "create project state", "read project status", "update phase", "save checkpoint", or when any ACT command needs to persist or retrieve project state from .epct/.
version: 1.0.0
---

# State Management Skill

## Purpose

Manage the `.epct/` directory and `state.json` file that tracks project progress through ACT phases.

## Commands

### Initialize new project state

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py init --name "project-name" --type "webapp" --stack "react,typescript,vite"
```

### Read current state

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py read
```

### Update state

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py update --updates '{"phase": {"current": 2, "name": "Strategy"}}'
```

### Create checkpoint

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py checkpoint
```

### Recover from checkpoint

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py recover --checkpoint-file "2026-01-06T10-30-00.json"
```

### Check if .epct/ exists

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py exists
```

## State Structure

The `state.json` file contains:

```json
{
  "version": "1.0.0",
  "project": {
    "name": "project-name",
    "type": "webapp",
    "stack": ["react", "typescript"],
    "created_at": "2026-01-06T10:00:00"
  },
  "phase": {
    "current": 1,
    "name": "Discovery",
    "started_at": "2026-01-06T10:00:00"
  },
  "scores": {
    "discovery": 0,
    "strategy": 0,
    "conception": 0,
    "development": 0,
    "quality": 0,
    "launch": 0,
    "growth": 0
  },
  "mode": "COMPLET",
  "current_feature": null
}
```

## Directory Structure

```
.epct/
├── state.json           # Current project state
├── session/
│   └── recovery.json    # Session recovery data
└── history/
    └── checkpoints/     # State snapshots
        ├── 2026-01-06T10-30-00.json
        └── ...
```

## When to Use

- `/onboard`: init after audit
- `/projet`: read to determine context
- `/next`: update phase after transition
- `/status`: read for display
- `/resume`: recover from checkpoint
- Any command needing project state
