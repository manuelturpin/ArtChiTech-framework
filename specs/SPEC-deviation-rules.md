# SPEC: Deviation Rules

**Version:** 2.5.0
**Status:** Draft
**Date:** 2026-02-02
**Source:** GSD Framework, TÂCHES Framework

---

## 1. Overview

### 1.1 Purpose

Deviation Rules define how ACT handles unexpected situations discovered during execution. They provide a framework for **controlled autonomy** — allowing the agent to handle routine deviations automatically while ensuring human oversight for critical decisions.

### 1.2 Problem Statement

During task execution, agents frequently encounter situations not explicitly covered by the original plan:
- **Without rules:** Agent either stops for every issue (slow) or makes all decisions alone (risky)
- **With rules:** Agent handles routine issues autonomously but escalates critical ones

### 1.3 Design Principle

```
Autonomy for the routine, human decision for the architectural.
```

---

## 2. The 5 Deviation Rules

### Rule Matrix

| # | Trigger | Classification | Action | Autonomy |
|---|---------|---------------|--------|----------|
| 1 | Bugs discovered | Bug | Auto-fix immediately | ✅ Auto |
| 2 | Missing critical (deps, config) | Critical Gap | Auto-add immediately | ✅ Auto |
| 3 | Blockers (prevents progress) | Blocker | Auto-fix immediately | ✅ Auto |
| 4 | Architectural changes | Architecture | **STOP, ask user** | ❌ Human |
| 5 | Enhancements (nice-to-have) | Enhancement | Log to ISSUES.md, continue | ✅ Auto |

### Autonomy Distribution

```
Rules 1-3 + 5 = Autonomous (routine)
Rule 4 = Human Required (critical)
```

---

## 3. Rule Definitions

### 3.1 Rule 1: Bug Auto-Fix

**Trigger:** Discovering a bug in existing code while working on the current task.

