# Phase 5: Quality

**Objective**: Validate quality before launch

**Active skills**: `@skills/verification/SKILL.md`, `@skills/debugging/SKILL.md`

## Checklist

- [ ] Complete E2E tests
- [ ] Performance testing (load, stress)
- [ ] Final security audit
- [ ] Accessibility audit (WCAG 2.1)
- [ ] Cross-browser testing
- [ ] Mobile responsiveness verified
- [ ] Error monitoring configured
- [ ] Backup/restore tested
- [ ] User documentation
- [ ] Beta testing (5-10 users)
- [ ] Critical bug fixes resolved
- [ ] Go/No-Go documented

## Anti-Patterns

⚠️ **Testing in production**: "We'll see in prod".

⚠️ **Ignoring edge cases**: Testing only the happy path.

⚠️ **Skipping accessibility**: "We'll add it later".

⚠️ **Manual testing only**: No automation.

## Debugging Process

```
1. Root Cause Investigation
   - Trace the stack trace
   - Identify the source of invalid data

2. Pattern Analysis
   - Look for similar errors
   - Identify common patterns

3. Hypothesis Testing
   - Form hypotheses
   - Test one by one

4. Implementation
   - Implement fix
   - Verify no regression
```

## Recommended Tools

- **Lighthouse**: Performance, Accessibility
- **Sentry**: Error monitoring
- **k6/Artillery**: Load testing
- **BrowserStack**: Cross-browser

## Key Metrics

| Metric | Target |
|--------|--------|
| E2E coverage | 100% critical paths |
| Lighthouse score | > 90 |
| WCAG compliance | AA |
| P95 response time | < 200ms |

## Transition → Phase 6

Go Conditions:
- 0 critical/major bugs
- Acceptable performance
- Security audit passed
- Positive beta feedback
