# Skill: Debugging

> **"The bug is never where you think it is."**

## Purpose

Systematically diagnose and fix bugs using proven techniques. Good debugging is a skill—it follows a process, not intuition.

---

## When to Use

| Situation | Why |
|-----------|-----|
| Unexpected behavior | Something's wrong |
| Test failures | Code doesn't match expectations |
| Production incidents | Users are affected |
| Performance issues | Slowness is a bug too |
| Integration problems | Systems not talking |

---

## The Debugging Process

```
┌──────────────────────────────────────────────────┐
│                                                  │
│  1. REPRODUCE  →  2. ISOLATE  →  3. IDENTIFY    │
│                                                  │
│       ↓              ↓              ↓           │
│                                                  │
│  4. FIX  →  5. VERIFY  →  6. PREVENT            │
│                                                  │
└──────────────────────────────────────────────────┘
```

---

## Step 1: Reproduce 🔄

**If you can't reproduce it, you can't fix it.**

### Questions to Answer

- What exactly is the bug? (Expected vs actual behavior)
- When does it happen? (Always, sometimes, specific conditions?)
- Who reported it? (User, test, monitoring?)
- What environment? (Production, staging, local?)

### Reproduction Checklist

```markdown
## Bug Reproduction

- [ ] I can reproduce the bug locally
- [ ] I have exact steps to trigger it
- [ ] I know the expected vs actual behavior
- [ ] I've documented the reproduction steps
```

### If You Can't Reproduce

- Check environment differences
- Look at logs from when it occurred
- Add logging and wait for it to happen again
- Interview the reporter for more details

---

## Step 2: Isolate 🔍

**Narrow down to the smallest failing case.**

### Binary Search Debugging

```
Full system failing
    ↓
Half the components → Still failing?
    ↓
Quarter of the components → Still failing?
    ↓
Keep halving until you find the culprit
```

### Isolation Techniques

| Technique | How | When |
|-----------|-----|------|
| Comment out code | Disable sections systematically | Simple bugs |
| Bisect (git) | Binary search through commits | Regression bugs |
| Minimal reproduction | Strip away everything unnecessary | Complex bugs |
| Mock dependencies | Replace external services | Integration bugs |
| Single input | Reduce data to simplest case | Data-related bugs |

### Git Bisect Example

```bash
git bisect start
git bisect bad                    # Current version is bad
git bisect good v1.2.0            # This version was good
# Git checks out middle commit
# Test it, then:
git bisect good                   # or git bisect bad
# Repeat until culprit found
git bisect reset                  # Return to original state
```

---

## Step 3: Identify 🎯

**Find the root cause, not just the symptom.**

### The 5 Whys

Keep asking "why" until you reach the root:

```
Bug: Users can't log in
Why? → Session tokens are invalid
Why? → Tokens expire immediately
Why? → Expiry time is set to 0
Why? → Config reads from wrong file
Why? → Deployment script points to dev config
ROOT CAUSE: Deployment configuration error
```

### Common Bug Categories

| Category | Symptoms | Typical Causes |
|----------|----------|----------------|
| Logic | Wrong output | Incorrect algorithm, off-by-one |
| State | Intermittent failures | Race conditions, stale data |
| Memory | Crashes, slowness | Leaks, buffer overflow |
| Integration | Connection failures | API changes, network issues |
| Data | Corruption, weird values | Invalid input, encoding |

### Debugging Tools

| Tool Type | Examples | Use For |
|-----------|----------|---------|
| Debugger | gdb, pdb, IDE debugger | Stepping through code |
| Logging | console.log, logger | Following execution flow |
| Profiler | cProfile, perf | Performance issues |
| Network | Wireshark, tcpdump | Connection issues |
| Memory | Valgrind, heapdump | Memory issues |

---

## Step 4: Fix 🔧

**Fix the root cause, not the symptom.**

### Before Fixing

```markdown
## Fix Planning

- [ ] I understand the root cause
- [ ] I know why the bug exists
- [ ] My fix addresses the root cause
- [ ] My fix won't introduce new bugs
- [ ] My fix is the simplest solution
```

### Fix Guidelines

| Do ✅ | Don't ❌ |
|------|---------|
| Fix the root cause | Patch the symptom |
| Keep changes minimal | Refactor everything |
| Add a test for the bug | Fix without tests |
| Document the fix | Leave future devs guessing |

---

## Step 5: Verify ✅

**Prove the bug is fixed AND nothing else broke.**

### Verification Checklist

```markdown
## Fix Verification

- [ ] Bug no longer reproduces
- [ ] All existing tests pass
- [ ] New test covers this bug
- [ ] No regressions introduced
- [ ] Fix works in all environments
```

### Write a Regression Test

```python
def test_session_tokens_have_correct_expiry():
    """
    Regression test for BUG-123
    Tokens were expiring immediately due to config issue.
    """
    token = create_session_token(user)
    assert token.expiry > datetime.now() + timedelta(hours=1)
```

---

## Step 6: Prevent 🛡️

**Make sure this bug class can't happen again.**

### Prevention Questions

- Could this have been caught earlier?
- Do we need better tests?
- Do we need better monitoring?
- Should we add validation?
- Is there a pattern here we keep hitting?

### Prevention Actions

| If This Was The Issue | Add This |
|-----------------------|----------|
| Invalid input | Input validation |
| Missing error handling | Try/catch + logging |
| Race condition | Locks or atomic operations |
| Config error | Config validation on startup |
| Undocumented behavior | Tests + documentation |

---

## Quick Debug Techniques

### Rubber Duck Debugging 🦆

Explain the problem out loud, step by step. Often you'll find the bug while explaining.

### Print Statement Debugging

When in doubt, print it out:

```python
def process_order(order):
    print(f"DEBUG: order received: {order}")
    result = validate(order)
    print(f"DEBUG: validation result: {result}")
    if result.valid:
        print(f"DEBUG: processing valid order")
        # ... more code
```

### Divide and Conquer

```python
# If this function is buggy...
def complex_function(x):
    a = step_one(x)
    b = step_two(a)
    c = step_three(b)
    return step_four(c)

# Check each step:
def complex_function(x):
    a = step_one(x)
    print(f"After step 1: {a}")  # Is this correct?
    
    b = step_two(a)
    print(f"After step 2: {b}")  # Is this correct?
    
    # ... and so on
```

---

## Commands

| Command | Description |
|---------|-------------|
| `/debug [issue]` | Start systematic debugging |
| `/debug:isolate` | Help narrow down the cause |
| `/debug:5whys` | Root cause analysis |
| `/debug:reproduce` | Document reproduction steps |

---

## Common Traps to Avoid

### ❌ Assuming You Know The Cause
Always verify. "I'm sure it's X" is usually wrong.

### ❌ Fixing Without Understanding
A fix you don't understand is a bug waiting to happen.

### ❌ Making Multiple Changes
Change one thing at a time. Otherwise you won't know what fixed it.

### ❌ Ignoring Intermittent Bugs
They'll come back. Usually in production. At 3 AM.

### ❌ Not Writing a Test
If you don't test for it, it WILL regress.

---

*Skill version: 1.0*
*Compatible with: ACT v2.5+*
