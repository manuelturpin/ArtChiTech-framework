# ACT v2.5 Hooks System

> **"Hooks are 100% reliable (vs skills ~50-80%)"**

---

## Overview

The Hooks System provides automated triggers that fire at specific points during agent execution. Unlike skills which depend on the agent remembering to use them, hooks are **mandatory** and **automatic**.

## The 5 Essential Hooks

| Hook | Trigger | Purpose |
|------|---------|---------|
| **PreSession** | Session start/context reset | Load context, enable recovery |
| **PreToolUse** | Before Write/Edit/Bash | Refresh goals, prevent drift |
| **PostToolUse** | After Write/Edit | Update progress, enable recovery |
| **OnError** | Tool/command/validation failures | Log errors, enable recovery |
| **Stop** | Completion claims | Verify before allowing done |

---

## Quick Start

### 1. Initialize Hooks

Hooks are configured in `hooks/hooks.json`. They work with the `.act/` context files:

```
.act/
├── plan.md      ← PreToolUse reads this
├── progress.md  ← PostToolUse writes here
└── state.md     ← Both read/write
```

### 2. How They Work

```
┌─────────────────────────────────────────┐
│           Agent Workflow                │
│                                         │
│  [Action Request]                       │
│        │                                │
│        ▼                                │
│  ┌─────────────┐                        │
│  │ PreToolUse  │ → Read plan.md         │
│  │             │ → Check alignment      │
│  └─────────────┘                        │
│        │                                │
│        ▼                                │
│  [Execute Tool]                         │
│        │                                │
│        ▼                                │
│  ┌─────────────┐                        │
│  │ PostToolUse │ → Update progress.md   │
│  │             │ → Track files          │
│  └─────────────┘                        │
│        │                                │
│        ▼                                │
│  [Completion?]                          │
│        │                                │
│        ▼                                │
│  ┌─────────────┐                        │
│  │ Stop        │ → Verify all phases    │
│  │             │ → Allow or block       │
│  └─────────────┘                        │
└─────────────────────────────────────────┘
```

---

## Hook Details

### PreSession Hook

**When:** Session start, context reset

**Action:**
1. Read `.act/state.md` for current state
2. Read `.act/plan.md` for goals
3. Generate catchup report if enabled

**Message:**
```
🔄 Reading project context... Check .act/state.md for current status.
```

📖 [Full documentation](./pre-session.md)

---

### PreToolUse Hook

**When:** Before `Write`, `Edit`, `Bash`

**Action:** 
1. Re-read `.act/plan.md`
2. Verify action aligns with current phase
3. Apply deviation rules if needed

**Deviation Rules:**
| Type | Action |
|------|--------|
| Bugs | Auto-fix |
| Missing critical | Auto-add |
| Blockers | Auto-fix |
| Architectural | Ask user |
| Enhancements | Log & continue |

📖 [Full documentation](./pre-tool-use.md)

---

### PostToolUse Hook

**When:** After `Write`, `Edit`

**Action:**
1. Log change to `.act/progress.md`
2. Track modified files
3. Update state on milestones

**Progress Entry Format:**
```markdown
### HH:MM - Action Description
- **File(s):** path/to/file
- **Change:** Brief description
- **Phase:** Current phase
```

📖 [Full documentation](./post-tool-use.md)

---

### Stop Hook

**When:** Agent claims completion

**Action:**
1. Read `.act/plan.md` for all phases
2. Verify each phase has evidence
3. Block if incomplete, allow if verified

**Evidence Types:**
- Git commits
- Test results
- Documentation
- Review notes

📖 [Full documentation](./stop.md)

---

### OnError Hook

**When:** Tool error, command failure, validation error

**Action:**
1. Log error to `.act/progress.md`
2. Check Deviation Rules (Rule 3 - Blockers)
3. Attempt recovery or escalate

**Message:**
```
⚠️ Error detected. Logging to progress.md and checking Deviation Rules...
```

📖 [Full documentation](./on-error.md)

---

## Configuration

### hooks.json

```json
{
  "version": "1.0",
  "hooks": {
    "PreToolUse": {
      "enabled": true,
      "triggers": ["Write", "Edit", "Bash"],
      "config": { ... }
    },
    "PostToolUse": {
      "enabled": true,
      "triggers": ["Write", "Edit"],
      "config": { ... }
    },
    "Stop": {
      "enabled": true,
      "triggers": ["complete", "done", "finished"],
      "config": { ... }
    }
  }
}
```

### Enable/Disable Hooks

```json
"PreToolUse": {
  "enabled": false  // Disable this hook
}
```

### Strict Mode

```json
"global": {
  "strictMode": true  // Block on missing evidence
}
```

---

## Why Hooks > Skills

| Aspect | Skills | Hooks |
|--------|--------|-------|
| Reliability | ~50-80% | 100% |
| Activation | Agent must remember | Automatic |
| Skip-able | Yes | No |
| Consistency | Variable | Guaranteed |

Hooks ensure critical behaviors happen **every time**, not just when the agent remembers.

---

## Integration with ACT

Hooks are part of the ACT v2.5 automation layer:

```
ACT v2.5
├── Context Engineering (.act/ files)
├── Hooks System (automatic triggers)  ← You are here
├── Iron Laws (quality rules)
└── Deviation Rules (autonomy control)
```

They work together to create a reliable, autonomous agent that:
- Stays aligned with goals (PreToolUse)
- Maintains continuity (PostToolUse)
- Delivers verified work (Stop)

---

## Files

```
hooks/
├── README.md           # This file
├── hooks.json          # Configuration
├── pre-session.md      # PreSession documentation
├── pre-tool-use.md     # PreToolUse documentation
├── post-tool-use.md    # PostToolUse documentation
├── on-error.md         # OnError documentation
└── stop.md             # Stop documentation
```

---

## References

- [SPEC-hooks-system.md](../specs/SPEC-hooks-system.md) - Full specification
- [SYNTHESIS.md](../research/SYNTHESIS.md) - Research foundation
- [Context Engineering](../skills/context-engineering/) - Related skill

---

*Hooks System - ACT v2.5*
*Making reliable agent behavior the default, not the exception.*
