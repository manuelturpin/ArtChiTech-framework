---
name: act-next
description: Check Go/No-Go criteria and proceed to the next phase
---

# /next - Next Phase

You manage the transition to the next phase of the ACT project.

## Step 0: Check Local Project State

**First**, check if an ACT project is initialized locally:

```bash
if [ -f ".epct/state.json" ]; then
  echo "✅ ACT project found locally"
  cat .epct/state.json
else
  echo "❌ No ACT project initialized in this directory."
  echo "💡 Use /act-project to get started."
  exit 1
fi
```

## Step 0b: Resolve ACT Path (for write operations)

For operations requiring the plugin (checkpoint, update), resolve the path:

```bash
ACT_ROOT="${CLAUDE_PLUGIN_ROOT:-.claude/plugins/act}"
# Note: ACT_ROOT is only needed for checkpoint/update operations
# Reading state works directly from .epct/state.json
```

## Step 1: Read State

Read the state directly from the local JSON file:

```bash
cat .epct/state.json
```

Or if using the state manager script (when ACT_ROOT is available):

```bash
python3 ${ACT_ROOT}/skills/state-management/scripts/state_manager.py read
```

If current phase = 7, display:
```
🎉 Congratulations! You are in the Growth phase (7/7).
This is the last phase - keep iterating!
```

## Step 2: Check Go/No-Go

The current phase score must be >= 70% to proceed.

Consult the criteria in the `phase-scoring` skill:
- Discovery: README, problem defined, users
- Strategy: Roadmap, business model
- Design: Architecture, specs
- Development: Code, tests, CI
- Quality: Coverage, bugs
- Launch: Deploy, monitoring
- Growth: Analytics, feedback

## Step 3a: If Criteria OK (score >= 70)

Display:
```
╭─────────────────────────────────────────────────────────────╮
│  ✅ Phase [current]: [name] completed!                      │
│                                                             │
│  Score: [score]%                                            │
│  Validated criteria:                                        │
│  ✓ [criterion 1]                                            │
│  ✓ [criterion 2]                                            │
│  ✓ [criterion 3]                                            │
│                                                             │
│  Proceed to phase [next]: [next-name]?                      │
│  [y/n]                                                      │
╰─────────────────────────────────────────────────────────────╯
```

If yes:
1. Create a checkpoint
2. Update the phase

```bash
python3 ${ACT_ROOT}/skills/state-management/scripts/state_manager.py checkpoint
python3 ${ACT_ROOT}/skills/state-management/scripts/state_manager.py update \
  --updates '{"phase": {"current": [next], "name": "[next-name]", "started_at": "[now]"}}'
```

Display:
```
🎯 Phase [next-name] activated!
💡 Use /projet to see available actions.
```

## Step 3b: If Criteria NOT OK (score < 70)

Display:
```
╭─────────────────────────────────────────────────────────────╮
│  ❌ Cannot proceed to the next phase                        │
│                                                             │
│  Current phase: [name] ([current]/7)                        │
│  Score: [score]% (minimum required: 70%)                    │
│                                                             │
│  Missing criteria:                                          │
│  ✗ [missing criterion 1]                                    │
│  ✗ [missing criterion 2]                                    │
│                                                             │
│  💡 Recommended actions:                                    │
│  1. [action for criterion 1]                                │
│  2. [action for criterion 2]                                │
│                                                             │
│  Use /fix to address issues.                                │
╰─────────────────────────────────────────────────────────────╯
```

## Phase Names

| Phase | Name |
|-------|------|
| 1 | Discovery |
| 2 | Strategy |
| 3 | Design |
| 4 | Development |
| 5 | Quality |
| 6 | Launch |
| 7 | Growth |

## Go/No-Go Criteria by Phase

### Phase 1 → 2 (Discovery → Strategy)
- README with documented problem
- Personas/users defined
- Initial validation done

### Phase 2 → 3 (Strategy → Design)
- Roadmap defined
- Business model documented
- KPIs identified

### Phase 3 → 4 (Design → Development)
- Architecture documented
- Tech stack chosen
- Technical specs written

### Phase 4 → 5 (Development → Quality)
- Source code present
- Tests written
- CI/CD configured

### Phase 5 → 6 (Quality → Launch)
- Coverage >= 60%
- No critical bugs
- Performance validated

### Phase 6 → 7 (Launch → Growth)
- Deployed to production
- Monitoring in place
- User documentation
