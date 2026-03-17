# Skill: Code Review

> **"Fresh eyes catch what tired ones miss."**

## Purpose

Systematically review code for correctness, maintainability, security, and performance. A good code review is a learning opportunity for everyone involved.

---

## When to Use

### Always Review

| Situation | Why |
|-----------|-----|
| Before merging to main | Gate for quality |
| After major refactoring | Catch unintended changes |
| Security-sensitive code | Extra scrutiny needed |
| New contributor's code | Mentoring opportunity |
| Complex algorithms | More eyes = fewer bugs |

### Can Skip

| Situation | Why |
|-----------|-----|
| Typo fixes | Overhead > benefit |
| Auto-generated code | Machine knows best |
| Reverting a change | Already reviewed before |

---

## The Review Checklist

### 1. Correctness ✅

| Check | Question |
|-------|----------|
| Logic | Does it do what it's supposed to? |
| Edge cases | Are boundaries handled? |
| Error handling | Are failures graceful? |
| Tests | Do tests cover the changes? |
| Regressions | Did anything break? |

### 2. Readability 📖

| Check | Question |
|-------|----------|
| Naming | Are names clear and descriptive? |
| Comments | Is complex logic explained? |
| Structure | Is code organized logically? |
| Complexity | Can it be simplified? |
| Consistency | Does it match project style? |

### 3. Security 🔒

| Check | Question |
|-------|----------|
| Input validation | Is all input sanitized? |
| Authentication | Are auth checks in place? |
| Authorization | Are permissions verified? |
| Data exposure | Is sensitive data protected? |
| Dependencies | Are libraries trusted? |

### 4. Performance ⚡

| Check | Question |
|-------|----------|
| Algorithms | Is complexity acceptable? |
| Database | Are queries optimized? |
| Memory | Any leaks or bloat? |
| Caching | Is it used appropriately? |
| Scaling | Will it handle load? |

### 5. Maintainability 🔧

| Check | Question |
|-------|----------|
| DRY | Is there duplication? |
| SOLID | Are principles followed? |
| Coupling | Are dependencies minimal? |
| Testing | Is code testable? |
| Documentation | Is it documented? |

---

## Review Process

### Step 1: Understand Context

Before looking at code:
- Read the PR/commit description
- Understand the problem being solved
- Check linked issues or tickets

### Step 2: Big Picture First

- Does the approach make sense?
- Is the architecture appropriate?
- Are there better alternatives?

### Step 3: Line-by-Line Review

- Go through each file methodically
- Note concerns as you go
- Check both new code AND changes to existing code

### Step 4: Run the Code

- Pull the branch locally if possible
- Test the happy path
- Try to break it

### Step 5: Provide Feedback

- Be specific and constructive
- Explain the "why" not just the "what"
- Suggest solutions, not just problems

---

## Feedback Guidelines

### How to Give Feedback

| Do ✅ | Don't ❌ |
|------|---------|
| "Consider using X because Y" | "This is wrong" |
| "What about edge case Z?" | "Did you even test this?" |
| "Nice approach here!" | Only negative feedback |
| Ask clarifying questions | Assume bad intent |
| Focus on the code | Attack the person |

### Comment Types

Mark comments clearly:

```markdown
[MUST] This needs to change before merge
[SHOULD] Strong recommendation, but not blocking
[COULD] Optional improvement suggestion
[QUESTION] Need clarification to understand
[PRAISE] This is done well, highlighting good patterns
```

### Example Feedback

```markdown
[MUST] SQL Injection Risk
The user input is concatenated directly into the query.
Use parameterized queries instead:
```python
# Instead of:
cursor.execute(f"SELECT * FROM users WHERE id = {user_id}")

# Use:
cursor.execute("SELECT * FROM users WHERE id = ?", [user_id])
```

[SHOULD] Consider Error Handling
If `fetch_data()` fails, this will crash. Consider:
```python
try:
    data = fetch_data()
except FetchError as e:
    logger.error(f"Failed to fetch: {e}")
    return default_value
```

[PRAISE] Nice use of the factory pattern here!
This makes the code much more extensible.
```

---

## Self-Review Checklist

Before requesting review:

```markdown
## Pre-Review Self-Check

- [ ] Code compiles/runs without errors
- [ ] All tests pass
- [ ] I've tested manually
- [ ] No debugging code left (console.log, print)
- [ ] No commented-out code
- [ ] No hardcoded secrets/credentials
- [ ] PR description explains the change
- [ ] Commit messages are clear
```

---

## Review Modes

### Quick Review (~5 min)
- Skim for obvious issues
- Check structure and naming
- Verify tests exist
- Good for: Small changes, trusted contributors

### Standard Review (~15-30 min)
- Full checklist
- Run the code locally
- Write detailed feedback
- Good for: Most PRs

### Deep Review (~1+ hour)
- Security audit
- Performance analysis
- Architecture review
- Good for: Critical systems, major changes

---

## Commands

| Command | Description |
|---------|-------------|
| `/review [file/PR]` | Full code review |
| `/review:quick [file/PR]` | Quick scan for issues |
| `/review:security [file/PR]` | Security-focused review |
| `/review:perf [file/PR]` | Performance-focused review |

---

## Common Issues to Watch For

### Security Red Flags 🚨

- Hardcoded credentials
- SQL string concatenation
- Unsanitized user input
- Missing authentication checks
- Exposed internal errors to users

### Performance Red Flags 🐌

- N+1 queries
- Unbounded loops
- Missing pagination
- Synchronous operations that should be async
- Loading entire datasets into memory

### Maintainability Red Flags 🔧

- Functions > 50 lines
- Deep nesting (> 3 levels)
- Magic numbers/strings
- Copy-pasted code
- No error messages

---

*Skill version: 1.0*
*Compatible with: ACT v2.5+*
