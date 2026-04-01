# Skill: Subagent-Driven Development (SDD)

**Version:** 1.0.0
**Category:** Orchestration
**Type:** Rigid

> **Self-Announcement:** When using this skill, announce: "Using SDD skill to orchestrate task execution through specialized subagents."

## Purpose

Transform monolithic execution into orchestrated multi-agent workflows. The controller agent plans and reviews while executor agents implement in isolated contexts with curated context.

## The Problem

Single-agent execution has inherent limitations:
- **Context pollution:** Long sessions accumulate irrelevant context
- **Role confusion:** Same agent plans, implements, and reviews
- **No fresh perspective:** Self-review is less effective than independent review

## The SDD Solution

```
Controller (Opus)
    |
    |-- Plans tasks
    |-- Curates context per task
    |-- Dispatches to subagents
    |-- Reviews results
    +-- Integrates work

Executor (Sonnet)           Reviewer (Opus)
    |                           |
    |-- Fresh context           |-- Fresh context
    |-- Single task focus       |-- Independent review
    |-- TDD implementation      |-- Spec compliance
    +-- Returns status          +-- Quality assessment
```

## When to Use

| Situation | Use SDD? |
|-----------|----------|
| Multi-task implementation plan | Yes |
| Complex feature (> 3 files) | Yes |
| Single file fix | No (direct execution) |
| Exploration / spike | No (direct execution) |
| Review needed | Yes (dispatch reviewer) |

## The SDD Workflow

### Phase 1: Plan (Controller)

1. Read the plan (`.act/plan.md`)
2. Break into dispatchable tasks
3. For each task, identify:
   - Required files to read
   - Architecture notes
   - Acceptance criteria
   - Dependencies on other tasks

### Phase 2: Execute (Per Task)

For each task in order:

1. **Curate context** — See [Context Curation](context-curation.md)
2. **Create worktree** (optional but recommended)
3. **Dispatch implementer** — See [Dispatch Protocol](dispatch-protocol.md)
4. **Receive status** — See [Status Codes](status-codes.md)
5. **Handle result:**
   - DONE → Proceed to review
   - DONE_WITH_CONCERNS → Review concerns, then proceed
   - NEEDS_CONTEXT → Provide missing context, re-dispatch
   - BLOCKED → Assess blocker, decide action

### Phase 3: Review (Per Task)

1. **Dispatch spec-reviewer** (Stage 1)
2. If PASS → **Dispatch quality-reviewer** (Stage 2)
3. If FAIL → **Dispatch implementer** with fix instructions
4. Track review rounds (max 3)

### Phase 4: Integrate (Controller)

After all tasks complete:
1. Merge all branches (if using worktrees)
2. Run full test suite
3. Dispatch final review of the integrated whole
4. Update `.act/progress.md`

## Key Principles

1. **Controller never implements** — It plans, dispatches, and reviews
2. **Each subagent gets fresh context** — No accumulated garbage
3. **Context is curated, not dumped** — Only relevant files
4. **Two-stage review is mandatory** — Spec first, then quality
5. **Max 3 review rounds** — Then escalate

## Related

- [Dispatch Protocol](dispatch-protocol.md) — How to dispatch subagents
- [Status Codes](status-codes.md) — Subagent return codes
- [Context Curation](context-curation.md) — Preparing context for subagents
- [Worktree Isolation](../worktree-isolation/SKILL.md) — Isolated execution
- [Review Workflow](../../plugin/workflows/review/workflow.md) — Two-stage review

---

*Skill version: 1.0 — ACT v3.5*
