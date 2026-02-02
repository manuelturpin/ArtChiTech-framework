# PostToolUse Hook

**Type:** Post-execution hook
**Triggers:** `Write`, `Edit`
**Reliability:** 100%

---

## Purpose

Maintain progress logs after file modifications to ensure:
1. Session continuity (context can be recovered)
2. Work tracking (what was done and when)
3. Handoff readiness (next session can pick up)

## When It Fires

The PostToolUse hook fires **after** these tools complete:
- `Write` - After creating or overwriting files
- `Edit` - After modifying existing files

Note: Does not fire after `Bash` to avoid noise from command output.

## Actions Performed

### 1. Log the Change
```
Record in .act/progress.md:
- Timestamp
- File modified
- Brief description of change
- Relation to current phase
```

### 2. Track Modified Files
```
Maintain a list of recently modified files for:
- Session recovery
- Context handoff
- Change review
```

### 3. Update State (if milestone)
```
If significant milestone reached:
- Update .act/state.md with new progress %
- Mark phase complete if applicable
```

---

## Implementation

### Hook Message
```
📝 File modified. Remember to update .act/progress.md with what was done. 
   If this is a significant milestone, also update .act/state.md.
```

### Checklist for Agent
```markdown
After Write/Edit:
- [ ] Note the file(s) modified
- [ ] Add entry to .act/progress.md
- [ ] If milestone → update .act/state.md
- [ ] If phase complete → mark in plan.md
```

---

## Progress Log Format

### Entry Template
```markdown
### HH:MM - Action Description
- **File(s):** path/to/file.py
- **Change:** Brief description
- **Phase:** Current phase name
- **Status:** In progress | Complete
```

### Example Entry
```markdown
### 14:30 - Created User Model
- **File(s):** src/models/user.py
- **Change:** Added User class with id, email, name fields
- **Phase:** Database Design
- **Status:** In progress (3/5 models done)
```

---

## Examples

### Example 1: Simple File Creation

```
[Write tool executed: src/models/user.py]

[PostToolUse Hook]
→ File created: src/models/user.py
→ Reminder: Update .act/progress.md
→ Agent logs:
  "### 14:30 - Created User model
   - File: src/models/user.py
   - Phase: Database Design"
```

### Example 2: Milestone Reached

```
[Edit tool executed: src/models/order.py - final model]

[PostToolUse Hook]
→ File modified: src/models/order.py
→ Reminder: Update .act/progress.md
→ Agent recognizes: This was the last model!
→ Agent updates:
  - progress.md: "All 5 models complete"
  - state.md: "Phase 2 complete, 40%"
```

### Example 3: Multiple Files

```
[Write tool executed: src/api/routes.py]
[Write tool executed: src/api/handlers.py]

[PostToolUse Hook fires twice]
→ Files modified: routes.py, handlers.py
→ Agent logs combined:
  "### 15:00 - API endpoint structure
   - Files: routes.py, handlers.py
   - Phase: API Implementation"
```

---

## Integration with .act/ Files

### Files Read
- `.act/plan.md` - To determine current phase

### Files Written
- `.act/progress.md` - Session log entries
- `.act/state.md` - Progress updates (milestones only)

---

## Configuration

In `hooks.json`:
```json
"PostToolUse": {
  "enabled": true,
  "triggers": ["Write", "Edit"],
  "config": {
    "progressFile": ".act/progress.md",
    "stateFile": ".act/state.md",
    "trackFiles": true
  }
}
```

---

## Session Recovery Benefits

When a new session starts, the agent can:
1. Read `.act/progress.md` to see last session's work
2. Find the last modified files
3. Understand where to continue
4. Apply the "5-Question Reboot Test"

This enables the Session Recovery pattern from the Context Engineering skill.

---

## Why Log Everything?

From the research synthesis:
> "Context Window = RAM (volatile, limited)"
> "Filesystem = Disk (persistent, unlimited)"

By logging to `.act/progress.md`, we move critical context from the volatile context window to persistent storage, enabling:
- Multi-session projects
- Context handoff between agents
- Audit trail of work done

---

*PostToolUse Hook - ACT v2.5*
