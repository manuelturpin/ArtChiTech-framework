# Deviation Rules

> **Autonomy for the routine, human decision for the architectural.**

---

## The 5 Rules

### Quick Reference

| Rule | Trigger | Action | Example |
|:----:|---------|--------|---------|
| **1** | Bug discovered | 🔧 Auto-fix | Null pointer, typo, logic error |
| **2** | Missing critical | ➕ Auto-add | Missing import, dependency, config |
| **3** | Blocker | 🚧 Auto-fix | Build failure, port conflict, syntax error |
| **4** | Architectural | ⛔ **STOP & ASK** | New pattern, interface change, tech change |
| **5** | Enhancement | 📝 Log & continue | Refactoring idea, performance improvement |

---

## Rule 1: Bug Auto-Fix 🔧

### Definition
A bug in existing code that blocks or affects the current task.

### Criteria
✅ Fix is isolated (same file or directly related)
✅ Doesn't change how components interact
✅ Root cause is clear
✅ Can be tested

### Action
```
1. Investigate root cause (Debugging Iron Law)
2. Fix the bug
3. Add/update test (TDD Iron Law)
4. Log in progress.md
5. Continue task
```

### Examples

**✅ Auto-Fix These:**
```
- Off-by-one error in loop
- Null/undefined check missing
- Typo in variable name causing bug
- Wrong comparison operator (= vs ==)
- Missing await on async function
- Incorrect regex pattern
- Wrong array index
```

**❌ Escalate to Rule 4:**
```
- Bug reveals fundamental design flaw
- Fix requires changing multiple modules
- Bug is in shared/core component
- Fix would change API contract
```

### Log Format
```markdown
### Bug Fix (Rule 1)
- **File:** src/utils/parser.js
- **Issue:** Missing null check on input
- **Root Cause:** Function assumed non-null input
- **Fix:** Added guard clause at line 42
- **Test:** Added test in parser.test.js
```

---

## Rule 2: Missing Critical Auto-Add ➕

### Definition
Something required for the task that doesn't exist yet.

### Criteria
✅ Task cannot proceed without it
✅ Not a design choice (only one reasonable option)
✅ Addition is straightforward
✅ Standard practice in the codebase

### Action
```
1. Identify what's missing
2. Add it in the standard way
3. Document in findings.md
4. Continue task
```

### Examples

**✅ Auto-Add These:**
```
- Missing import statement
- Missing npm dependency (standard library)
- Missing environment variable
- Missing directory that should exist
- Missing required field in config
- Missing export statement
- Missing type definition (obvious)
```

**❌ Escalate to Rule 4:**
```
- Choosing between multiple libraries
- Adding a new major dependency
- Creating new module/service
- Adding new configuration pattern
```

### Log Format
```markdown
### Missing Critical (Rule 2)
- **Added:** lodash@4.17.21
- **Reason:** Task requires deep object comparison
- **Location:** package.json
- **Standard:** Already used elsewhere in codebase
```

---

## Rule 3: Blocker Auto-Fix 🚧

### Definition
Something that completely prevents progress on the current task.

### Criteria
✅ Work cannot continue at all
✅ Solution is clear (not a design choice)
✅ Fix is within current scope
✅ Not a symptom of deeper issue

### Action
```
1. Identify the blocker
2. Determine root cause
3. Implement fix
4. Verify unblocked
5. Log in progress.md
6. Continue task
```

### Examples

**✅ Auto-Fix These:**
```
- Build/compile error
- Test suite won't run
- Port already in use
- Missing file permission
- Corrupted node_modules
- Git merge conflict (simple)
- Syntax error in config file
- Expired token/credential
```

**❌ Escalate to Rule 4:**
```
- Incompatible dependency versions
- Blocker reveals design problem
- Need to change approach entirely
- Blocker is in someone else's code
```

### Log Format
```markdown
### Blocker Fix (Rule 3)
- **Blocker:** Build failed - TypeScript error
- **Root Cause:** Missing return type on function
- **Fix:** Added explicit return type
- **Verified:** Build passes ✓
```

