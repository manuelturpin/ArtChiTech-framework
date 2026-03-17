---
description: Two-stage code review workflow — spec compliance then code quality
---

# Review Workflow

> **Two-stage review ensures correctness THEN quality.** Never reverse the order. Never skip Stage 1.

## Overview

```
Implementation → Stage 1: Spec Compliance → Stage 2: Code Quality → Approved
                       ↓                          ↓
                    Fix Issues                  Fix Issues
                       ↓                          ↓
                   Re-review                   Re-review
```

## When to Use

| Situation | Action |
|-----------|--------|
| After implementing a task | Full 2-stage review |
| After fixing review issues | Re-review affected stage only |
| Quick fix (< 10 lines) | Stage 1 only (spec compliance) |
| Refactoring (no spec change) | Stage 2 only (quality) |

## Stages

### Stage 1: Spec Compliance Review

**Purpose:** Does the implementation match the specification?

**Reviewer:** `spec-reviewer` (Opus)

**Input:**
- The specification or acceptance criteria
- The implementation files
- The git diff

**Process:** See [Step 01 — Spec Compliance](steps/step-01-spec-compliance.md)

**Outcome:** PASS / CONCERNS / FAIL

**Rule:** If Stage 1 FAILS, do NOT proceed to Stage 2. Fix first.

---

### Stage 2: Code Quality Review

**Purpose:** Is the code well-built?

**Reviewer:** `quality-reviewer` (Opus)

**Input:**
- The implementation files
- The git diff
- Project conventions

**Process:** See [Step 02 — Code Quality](steps/step-02-code-quality.md)

**Outcome:** APPROVE / REQUEST_CHANGES / COMMENT

---

### Review Loop

When issues are found, enter the fix-review loop.

**Process:** See [Step 03 — Review Loop](steps/step-03-review-loop.md)

## Issue Categories

| Category | Meaning | Action |
|----------|---------|--------|
| **Critical** | Blocks approval, spec violation or major bug | MUST fix before merge |
| **Important** | Significant quality issue | SHOULD fix, can discuss |
| **Minor** | Style, naming, small improvements | COULD fix, at author's discretion |

## Rules

1. **Order is sacred:** Spec compliance BEFORE quality. Always.
2. **Never skip Stage 1:** Even if you're confident. Verify.
3. **Critical = blocking:** No merge with unresolved critical issues.
4. **Review the diff, not the whole file:** Focus on what changed.
5. **Max 3 review rounds:** If still failing after 3 rounds, escalate (Deviation Rule 4).

---

*ACT v3.5 — Two-Stage Review Workflow*
