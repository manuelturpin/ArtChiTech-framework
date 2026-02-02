# /act:quick

Start a quick task with minimal overhead.

---

## Usage

```
/act:quick <task description>
```

## Examples

```
/act:quick Fix the login timeout bug
/act:quick Add email validation to signup
/act:quick Refactor auth to async/await
/act:quick Update README with new API endpoints
```

---

## When to Use

Quick Mode is for tasks where:

- [x] Task is well-defined
- [x] Solution is known
- [x] Scope < 1 day
- [x] No architectural decisions
- [x] Low risk

**If ANY of these don't apply → Use `/act:full` instead**

---

## What Happens

### 1. Plan Phase (5 min)

I'll create a quick task plan:

```markdown
## Quick Task: [your task]

**Goal:** [one sentence]
**Approach:** [how we'll do it]

### Tasks
- [ ] Task 1
- [ ] Task 2
- [ ] Task 3

**Done when:** [success criteria]
```

### 2. Execute Phase (main work)

- Work through tasks
- Apply Iron Laws (TDD, debugging, verification)
- Log progress
- Handle deviations

### 3. Verify Phase (5 min)

- All tasks complete ✓
- Tests pass ✓
- Code committed ✓
- No regressions ✓

---

## Iron Laws Still Apply

Even in Quick Mode:

| Law | Applies? | Why |
|-----|----------|-----|
| TDD Iron Law | ✅ YES | Every fix needs a test |
| Debugging Iron Law | ✅ YES | Find root cause first |
| Verification Iron Law | ✅ YES | Show evidence, don't claim |

**"It's just a small change"** is not an excuse to skip tests.

---

## Deviation Handling

| What Happens | Action |
|--------------|--------|
| Bug found | Auto-fix (Rule 1) |
| Missing piece | Auto-add (Rule 2) |
| Blocker | Auto-fix (Rule 3) |
| **Architectural decision** | **Escalate to Full Mode** |
| Nice-to-have | Log to ISSUES.md |

### Escalation

If complexity grows beyond Quick Mode:

```
⚠️ Complexity detected. Escalating to Full Mode.
```

I'll preserve your progress and initialize Full Mode.

---

## State Management

Quick Mode uses a minimal state:

```markdown
# Quick Mode

## Task
[description]

## Status
- [x] Plan
- [ ] Execute
- [ ] Verify

## Progress
- [timestamp] Started task
- [timestamp] Task 1 complete
```

Stored in `.act/state.md` with `mode: quick` indicator.

---

## Output

After `/act:quick`, you'll see:

```markdown
## 🚀 Quick Mode Initialized

**Task:** [your task]
**Estimated:** [time]

### Plan
[task breakdown]

### Ready to Execute
Type "go" or "/act:execute" to begin.
```

---

## Flow

```
/act:quick "Fix login bug"
        │
        ▼
   ┌─────────┐
   │  PLAN   │  ← I create the plan
   │  5 min  │
   └────┬────┘
        │
        ▼
   ┌─────────┐
   │ EXECUTE │  ← We work through tasks
   │  main   │
   └────┬────┘
        │
        ▼
   ┌─────────┐
   │ VERIFY  │  ← I verify completion
   │  5 min  │
   └────┬────┘
        │
        ▼
      DONE ✓
```

---

## Tips

1. **Be specific** — "Fix login bug" > "Fix bugs"
2. **One thing** — One task per quick mode session
3. **Trust the process** — Even quick needs verification
4. **Escalate early** — If it's getting complex, switch modes

---

## Related Commands

| Command | Description |
|---------|-------------|
| `/act:full` | Full mode for complex projects |
| `/act:status` | Check current state |
| `/act:verify` | Run verification checklist |

---

*Quick doesn't mean sloppy. Quick means focused.*
