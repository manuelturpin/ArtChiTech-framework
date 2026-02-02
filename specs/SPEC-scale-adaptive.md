# SPEC: Scale-Adaptive Mode

**Version:** 2.5.0-alpha.4
**Status:** Draft
**Source:** BMAD (Quick Flow) + GSD (Quick Mode)

---

## Problem Statement

Not every task needs the full ACT ceremony. A bug fix doesn't need research phases. A new product shouldn't skip architecture.

**Current pain:**
- Quick tasks get bogged down in process
- Complex projects get rushed without proper discovery
- No clear criteria for choosing workflow depth

---

## Solution: Scale-Adaptive Mode

Two modes that automatically adjust process depth to task complexity.

### Quick Mode (`/act:quick`)

**For:** Bug fixes, small features, refactoring, documentation
**Philosophy:** "Just fix it"

| What | Details |
|------|---------|
| **When** | 1-3 hour tasks, clear scope, known solution |
| **Phases** | Plan → Execute → Verify (3 phases) |
| **Skip** | Research, discovery, extensive architecture |
| **Focus** | Speed, working code, minimal overhead |

### Full Mode (`/act:full`)

**For:** New products, major features, multi-team efforts
**Philosophy:** "Do it right"

| What | Details |
|------|---------|
| **When** | Days/weeks tasks, unclear scope, exploration needed |
| **Phases** | All 7 ACT phases |
| **Include** | Research, discovery, architecture, verification |
| **Focus** | Quality, sustainability, documentation |

---

## Selection Criteria

### Use Quick Mode When:

```
[ ] Task is well-defined (clear start, clear end)
[ ] Solution approach is known
[ ] Scope is small (1-3 tasks, <1 day)
[ ] No architectural decisions needed
[ ] Risk is low (easy to revert)
```

**Score: 4-5 checks → Quick Mode**

### Use Full Mode When:

```
[ ] Task involves unknowns
[ ] Multiple approaches possible
[ ] Scope is large (multiple days/weeks)
[ ] Architectural decisions required
[ ] Risk is high (hard to undo)
```

**Score: 3+ checks → Full Mode**

### Decision Flowchart

```
Is the task well-defined?
├── NO → Full Mode
└── YES → Is solution known?
          ├── NO → Full Mode
          └── YES → Is scope < 1 day?
                    ├── NO → Full Mode
                    └── YES → Any architectural impact?
                              ├── YES → Full Mode
                              └── NO → Quick Mode ✓
```

---

## Quick Mode Workflow

### Phase 1: Plan (5 min)

```markdown
## Quick Task: [title]

**Goal:** [one-liner]
**Approach:** [2-3 sentences]
**Tasks:**
- [ ] Task 1
- [ ] Task 2
- [ ] Task 3

**Done when:** [success criteria]
```

### Phase 2: Execute (main work)

1. Execute tasks sequentially
2. Apply Iron Laws (TDD, debugging, verification)
3. Log progress in `.act/progress.md`
4. Handle deviations per deviation rules

### Phase 3: Verify (5 min)

```markdown
## Verification

- [ ] All tasks complete
- [ ] Tests pass
- [ ] No regressions
- [ ] Code committed
```

### Quick Mode State File

```markdown
# Quick Mode

## Task
[brief description]

## Status
- [ ] Plan
- [x] Execute
- [ ] Verify

## Notes
[any relevant notes]
```

---

## Full Mode Workflow

### All 7 Phases

| Phase | Duration | Activities |
|-------|----------|------------|
| 1. Discovery | 1-2 days | Problem validation, research, findings |
| 2. Strategy | 1 day | Roadmap, milestones, decisions |
| 3. Design | 2-3 days | Architecture, UX, specifications |
| 4. Development | Variable | TDD, implementation, iteration |
| 5. Quality | 1-2 days | Testing, validation, performance |
| 6. Launch | 1 day | Deployment, documentation, release |
| 7. Growth | Ongoing | Monitoring, feedback, iteration |

### Full Mode Context Files

```
.act/
├── config.yaml      # Project configuration
├── state.md         # Current state
├── plan.md          # All 7 phases planned
├── findings.md      # Research discoveries
└── progress.md      # Full session log
```

### Phase Transitions

Each phase requires Go/No-Go criteria:

```markdown
## Phase [N] Complete

### Go/No-Go Checklist
- [ ] All phase tasks done
- [ ] Deliverables verified
- [ ] No blockers
- [ ] Ready for next phase

**Decision:** GO / NO-GO
**Rationale:** [why]
```

