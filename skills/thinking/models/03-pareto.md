# Pareto Principle (80/20)

> **"For many outcomes, roughly 80% of consequences come from 20% of causes."** — Vilfredo Pareto

## What Is It?

The Pareto Principle states that roughly 80% of effects come from 20% of causes. In practice: a small number of inputs drive the majority of outputs. Use this to focus on what matters most.

## When to Use

- Prioritizing features or tasks
- Debugging (which bugs cause most problems?)
- Customer analysis (who are your best customers?)
- Time management (which activities create most value?)
- Code optimization (which code paths are hottest?)
- Any situation with limited resources

## When NOT to Use

- When completeness is required (compliance, safety)
- When the 20% hasn't been identified yet
- When all items are roughly equal in impact

---

## Process

### Step 1: List All Items
Enumerate everything: features, bugs, customers, tasks, etc.

### Step 2: Measure Impact
For each item, quantify its contribution to the outcome.

### Step 3: Rank by Impact
Sort from highest to lowest impact.

### Step 4: Find the Vital Few
Identify the ~20% that accounts for ~80% of impact.

### Step 5: Focus Ruthlessly
Allocate disproportionate resources to the vital few.

---

## Example: Feature Prioritization

### Context
Product team has 20 feature requests.

### Pareto Analysis

| Feature | Usage Impact | Revenue Impact | Effort |
|---------|--------------|----------------|--------|
| Dark mode | 5% | 0% | Medium |
| Export to PDF | 60% | 40% | Low |
| API access | 30% | 50% | High |
| Custom themes | 2% | 0% | Medium |
| Mobile app | 70% | 45% | Very High |
| ... | ... | ... | ... |

**Vital Few (20% of features):**
- Export to PDF (60% usage, low effort)
- API access (50% revenue potential)
- Mobile app (70% usage)
- Search improvements (requested by 80% of churned users)

**Decision:** Focus 80% of engineering on these 4 features.

---

## Example: Bug Triage

### Context
100 bugs in backlog, can fix 20 this sprint.

### Pareto Analysis

```
Bug severity distribution:
- 5 bugs cause 90% of crashes
- 12 bugs affect 80% of users
- 15 bugs relate to payment (highest value flow)

Overlap: 8 bugs appear in multiple categories
```

**Vital Few:** These 8 bugs
- Fix them first = dramatic improvement in stability + user experience

---

## Example: Customer Success

### Context
SaaS company with 1000 customers, limited support capacity.

### Pareto Analysis

```
Revenue distribution:
- Top 50 customers = 70% of revenue
- Top 200 customers = 90% of revenue

Support cost distribution:
- Bottom 200 customers = 60% of support tickets
- Many are on free/cheap plans
```

**Insight:** 
- Dedicated support for top 50 (high-touch)
- Self-service for bottom 200 (scale)
- Consider if bottom 200 are worth keeping

---

## Example: Code Performance

### Context
Application is slow, need to optimize.

### Pareto Analysis

```
Profiler results:
- database_query() = 45% of time
- json_serialize() = 25% of time
- image_resize() = 15% of time
- All other functions = 15% of time
```

**Vital Few:**
- database_query() and json_serialize() = 70% of time
- Optimize these two = dramatic speedup
- Ignore the rest until these are fixed

---

## Template

Use this when applying Pareto:

```markdown
## Context
[What are you trying to prioritize/optimize?]

## Full List
| Item | Impact Metric | Value |
|------|---------------|-------|
| [A] | [metric] | [value] |
| [B] | [metric] | [value] |
| ... | ... | ... |

## Ranked by Impact
1. [Highest impact item]
2. [Second highest]
3. [Third highest]
4. ...

## Vital Few (Top 20%)
- [Item 1] — [% of total impact]
- [Item 2] — [% of total impact]
- [Item 3] — [% of total impact]

Combined impact: [X]% of total

## Action Plan
Focus [X]% of resources on the vital few.

## What to Deprioritize
- [Item that seems important but isn't]
- [Item with low impact despite effort]
```

---

## Variations of 80/20

The ratio isn't always exactly 80/20:

| Ratio | Example |
|-------|---------|
| 90/10 | 10% of bugs cause 90% of crashes |
| 70/30 | 30% of content gets 70% of traffic |
| 99/1 | 1% of users create 99% of abuse reports |

The principle is: **distribution is unequal**. Find the vital few.

---

## Common Pitfalls

1. **Ignoring the 80%** — Sometimes long tail matters (compliance, completeness)
2. **Static analysis** — The vital few change over time; re-analyze regularly
3. **Survivorship bias** — You see the 20% that succeeded; failures are invisible
4. **False precision** — Don't obsess over exact percentages
5. **Neglecting quality** — "80% good enough" isn't always acceptable

---

## Related Models

- **Opportunity Cost** — What you give up by not doing the 80%
- **Reversibility** — Deprioritize low-impact reversible items
- **First Principles** — Why do we think these items matter?

---

## References

- Vilfredo Pareto (original observation, 1896)
- "The 80/20 Principle" by Richard Koch
- "Essentialism" by Greg McKeown
