# Defense in Depth

> Companion document for the Verification Iron Law. Multiple layers of validation prevent escaped bugs.

## The 4 Validation Layers

No single check catches everything. Use all four layers:

### Layer 1: Static Analysis (Instant)
Catches errors before execution.

| Tool Type | What It Catches | Examples |
|-----------|----------------|---------|
| Type checker | Type mismatches | `tsc --noEmit`, `mypy` |
| Linter | Style + logic issues | `eslint`, `flake8`, `clippy` |
| Formatter | Inconsistency | `prettier`, `black` |

**When to run:** Before every commit. Automate via pre-commit hooks.

### Layer 2: Unit Tests (Seconds)
Catches logic errors in isolated units.

| Aspect | Requirement |
|--------|------------|
| Speed | < 10 seconds for full suite |
| Coverage | Every function with logic |
| Isolation | No external dependencies |

**When to run:** After every code change. Automate in watch mode.

### Layer 3: Integration Tests (Minutes)
Catches interaction errors between components.

| Aspect | Requirement |
|--------|------------|
| Scope | Component boundaries |
| Dependencies | Real or faithful mocks |
| Data | Representative test data |

**When to run:** Before merge. Automate in CI.

### Layer 4: Manual Verification (Variable)
Catches what automation misses.

| Type | When |
|------|------|
| Smoke test | After deployment |
| Exploratory | Before release |
| User acceptance | Before launch |

**When to run:** Before declaring "done".

---

## Verification Cheat Sheet

| Claim | Minimum Required Evidence |
|-------|--------------------------|
| "Tests pass" | Fresh `npm test` / `pytest` output with exit code 0 |
| "Build works" | Fresh `npm run build` output with exit code 0 |
| "No lint errors" | Fresh linter output showing 0 errors |
| "It's deployed" | Access the URL, verify response |
| "Bug is fixed" | Failing test now passes, no regressions |
| "Feature works" | Demo or screenshot showing the behavior |

## The "Trust But Verify" Principle

Never trust:
- Cached results (always re-run)
- Other people's claims (verify independently)
- Your own memory ("I ran it earlier")
- CI from a different branch
- Partial output ("the first test passed so...")

Always:
- Run the full command
- Read the full output
- Check the exit code
- Screenshot or copy evidence

---

*Companion to Verification Iron Law — ACT v3.5*