---

## Rule 4: Architectural STOP ⛔

### Definition
A change that would affect the fundamental structure or design.

### Criteria
ANY of these = Rule 4:
- [ ] Changes how components communicate
- [ ] Adds new architectural pattern
- [ ] Modifies data structures/models
- [ ] Affects more than current scope
- [ ] Adds significant new dependency
- [ ] Changes public API/interface
- [ ] Requires design decision

### Action
```
1. STOP immediately
2. Document the situation
3. Present options clearly
4. WAIT for user decision
5. Do NOT proceed without approval
```

### Detection Phrases
When you think or say these, STOP:
```
"This would require changing..."
"We need a new service/component..."
"The architecture doesn't support..."
"We should switch to..."
"This affects multiple..."
"I need to decide between..."
```

### User Notification Format
```markdown
## ⚠️ Architectural Decision Required

### What I Found
[Clear description of the situation]

### Why This Needs Your Input
[Why this is Rule 4, not Rule 1-3 or 5]

### Options

**Option A: [Name]**
- Description: [What this involves]
- Pros: [Benefits]
- Cons: [Drawbacks]
- Effort: [Estimate]

**Option B: [Name]**
- Description: [What this involves]
- Pros: [Benefits]
- Cons: [Drawbacks]
- Effort: [Estimate]

**Option C: Defer**
- Continue with workaround for now
- Address in separate task later

### My Recommendation
[Your suggestion with reasoning]

---
**⏸️ Waiting for your decision before proceeding.**
```

### Examples

**⛔ STOP for These:**
```
- "Should we use Redux or Context for state?"
- "This needs a new database table"
- "We need to change the API endpoint signature"
- "This would work better as a microservice"
- "Should we add WebSocket support?"
- "The current auth pattern doesn't support this"
- "We need to refactor the entire module structure"
```

**✅ Don't Stop for These (other rules apply):**
```
- Simple bug fixes (Rule 1)
- Adding a missing import (Rule 2)
- Fixing build error (Rule 3)
- Nice-to-have improvement (Rule 5)
```

---

## Rule 5: Enhancement Logging 📝

### Definition
A noticed improvement that isn't required for the current task.

### Criteria
✅ Would make things better
✅ Not blocking anything
✅ "Nice to have" not "must have"
✅ Can be done later

### Action
```
1. Log to ISSUES.md
2. DO NOT implement
3. Continue with task
```

### Examples

**📝 Log These:**
```
- "This function could be more readable"
- "We could add caching here"
- "Better error messages would help"
- "This could use a helper function"
- "Documentation could be clearer"
- "Test coverage could be better"
- "Performance could be improved"
```

### ISSUES.md Entry Format
```markdown
## [Enhancement] Better error handling in parser

- **File:** src/utils/parser.js
- **Lines:** 45-60
- **Type:** enhancement
- **Priority:** low
- **Description:** Current error messages are generic. Could provide more context about what failed and why.
- **Logged:** 2026-02-02
- **Task context:** Discovered while implementing #123
```

### Priority Guidelines
| Priority | Criteria |
|----------|----------|
| **low** | Nice to have, no user impact |
| **medium** | Would improve DX/UX noticeably |
| **high** | Should be addressed soon |

---

## Decision Flowchart