**Classification Criteria:**
- Error exists in code that was already written
- Bug blocks or affects the current task
- Fix is isolated (doesn't change architecture)

**Action:**
1. Fix the bug immediately
2. Add test if none exists
3. Log fix in progress.md
4. Continue with original task

**NOT a Bug (escalate to Rule 4):**
- Systemic issues requiring architectural changes
- Bugs that require changing multiple components
- Issues that question fundamental design decisions

---

### 3.2 Rule 2: Missing Critical Auto-Add

**Trigger:** Discovering missing dependencies, configuration, or resources required for the task.

**Classification Criteria:**
- Task cannot proceed without this item
- Item is clearly needed (not a design choice)
- Adding it is straightforward

**Action:**
1. Add the missing item immediately
2. Document in findings.md
3. Update any relevant config files
4. Continue with task

**Examples:**
- Missing npm package for a feature
- Missing environment variable
- Missing directory structure
- Missing import statement

**NOT Missing Critical (escalate to Rule 4):**
- Choosing between multiple possible solutions
- Adding a new major dependency
- Changing the tech stack

---

### 3.3 Rule 3: Blocker Auto-Fix

**Trigger:** Encountering something that completely prevents progress.

**Classification Criteria:**
- Work cannot continue without fixing this
- Fix is within current scope
- Solution is clear and doesn't require design decisions

**Action:**
1. Identify the blocker clearly
2. Implement the fix
3. Log in progress.md
4. Continue with task

**Examples:**
- Syntax error preventing build
- Broken test from external changes
- Permission issue on file
- Port conflict

**NOT a Blocker (escalate to Rule 4):**
- Fundamental incompatibility
- Need to change approach entirely
- Blocker reveals design flaw

---

### 3.4 Rule 4: Architectural STOP

**Trigger:** Discovering that the current approach requires fundamental changes.

**Classification Criteria:**
- Affects overall system design
- Changes interfaces between components
- Adds significant new dependencies
- Alters data models or structures
- Changes more than the current scope

**Action:**
1. **STOP immediately**
2. Document the situation clearly
3. Present options to user
4. **Wait for user decision**
5. Do NOT proceed without explicit approval

**Detection Phrases:**
- "This would require changing the architecture..."
- "We need to add a new pattern/service/layer..."
- "The current design doesn't support this..."
- "This affects multiple components..."
- "We should consider switching to..."

**Format for User:**
```markdown
## ⚠️ Architectural Decision Required

### Situation
[What was discovered]

### Impact
[What would need to change]

### Options
1. **Option A:** [description] - Pros/Cons
2. **Option B:** [description] - Pros/Cons
3. **Option C:** Continue as-is with workaround

### Recommendation
[Your suggestion and why]

### Waiting for your decision...
```

---

### 3.5 Rule 5: Enhancement Logging

**Trigger:** Noticing improvements that could be made but aren't required for the current task.

**Classification Criteria:**
- Would improve the code/system
- Not required for current task completion
- "Nice to have" rather than "must have"
- Can be done later

**Action:**
1. Log to `ISSUES.md` with appropriate tag
2. **Continue with current task**
3. Do NOT implement unless asked

**Examples:**
- "This could be refactored for clarity"
- "We could add caching here for performance"
- "This would benefit from better error messages"
- "A helper function would make this cleaner"

**ISSUES.md Entry Format:**
```markdown
## [Enhancement] [Title]
- **File:** [path/to/file]
- **Line:** [approximate line number]
- **Type:** enhancement
- **Priority:** low | medium
- **Description:** [brief description]
- **Logged:** [date]
```

---

## 4. Decision Flowchart

```
┌─────────────────────────────────────┐
│     Deviation Detected              │
│     (during execution)              │
└────────────────┬────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────┐
│  Does it prevent current progress?  │
└────────────────┬────────────────────┘
                 │
        ┌────────┴────────┐
        │ YES             │ NO
        ▼                 ▼
┌───────────────┐  ┌───────────────────────┐
│ Is it a Bug?  │  │ Is it an Enhancement? │
└───────┬───────┘  └───────────┬───────────┘
        │                      │
   ┌────┴────┐            ┌────┴────┐
   │YES      │NO          │YES      │NO
   ▼         ▼            ▼         ▼
┌───────┐  ┌─────────┐  ┌───────┐  ┌───────┐
│Rule 1 │  │Missing  │  │Rule 5 │  │ Edge  │
│Auto-  │  │Critical?│  │Log &  │  │ case  │
│fix    │  └────┬────┘  │Continue│  │ ask   │
└───────┘       │       └───────┘  └───────┘
           ┌────┴────┐
           │YES      │NO
           ▼         ▼
      ┌───────┐  ┌─────────────┐
      │Rule 2 │  │ Architectural?│
      │Auto-  │  └──────┬──────┘
      │add    │         │
      └───────┘    ┌────┴────┐
                   │YES      │NO
                   ▼         ▼
              ┌───────┐  ┌───────┐
              │Rule 4 │  │Rule 3 │
              │STOP & │  │Auto-  │
              │ASK    │  │fix    │
              └───────┘  └───────┘
```

---

## 5. Integration Points

### 5.1 With Hooks System

**PreToolUse Hook** checks deviation rules before actions:
```json
{
  "deviationRules": {
    "bugs": "auto-fix",
    "missing-critical": "auto-add", 
    "blockers": "auto-fix",
    "architectural": "ask-user",
    "enhancements": "log-and-continue"
  }
}
```

### 5.2 With Scale-Adaptive

**Quick Mode:**
- Rules 1-3, 5 apply normally
- Rule 4 auto-escalates to Full Mode

**Full Mode:**
- All rules apply
- Rule 4 triggers design review before continuing

### 5.3 With Iron Laws

Deviation rules work within Iron Laws:
- **TDD Iron Law:** Bug fixes (Rule 1) must add tests
- **Debugging Iron Law:** Blocker fixes (Rule 3) require root cause
- **Verification Iron Law:** All fixes need evidence

---

## 6. Files

### Required Files

| File | Purpose |
|------|---------|
| `rules/deviation-rules.md` | Rule definitions and examples |
| `templates/ISSUES.md` | Template for logging enhancements |
| `.act/progress.md` | Log deviations and fixes |
| `.act/findings.md` | Document discoveries |

### ISSUES.md Location

Project root: `ISSUES.md`

---

## 7. Metrics

### Success Criteria

- **Autonomy rate:** 80%+ of deviations handled autonomously (Rules 1-3, 5)
- **Escalation rate:** 20% or less require human decision (Rule 4)
- **False escalation:** < 5% (things escalated that shouldn't be)
- **Missed escalation:** 0% (architectural changes made without asking)

---

## 8. Examples by Framework

### From GSD Framework

> "Small deviations (bug fixes, obvious improvements) should be made immediately. Larger deviations (architectural changes, feature additions) should be flagged and discussed."

### From TÂCHES Framework

> "AUTOFIX: Fix immediately if simple and obvious. ASK: Stop and discuss if complex or ambiguous."

---

## 9. Anti-Patterns

### ❌ Over-Escalation
Asking for permission for every small change.
**Fix:** Trust Rules 1-3, 5.

### ❌ Under-Escalation  
Making architectural changes without asking.
**Fix:** When in doubt, Rule 4 applies.

### ❌ Enhancement Creep
Implementing nice-to-haves instead of the task.
**Fix:** Log to ISSUES.md, continue.

### ❌ Incomplete Logging
Fixing things without documenting.
**Fix:** Always update progress.md.

---

## Acceptance Criteria
- [x] 5 règles de déviation définies
- [x] Flowchart de décision documenté
- [x] Template ISSUES.md créé
- [x] Intégration avec hooks documentée
- [x] Section dans CLAUDE.md
- [x] Section dans README.md

---

*Specification for ACT v2.5 Deviation Rules*
