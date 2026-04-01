# Skill: Verification

> **"Trust but verify. Actually, just verify."**

## Purpose

Ensure work is actually complete and correct before declaring it done. This skill prevents premature completion, which is one of the most common causes of bugs and rework.

---

## The Iron Law

```
╔══════════════════════════════════════════════════════╗
║                                                      ║
║   NO TASK IS COMPLETE WITHOUT VERIFICATION           ║
║                                                      ║
║   "It should work" ≠ "It works"                     ║
║   "I think I fixed it" ≠ "I verified the fix"       ║
║                                                      ║
╚══════════════════════════════════════════════════════╝
```

---

## When to Verify

### Always Verify

| Situation | Why |
|-----------|-----|
| Before saying "done" | Prevent false completion |
| After any code change | Confirm it works |
| After bug fixes | Confirm fix AND no regressions |
| After refactoring | Behavior should be identical |
| Before merging/deploying | Last line of defense |

### Verification Depth by Risk

| Risk Level | Example | Verification Depth |
|------------|---------|-------------------|
| Low | Typo fix, comment change | Quick visual check |
| Medium | New feature, bug fix | Full test suite + manual test |
| High | Security, payments, data | Full tests + review + staging |
| Critical | Production deploy | All above + rollback plan |

---

## The Verification Checklist

### For Code Changes

```markdown
## Code Verification Checklist

### Functionality
- [ ] Code compiles/runs without errors
- [ ] Feature works as intended (manual test)
- [ ] All automated tests pass
- [ ] Edge cases handled

### Quality
- [ ] No regressions introduced
- [ ] No new warnings
- [ ] Code review feedback addressed
- [ ] Documentation updated if needed

### Safety
- [ ] No debugging code left
- [ ] No hardcoded secrets
- [ ] No console.log/print statements
- [ ] .gitignore covers sensitive files
```

### For Bug Fixes

```markdown
## Bug Fix Verification

- [ ] Bug is reproducible before fix
- [ ] Bug no longer reproduces after fix
- [ ] Regression test added
- [ ] Related functionality still works
- [ ] Fix works in target environment
```

### For Deployments

```markdown
## Deployment Verification

- [ ] All tests pass in CI
- [ ] Staging deployment successful
- [ ] Smoke tests pass
- [ ] Monitoring in place
- [ ] Rollback plan ready
- [ ] Post-deploy verification complete
```

---

## Verification Techniques

### 1. Run the Tests

The minimum bar. Always run the full test suite.

```bash
# Don't just run the test you wrote
npm test          # All tests
pytest            # All tests
./run_tests.sh    # All tests
```

### 2. Manual Testing

Tests don't catch everything. Actually use the feature.

```markdown
## Manual Test Plan

1. Happy path: [describe normal usage]
2. Edge cases: [list edge cases to try]
3. Error cases: [try to break it]
4. User perspective: [would a user understand this?]
```

### 3. Code Review Verification

Did you address all review comments?

```markdown
## Review Response Verification

- [ ] All comments addressed
- [ ] Reviewer approved
- [ ] CI still passing after changes
```

### 4. Environment Verification

Does it work where it matters?

```markdown
## Environment Check

- [ ] Works locally
- [ ] Works in CI
- [ ] Works in staging
- [ ] Ready for production
```

---

## The "Before Done" Protocol

Execute this BEFORE declaring any task complete:

### Step 1: Stop and Ask

Before saying "done", ask yourself:

- Did I actually verify this works?
- How do I know it works?
- What evidence do I have?

### Step 2: Gather Evidence

Collect proof:

```markdown
## Verification Evidence

**Task:** [what was completed]

**Evidence of Completion:**
- Test results: [screenshot or output]
- Manual test: [what I tried, what happened]
- Code review: [link or status]

**Verification Steps Taken:**
1. [Step 1]
2. [Step 2]
3. [Step 3]
```

### Step 3: Document

Add verification to the task/PR:

```markdown
## Verified

- ✅ All tests pass (link to CI)
- ✅ Manually tested: created user, logged in, accessed dashboard
- ✅ Reviewed by @teammate
- ✅ Deployed to staging, smoke tests pass
```

---

## Common Verification Failures

### ❌ "The Tests Pass"

Tests can be:
- Incomplete (don't cover this case)
- Wrong (test the wrong thing)
- Mocked too much (don't test real behavior)

**Fix:** Always supplement with manual verification

### ❌ "It Works On My Machine"

Environment differences are real:
- Different configs
- Different dependencies
- Different data

**Fix:** Verify in the target environment

### ❌ "I Didn't Change Much"

Small changes cause big bugs:
- One-character typos
- Off-by-one errors
- Null pointer exceptions

**Fix:** Verify EVERY change, no matter how small

### ❌ "I've Done This Before"

Familiarity breeds carelessness:
- You assume things still work
- You skip steps
- You miss new edge cases

**Fix:** Follow the checklist every time

---

## Commands

| Command | Description |
|---------|-------------|
| `/verify [task]` | Run verification protocol |
| `/verify:quick` | Quick verification checklist |
| `/verify:deploy` | Pre-deployment verification |
| `/verify:evidence` | Document verification proof |

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| TDD | Tests ARE verification (partially) |
| Code Review | Part of verification chain |
| Debugging | Verify fixes work |
| Reflexion | Reflect after verification |

---

## Verification Levels

### Level 1: Smoke Test
- Does it run at all?
- No crashes on startup?
- Basic functionality works?

### Level 2: Functional Test
- Does each feature work?
- Are inputs validated?
- Are outputs correct?

### Level 3: Integration Test
- Do components work together?
- Are APIs compatible?
- Is data flowing correctly?

### Level 4: Acceptance Test
- Does it meet requirements?
- Would the user accept this?
- Is it production-ready?

---

## Quick Verification Template

```markdown
## Quick Verify: [Task Name]

**What:** [One-line description]
**Changed:** [Files/components modified]

**Verified:**
- [ ] Tests pass
- [ ] Manual test: [what I tried]
- [ ] Works in: [environment]

**Evidence:** [Link or description]
```

---

*Skill version: 1.0*
*Compatible with: ACT v2.5+*
