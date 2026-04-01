# Inversion

> **"Invert, always invert."** — Carl Jacobi

## What Is It?

Inversion is the practice of approaching a problem backwards. Instead of asking "How do I achieve X?", ask "How would I guarantee failure at X?" Then avoid those things. It's often easier to identify what to avoid than what to pursue.

## When to Use

- When stuck on a problem
- Risk management and planning
- Designing robust systems
- Writing requirements (what must NOT happen)
- Self-improvement (what habits to eliminate)

## When NOT to Use

- When the positive path is already clear
- For simple, straightforward problems
- When you need creative solutions (inversion finds safe paths, not innovative ones)

---

## Process

### Step 1: State the Goal
What are you trying to achieve?

### Step 2: Invert the Question
Ask: "What would guarantee failure?"

### Step 3: List Failure Modes
Brainstorm everything that would ensure you fail.

### Step 4: Invert Back
Turn each failure mode into something to avoid.

### Step 5: Design Against Failure
Build your plan around NOT doing the failure modes.

---

## Example: Project Success

### Goal
"How do I make this project successful?"

### Inversion
"How would I guarantee this project fails?"

**Failure modes:**
- Unclear requirements
- No communication with stakeholders
- No milestones or deadlines
- Single point of failure (one person knows everything)
- Scope creep without pushback
- No testing
- Ignore feedback
- Ship without documentation

### Inverted Plan
✅ Crystal clear requirements (written, approved)
✅ Weekly stakeholder updates
✅ Milestones every 2 weeks
✅ Knowledge shared across team
✅ Formal change process for scope
✅ Comprehensive testing
✅ Feedback loops built in
✅ Documentation as we go

---

## Example: Investment

### Goal
"How do I build wealth?"

### Inversion
"How would I guarantee I stay poor?"

**Failure modes:**
- Spend more than I earn
- No emergency fund
- High-interest debt
- Invest in things I don't understand
- Try to time the market
- Panic sell during downturns
- No diversification
- Ignore taxes

### Inverted Plan
✅ Spend less than I earn
✅ 6-month emergency fund
✅ Pay off high-interest debt first
✅ Only invest in what I understand
✅ Buy and hold, don't time
✅ Stay the course during volatility
✅ Diversify across asset classes
✅ Tax-advantaged accounts

---

## Example: Software Architecture

### Goal
"How do I design a reliable system?"

### Inversion
"How would I guarantee the system fails?"

**Failure modes:**
- Single point of failure
- No monitoring or alerts
- No backups
- Tight coupling
- No error handling
- Hardcoded secrets
- No load testing
- No documentation

### Inverted Design
✅ Redundancy at every layer
✅ Comprehensive monitoring
✅ Automated backups with restore testing
✅ Loose coupling between services
✅ Graceful degradation
✅ Secrets in vault
✅ Load tested before launch
✅ Runbooks for all scenarios

---

## Example: Meeting Effectiveness

### Goal
"How do I run effective meetings?"

### Inversion
"How would I guarantee this meeting wastes everyone's time?"

**Failure modes:**
- No agenda
- Wrong people invited
- No decisions made
- Runs over time
- No follow-up actions
- Could have been an email

### Inverted Approach
✅ Agenda sent 24h in advance
✅ Only essential attendees
✅ Clear decisions required listed
✅ Hard stop, timeboxed
✅ Actions assigned with owners
✅ Cancel if not necessary

---

## Template

Use this when applying Inversion:

```markdown
## Goal
[What are you trying to achieve?]

## Inverted Question
"How would I guarantee failure at [goal]?"

## Failure Modes
1. [Way to fail #1]
2. [Way to fail #2]
3. [Way to fail #3]
4. [Way to fail #4]
5. [Way to fail #5]

## Inverted Actions (What to AVOID)
- ❌ [Don't do failure mode #1]
- ❌ [Don't do failure mode #2]
- ...

## Positive Actions (What to DO)
- ✅ [Opposite of failure #1]
- ✅ [Opposite of failure #2]
- ...

## Implementation
How will you build these safeguards into your plan?
```

---

## Advanced: Double Inversion

Sometimes useful to invert twice:

1. **Goal:** Make users happy
2. **Inversion 1:** What makes users unhappy? → Slow, buggy, confusing
3. **Inversion 2:** What prevents us from fixing those? → No metrics, no feedback, no testing
4. **Action:** Build metrics, feedback loops, and testing first

---

## Common Pitfalls

1. **Only thinking negatively** — Inversion finds safe paths, not innovative ones
2. **Ignoring upside** — Avoiding failure ≠ maximizing success
3. **Paralysis** — Too many things to avoid can freeze action
4. **Obvious answers** — "Don't fail" isn't actionable

---

## Related Models

- **Pre-Mortem** — Structured future-focused inversion
- **First Principles** — Complementary forward-thinking approach
- **5 Whys** — Find root causes of failures identified through inversion

---

## References

- Charlie Munger (popularized in investing)
- Carl Jacobi (mathematician, original quote)
- "Poor Charlie's Almanack"