```
            ┌──────────────────┐
            │ DEVIATION FOUND  │
            └────────┬─────────┘
                     │
                     ▼
         ┌───────────────────────┐
         │ Does it block current │
         │ task progress?        │
         └───────────┬───────────┘
                     │
          ┌─────────┴──────────┐
          │                    │
         YES                   NO
          │                    │
          ▼                    ▼
    ┌───────────┐      ┌─────────────────┐
    │ Is it a   │      │ Is it just a    │
    │ BUG?      │      │ nice-to-have?   │
    └─────┬─────┘      └────────┬────────┘
          │                     │
     ┌────┴────┐           ┌────┴────┐
    YES       NO          YES       NO
     │         │           │         │
     ▼         ▼           ▼         ▼
┌─────────┐ ┌────────┐ ┌───────┐ ┌────────┐
│ RULE 1  │ │Missing │ │RULE 5 │ │ Review │
│ Auto-   │ │deps or │ │Log to │ │ if it  │
│ fix it  │ │config? │ │ISSUES │ │ fits   │
└─────────┘ └───┬────┘ └───────┘ │ Rules  │
                │                │ 1-4    │
           ┌────┴────┐           └────────┘
          YES       NO
           │         │
           ▼         ▼
     ┌─────────┐ ┌───────────────┐
     │ RULE 2  │ │ Would fix     │
     │ Auto-   │ │ require arch  │
     │ add it  │ │ changes?      │
     └─────────┘ └──────┬────────┘
                        │
                   ┌────┴────┐
                  YES       NO
                   │         │
                   ▼         ▼
             ┌─────────┐ ┌─────────┐
             │ RULE 4  │ │ RULE 3  │
             │ STOP &  │ │ Auto-   │
             │ ASK     │ │ fix it  │
             └─────────┘ └─────────┘
```

---

## Integration with Other Systems

### With Iron Laws

| Rule | TDD Iron Law | Debugging Iron Law | Verification Iron Law |
|------|--------------|-------------------|----------------------|
| 1 (Bug) | Add test for fix | Find root cause first | Verify fix works |
| 2 (Missing) | N/A usually | N/A | Verify addition works |
| 3 (Blocker) | Test if applicable | Find root cause | Verify unblocked |
| 4 (Arch) | Design tests first | N/A | User verifies decision |
| 5 (Enhancement) | N/A (logged only) | N/A | N/A |

### With Hooks

**PreToolUse Hook** enforces deviation rules:
```
Before any Write/Edit/Bash:
1. Check if action is on-plan
2. If deviation, classify by rules 1-5
3. Act accordingly
```

### With Scale-Adaptive

| Mode | Rule 4 Behavior |
|------|-----------------|
| Quick Mode | Auto-escalate to Full Mode |
| Full Mode | Present options, wait for decision |

---

## Quick Decision Guide

Ask yourself:

```
1. "Can I fix this in < 5 minutes without changing 
    how things work together?"
   → YES: Rules 1, 2, or 3 (auto-handle)
   → NO: Continue to question 2

2. "Does this need a design decision?"
   → YES: Rule 4 (STOP and ASK)
   → NO: Continue to question 3

3. "Is this needed for the current task to work?"
   → YES: Re-evaluate Rules 1-4
   → NO: Rule 5 (Log and continue)
```

---

## Common Mistakes

### ❌ Over-Escalating
**Problem:** Stopping to ask about every small thing.
**Solution:** Trust yourself for Rules 1-3, 5. Only Rule 4 needs human input.

### ❌ Under-Escalating
**Problem:** Making architectural changes without asking.
**Solution:** If you're unsure, it's Rule 4. When in doubt, ask.

### ❌ Enhancement Creep
**Problem:** Implementing nice-to-haves during the task.
**Solution:** Log to ISSUES.md, then literally move on. The task comes first.

### ❌ Not Logging
**Problem:** Fixing things without documenting.
**Solution:** Every fix goes in progress.md. Every enhancement goes in ISSUES.md.

---

## Summary

```
┌─────────────────────────────────────────────────┐
│                DEVIATION RULES                  │
├─────────────────────────────────────────────────┤
│                                                 │
│  AUTONOMOUS (just do it):                       │
│  ├── Rule 1: Bug → Fix it                       │
│  ├── Rule 2: Missing → Add it                   │
│  ├── Rule 3: Blocker → Unblock it               │
│  └── Rule 5: Enhancement → Log it               │
│                                                 │
│  HUMAN REQUIRED (stop and ask):                 │
│  └── Rule 4: Architectural → Present options    │
│                                                 │
└─────────────────────────────────────────────────┘
```

---

*ACT v2.5 Deviation Rules - Controlled Autonomy*
