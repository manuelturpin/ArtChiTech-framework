# PreSession Hook

**Type:** Session initialization hook  
**Triggers:** `session_start`, `context_reset`  
**Reliability:** 100%

---

## Purpose

Ensure session continuity by automatically reading context files when:
1. A new session starts (fresh context window)
2. Context is explicitly reset
3. Agent resumes work after a break

This hook prevents the "amnesia problem" where agents forget project state between sessions.

---

## When It Fires

| Trigger | Description |
|---------|-------------|
| `session_start` | New conversation or fresh context window |
| `context_reset` | Explicit context clear or reload |

---

## Actions Performed

### 1. Read Context Files
```
Load in order:
1. .act/state.md  → Current state (quick glance)
2. .act/plan.md   → Phases and goals
```

### 2. Generate Catchup Report
```
If generateCatchup is enabled:
→ Create summary of current project state
→ Display to agent for quick context
```

### 3. Notify Ready
```
Signal that context is loaded and agent can proceed
```

---

## Implementation

### Hook Message
```
🔄 Reading project context... Check .act/state.md for current status.
```

### Checklist for Agent
```markdown
At session start:
- [ ] Read .act/state.md → Where am I?
- [ ] Read .act/plan.md → What's the goal?
- [ ] Check .act/progress.md → Recent work?
- [ ] Generate mental "catchup" summary
- [ ] Confirm ready to continue
```

---

## Catchup Report Format

When `generateCatchup: true`, produce:

```markdown
## 🔄 Session Recovery

**Project:** [project name]
**Last Activity:** [date/time from progress.md]

**Current State:**
- **Phase:** X/Y ([phase name])
- **Task:** [current task]
- **Progress:** XX%
- **Blocker:** [if any]

**Quick Context:**
- [key point 1]
- [key point 2]

**Next Steps:**
1. [immediate next action]
2. [following action]
```

---

## Examples

### Example 1: Clean Session Start

```
[New session detected]

[PreSession Hook]
→ Reading .act/state.md...
  - Phase: 3/5 (Implementation)
  - Progress: 60%
  - No blockers

→ Reading .act/plan.md...
  - Goal: Build REST API
  - Remaining: 2 phases

→ Catchup Summary:
  "Project is at 60%, implementing core features.
   Next: Complete user authentication module."

→ Agent ready to continue
```

### Example 2: Context Reset Mid-Session

```
[Context explicitly reset by user]

[PreSession Hook]
→ Reloading context files...
→ Refreshing project state...
→ Agent re-oriented to current task
```

### Example 3: Stale Session Detection

```
[Session start, progress.md shows last update 3 days ago]

[PreSession Hook]
→ Reading context files...
→ Detecting stale session (>24h)
→ Generating detailed catchup:
  "Last worked on Feb 1. Database models complete.
   Stopped mid-way through API routes.
   Next: Complete auth endpoints."
```

---

## Integration with .act/ Files

### Files Read
| File | Purpose |
|------|---------|
| `.act/state.md` | Quick current state |
| `.act/plan.md` | Goals and phases |

### Files Optionally Read
| File | Purpose |
|------|---------|
| `.act/progress.md` | Recent activity log |
| `.act/findings.md` | Key discoveries |

---

## Configuration

In `hooks.json`:
```json
"PreSession": {
  "enabled": true,
  "triggers": ["session_start", "context_reset"],
  "action": "refresh_context",
  "config": {
    "files": ["state.md", "plan.md"],
    "generateCatchup": true
  }
}
```

### Options

| Option | Type | Description |
|--------|------|-------------|
| `files` | array | Files to read on session start |
| `generateCatchup` | boolean | Auto-generate catchup report |

---

## Relationship with Context Engineering

This hook automates the "Session Start" pattern from the Context Engineering skill:

```markdown
## Checklist de reprise (automated by PreSession)

1. Lire `.act/state.md` → Où en suis-je ?    ✓ Automated
2. Lire `.act/plan.md` → Que reste-t-il ?    ✓ Automated
3. Générer un "Catchup Report"                ✓ Automated
```

The hook ensures this happens **every time**, not just when the agent remembers.

---

## 5-Question Reboot Test

PreSession should enable answering:

| Question | Source | Check |
|----------|--------|-------|
| Où suis-je ? | `state.md` | ✓ |
| Où vais-je ? | `plan.md` | ✓ |
| Quel est l'objectif ? | `plan.md` | ✓ |
| Qu'ai-je appris ? | `findings.md` | Optional |
| Qu'ai-je fait ? | `progress.md` | Optional |

---

## Why This Hook Matters

From research:
> "Agents wake up with amnesia every session"

PreSession solves this by:
1. **Automatic loading** - No forgotten context reads
2. **Consistent recovery** - Same process every time
3. **Quick orientation** - Catchup report for fast ramp-up

Without this hook, agents often start working without context, leading to:
- Repeated questions
- Duplicated work
- Divergent approaches

---

*PreSession Hook - ACT v2.5*
*Ensuring every session starts with full context.*
