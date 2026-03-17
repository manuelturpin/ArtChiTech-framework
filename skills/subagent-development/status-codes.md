# Subagent Status Codes

> Standardized return codes for subagent communication.

## Status Codes

### DONE

The task is complete. All acceptance criteria met.

```xml
<status>DONE</status>
<summary>Implemented user login with email/password. Tests pass.</summary>
```

**Controller action:** Proceed to review.

---

### DONE_WITH_CONCERNS

The task is complete but the subagent has concerns.

```xml
<status>DONE_WITH_CONCERNS</status>
<summary>Implemented login. Works but password hashing might be slow for >1000 concurrent users.</summary>
<concerns>
  - Performance: bcrypt rounds=12 may be slow under load
  - Missing: Rate limiting not in spec but probably needed
</concerns>
```

**Controller action:**
1. Evaluate concerns
2. If concern is Critical → re-dispatch with updated instructions
3. If concern is Important → log to ISSUES.md, proceed to review
4. If concern is Minor → note, proceed to review

---

### NEEDS_CONTEXT

The subagent cannot complete the task without additional information.

```xml
<status>NEEDS_CONTEXT</status>
<summary>Cannot implement login — unclear which auth strategy to use.</summary>
<questions>
  - Should we use JWT or session-based auth?
  - What's the token expiry policy?
  - Is refresh token rotation required?
</questions>
```

**Controller action:**
1. Answer questions if possible (from plan, specs, or knowledge)
2. If controller can answer → re-dispatch with answers
3. If controller cannot answer → escalate to user (Deviation Rule 4)

---

### BLOCKED

The subagent hit an insurmountable blocker.

```xml
<status>BLOCKED</status>
<summary>Cannot implement — database schema doesn't support the required relationship.</summary>
<blocker>
  - Type: architectural
  - Detail: User table has no foreign key to Organization
  - Attempted: Checked schema, no migration available
  - Suggestion: Need schema migration first
</blocker>
```

**Controller action:**
1. Assess blocker type
2. If fixable (Rules 1-3) → fix and re-dispatch
3. If architectural (Rule 4) → escalate to user
4. Never re-dispatch without addressing the blocker

## Status Decision Tree (for Subagents)

```
Task complete?
|-- YES → Any concerns?
|         |-- YES → DONE_WITH_CONCERNS
|         +-- NO  → DONE
+-- NO  → Missing information?
          |-- YES → NEEDS_CONTEXT
          +-- NO  → BLOCKED
```

## Status Tracking

The controller maintains a dispatch log:

```markdown
| # | Task | Agent | Status | Round | Notes |
|---|------|-------|--------|-------|-------|
| 1 | Login | implementer | DONE | 1 | |
| 2 | Login | spec-reviewer | PASS | 1 | |
| 3 | Login | quality-reviewer | REQUEST_CHANGES | 1 | Missing error handling |
| 4 | Login | implementer | DONE | 2 | Fixed error handling |
| 5 | Login | quality-reviewer | APPROVE | 2 | |
```

---

*ACT v3.5 — Subagent Status Codes*
