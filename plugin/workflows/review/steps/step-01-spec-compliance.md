# Step 01: Spec Compliance Review

> Verify that the implementation matches the specification exactly.

## Input Required

- **Specification:** The acceptance criteria, PRD section, or task description
- **Implementation:** Files created or modified
- **Diff:** `git diff` of the changes

## Process

### 1. Load the Specification

Read the relevant specification document:
- `.act/plan.md` — Task description and acceptance criteria
- `.act/prd.md` — Product requirements (if applicable)
- Specific spec file — If referenced in the task

### 2. Create Requirement Checklist

Extract every testable requirement from the spec:

```markdown
| # | Requirement | Status | Evidence |
|---|-------------|--------|----------|
| 1 | "User can login with email" | ? | |
| 2 | "Invalid email shows error" | ? | |
| 3 | "Session expires after 1h" | ? | |
```

### 3. Check Each Requirement

For each requirement:
1. **Find** the code that implements it
2. **Verify** it handles the full requirement (not just happy path)
3. **Find** the test that validates it
4. **Mark** PASS or FAIL with evidence

### 4. Check for Extras

Look for code that does MORE than the spec requires:
- Is there scope creep?
- Are there undocumented behaviors?
- Flag additions as "unspecified" — not necessarily wrong, but should be intentional

### 5. Render Verdict

| Condition | Verdict |
|-----------|---------|
| All requirements PASS | **PASS** |
| All requirements PASS but concerns exist | **CONCERNS** |
| Any requirement FAILS | **FAIL** |

## Output

```markdown
## Spec Compliance Review

**Verdict:** PASS / CONCERNS / FAIL

### Requirements
| # | Requirement | Status | Evidence |
|---|-------------|--------|----------|
| 1 | ... | ✅/❌ | file:line |

### Issues
- **Critical:** [if any]
- **Important:** [if any]

### Summary
[2-3 sentence assessment]
```

---

*ACT v3.5 — Review Workflow Step 01*
