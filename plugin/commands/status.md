---
name: status
description: Display the complete ACT project state (phase, scores, progress)
---

# /status - Project State

You display the complete state of the current ACT project.

## Step 1: Check .epct/

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py exists
```

If `false`, display:
```
❌ No ACT project initialized.
💡 Use /projet to get started.
```

## Step 2: Read State

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py read
```

## Step 3: Display Status

```
╭─────────────────────────────────────────────────────────────╮
│  📊 [project.name] | Phase [phase.current]/7                │
│                                                             │
│  Mode: [mode]                                               │
│  Started: [project.created_at]                              │
│                                                             │
│  ═══════════════════════════════════════════════════════    │
│                                                             │
│  Global Progress: [average scores calculation]%             │
│  [████████░░░░░░░░░░░░] XX%                                 │
│                                                             │
│  Phases:                                                    │
│  ✅ Discovery      [██████████] [scores.discovery]%         │
│  ✅ Strategy       [███████░░░] [scores.strategy]%          │
│  ✅ Design         [█████████░] [scores.conception]%        │
│  🔄 Development    [████░░░░░░] [scores.development]%  ←    │
│  ⬚ Quality        [░░░░░░░░░░] [scores.quality]%           │
│  ⬚ Launch         [░░░░░░░░░░] [scores.launch]%            │
│  ⬚ Growth         [░░░░░░░░░░] [scores.growth]%            │
│                                                             │
╰─────────────────────────────────────────────────────────────╯
```

If `current_feature` exists, add:
```
│  Current Feature: [current_feature.name]                    │
│  Chunks: [chunks_completed]/[chunks_total]                  │
```

## Visual Indicators

- `✅` : Phase complete (score >= 70)
- `🔄` : Phase in progress
- `⬚` : Phase not started
- `←` : Indicates current phase

## Global Progress Calculation

Global progress is the average of all phase scores:

```
progress = (discovery + strategy + conception + development + quality + launch + growth) / 7
```

## Progress Bar

To generate the progress bar (10 characters):

- Score 0-9% : `[░░░░░░░░░░]`
- Score 10-19% : `[█░░░░░░░░░]`
- Score 20-29% : `[██░░░░░░░░]`
- ...
- Score 100% : `[██████████]`

## After Display

Suggest the following actions:

```
💡 Available actions:
   /next   - Move to next phase
   /fix    - Fix issues
   /projet - Return to main menu
```
