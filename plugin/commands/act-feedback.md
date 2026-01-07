---
name: act-feedback
description: Report a bug, suggestion, or question with automatic context capture and GitHub Issue creation
---

# /feedback - Report Feedback

You help the user report issues with ACT by capturing context and creating a GitHub Issue.

## Step 0: Check Local Project State (Optional)

**First**, check if an ACT project exists to capture context:

```bash
if [ -f ".epct/state.json" ]; then
  echo "✅ ACT project found - context will be captured"
  cat .epct/state.json
else
  echo "ℹ️  No ACT project found - feedback will be created without ACT context"
fi
```

Note: Feedback can be submitted even without an initialized ACT project.

## Step 1: Check GitHub CLI

```bash
gh auth status
```

If not authenticated, display:
```
⚠️ GitHub CLI not authenticated.
To use /feedback, please run: gh auth login
```
And stop.

## Step 2: Ask Feedback Type

```
╭─────────────────────────────────────────────────────╮
│  📝 What type of feedback?                          │
│                                                     │
│  1. 🐛 Bug - Something doesn't work                 │
│  2. 💡 Suggestion - Idea for improvement            │
│  3. ❓ Question - Need clarification                │
│                                                     │
╰─────────────────────────────────────────────────────╯
```

Map selection to label:
- 1 → `bug`
- 2 → `enhancement`
- 3 → `question`

## Step 3: Ask Description

```
Describe the issue in a few words:
> _
```

## Step 4: Ask Priority (for bugs only)

If type is Bug:
```
╭─────────────────────────────────────────────────────╮
│  ⚡ How severe is this bug?                         │
│                                                     │
│  1. 🔴 Critical - Crash or blocking                 │
│  2. 🟠 High - Feature broken                        │
│  3. 🟡 Medium - Degraded experience                 │
│  4. 🔵 Low - Cosmetic issue                         │
│                                                     │
╰─────────────────────────────────────────────────────╯
```

Map to label:
- 1 → `priority:critical`
- 2 → `priority:high`
- 3 → `priority:medium`
- 4 → `priority:low`

## Step 5: Capture Context (Standard Level)

```bash
# Get ACT version
cat ${ACT_ROOT}/.claude-plugin/plugin.json | python3 -c "import sys,json; print(json.load(sys.stdin)['version'])"

# Get state if exists
python3 ${ACT_ROOT}/skills/state-management/scripts/state_manager.py read 2>/dev/null || echo "{}"
```

Extract from state:
- `phase.current` and `phase.name`
- `mode`
- `project.stack`

Build context block:
```
**ACT Context (auto-captured)**
- Version: v1.1.0
- Phase: 4 - Development
- Mode: COMPLET
- Stack: react, typescript, vite
- Last command: /next
```

## Step 6: Create GitHub Issue

Build issue body:
```markdown
## Description

[User's description]

## ACT Context (auto-captured)

| Field | Value |
|-------|-------|
| Version | v1.1.0 |
| Phase | 4 - Development |
| Mode | COMPLET |
| Stack | react, typescript, vite |
| Last command | /next |

## State Extract

```json
{
  "phase": { "current": 4, "name": "Development" },
  "mode": "COMPLET",
  "scores": { ... }
}
```

## Steps to Reproduce

1. ...

---
*Created via `/feedback` command*
```

Create issue:
```bash
gh issue create \
  --repo manuelturpin/ArtChiTech-framework \
  --title "[TYPE] Description" \
  --body "BODY" \
  --label "type_label" \
  --label "priority_label"
```

Note: If priority_label is not applicable (for suggestions/questions), omit that `--label` flag.

## Step 7: Display Confirmation

```
✅ Issue created successfully!

🔗 https://github.com/manuelturpin/ArtChiTech-framework/issues/XX

Thank you for your feedback!
```

## Error Handling

### GitHub CLI not installed

```
❌ GitHub CLI (gh) not found.

Install it from: https://cli.github.com/

Then authenticate with: gh auth login
```

### Issue creation fails

```
❌ Failed to create issue.

Error: [error message]

You can create an issue manually at:
https://github.com/manuelturpin/ArtChiTech-framework/issues/new
```

### No ACT project initialized

If no `.epct/` exists, still allow feedback but note in context:
```
**ACT Context (auto-captured)**
- Version: v1.1.0
- Phase: N/A (no project initialized)
- Mode: N/A
- Stack: N/A
- Last command: /feedback
```
