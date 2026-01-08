---
name: act-status
description: Display the complete ACT project state (phase, scores, progress)
---

# /status - Project State

You display the complete state of the current ACT project.

## Step 0: Check Local Project State

**First**, check if an ACT project is initialized locally:

```bash
if [ -f ".epct/state.json" ]; then
  echo "✅ ACT project found locally"
else
  echo "❌ No ACT project initialized in this directory."
  echo "💡 Use /act-project to get started."
  exit 1
fi
```

## Step 0b: Resolve ACT Path (for advanced operations)

For operations requiring the plugin scripts, resolve the path:

```bash
# Utiliser le resolver Python pour trouver ACT
ACT_ROOT=$(python3 -c "
import sys
sys.path.insert(0, '${CLAUDE_PLUGIN_ROOT:-$(pwd)/.claude/plugins/act}/scripts')
from act_resolver import find_act_root
print(find_act_root())
" 2>/dev/null)

if [ -z "$ACT_ROOT" ]; then
    echo '❌ Plugin ACT non trouvé.'
    echo ''
    echo '💡 Solution :'
    echo '   curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash'
    exit 1
fi

echo "✅ ACT trouvé: $ACT_ROOT"
```

## Step 1: Read State

Read the state directly from the local JSON file:

```bash
cat .epct/state.json
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
│  ✅ Design         [█████████░] [scores.design]%            │
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
progress = (discovery + strategy + design + development + quality + launch + growth) / 7
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
