# OnError Hook

**Type:** Error handling hook  
**Triggers:** `tool_error`, `command_failure`, `validation_error`  
**Reliability:** 100%

---

## Purpose

Handle operation failures gracefully by:
1. Logging errors to progress.md for visibility
2. Suggesting recovery actions
3. Linking to Deviation Rules for autonomous decisions
4. Preventing silent failures that break context

---

## When It Fires

| Trigger | Description |
|---------|-------------|
| `tool_error` | Tool execution fails (Write, Edit, Bash, etc.) |
| `command_failure` | Shell command returns non-zero exit code |
| `validation_error` | Input/output validation fails |

---

## Actions Performed

### 1. Log the Error
```
Record in .act/progress.md:
- Timestamp
- Error type
- Brief description
- Context (what was being attempted)
```

### 2. Check Deviation Rules
```
Consult Rule 3 (Blockers) for guidance:
- Is this a blocker? → Auto-fix if possible
- Needs user input? → Ask and log
- Can retry? → Suggest retry strategy
```

### 3. Suggest Recovery
```
Based on error type:
- Retry with different approach
- Ask user for clarification
- Log and continue if non-critical
```

---

## Implementation

### Hook Message
```
⚠️ Error detected. Logging to progress.md and checking Deviation Rules...
```

### Checklist for Agent
```markdown
On Error:
- [ ] Log error to .act/progress.md with timestamp
- [ ] Identify error type (tool/command/validation)
- [ ] Check Deviation Rules (Rule 3 - Blockers)
- [ ] Apply appropriate recovery strategy
- [ ] Update state if error blocks progress
```

---

## Error Log Format

### Entry Template
```markdown
### [YYYY-MM-DD HH:mm] ⚠️ ERROR: Brief Description
- **Type:** tool_error | command_failure | validation_error
- **Context:** What was being attempted
- **Error:** Error message or details
- **Action:** How it was handled
- **Status:** Resolved | Blocked | Retrying
```

### Example Entries

```markdown
### [2026-02-01 14:30] ⚠️ ERROR: File write permission denied
- **Type:** tool_error
- **Context:** Creating config file in /etc/
- **Error:** Permission denied: /etc/app.conf
- **Action:** Changed target to ~/.config/app.conf
- **Status:** Resolved (alternative path used)

### [2026-02-01 15:00] ⚠️ ERROR: npm install failed
- **Type:** command_failure
- **Context:** Installing dependencies
- **Error:** ENOENT: package.json not found
- **Action:** Asked user - wrong directory
- **Status:** Resolved (changed to correct dir)

### [2026-02-01 15:30] ⚠️ ERROR: API validation failed
- **Type:** validation_error
- **Context:** Testing user creation endpoint
- **Error:** Missing required field: email
- **Action:** Added email to test payload
- **Status:** Resolved
```

---

## Link to Deviation Rules

This hook integrates with **Rule 3: Blockers** from the Deviation Rules:

| Blocker Type | Action |
|--------------|--------|
| Technical blocker | Auto-fix if possible, else ask |
| Missing info | Ask user, log question |
| Dependency failure | Retry or find alternative |
| Permission issue | Escalate to user |

### Decision Flow
```
Error Detected
     │
     ▼
Can auto-fix? ──Yes──▶ Fix and log
     │
     No
     │
     ▼
Retry possible? ──Yes──▶ Retry (max 2x)
     │
     No
     │
     ▼
Ask user and wait
```

---

## Examples

### Example 1: Recoverable Tool Error

```
[Edit tool fails: file not found]

[OnError Hook]
→ Logging to progress.md:
  "[2026-02-01 14:30] ⚠️ ERROR: File not found"
→ Checking Deviation Rules (Rule 3)
→ Auto-fix: Check if file exists elsewhere
→ Found at different path
→ Retry successful
→ Log resolution
```

### Example 2: Command Failure with Retry

```
[Bash command fails: network timeout]

[OnError Hook]
→ Logging: "Command failed: curl timeout"
→ Deviation Rules: Retry allowed
→ Retry 1/2... still failing
→ Retry 2/2... success!
→ Log: "Resolved after 2 retries"
```

### Example 3: Blocker Requiring User Input

```
[Validation error: missing API key]

[OnError Hook]
→ Logging: "Validation failed: API key required"
→ Deviation Rules: Need user input
→ Ask: "Please provide the API key for..."
→ Wait for response
→ Continue when received
```

---

## Configuration

In `hooks.json`:
```json
"OnError": {
  "enabled": true,
  "triggers": ["tool_error", "command_failure", "validation_error"],
  "action": "log_and_recover",
  "config": {
    "logTo": "progress.md",
    "suggestRetry": true,
    "linkToDeviationRules": "rule-3"
  }
}
```

### Options

| Option | Type | Description |
|--------|------|-------------|
| `logTo` | string | File to log errors (default: progress.md) |
| `suggestRetry` | boolean | Suggest retry strategies |
| `linkToDeviationRules` | string | Which rule to consult |

---

## Benefits

### Without OnError Hook
```
- Error occurs silently
- Agent continues without logging
- Context lost for recovery
- User unaware of issues
- Debugging becomes difficult
```

### With OnError Hook
```
- Error logged immediately
- Deviation Rules consulted
- Recovery attempted automatically
- User informed if needed
- Full audit trail maintained
```

---

## Integration with Other Hooks

| Hook | Relationship |
|------|--------------|
| PreToolUse | OnError may trigger re-read of plan |
| PostToolUse | OnError logs before PostToolUse |
| Stop | OnError blocks premature completion |

---

## Why This Matters

From the Iron Laws:
> "No silent failures. Log everything."

OnError ensures that:
1. **Visibility** - Errors are always visible in progress.md
2. **Recovery** - Automatic recovery when possible
3. **Escalation** - User involvement when needed
4. **Continuity** - Context preserved across errors

---

*OnError Hook - ACT v2.5*
*Graceful failure handling for reliable agent behavior.*
