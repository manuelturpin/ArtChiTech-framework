---
description: Adversarial review tool — cynical critique to find hidden flaws
---

# Adversarial Review

> Think like a hostile user, a careless developer, and a malicious attacker — all at once.

## Purpose

Challenge assumptions and find flaws that normal review misses. The adversarial reviewer is deliberately pessimistic and skeptical.

## When to Use

- Before merging critical features
- For security-sensitive code
- When confidence is high (that's when blind spots are largest)
- When the implementation "just works" on first try (suspicious)

## The Adversarial Mindset

Ask yourself:
1. **"How could this fail silently?"** — No error, but wrong result
2. **"What happens with malicious input?"** — SQL injection, XSS, path traversal
3. **"What if assumptions are wrong?"** — Network down, disk full, concurrent access
4. **"What's the worst-case scenario?"** — Data loss, security breach, infinite loop
5. **"What would a junior developer break?"** — Unclear API, footgun patterns

## Review Process

### 1. Attack Surface Analysis

Identify every entry point:
- User input (forms, URLs, headers)
- API endpoints (parameters, body, auth)
- File system (paths, permissions, size)
- Database (queries, connections, transactions)
- External services (timeouts, failures, format changes)

### 2. Failure Mode Exploration

For each entry point, consider:

| Failure Mode | Question |
|-------------|----------|
| **Null/Empty** | What if this is null, empty, or undefined? |
| **Overflow** | What if this is MAX_INT, very long string, huge file? |
| **Concurrency** | What if two requests hit this simultaneously? |
| **Timing** | What if this takes 60 seconds? What if it never returns? |
| **Format** | What if the format is unexpected (UTF-16, CRLF, BOM)? |
| **State** | What if the system is in an unexpected state? |

### 3. Trust Boundary Audit

Identify where data crosses trust boundaries:
- External → Internal (must validate)
- User → System (must sanitize)
- Network → Local (must verify)

**Rule:** Never trust data that crosses a trust boundary.

### 4. Dependency Risk

- What if a dependency is unavailable?
- What if a dependency returns unexpected data?
- What if a dependency has a breaking change?

## Output Format

```markdown
## Adversarial Review

### Attack Surface
- [Entry point 1]: [Risk level]
- [Entry point 2]: [Risk level]

### Vulnerabilities Found
- **Critical:** [description, exploit scenario]
- **High:** [description, impact]
- **Medium:** [description, likelihood]

### Assumptions Challenged
- "Assumption X" → What if [counter-scenario]?

### Recommendations
- [Specific fix for each vulnerability]
```

---

*ACT v3.5 — Adversarial Review Tool*
