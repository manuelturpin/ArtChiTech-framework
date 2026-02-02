# Iron Laws

> Non-negotiable rules for quality-driven development.

These three laws are **mandatory**. No exceptions. No shortcuts.

---

## 1. TDD Iron Law

### The Rule

> **NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST**

### When It Applies

- Writing any new function, class, or module
- Adding new features
- Implementing business logic
- Fixing bugs (write the failing test that reproduces it first)

### When It Does NOT Apply

- Configuration files
- Documentation
- Spike/prototype code (clearly marked, will be deleted)
- Trivial getters/setters (use judgment)

### How to Comply

```
1. Write the test
2. Run the test → MUST FAIL
3. Verify it fails for the RIGHT reason
4. Write minimal production code
5. Run the test → MUST PASS
6. Refactor if needed
7. All tests still pass
```

### The RED-GREEN-REFACTOR Cycle

```
    ┌──────────────────────────────────────────┐
    │                                          │
    ▼                                          │
  [RED]                                        │
  Write failing test                           │
    │                                          │
    ▼                                          │
  Verify it fails correctly                    │
    │                                          │
    ▼                                          │
  [GREEN]                                      │
  Write minimal code to pass                   │
    │                                          │
    ▼                                          │
  Verify it passes                             │
    │                                          │
    ▼                                          │
  [REFACTOR]                                   │
  Clean up, improve                            │
    │                                          │
    ▼                                          │
  All tests still pass? ───────────────────────┘
```

### Code Written Before Test?

**DELETE IT. Start over.**

No exceptions. The code you wrote is contaminated by assumptions. The test you write after will be designed to pass, not to verify behavior.

### Common Rationalizations (Don't Fall For These)

| Rationalization | Reality |
|-----------------|---------|
| "It's too simple to test" | Simple code breaks. A 30-second test saves hours. |
| "I'll add tests after" | Tests that pass immediately prove nothing. |
| "TDD will slow me down" | TDD is faster than debugging untested code. |
| "Let me keep this code as reference" | You'll adapt it to pass. Delete means delete. |
| "It's just a refactor" | Refactors need tests to verify behavior is preserved. |

### Example

**Wrong:**
```python
# First write the code
def calculate_total(items):
    return sum(item.price * item.quantity for item in items)

# Then write a test (BAD!)
def test_calculate_total():
    items = [Item(price=10, quantity=2)]
    assert calculate_total(items) == 20  # Always passes
```

**Correct:**
```python
# 1. Write the test FIRST
def test_calculate_total_with_single_item():
    items = [Item(price=10, quantity=2)]
    assert calculate_total(items) == 20

# 2. Run it - FAILS (function doesn't exist)

# 3. Write minimal code
def calculate_total(items):
    return sum(item.price * item.quantity for item in items)

# 4. Run test - PASSES
```

---

## 2. Debugging Iron Law

### The Rule

> **NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST**

### When It Applies

- Bug reports
- Test failures
- Error messages
- Unexpected behavior
- "It worked yesterday"

### How to Comply: The 4 Phases

#### Phase 1: Root Cause Investigation

1. **Read error messages carefully** - The answer is often there
2. **Reproduce consistently** - If you can't reproduce it, you can't fix it
3. **Check recent changes** - `git log`, `git diff`
4. **Gather evidence** - Logs, stack traces, state dumps
5. **Trace data flow** - Follow the path from input to error

#### Phase 2: Pattern Analysis

1. **Find working examples** - What similar code works?
2. **Compare against references** - Documentation, examples
3. **Identify differences** - What's different between working and broken?
4. **Understand dependencies** - What does this code depend on?

#### Phase 3: Hypothesis Testing

1. **Form a single hypothesis** - "The bug is caused by X"
2. **Test minimally** - Change ONE variable
3. **Verify before continuing** - Did the change help?
4. **If 3+ fixes failed → Question the architecture**

#### Phase 4: Implementation

1. **Create a failing test** - Reproduce the bug in a test
2. **Implement single fix** - One change at a time
3. **Verify the fix** - Test passes, no regressions
4. **If ≥3 fixes failed → STOP, question architecture**

### The Rule of 3

> If you've tried 3+ fixes without success, the problem isn't where you think it is.

Stop. Step back. Question your assumptions. The architecture might be wrong.

### Red Flags (Stop Immediately If You Catch Yourself)

- "Quick fix for now" - There is no "for now"
- "Just try changing X" - Random changes create random bugs
- "I'm confident this will work" - Confidence without evidence is wishful thinking
- "One more fix attempt" after 2+ failures - You're pattern matching, not understanding

