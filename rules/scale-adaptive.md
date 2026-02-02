# Scale-Adaptive Rules

> **Right-size your process.** Quick for quick tasks. Full for full projects.

---

## The Golden Rule

```
COMPLEXITY OF PROCESS ≤ COMPLEXITY OF TASK
```

Don't use a sledgehammer for a thumbtack. Don't use a thumbtack for a wall.

---

## Mode Selection Criteria

### Quick Mode Checklist

Use Quick Mode when **ALL** apply:

```markdown
## Quick Mode Criteria

- [x] Task is well-defined (clear start, clear end)
- [x] Solution approach is known (no research needed)
- [x] Scope is small (1-3 tasks, < 1 day work)
- [x] No architectural decisions required
- [x] Risk is low (easy to revert if wrong)
```

**Examples:**
- Bug fixes
- Small features (< 100 lines)
- Refactoring with clear pattern
- Documentation updates
- Configuration changes
- Dependency updates

### Full Mode Checklist

Use Full Mode when **ANY** apply:

```markdown
## Full Mode Criteria

- [ ] Task involves unknowns (needs research)
- [ ] Multiple approaches possible (needs evaluation)
- [ ] Scope is large (multiple days/weeks)
- [ ] Architectural decisions required (impacts system design)
- [ ] Risk is high (hard to undo, security, data)
```

**Examples:**
- New products or modules
- Major features (new subsystem)
- Database migrations
- Security implementations
- API redesigns
- Multi-service integrations

---

## Decision Flowchart

```
START: New Task
    │
    ▼
┌───────────────────────┐
│ Is task well-defined? │
└───────────────────────┘
    │           │
   NO          YES
    │           │
    ▼           ▼
 FULL    ┌─────────────────┐
 MODE    │ Solution known? │
         └─────────────────┘
              │         │
             NO        YES
              │         │
              ▼         ▼
           FULL   ┌───────────────┐
           MODE   │ Scope < 1 day?│
                  └───────────────┘
                       │       │
                      NO      YES
                       │       │
                       ▼       ▼
                    FULL  ┌────────────────────┐
                    MODE  │ Architectural risk?│
                          └────────────────────┘
                               │         │
                              YES        NO
                               │         │
                               ▼         ▼
                            FULL      QUICK
                            MODE      MODE ✓
```

---

## Quick Mode Workflow

### 3 Phases Only

```
PLAN → EXECUTE → VERIFY
 5min    main     5min
```

### Phase 1: Plan (5 minutes max)

```markdown
## Quick Task: [title]

**Goal:** [one sentence]
**Approach:** [2-3 sentences max]

### Tasks
- [ ] Task 1
- [ ] Task 2
- [ ] Task 3

**Done when:** [success criteria]
```

**Rules:**
- No more than 5 tasks
- No research phase
- No architecture diagrams
- Keep it on one page

### Phase 2: Execute (main work)

1. Work through tasks sequentially
2. Apply Iron Laws (TDD still applies!)
3. Log briefly in `.act/progress.md`
4. Handle deviations (see below)

**Rules:**
- If you hit architectural complexity → **Escalate to Full Mode**
- If scope grows > 1 day → **Escalate to Full Mode**
- Bug fixes during execution = OK (Rule 1)
- Missing pieces = auto-add (Rule 2)

### Phase 3: Verify (5 minutes max)

```markdown
## Verification ✓

- [ ] All tasks marked complete
- [ ] Tests pass (npm test / pytest / etc.)
- [ ] No regressions (existing tests still pass)
- [ ] Code committed with clear message
- [ ] No TODO/FIXME left behind
```

**Rules:**
- Verification is NOT optional
- Evidence required (test output, not "I checked")
- If verification fails → fix before marking complete

---

## Full Mode Workflow

### All 7 Phases

```
DISCOVERY → STRATEGY → DESIGN → DEVELOPMENT → QUALITY → LAUNCH → GROWTH
  1-2 days    1 day    2-3 days   variable    1-2 days   1 day   ongoing
```

### Phase Gates

Each phase ends with Go/No-Go:

```markdown
## Phase [N] Complete

### Deliverables
- [ ] Deliverable 1
- [ ] Deliverable 2

### Go/No-Go
- [ ] All deliverables verified
- [ ] No open blockers
- [ ] Stakeholder approval (if needed)

**Decision:** ▢ GO  ▢ NO-GO
**Next Phase:** [phase name]
```

**Rules:**
- No skipping phases without explicit escalation
- Each phase updates `.act/plan.md`
- Findings go in `.act/findings.md`
- Progress logged in `.act/progress.md`

---

## Mode Switching

### Escalation: Quick → Full

**Trigger:** Any of these during Quick Mode execution:

1. Architectural decision needed (Rule 4)
2. Scope grows beyond 1 day
3. Multiple unknowns discovered
4. Risk assessment changes

**Process:**