---

## Mode Switching

### Escalation: Quick → Full

When Quick Mode reveals complexity:

1. **Trigger:** Deviation Rule 4 (Architectural) detected
2. **Action:** Pause execution
3. **State:** Save current progress
4. **Switch:** Initialize Full Mode with context

```markdown
## Mode Escalation

**Reason:** [why escalating]
**Current Progress:** [what's done]
**New Scope:** [expanded scope]

→ Switching to Full Mode
```

### De-escalation: Full → Quick

When Full Mode is overkill:

1. **Trigger:** After Strategy phase, scope is clearly small
2. **Action:** Skip Design phase
3. **State:** Condense to Quick Mode state
4. **Continue:** Quick Mode workflow

```markdown
## Mode De-escalation

**Reason:** [why de-escalating]
**Completed Phases:** [1, 2]
**Remaining:** Quick Mode (Plan already done)

→ Switching to Quick Mode
```

---

## Integration with Other Features

### Iron Laws (Always Apply)

Both modes enforce Iron Laws:
- TDD Iron Law (production code needs tests)
- Debugging Iron Law (root cause first)
- Verification Iron Law (evidence before claims)

### Hooks

| Hook | Quick Mode | Full Mode |
|------|------------|-----------|
| PreToolUse | Lighter checks | Full context refresh |
| PostToolUse | Update progress | Full logging |
| Stop | Basic verification | Full phase checklist |

### Deviation Rules

| Rule | Quick Mode | Full Mode |
|------|------------|-----------|
| Bugs (Rule 1) | Auto-fix | Auto-fix |
| Missing (Rule 2) | Auto-add | Auto-add |
| Blockers (Rule 3) | Auto-fix | Auto-fix |
| Architectural (Rule 4) | **Escalate to Full** | STOP, ask user |
| Enhancements (Rule 5) | Log, continue | Log to backlog |

---

## Examples

### Example 1: Bug Fix (Quick Mode)

```markdown
/act:quick Fix login timeout bug

## Quick Task: Fix login timeout bug

**Goal:** Prevent session timeout during OAuth flow
**Approach:** Increase timeout from 30s to 120s in auth config
**Tasks:**
- [ ] Update auth.config.js timeout value
- [ ] Add test for long OAuth flows
- [ ] Verify existing tests pass

**Done when:** OAuth works for slow providers
```

### Example 2: New Feature (Full Mode)

```markdown
/act:full Add payment integration

## Project: Payment Integration

### Phase 1: Discovery
- Research payment providers (Stripe, PayPal, Square)
- Document security requirements
- Identify regulatory compliance needs

### Phase 2: Strategy
- Choose Stripe for MVP
- Plan 3 milestones: Basic → Subscriptions → Invoicing
- Define success metrics

[... continues through all 7 phases]
```

### Example 3: Refactoring (Quick Mode)

```markdown
/act:quick Refactor user service to use repository pattern

## Quick Task: Refactor user service

**Goal:** Extract data access to repository
**Approach:** 
1. Create UserRepository interface
2. Move DB queries from UserService
3. Inject repository into service
**Tasks:**
- [ ] Create UserRepository.ts
- [ ] Migrate queries
- [ ] Update UserService to use repository
- [ ] Verify all tests pass

**Done when:** UserService has no direct DB calls
```

---

## Commands

### `/act:quick [task]`

Starts Quick Mode for a specific task.

```
Usage: /act:quick <task description>

Example:
  /act:quick Fix the logout redirect bug
  /act:quick Add email validation to signup form
  /act:quick Refactor auth module to async/await
```

### `/act:full [project]`

Starts Full Mode for a project.

```
Usage: /act:full <project description>

Example:
  /act:full Build user authentication system
  /act:full Migrate database to PostgreSQL
  /act:full Redesign checkout flow
```

---

## Metrics

### Quick Mode Success

- Task completed in target time
- No escalation needed
- Tests pass
- Zero regressions

### Full Mode Success

- All phases completed
- Go/No-Go criteria met
- Deliverables verified
- Documentation complete

---

## Related

- SPEC-context-engineering.md — Context persistence
- SPEC-hooks-system.md — Automated hooks
- SPEC-iron-laws.md — Quality rules
- rules/deviation-rules.md — Handling deviations

---

*Scale-Adaptive: Right-sized process for every task.*
