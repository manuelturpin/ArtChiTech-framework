# Skill: Test-Driven Development (TDD)

> **"Red → Green → Refactor. The discipline that prevents bugs before they exist."**

## Purpose

Write tests before implementation to ensure correctness, drive design, and maintain confidence during refactoring. TDD isn't about testing—it's about thinking clearly before coding.

---

## When to Use

### Always Use TDD For

| Situation | Why |
|-----------|-----|
| New feature implementation | Design emerges from tests |
| Bug fixes | Prove the bug exists, then fix |
| API design | Tests document expected behavior |
| Complex logic | Tests catch edge cases early |
| Refactoring | Safety net for changes |

### Consider Skipping When

| Situation | Why |
|-----------|-----|
| Pure UI/styling changes | Visual verification needed |
| One-off scripts | Not worth the investment |
| Exploratory prototypes | Design isn't settled |
| Trivial getters/setters | Obvious correctness |

---

## The TDD Cycle

```
┌─────────────────────────────────────────────┐
│                                             │
│    ┌─────┐     ┌─────┐     ┌──────────┐    │
│    │ RED │ ──→ │GREEN│ ──→ │ REFACTOR │    │
│    └─────┘     └─────┘     └──────────┘    │
│        ↑                         │         │
│        └─────────────────────────┘         │
│                                             │
└─────────────────────────────────────────────┘
```

### 1. RED: Write a Failing Test

- Write the smallest test that expresses the next behavior
- Run it — must fail (proves the test works)
- Failure message should be clear and useful

```python
# Example: Testing a user registration function
def test_register_user_creates_account():
    result = register_user("alice@example.com", "password123")
    assert result.success is True
    assert result.user.email == "alice@example.com"
```

### 2. GREEN: Make It Pass

- Write the minimum code to pass the test
- Don't over-engineer — just make it work
- Ugly is fine at this stage

```python
# Minimal implementation to pass
def register_user(email, password):
    user = User(email=email, password=password)
    user.save()
    return Result(success=True, user=user)
```

### 3. REFACTOR: Clean Up

- Improve code quality without changing behavior
- Remove duplication, improve names, simplify
- Tests must still pass after refactoring

```python
# Refactored: Added validation, cleaner structure
def register_user(email: str, password: str) -> RegistrationResult:
    validated_email = validate_email(email)
    hashed_password = hash_password(password)
    
    user = User.create(email=validated_email, password=hashed_password)
    return RegistrationResult.success(user)
```

---

## TDD Best Practices

### Test Naming

Follow the pattern: `test_[unit]_[scenario]_[expected]`

```python
# Good
def test_user_registration_with_invalid_email_returns_error():
def test_password_reset_with_expired_token_raises_exception():

# Bad
def test_user():
def test_it_works():
```

### One Assertion Per Test

Each test should verify one specific behavior:

```python
# Good: Separate tests for separate behaviors
def test_login_with_valid_credentials_succeeds():
    assert login("alice", "password").success is True

def test_login_with_valid_credentials_returns_user():
    assert login("alice", "password").user.name == "alice"

# Bad: Multiple unrelated assertions
def test_login():
    result = login("alice", "password")
    assert result.success is True
    assert result.user.name == "alice"
    assert result.token is not None
    assert len(result.permissions) > 0
```

### Arrange-Act-Assert (AAA)

Structure tests clearly:

```python
def test_transfer_funds_updates_both_accounts():
    # Arrange
    source = Account(balance=100)
    target = Account(balance=50)
    
    # Act
    transfer(source, target, amount=30)
    
    # Assert
    assert source.balance == 70
    assert target.balance == 80
```

---

## The TDD Checklist

Before writing any implementation:

```markdown
## Pre-Implementation Checklist

- [ ] Test file exists
- [ ] Test describes intended behavior
- [ ] Test runs and FAILS (red)
- [ ] Failure message is clear

After implementation:
- [ ] Test passes (green)
- [ ] No other tests broke
- [ ] Code is refactored and clean
- [ ] Edge cases are covered
```

---

## Edge Case Strategy

For each function, consider:

| Category | Examples |
|----------|----------|
| Empty inputs | `""`, `[]`, `None`, `0` |
| Boundary values | Max/min, first/last, off-by-one |
| Invalid inputs | Wrong type, malformed data |
| Error conditions | Network failure, timeout, disk full |
| Concurrent access | Race conditions, deadlocks |

---

## TDD for Bug Fixes

When fixing a bug, ALWAYS:

1. **Write a test that reproduces the bug** (must fail)
2. **Fix the bug** (test passes)
3. **Keep the test** (prevents regression)

```python
# Step 1: Reproduce the bug
def test_user_login_with_spaces_in_email_fails():
    # Bug: " alice@example.com" was being accepted
    result = login(" alice@example.com", "password")
    assert result.success is False
    assert "invalid email" in result.error.lower()

# Step 2: Fix the bug (trim whitespace in login function)
# Step 3: Test stays in suite forever
```

---

## Commands

| Command | Description |
|---------|-------------|
| `/tdd [feature]` | Start TDD cycle for a feature |
| `/tdd:red` | Write failing test |
| `/tdd:green` | Implement to pass |
| `/tdd:refactor` | Clean up while green |

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| Verification | TDD tests ARE verification |
| Debugging | Failing test = bug reproduction |
| Code Review | Tests are reviewed with code |

---

## Anti-Patterns to Avoid

### ❌ Test After
Writing tests after implementation defeats the purpose. You'll test what you wrote, not what you should have written.

### ❌ Test Everything
100% coverage isn't the goal. Test behavior, not implementation details.

### ❌ Slow Tests
Tests should run in milliseconds. Slow tests don't get run.

### ❌ Coupled Tests
Tests shouldn't depend on each other or external state. Each test should be isolated.

---

*Skill version: 1.0*
*Compatible with: ACT v2.5+*