```markdown
## 🔄 Mode Escalation

**From:** Quick Mode
**To:** Full Mode

**Reason:** [why escalating]

### Current State
- Tasks completed: [X/Y]
- Code written: [files]
- Tests added: [count]

### Expanded Scope
- [new understanding of scope]

### Next Steps
- Initialize Full Mode
- Begin Phase 1: Discovery (with current knowledge)
```

**Rules:**
- Preserve all work done
- Current progress becomes input to Discovery
- Don't restart from zero

### De-escalation: Full → Quick

**Trigger:** After Strategy phase reveals:

1. Scope is actually small
2. Solution is now clear
3. No architectural decisions remain

**Process:**

```markdown
## 🔄 Mode De-escalation

**From:** Full Mode
**To:** Quick Mode

**Reason:** [why de-escalating]

### Completed Phases
- [x] Discovery
- [x] Strategy
- [ ] Design (skipping)
- [ ] Development (→ Quick Execute)

### Condensed Plan
## Quick Task: [refined title]

**Goal:** [from Strategy]
**Approach:** [from Strategy]

### Tasks
- [ ] [from Strategy milestones]
```

**Rules:**
- Only after Strategy phase
- Must have clear scope and solution
- Keep Discovery findings

---

## Integration with Iron Laws

Both modes enforce Iron Laws. **No exceptions.**

### Quick Mode + TDD

```
Even quick fixes need tests.
"It's just one line" → Still needs a test
"I'll add tests later" → NO. Test first.
```

### Quick Mode + Debugging

```
Even quick fixes need root cause.
"I'll just patch it" → NO. Understand first.
"Works on my machine" → NOT verification.
```

### Quick Mode + Verification

```
Even quick fixes need evidence.
"It works now" → Show test output.
"I tested it manually" → Automate it.
```

---

## Integration with Hooks

| Hook | Quick Mode | Full Mode |
|------|------------|-----------|
| **PreToolUse** | Read Quick Task only | Read full context files |
| **PostToolUse** | Brief progress note | Full progress log |
| **Stop** | Quick verification checklist | Full phase checklist |

### Quick Mode Stop Hook

```markdown
## Stop Checklist (Quick Mode)

- [ ] All tasks complete
- [ ] Tests pass
- [ ] Committed
```

### Full Mode Stop Hook

```markdown
## Stop Checklist (Full Mode)

- [ ] Current phase deliverables complete
- [ ] Go/No-Go criteria met
- [ ] Plan updated
- [ ] Progress logged
- [ ] Findings recorded
```

---

## Integration with Deviation Rules

| Deviation | Quick Mode Action | Full Mode Action |
|-----------|-------------------|------------------|
| Rule 1: Bugs | Auto-fix immediately | Auto-fix immediately |
| Rule 2: Missing Critical | Auto-add immediately | Auto-add immediately |
| Rule 3: Blockers | Auto-fix immediately | Auto-fix immediately |
| Rule 4: Architectural | **ESCALATE TO FULL** | STOP, ask user |
| Rule 5: Enhancements | Log to ISSUES.md | Log to backlog |

### Rule 4 in Quick Mode

```
⚠️ ARCHITECTURAL DEVIATION DETECTED

Quick Mode cannot handle architectural decisions.
Escalating to Full Mode.

[Generate escalation document]
[Initialize Full Mode]
```

---

## Anti-Patterns

### ❌ Quick Mode Anti-Patterns

1. **"Quick-washing"** — Forcing complex tasks into Quick Mode
2. **"Scope creep"** — Adding tasks during execution without escalation
3. **"Test later"** — Skipping TDD because "it's quick"
4. **"YOLO commits"** — Committing without verification

### ❌ Full Mode Anti-Patterns

1. **"Process theater"** — Going through phases without substance
2. **"Analysis paralysis"** — Stuck in Discovery forever
3. **"Gold plating"** — Over-engineering simple solutions
4. **"Phase skipping"** — Jumping to Development without Design

---

## Quick Reference Card

```
┌─────────────────────────────────────────────┐
│           SCALE-ADAPTIVE RULES              │
├─────────────────────────────────────────────┤
│                                             │
│  QUICK MODE                FULL MODE        │
│  ──────────                ─────────        │
│  Bug fixes                 New products     │
│  Small features            Major features   │
│  Refactoring               Migrations       │
│  Documentation             Security work    │
│  Config changes            API redesigns    │
│                                             │
│  3 phases:                 7 phases:        │
│  Plan→Execute→Verify       All ACT phases   │
│                                             │
│  < 1 day                   Days to weeks    │
│  1-5 tasks                 Multiple phases  │
│  Known solution            Needs research   │
│                                             │
├─────────────────────────────────────────────┤
│  IRON LAWS APPLY TO BOTH MODES. ALWAYS.    │
└─────────────────────────────────────────────┘
```

---

*Scale your process to match your task. Not more. Not less.*