### Common Rationalizations (Don't Fall For These)

| Rationalization | Reality |
|-----------------|---------|
| "I know what the problem is" | Then prove it with evidence |
| "Let me just try this quick" | Quick tries lead to long debugging |
| "It's probably X" | Probably isn't good enough |
| "I'll understand it later" | You'll never understand it later |

### Example

**Wrong:**
```python
# Error: KeyError: 'user_id'
# Quick fix: add a default
data.get('user_id', None)  # Hides the real problem!
```

**Correct:**
```python
# Error: KeyError: 'user_id'

# Phase 1: Investigate
# - Where does 'data' come from?
# - When is 'user_id' expected to be present?
# - What changed recently?

# Finding: The API response format changed
# Root cause: API v2 uses 'userId' instead of 'user_id'

# Phase 4: Fix with test
def test_handles_api_v2_format():
    data = {'userId': '123'}
    assert extract_user_id(data) == '123'

def extract_user_id(data):
    return data.get('userId') or data.get('user_id')
```

---

## 3. Verification Iron Law

### The Rule

> **NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE**

### When It Applies

- Before saying "done", "complete", "finished"
- Before saying "it works", "it passes", "it's fixed"
- Before committing code
- Before pushing code
- Before marking a task complete

### How to Comply: The Gate Function

```
1. IDENTIFY: What command proves this claim?
2. RUN: Execute the FULL command
3. READ: Full output, check exit code
4. VERIFY: Does output actually confirm the claim?
5. ONLY THEN: Make the claim
```

### Evidence Format

**Acceptable:**
```
✅ Ran: pytest tests/
   Output: 34 passed in 2.1s
   Claim: "All tests pass"

✅ Ran: npm run build
   Output: Build completed successfully
   Claim: "Build succeeds"
```

**Unacceptable:**
```
❌ "Should work now"
❌ "I'm confident it passes"
❌ "The agent said it succeeded"
❌ "It looked correct"
❌ "I ran it earlier"
```

### Verification Commands by Type

| Claim | Verification Command |
|-------|---------------------|
| "Tests pass" | `pytest`, `npm test`, `go test` |
| "Build succeeds" | `npm run build`, `cargo build` |
| "No lint errors" | `eslint .`, `flake8`, `cargo clippy` |
| "Server starts" | Start it, check logs |
| "API works" | `curl` the endpoint |

### Common Rationalizations (Don't Fall For These)

| Rationalization | Reality |
|-----------------|---------|
| "Should work now" | RUN the verification |
| "I'm confident" | Confidence ≠ evidence |
| "The previous run passed" | Fresh run required |
| "I just changed a comment" | Comments can break things (ask Python) |
| "Agent said success" | Verify independently |

### Example

**Wrong:**
```markdown
I've fixed the bug by updating the validation logic. 
The tests should pass now.
```

**Correct:**
```markdown
I've fixed the bug by updating the validation logic.

Verification:
$ pytest tests/test_validation.py -v
========================= test session starts =========================
tests/test_validation.py::test_valid_email PASSED
tests/test_validation.py::test_invalid_email PASSED
tests/test_validation.py::test_empty_email PASSED
========================= 3 passed in 0.12s =========================

All validation tests pass.
```

---

## Quick Reference Card

```
┌─────────────────────────────────────────────────────────────────┐
│                        IRON LAWS                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. TDD LAW                                                     │
│     NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST             │
│     → Test first, fail first, then code                         │
│                                                                 │
│  2. DEBUGGING LAW                                               │
│     NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST             │
│     → Understand before you fix                                 │
│     → 3+ failed fixes = wrong architecture                      │
│                                                                 │
│  3. VERIFICATION LAW                                            │
│     NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE    │
│     → Run it, read it, then claim it                            │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Integration with ACT

### Phase Mapping

| ACT Phase | Iron Laws Applied |
|-----------|-------------------|
| 1. Discovery | - |
| 2. Strategy | - |
| 3. Design | - |
| 4. Development | TDD Iron Law |
| 5. Quality | All three laws |
| 6. Launch | Verification Iron Law |
| 7. Growth | Debugging Iron Law |

### Hook Enforcement

- **PreToolUse Hook:** Checks TDD compliance before code changes
- **PostToolUse Hook:** Prompts for progress logging
- **Stop Hook:** Enforces Verification Iron Law before completion

---

*Iron Laws adapted from Superpowers v4.1.1 for ACT v2.5*
