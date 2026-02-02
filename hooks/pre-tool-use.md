# PreToolUse Hook

**Type:** Pre-execution hook
**Triggers:** `Write`, `Edit`, `Bash`
**Reliability:** 100%

---

## Purpose

Prevent goal drift by refreshing the current plan before any code modification or command execution. This hook ensures the agent stays aligned with the defined phases.

## When It Fires

The PreToolUse hook fires **before** any of these tools execute:
- `Write` - Creating or overwriting files
- `Edit` - Modifying existing files
- `Bash` - Running shell commands

## Actions Performed

### 1. Refresh Plan
```
Read .act/plan.md to understand:
- Current phase
- Phase objectives
- Success criteria
```

### 2. Check Alignment
```
Verify the intended action aligns with current phase:
- Is this action part of the current phase?
- Does it match phase objectives?
- Will it contribute to success criteria?
```

### 3. Apply Deviation Rules
If misalignment detected:

| Deviation Type | Action |
|----------------|--------|
| Bug fix | ✅ Auto-fix immediately |
| Missing critical | ✅ Auto-add immediately |
| Blocker | ✅ Auto-fix immediately |
| Architectural | ⛔ STOP, ask user |
| Enhancement | 📝 Log to ISSUES.md, continue |

---

## Implementation

### Hook Message
```
🎯 Before modifying files: Re-read .act/plan.md to refresh current phase goals. 
   Verify this action aligns with the current phase.
```

### Checklist for Agent
```markdown
Before Write/Edit/Bash:
- [ ] Read .act/plan.md
- [ ] Identify current phase
- [ ] Verify action matches phase objectives
- [ ] If deviation → apply deviation rules
- [ ] Proceed or ask user
```

---

## Examples

### Example 1: Aligned Action

```
Agent wants to: Create user model
Current phase: "Database Design"

[PreToolUse Hook]
→ Reading .act/plan.md...
→ Current phase: 2 - Database Design
→ Objective: Define all data models
→ Action: Create user model
→ ✅ ALIGNED - Proceeding
```

### Example 2: Bug Deviation

```
Agent wants to: Fix failing test
Current phase: "Feature Implementation"

[PreToolUse Hook]
→ Reading .act/plan.md...
→ Current phase: 3 - Feature Implementation
→ Action: Fix failing test
→ ⚠️ DEVIATION DETECTED: Bug fix
→ Rule 1: Auto-fix immediately
→ ✅ PROCEEDING with bug fix
```

### Example 3: Architectural Deviation

```
Agent wants to: Switch from PostgreSQL to MongoDB
Current phase: "Feature Implementation"

[PreToolUse Hook]
→ Reading .act/plan.md...
→ Current phase: 3 - Feature Implementation
→ Action: Database technology change
→ ⚠️ DEVIATION DETECTED: Architectural change
→ Rule 4: STOP, ask user
→ ⛔ BLOCKED - Requesting user decision
```

---

## Integration with .act/ Files

### Files Read
- `.act/plan.md` - Current phase and objectives
- `.act/state.md` - Quick status check

### Files Written
- None (pre-execution only)

---

## Configuration

In `hooks.json`:
```json
"PreToolUse": {
  "enabled": true,
  "triggers": ["Write", "Edit", "Bash"],
  "config": {
    "planFile": ".act/plan.md",
    "checkAlignment": true,
    "deviationRules": {
      "bugs": "auto-fix",
      "missing-critical": "auto-add",
      "blockers": "auto-fix",
      "architectural": "ask-user",
      "enhancements": "log-and-continue"
    }
  }
}
```

---

## Why 100% Reliable?

Unlike skills that depend on the agent remembering to use them, hooks are:
1. **Automatic** - Fire without agent action
2. **Mandatory** - Cannot be skipped
3. **Consistent** - Same behavior every time

---

*PreToolUse Hook - ACT v2.5*
