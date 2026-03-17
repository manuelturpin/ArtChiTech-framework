# Step 02: Code Quality Review

> Evaluate code quality, maintainability, and robustness.
> Only proceed here AFTER spec compliance passes.

## Input Required

- **Files:** Implementation files
- **Diff:** `git diff` of changes
- **Conventions:** Project coding conventions
- **Spec review:** Confirmation that Stage 1 passed

## Process

### 1. Read the Implementation

Read all modified files completely. Understand the design choices.

### 2. Evaluate Each Dimension

#### Readability
- Are names clear and descriptive?
- Is the code structure logical?
- Are complex sections commented?

#### Maintainability
- Is there unnecessary coupling?
- Would a new developer understand this?
- Are responsibilities properly separated?

#### Robustness
- Are errors handled gracefully?
- Are edge cases covered?
- Is input validated at boundaries?

#### Performance
- Any obvious O(n²) where O(n) is possible?
- Unnecessary database queries?
- Memory leaks or resource leaks?

#### Security
- SQL injection possible?
- XSS vulnerabilities?
- Authentication/authorization checks?

#### Testing
- Are tests meaningful (not just coverage padding)?
- Edge cases tested?
- Error paths tested?

### 3. Categorize Issues

- **Critical:** Security vulnerability, data loss risk, or major bug
- **Important:** Significant maintainability or robustness issue
- **Minor:** Style preference, naming suggestion, small optimization

### 4. Acknowledge Good Work

Always note what was done well. Positive feedback matters.

### 5. Render Verdict

| Condition | Verdict |
|-----------|---------|
| No critical or important issues | **APPROVE** |
| Important issues but no critical | **COMMENT** (approve with suggestions) |
| Critical issues found | **REQUEST_CHANGES** |

## Output

```markdown
## Code Quality Review

**Verdict:** APPROVE / COMMENT / REQUEST_CHANGES
**Score:** X/5

### Issues
- **Critical:** [list]
- **Important:** [list]
- **Minor:** [list]

### Highlights
- [What was done well]

### Summary
[2-3 sentence quality assessment]
```

---

*ACT v3.5 — Review Workflow Step 02*
