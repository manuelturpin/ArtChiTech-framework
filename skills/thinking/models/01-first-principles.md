# First Principles Thinking

> **"I think it's important to reason from first principles rather than by analogy."** — Elon Musk

## What Is It?

First Principles Thinking is the practice of breaking down complex problems into their most fundamental truths, then building up solutions from there. Instead of reasoning by analogy ("how do others do it?"), you reason from basics ("what is fundamentally true?").

## When to Use

- When conventional wisdom feels wrong
- When you need to innovate, not iterate
- When assumptions are limiting your options
- When facing "impossible" constraints
- When starting something entirely new

## When NOT to Use

- When best practices exist and work well
- When speed matters more than optimization
- When the problem is truly analogous to solved ones

---

## Process

### Step 1: Identify Assumptions
List everything you're assuming about the problem.

```
"We need to buy batteries for our electric cars"
Assumptions:
- Batteries must be bought
- Current battery prices are fixed
- Battery technology is settled
```

### Step 2: Break Down to Fundamentals
Ask: What do we know to be fundamentally true?

```
Fundamental truths:
- Batteries are made of raw materials (lithium, cobalt, etc.)
- Raw materials have market prices
- Manufacturing has a cost curve
- Physics determines energy density limits
```

### Step 3: Question Each Assumption

```
"Must batteries be bought?"
→ We could manufacture them
→ What are raw material costs? ~$80/kWh
→ Why do batteries cost $600/kWh?
→ Markup, inefficiency, middlemen
```

### Step 4: Rebuild from Fundamentals

```
If raw materials = $80/kWh
And we build our own factory optimized for scale...
We could make batteries at $130/kWh
```

---

## Example: Software Architecture

### Problem
"We need a microservices architecture because that's what big companies use."

### First Principles Analysis

**Assumptions:**
- Microservices are necessary for scale
- Monoliths don't scale
- Big companies know best

**Fundamental truths:**
- We need to handle X requests/second
- We need Y developers to work in parallel
- We need Z deployment frequency
- Network calls add latency
- Distributed systems add complexity

**Rebuild:**
- Our scale: 1000 req/s → Monolith handles this easily
- Our team: 5 developers → Can coordinate on monolith
- Our needs: Daily deploys → Modular monolith works

**Conclusion:** We don't need microservices. Modular monolith serves us better.

---

## Example: Product Feature

### Problem
"Users want more features in our app"

### First Principles Analysis

**Assumptions:**
- More features = more value
- Users know what they want
- Features solve user problems

**Fundamental truths:**
- Users want to accomplish a job
- Features are one way to help
- Complexity reduces usability
- Time on task matters

**Rebuild:**
- What job are users trying to do?
- Is adding features the best way?
- Could we simplify existing features instead?
- Would removing features help?

**Conclusion:** Users don't want features, they want outcomes. Focus on the core job.

---

## Template

Use this when applying First Principles:

```markdown
## Problem Statement
[What are you trying to solve?]

## Current Assumptions
1. [Assumption 1]
2. [Assumption 2]
3. [Assumption 3]

## Fundamental Truths
- [What do you know for certain?]
- [What are the physical/logical constraints?]
- [What are the actual requirements?]

## Question Each Assumption
| Assumption | Challenge | Still True? |
|------------|-----------|-------------|
| [A1] | [Why assume this?] | [Yes/No/Partially] |
| [A2] | [Why assume this?] | [Yes/No/Partially] |

## Rebuild from Fundamentals
Given only the fundamental truths, what solutions emerge?

1. [Option 1]
2. [Option 2]
3. [Option 3]

## Conclusion
[What's the best path forward?]
```

---

## Common Pitfalls

1. **Going too deep** — You don't need to derive physics from scratch
2. **Ignoring valid best practices** — Some "conventions" are wisdom
3. **Taking too long** — First principles is expensive; use strategically
4. **Hubris** — Experts exist for a reason; their knowledge isn't all "assumptions"

---

## Related Models

- **Inversion** — First principles + inversion = powerful combo
- **5 Whys** — Helps identify assumptions to challenge
- **Map vs Territory** — Reminds you your model may be wrong

---

## References

- Elon Musk on First Principles (various interviews)
- "The Great Mental Models" by Shane Parrish
- Aristotle's original concept of "first principles"
