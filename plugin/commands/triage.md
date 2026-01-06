---
name: triage
description: View and manage open GitHub Issues for ACT framework (maintainer tool)
---

# /triage - Issue Triage

You display open issues and help the maintainer manage them.

## Step 1: Check GitHub CLI

```bash
gh auth status
```

If not authenticated, display:
```
⚠️ GitHub CLI not authenticated.
To use /triage, please run: gh auth login
```
And stop.

If GitHub CLI not installed:
```
❌ GitHub CLI (gh) not found.

Install it from: https://cli.github.com/

Then authenticate with: gh auth login
```
And stop.

## Step 2: Fetch Open Issues

```bash
gh issue list \
  --repo manuelturpin/ArtChiTech-framework \
  --state open \
  --json number,title,labels,createdAt \
  --limit 20
```

Parse the JSON response into a structured list.

## Step 3: Display Issues by Priority

Parse labels and sort by priority (highest first):

Priority mapping:
- `priority:critical` → 🔴 (sort order: 1)
- `priority:high` → 🟠 (sort order: 2)
- `priority:medium` → 🟡 (sort order: 3)
- `priority:low` → 🔵 (sort order: 4)
- `question` → ❓ (sort order: 5)
- `enhancement` → 💡 (sort order: 6)
- No priority label → ⚪ (sort order: 7)

Display format:
```
╭─────────────────────────────────────────────────────────────╮
│  📋 Open Issues (N)                                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  🔴 #12 [critical] Crash on /next command                   │
│  🟠 #11 [high] Score not updated after phase change         │
│  🟡 #10 [medium] Typo in help message                       │
│  💡 #9  [enhancement] Add dark mode support                 │
│  ❓ #8  [question] How to reset project state?              │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│  Actions:                                                   │
│  • Enter issue number to view details                       │
│  • Type "fix N" to start /fix-issue N                       │
│  • Type "close N" to close issue                            │
│  • Type "q" to quit                                         │
╰─────────────────────────────────────────────────────────────╯
```

## Step 4: Handle User Action

Wait for user input and process the action:

### View Details (number only)

When user enters just a number (e.g., `12`):

```bash
gh issue view 12 --repo manuelturpin/ArtChiTech-framework
```

Display the issue details:
```
╭─────────────────────────────────────────────────────────────╮
│  🔍 Issue #12                                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Title: Crash on /next command                              │
│  Type: bug                                                  │
│  Priority: critical                                         │
│  Created: 2026-01-05                                        │
│                                                             │
│  Description:                                               │
│  [Issue body content...]                                    │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│  Actions:                                                   │
│  • Type "fix" to start /fix-issue 12                        │
│  • Type "close" to close this issue                         │
│  • Type "back" to return to list                            │
╰─────────────────────────────────────────────────────────────╯
```

### Fix Issue (fix N)

When user types `fix N` (e.g., `fix 12`):

→ Spawn `/fix-issue N`

This hands off to the fix-issue command which will guide the maintainer through implementing a fix.

### Close Issue (close N)

When user types `close N` (e.g., `close 12`):

First confirm:
```
Are you sure you want to close issue #12? (y/n)
```

If confirmed:
```bash
gh issue close 12 --repo manuelturpin/ArtChiTech-framework --comment "Closed via /triage"
```

Display:
```
✅ Issue #12 closed.
```

### Quit (q)

When user types `q`:
```
👋 Triage session ended.
```
And stop.

## Step 5: Loop or Exit

After any action (except "q"), return to the issue list by repeating from Step 2.

This creates an interactive loop that allows the maintainer to:
1. View list → View details → Back to list
2. View list → Fix issue → (handled by /fix-issue)
3. View list → Close issue → Back to list

## No Issues Found

If no open issues exist:
```
╭─────────────────────────────────────────────────────────────╮
│  📋 Open Issues (0)                                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  🎉 No open issues!                                         │
│                                                             │
│  Everything is looking good.                                │
│                                                             │
╰─────────────────────────────────────────────────────────────╯
```

## Error Handling

### Network Error

```
❌ Failed to fetch issues.

Error: [error message]

Check your network connection and try again.
```

### Issue Not Found

```
❌ Issue #N not found.

It may have been closed or deleted.
```

### Close Failed

```
❌ Failed to close issue #N.

Error: [error message]

You may not have permission to close this issue.
```

## Label Parsing Logic

For each issue, extract labels and determine:

1. **Type**: First match of `bug`, `enhancement`, or `question`
2. **Priority**: First match of `priority:critical`, `priority:high`, `priority:medium`, `priority:low`
3. **Display indicator**: Based on priority > type > default

Example label parsing:
- `["bug", "priority:critical"]` → 🔴 [critical]
- `["bug", "priority:high"]` → 🟠 [high]
- `["enhancement"]` → 💡 [enhancement]
- `["question"]` → ❓ [question]
- `[]` → ⚪ [unlabeled]
