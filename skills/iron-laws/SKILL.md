# Skill: Iron Laws

> **"Evidence before claims. Root cause before fixes. Tests before code."**

## Purpose

The Iron Laws are non-negotiable rules that prevent common AI coding agent failures. They enforce evidence-based development, systematic debugging, and mandatory verification.

---

## The Three Iron Laws

### 1. TDD Iron Law

> **NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST**

#### When It Applies
- Writing any new function, class, or module
- Adding new features
- Implementing business logic

#### How to Comply
```
1. Write the test first
2. Run it → Must FAIL (red)
3. Write minimal code to pass
4. Run it → Must PASS (green)
5. Refactor if needed
6. Run again → Still PASS
```

#### Common Rationalizations to AVOID
- ❌ "I'll add tests later"
- ❌ "This is too simple to test"
- ❌ "I'm just prototyping"
- ❌ "Tests would slow me down"

#### Evidence Required
- Test file exists BEFORE implementation
- Test must be seen failing first
- Test must pass after code is written

---

### 2. Debugging Iron Law

> **NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST**

#### When It Applies
- Bug reports
- Test failures
- Error messages
- Unexpected behavior

#### How to Comply
```
1. Reproduce the bug
2. Gather evidence (logs, stack traces)
3. Form hypothesis about root cause
4. Verify hypothesis
5. THEN implement fix
6. Add regression test
```

#### Common Rationalizations to AVOID
- ❌ "I think I know what's wrong"
- ❌ "Let me just try this quick fix"
- ❌ "The error message says X, so it must be X"
- ❌ "This worked before, so just revert"

#### The 3-Strike Rule
If 3 fix attempts fail, STOP. The problem is architectural, not tactical.

#### Evidence Required
- Root cause documented
- Fix addresses the root cause (not just symptoms)
- Regression test prevents recurrence

---

### 3. Verification Iron Law

> **NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE**

#### When It Applies
- Before marking any task complete
- Before claiming "it works"
- Before committing/pushing code
- Before responding "done"

#### How to Comply
```
1. Run the actual verification command
2. READ the output (don't assume)
3. Only claim completion if evidence confirms
4. Include evidence in your response
```

#### Common Rationalizations to AVOID
- ❌ "It should work now"
- ❌ "I'm confident this fixes it"
- ❌ "I've done this before"
- ❌ "The code looks correct"

#### Evidence Required
- Command run with output shown
- Fresh evidence (from THIS session)
- Explicit confirmation of success

---

## Quick Reference

| Law | Trigger | Evidence Needed |
|-----|---------|-----------------|
| TDD | Writing code | Failing test → Passing test |
| Debug | Fixing bug | Root cause → Fix → Regression test |
| Verify | Claiming done | Fresh command output |

---

## Verification Checklist

Before claiming any task complete, verify:

### For Code Changes
```markdown
- [ ] Tests written FIRST (TDD)
- [ ] All tests pass (run command, show output)
- [ ] No TypeScript/lint errors
- [ ] Code committed with clear message
```

### For Bug Fixes
```markdown
- [ ] Root cause identified and documented
- [ ] Fix addresses root cause
- [ ] Regression test added
- [ ] Original bug no longer reproduces
```

### For Features
```markdown
- [ ] TDD followed throughout
- [ ] Feature works as specified
- [ ] Edge cases handled
- [ ] Documentation updated
```

---

## Integration with ACT

### With Hooks
- **Stop Hook** enforces Verification Iron Law
- **PreToolUse** can check TDD compliance
- **PostToolUse** prompts for verification

### With Deviation Rules
- Bug discovered → Rule 1 (auto-fix) + Debugging Iron Law
- Completion claim → Verification Iron Law gates exit

---

## Examples

### Example 1: TDD in Action

```
❌ WRONG:
"I'll create the user model..."
[writes user.py]
"Now I'll add some tests..."
[writes test_user.py]

✅ CORRECT:
"First, let me write the test for the user model..."
[writes test_user.py]
[runs test → FAILS as expected]
"Now I'll implement the user model..."
[writes user.py]
[runs test → PASSES]
```

### Example 2: Debugging Iron Law

```
❌ WRONG:
"Login is broken? Let me try adding a null check..."
[adds null check]
"Still broken? Maybe it's the session..."
[changes session code]
"Hmm, let me try..."

✅ CORRECT:
"Login is broken. Let me investigate..."
[checks logs → finds 401 error]
[checks auth flow → token expired]
"Root cause: Token refresh not triggered."
[writes regression test for token refresh]
[implements proper refresh logic]
[test passes]
```

### Example 3: Verification Iron Law

```
❌ WRONG:
"Done! The auth module should work now."

✅ CORRECT:
"Let me verify the auth module works..."
$ npm test auth
✓ auth/login (45ms)
✓ auth/logout (12ms)
✓ auth/refresh (23ms)
3 passing (80ms)

"Auth module verified: 3 tests passing."
```

---

## When to Break the Laws (Spoiler: Never)

These laws have no exceptions. The moment you think "just this once," you're about to create technical debt or ship a bug.

If the laws feel burdensome:
1. The task scope is wrong (break it down)
2. The architecture is wrong (refactor first)
3. You're rushing (slow down)

---

## Related

- **rules/iron-laws.md** — Full rules documentation
- **templates/verification-checklist.md** — Actionable checklist
- **SPEC-iron-laws.md** — Specification document

---

*Skill version: 1.0*
*Compatible with: ACT v2.5+*
