---
name: act-resume
description: Resume a previous work session
---

# /resume - Session Resume

You help resume work where it left off.

## Step 0: Resolve ACT Path

First, resolve the plugin path with fallback for local installation:

```bash
ACT_ROOT="${CLAUDE_PLUGIN_ROOT:-.claude/plugins/act}"
if [ ! -d "$ACT_ROOT/skills" ]; then
  echo "❌ Plugin ACT not found in $ACT_ROOT"
  echo "💡 Install with: ./scripts/install-local.sh $(pwd)"
  exit 1
fi
```

## Step 1: Check State

```bash
python3 ${ACT_ROOT}/skills/state-management/scripts/state_manager.py read
```

If no `.epct/`, display:
```
❌ No ACT project to resume.
💡 Use /projet to get started.
```

## Step 2: Analyze Context

Display the summary:
```
╭─────────────────────────────────────────────────────────────╮
│  🔄 Session Resume                                          │
│                                                             │
│  Project: [project.name]                                    │
│  Phase: [phase.name] ([phase.current]/7)                    │
│  Mode: [mode]                                               │
│                                                             │
```

If `current_feature` exists:
```
│  Feature in progress: [current_feature.name]                │
│  Progress: [chunks_completed]/[chunks_total] chunks         │
│                                                             │
│  Last action: [description]                                 │
│                                                             │
│  Continue this feature? [y/n]                               │
╰─────────────────────────────────────────────────────────────╯
```

Otherwise:
```
│  No task in progress.                                       │
│                                                             │
│  Options:                                                   │
│  1. View full status (/status)                              │
│  2. Continue current phase (/projet)                        │
│  3. Restore a previous checkpoint                           │
╰─────────────────────────────────────────────────────────────╯
```

## Step 3: Restore a Checkpoint (if requested)

List available checkpoints:
```bash
ls -la .epct/history/checkpoints/
```

```
Available checkpoints:
[1] 2026-01-06T10-30-00.json - Phase 3, Score 85%
[2] 2026-01-05T15-45-00.json - Phase 3, Score 70%
[3] 2026-01-04T09-00-00.json - Phase 2, Score 65%

Which one to restore? [number]
```

If choice made:
```bash
python3 ${ACT_ROOT}/skills/state-management/scripts/state_manager.py recover \
  --checkpoint-file "[filename]"
```

## After Restoration

Display:
```
✅ Checkpoint restored!

📊 Current state:
   Phase: [phase.name] ([phase.current]/7)
   Score: [score]%

💡 Use /status to see details.
```

## Special Cases

### Old Session (> 7 days)

```
⚠️  Session found but old ([X] days ago)

The context may be incomplete or outdated.
Recommendation: /onboard to re-audit the project.

Continue anyway? [y/n]
```

### Multiple Features in Progress

If the state shows multiple unfinished features:

```
⚠️  Multiple features detected:

1. [feature1.name] - [status]
2. [feature2.name] - [status]

Which one to continue? [number]
```

### No Checkpoint

If `.epct/history/checkpoints/` is empty:

```
📁 No saved checkpoint.

The project is in phase [phase.name].
Use /status to see the current state.
```
