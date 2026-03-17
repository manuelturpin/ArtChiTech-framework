---
description: Implementation readiness gate — PASS/CONCERNS/FAIL before starting Phase 4 (Development)
---

# Implementation Readiness Gate

> Don't start coding until you know WHAT to code, HOW to code it, and HOW to verify it.

## Purpose

Validate that all prerequisites for implementation are met before entering Phase 4 (Development). This gate prevents the #1 source of wasted effort: starting to code before the design is complete.

## When to Use

- At the Phase 3 → Phase 4 transition (Design → Development)
- Before starting a complex implementation task
- When resuming work after a long break (verify assumptions still hold)

## The Gate Checklist

### Must-Have (all required for PASS)

| # | Check | Question | Evidence |
|---|-------|----------|----------|
| 1 | **Requirements clear** | Can you list exactly what to build? | PRD or acceptance criteria |
| 2 | **Architecture decided** | Do you know the structure? | ADR or design doc |
| 3 | **Interfaces defined** | Do you know the inputs/outputs? | API spec or type definitions |
| 4 | **Dependencies identified** | What do you need that doesn't exist yet? | Dependency list |
| 5 | **Test strategy** | How will you verify each requirement? | Test plan outline |
| 6 | **Scope bounded** | What's explicitly OUT of scope? | Scope statement |

### Should-Have (affects confidence)

| # | Check | Question |
|---|-------|----------|
| 7 | **Risks identified** | What could go wrong? |
| 8 | **Precedents found** | Similar code in the project? |
| 9 | **Environment ready** | Can you run and test locally? |
| 10 | **Data model stable** | Will the schema change? |

## Verdicts

### PASS ✅
All 6 must-haves satisfied. Ready to implement.

```
✅ PASS — Ready for implementation
All requirements clear, architecture decided, interfaces defined.
Confidence: High
```

### CONCERNS ⚠️
Must-haves met but should-haves have gaps.

```
⚠️ CONCERNS — Proceed with caution
Requirements and architecture clear, but:
- Risk: Database migration may conflict with Team B's work
- Environment: Staging env not yet available
Recommendation: Start implementation, address concerns in parallel
```

### FAIL ❌
One or more must-haves not met. Do NOT start implementation.

```
❌ FAIL — Not ready for implementation
Missing:
- Requirements: Payment flow edge cases undefined
- Architecture: No decision on sync vs async processing
Action: Return to Phase 3 (Design) to resolve gaps
```

## Process

### 1. Run the Checklist

Go through each check systematically. Don't skip items.

### 2. Gather Evidence

For each check, point to specific artifacts:
- "Requirements in `.act/prd.md` section 3"
- "Architecture in `.act/architecture/ADR-002-auth-strategy.md`"
- "Test strategy in `.act/plan.md` Phase 5 section"

### 3. Render Verdict

Based on the checklist results, determine PASS / CONCERNS / FAIL.

### 4. Document Decision

Log the gate result in `.act/progress.md`:

```markdown
### [Date] Implementation Readiness Gate
- **Verdict:** PASS / CONCERNS / FAIL
- **Checks:** 6/6 must-haves, 3/4 should-haves
- **Action:** [Proceed / Address concerns / Return to Design]
```

## Integration

### With ACT Phases
- Run at Phase 3 → Phase 4 boundary
- Failed gate returns to Phase 3

### With Adaptive Replanning
- Gate failure triggers reassessment of the plan
- May reveal missing design work

### With Deviation Rules
- Gate failure on architecture = Deviation Rule 4 (ask user)
- Gate failure on requirements = may need more Discovery

---

*ACT v3.5 — Implementation Readiness Gate*
