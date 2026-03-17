# Step 03: Review Loop

> When issues are found, iterate until resolved or escalated.

## The Fix-Review Loop

```
Issues Found
    │
    ▼
Fix Issues (implementer)
    │
    ▼
Re-Review (same stage)
    │
    ├── PASS → Continue to next stage or Approve
    │
    └── FAIL → Loop counter++
              │
              ├── Counter < 3 → Fix again
              │
              └── Counter ≥ 3 → ESCALATE
```

## Rules

### Round Limits

| Round | Action |
|-------|--------|
| 1 | Normal fix and re-review |
| 2 | Focus review on previously failed items + any new issues |
| 3 | Final attempt — if still failing, escalate |
| 3+ | **STOP** — Deviation Rule 4 (Architectural decision required) |

### What "Escalate" Means

After 3 failed review rounds:
1. The issue is likely architectural, not implementation
2. Stop trying to fix within the current approach
3. Present the situation to the user (Deviation Rule 4)
4. Include: what was tried, why it keeps failing, suggested alternatives

### Re-Review Scope

When re-reviewing after fixes:
- **Check fixed issues** — Are they actually resolved?
- **Check for regressions** — Did the fix break something else?
- **Check for new issues** — Did the fix introduce new problems?
- **Don't re-review everything** — Focus on the changed areas

### Tracking

Maintain a review log:

```markdown
## Review Log

### Round 1
- **Date:** YYYY-MM-DD
- **Reviewer:** spec-reviewer / quality-reviewer
- **Verdict:** FAIL
- **Issues:** 2 critical, 1 important
- **Action:** Fix requested

### Round 2
- **Date:** YYYY-MM-DD
- **Reviewer:** spec-reviewer / quality-reviewer
- **Verdict:** CONCERNS
- **Issues:** 0 critical, 1 important (new)
- **Action:** Fix requested

### Round 3
- **Date:** YYYY-MM-DD
- **Reviewer:** spec-reviewer / quality-reviewer
- **Verdict:** PASS
- **Issues:** 0
- **Action:** Approved ✅
```

## Integration with Stuck Detection

The review loop integrates with the Iron Laws stuck detection:
- 3 failed reviews = same as 3 failed fixes
- Triggers automatic escalation
- Prevents infinite review loops

---

*ACT v3.5 — Review Workflow Step 03*
