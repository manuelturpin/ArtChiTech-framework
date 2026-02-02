# Verification Checklist

> Use this checklist before marking any task complete.

---

## Pre-Completion Checklist

### 1. TDD Compliance

- [ ] Every new function has a corresponding test
- [ ] Each test was written BEFORE the implementation
- [ ] Each test was observed to FAIL first
- [ ] Each test failed for the EXPECTED reason
- [ ] Minimal code was written to make tests pass
- [ ] All tests pass after implementation
- [ ] No production code was written without a failing test

**Evidence required:**
```
Test file: [path/to/test]
Test run before implementation: FAIL (expected: [reason])
Test run after implementation: PASS
```

### 2. Root Cause Investigation (For Bug Fixes)

- [ ] Error message was read carefully
- [ ] Bug was reproduced consistently
- [ ] Recent changes were reviewed (`git log`, `git diff`)
- [ ] Root cause was identified and documented
- [ ] Fix addresses root cause (not symptoms)
- [ ] Fewer than 3 fix attempts (or architecture was questioned)

**Evidence required:**
```
Root cause: [description]
How identified: [investigation steps]
Fix applied: [description]
Verification: [test results]
```

### 3. Verification

- [ ] Verification command was identified
- [ ] Command was run FRESH (not using cached results)
- [ ] Full output was read
- [ ] Exit code was checked
- [ ] Output confirms the claim

**Evidence required:**
```
Command: [exact command]
Output: [actual output or summary]
Exit code: [0 or error code]
Conclusion: [what this proves]
```

---

## Quick Verification Commands

### Tests

```bash
# Python
pytest tests/ -v

# Node.js
npm test

# Go
go test ./...

# Rust
cargo test
```

### Build

```bash
# Node.js
npm run build

# Rust
cargo build --release

# Go
go build ./...
```

### Lint

```bash
# Python
flake8 . && black --check .

# Node.js
npm run lint

# Rust
cargo clippy

# Go
golangci-lint run
```

### Type Check

```bash
# Python
mypy .

# TypeScript
npx tsc --noEmit
```

---

## Evidence Template

Copy and fill this before completing any task:

```markdown
## Task Completion Evidence

### Task
[Brief description of what was done]

### TDD Compliance
- Tests written first: YES/NO/N/A
- Tests failed initially: YES/NO/N/A
- All tests pass now: YES/NO

### Verification
- Command: `[verification command]`
- Result: 
  ```
  [paste output here]
  ```
- Exit code: [0/error]

### Conclusion
[Claim with evidence]
```

---

## Anti-Patterns to Avoid

### Don't Say This:

- ❌ "Should work now"
- ❌ "I'm confident it's fixed"
- ❌ "Tests should pass"
- ❌ "The code looks correct"
- ❌ "I ran it earlier and it worked"

### Say This Instead:

- ✅ "Tests pass: `pytest` shows 34/34 passed"
- ✅ "Build succeeds: `npm run build` completed with exit code 0"
- ✅ "Fix verified: test_user_validation now passes after fixing the regex"

---

## Phase-Specific Checklists

### Development Phase

```
□ Feature has tests
□ Tests were written first
□ Tests cover happy path
□ Tests cover edge cases
□ All tests pass
□ Code is committed
```

### Quality Phase

```
□ All tests pass
□ Lint passes
□ Type check passes (if applicable)
□ Build succeeds
□ Manual verification done (if applicable)
```

### Launch Phase

```
□ All automated checks pass
□ Documentation is updated
□ CHANGELOG is updated
□ Version is bumped
□ Ready for merge/deploy
```

---

*Checklist for ACT v2.5 Iron Laws compliance*
