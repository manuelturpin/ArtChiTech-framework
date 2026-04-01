# The 5 Whys

> **"If you don't ask the right questions, you don't get the right answers."** — Edward Hodnett

## What Is It?

The 5 Whys is an iterative interrogation technique used to explore cause-and-effect relationships underlying a problem. By asking "Why?" five times (or more), you drill down from symptoms to root cause.

## When to Use

- Bug investigation
- Production incidents
- Process failures
- Understanding customer complaints
- Any problem where symptoms are visible but cause is hidden

## When NOT to Use

- When you already know the root cause
- For complex multi-causal problems (use fishbone diagram instead)
- When the cause is obvious

---

## Process

### Step 1: State the Problem Clearly
Be specific. Not "things are broken" but "Login fails for users with 2FA enabled."

### Step 2: Ask "Why?" and Answer
Give a factual answer, not a guess.

### Step 3: Repeat 4 More Times
Each answer becomes the subject of the next "why?"

### Step 4: Identify Root Cause
When "why?" leads to a process, system, or human factor that can be addressed.

### Step 5: Implement Countermeasure
Fix the root cause, not the symptoms.

---

## Example: Software Bug

### Problem
"Users report that the app crashes on startup"

```
Why does the app crash on startup?
→ Because it throws a null pointer exception

Why does it throw a null pointer exception?
→ Because the config object is null

Why is the config object null?
→ Because the config file failed to load

Why did the config file fail to load?
→ Because the file path was hardcoded to Windows format

Why was the path hardcoded to Windows format?
→ Because we never tested on Mac/Linux

ROOT CAUSE: No cross-platform testing
COUNTERMEASURE: Add CI tests on all platforms
```

---

## Example: Production Incident

### Problem
"Website was down for 2 hours"

```
Why was the website down?
→ Database connections were exhausted

Why were connections exhausted?
→ A query was holding connections for 30+ seconds

Why was the query taking so long?
→ It was doing a full table scan on 10M rows

Why was it doing a full table scan?
→ The index was missing after a migration

Why was the index missing?
→ The migration script didn't include index creation

ROOT CAUSE: Migration process doesn't verify indexes
COUNTERMEASURE: Add index verification to migration checklist
```

---

## Example: Process Failure

### Problem
"Feature was deployed without tests"

```
Why was it deployed without tests?
→ Developer thought tests weren't needed

Why did they think tests weren't needed?
→ It was "just a small change"

Why is "small change" an exception?
→ We have no clear testing policy

Why don't we have a testing policy?
→ We've grown fast and never formalized it

Why haven't we formalized it?
→ No one owns the engineering process

ROOT CAUSE: No engineering process owner
COUNTERMEASURE: Assign process owner + create testing policy
```

---

## Template

Use this when applying 5 Whys:

```markdown
## Problem Statement
[Specific, measurable problem]

## 5 Whys Analysis

**Problem:** [Statement]

1. **Why?** → [Answer 1]
2. **Why?** → [Answer 2]
3. **Why?** → [Answer 3]
4. **Why?** → [Answer 4]
5. **Why?** → [Answer 5]

## Root Cause
[The underlying reason, typically systemic or process-related]

## Countermeasure
[Action that addresses root cause, not just symptoms]

## Verification
How will we know the fix worked?
- [ ] [Metric or test]
```

---

## Tips for Effective 5 Whys

### 1. Be Specific
❌ "Why did it break?" → Too vague
✅ "Why did the payment fail at 3:42 PM?" → Specific

### 2. Use Facts, Not Guesses
❌ "Probably because the server was overloaded"
✅ "Because CPU hit 100% (verified in metrics)"

### 3. Don't Stop at Blame
❌ "Because John made a mistake" → Not helpful
✅ "Because our process didn't catch the error" → Actionable

### 4. Sometimes It's More Than 5
5 is a guideline. Go until you hit a root cause you can fix.

### 5. Watch for Multiple Causes
If you find multiple valid answers to a "why", branch and explore both.

---

## Common Pitfalls

1. **Stopping too early** — Surface causes feel like root causes
2. **Blame game** — "Because John screwed up" isn't a root cause
3. **Speculation** — Answers must be factual and verifiable
4. **Single path** — Complex problems may have multiple root causes
5. **No action** — Finding root cause without countermeasure is pointless

---

## Related Models

- **First Principles** — Complementary depth technique
- **Pre-Mortem** — Preventive version of 5 Whys
- **Debugging Iron Law** — Mandates root cause investigation

---

## References

- Toyota Production System (Taiichi Ohno)
- "The Toyota Way" by Jeffrey Liker
- Lean Manufacturing principles
