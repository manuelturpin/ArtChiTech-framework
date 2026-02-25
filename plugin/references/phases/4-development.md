# Phase 4: Development

**Objective**: Implement the MVP with quality

**Active skills**: `superpowers:test-driven-development`, `superpowers:code-review`, `superpowers:systematic-debugging`
**Iron Laws**: TDD Iron Law (mandatory), Debugging Iron Law (when issues arise)
**Agents**: `executor` (Sonnet), `tester` (Sonnet)

## Checklist

- [ ] Environment setup (dev, staging, prod)
- [ ] CI/CD pipeline configured
- [ ] Core features implemented
- [ ] Unit tests (> 80% coverage)
- [ ] Integration tests
- [ ] Systematic code reviews
- [ ] Code documentation (JSDoc, etc.)
- [ ] Robust error handling
- [ ] Logging and monitoring
- [ ] Performance baseline established
- [ ] Security audit passed
- [ ] Go/No-Go documented

## Chunk-Test-Fix Workflow

```
For each feature:
1. Break down into chunks (~50 lines)
2. For each chunk:
   🔴 RED   : Write failing test
   🟢 GREEN : Implement minimum
   🔧 REFACTOR : Clean up if necessary
3. Commit after each green chunk
4. Code review before merge
```

## Anti-Patterns

⚠️ **Skipping tests**: "I'll test later" → never.

⚠️ **Big bang commits**: Massive commits difficult to review.

⚠️ **Cowboy coding**: Merge without review.

⚠️ **Technical debt denial**: Accumulating without tracking.

## Recommended Tools

- **Jest/Vitest**: Unit testing
- **Playwright/Cypress**: E2E testing
- **GitHub Actions**: CI/CD
- **SonarQube**: Code quality

## Key Metrics

| Metric | Target |
|--------|--------|
| Test coverage | > 80% |
| Build time | < 5 min |
| Code review time | < 24h |
| Bug escape rate | < 5% |

## Superpowers Integration

| Superpower | Role in Development |
|------------|---------------------|
| `superpowers:test-driven-development` | Enforces RED→GREEN→REFACTOR cycle for every feature |
| `superpowers:code-review` | Reviews implementation quality after each chunk |
| `superpowers:systematic-debugging` | Investigates failures methodically (Debugging Iron Law) |

**TDD Iron Law applies**: No production code without a failing test first. Code written before test? DELETE IT.

## Transition → Phase 5

Go Conditions:
- All MVP features implemented
- Tests pass (> 80% coverage)
- 0 critical bugs
- Code reviews approved
