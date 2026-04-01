# Skill: Adaptive Replanning

**Version:** 1.0.0
**Category:** Planning
**Type:** Flexible

> **Self-Announcement:** When using this skill, announce: "Using Adaptive Replanning skill to reassess the plan based on current progress."

## Purpose

Plans are hypotheses, not contracts. After each phase or milestone, reassess whether the remaining plan is still valid. Adapt early to avoid wasted work.

## The Problem

Static plans fail because:
- **Discovery changes scope** — You learn things that invalidate assumptions
- **Implementation reveals complexity** — Some tasks are harder than expected
- **Requirements evolve** — User feedback changes priorities
- **Dependencies shift** — External factors create new constraints

## When to Replan

### Automatic Triggers (PostToolUse Hook)

| Trigger | Action |
|---------|--------|
| Phase completed | Mini-reassess (3 questions) |
| Milestone reached | Full reassess (6 questions) |
| Blocker discovered | Immediate reassess |
| Scope change requested | Full reassess |

### Manual Triggers

- User requests `/act:replan`
- 3+ tasks take longer than expected
- New information contradicts a plan assumption

## The Reassessment Process

### Mini-Reassess (After Each Phase)

Ask yourself 3 questions:

1. **Has the world changed?**
   - New requirements discovered?
   - External dependencies changed?
   - User feedback received?

2. **Are remaining tasks still correct?**
   - Any tasks now unnecessary?
   - Any new tasks needed?
   - Any tasks need reordering?

3. **Is the approach still right?**
   - Architecture holding up?
   - Technology choices validated?
   - Timeline realistic?

**If all answers are "no change" → Continue as planned.**
**If any answer indicates change → Full reassess.**

### Full Reassess (At Milestones)

Ask yourself 6 questions:

1. **What did we learn?** (from findings.md)
2. **What changed?** (requirements, constraints, dependencies)
3. **What's working?** (keep these approaches)
4. **What's not working?** (change these approaches)
5. **What's missing?** (add to the plan)
6. **What's unnecessary?** (remove from the plan)

Then update:
- `.act/plan.md` — Add/remove/reorder tasks
- `.act/state.md` — Update phase and progress
- `.act/findings.md` — Log the reassessment decision

### Reassessment Output Format

```markdown
## Reassessment: [Date]

**Trigger:** [Phase completed | Milestone | Blocker | Manual]

### What Changed
- [Change 1]
- [Change 2]

### Plan Adjustments
- **Added:** [New task or phase]
- **Removed:** [Unnecessary task]
- **Reordered:** [Task X moved before Task Y because...]
- **Modified:** [Task description updated]

### No Change
- [Aspects that remain valid]

### Decision
[Continue as adjusted | Major pivot needed (Deviation Rule 4)]
```

## The Plan-Execute-Reassess Loop

```
┌──────────────────────────────────────────┐
│                                          │
│  ┌──────────┐                            │
│  │   PLAN   │ ← Update plan based on    │
│  │          │   reassessment findings    │
│  └────┬─────┘                            │
│       │                                  │
│       ▼                                  │
│  ┌──────────┐                            │
│  │ EXECUTE  │ ← Work on next task/phase  │
│  │          │                            │
│  └────┬─────┘                            │
│       │                                  │
│       ▼                                  │
│  ┌──────────┐                            │
│  │ REASSESS │ ← Did anything change?     │
│  │          │   Should we adjust?        │
│  └────┬─────┘                            │
│       │                                  │
│       └──────────────────────────────────┘
```

## Integration with ACT

### With Hooks
- **PostToolUse:** After phase transitions, trigger mini-reassess
- **Stop:** Before declaring done, verify plan was reassessed

### With Deviation Rules
- Rule 4 (Architectural) triggers immediate full reassess
- Rule 5 (Enhancement) items are reviewed during reassess

### With Iron Laws
- Verification Iron Law: Reassessment findings must have evidence
- Debugging Iron Law: If stuck, reassess before trying more fixes

### With SDD
- Controller reassesses after each subagent task completes
- Aggregate concerns from subagents into reassessment

## Anti-Patterns

| Anti-Pattern | Problem | Fix |
|-------------|---------|-----|
| **Never reassess** | Plan becomes fiction | Mini-reassess after every phase |
| **Reassess too often** | Analysis paralysis | Only at defined triggers |
| **Change plan without logging** | Lost rationale | Always log in findings.md |
| **Ignore reassessment findings** | Same as not reassessing | Act on findings |
| **Pivot without user consent** | Deviation Rule 4 violation | Major changes need approval |

## Quick Reference

```
Phase done? → 3-question mini-reassess → Continue or Full reassess
Milestone?  → 6-question full reassess → Update plan
Blocker?    → Immediate full reassess  → Decide action
Stuck?      → Full reassess + consider Deviation Rule 4
```

---

*Skill version: 1.0 — ACT v3.5*
