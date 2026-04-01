# Reversibility (One-Way vs Two-Way Doors)

> **"Some decisions are consequential and irreversible or nearly irreversible – one-way doors – and these decisions must be made methodically, carefully, slowly, with great deliberation and consultation... But most decisions aren't like that – they are changeable, reversible – they're two-way doors."** — Jeff Bezos

## What Is It?

The Reversibility mental model distinguishes between one-way doors (irreversible decisions) and two-way doors (reversible decisions). This distinction changes how much time and caution you should apply: move fast on reversible decisions, slow on irreversible ones.

## When to Use

- Any significant decision
- Resource allocation
- Hiring and org structure
- Architecture choices
- Business commitments
- Personal life decisions

## When NOT to Use

- Trivial decisions (they're all two-way doors)
- Emergencies (no time for deliberation)

---

## Process

### Step 1: Identify the Decision
What choice are you making?

### Step 2: Classify the Door
Is this one-way or two-way?

### Step 3: Calibrate Response
- **One-way:** Deliberate carefully, seek input, consider alternatives
- **Two-way:** Decide quickly, execute, adjust based on results

### Step 4: Look for Ways to Make It Reversible
Can you convert a one-way door into a two-way?

### Step 5: Execute Appropriately
Match speed and caution to the door type.

---

## One-Way Doors (Irreversible)

### Characteristics
- Cannot be undone (or very costly to undo)
- Commits significant resources
- Burns bridges
- Creates dependencies
- Has long-term consequences

### Examples
- Selling a business
- Public announcements
- Legal contracts
- Major layoffs
- Architectural foundations
- Choosing a life partner
- Having children

### Approach
- Take time to deliberate
- Gather extensive data
- Seek diverse opinions
- Consider edge cases
- Use pre-mortem
- Sleep on it (literally)

---

## Two-Way Doors (Reversible)

### Characteristics
- Can be undone with minimal cost
- Allows iteration
- Generates learning
- Low switching cost
- Short-term commitment

### Examples
- A/B tests
- Feature flags
- Most hires (probation exists)
- Pricing experiments
- Process changes
- Tool choices
- Most code changes

### Approach
- Decide quickly
- Execute and learn
- Adjust based on results
- Don't over-deliberate
- Bias toward action

---

## Example: Technology Choice

### Decision
"Should we use Database X or Database Y?"

### Analysis

**Factors that make it one-way:**
- Data migration is painful
- Code is tightly coupled to database
- Team learns database deeply
- Costs if it fails are high

**Factors that make it two-way:**
- We can abstract the database layer
- We're early stage, little data
- Both databases have similar interfaces
- We can migrate if needed

**Classification:** More one-way than two-way

**Approach:**
- Do a proper evaluation
- Prototype with both
- Check long-term scalability
- Talk to companies who've scaled each
- Make a deliberate choice

**Making it more reversible:**
- Use abstraction layer (repository pattern)
- Keep data model simple initially
- Document migration path

---

## Example: Pricing Change

### Decision
"Should we raise prices 20%?"

### Analysis

**One-way aspects:**
- Existing customers may churn
- Market perception changes
- Competitors may respond

**Two-way aspects:**
- Can offer discounts/grandfathering
- Can revert if metrics tank
- Can A/B test on new customers first

**Classification:** Mostly two-way (with proper rollout)

**Approach:**
- Test with subset of new customers
- Monitor key metrics (conversion, churn)
- Adjust or revert based on data
- Don't over-deliberate

**Making it more reversible:**
- Grandfather existing customers
- Run as experiment first
- Set clear revert criteria

---

## Example: Hiring

### Decision
"Should we hire this person?"

### Analysis

**One-way aspects:**
- Bad hire is costly (time, money, morale)
- Knowledge loss if they leave
- Team dynamics affected

**Two-way aspects:**
- Probation period exists
- Can let go if it doesn't work
- Trial period possible

**Classification:** More two-way than people think

**Common mistake:** Treating hiring as purely one-way leads to:
- Analysis paralysis
- Endless interview rounds
- Great candidates lost to faster companies

**Approach:**
- Hire faster than feels comfortable
- Invest in onboarding
- Use probation period meaningfully
- Fire fast if clear mismatch

---

## Example: Public Announcement

### Decision
"Should we announce this partnership?"

### Analysis

**One-way aspects:**
- Once public, can't unpublish
- Reputation at stake
- Partner expectations set
- Competitor response triggered

**Two-way aspects:**
- Can announce quietly (soft launch)
- Can frame as "exploring" rather than "committed"
- Can have exit clauses in partnership

**Classification:** Mostly one-way

**Approach:**
- Review announcement carefully
- Legal review of claims
- Partner sign-off
- Crisis communication plan ready
- Sleep on it before publishing

---

## Converting One-Way to Two-Way

Many decisions that seem irreversible can be made more reversible:

| Seemingly One-Way | How to Make Two-Way |
|-------------------|---------------------|
| Big rewrite | Feature flags, gradual rollout |
| New office | Short-term lease first |
| Major hire | Trial project, probation |
| Database migration | Abstract data layer, parallel run |
| Pricing change | A/B test, grandfather existing |
| New market | MVPreference, pilot program |
| Outsourcing | Start with one project |

### The Options Mindset
- Buy time before commitment
- Create escape hatches
- Run experiments before full rollout
- Use trial periods liberally

---

## Template

Use this when applying Reversibility:

```markdown
## Decision
[What choice are you facing?]

## Door Classification

### One-Way Indicators
- [ ] Cannot be undone
- [ ] High cost to reverse
- [ ] Burns bridges
- [ ] Long-term commitment
- [ ] Public/legal implications

### Two-Way Indicators
- [ ] Easily undone
- [ ] Low switching cost
- [ ] Generates learning
- [ ] Can iterate
- [ ] Internal/private

**Classification:** [One-way / Two-way / Mixed]

## If One-Way
- [ ] Have I gathered enough data?
- [ ] Have I sought diverse opinions?
- [ ] Have I considered alternatives?
- [ ] Have I done a pre-mortem?
- [ ] Am I okay with this being permanent?

## If Two-Way
- [ ] Am I overthinking this?
- [ ] What's the cost of delay?
- [ ] Can I just try it and learn?
- [ ] What metrics will tell me if it's wrong?

## Making It More Reversible
Can I convert this to a two-way door?
- [Idea 1]
- [Idea 2]

## Decision
[Choice] with [appropriate speed/deliberation]
```

---

## The 70% Rule

For two-way doors: if you're 70% confident, proceed.

**Why 70%?**
- Waiting for 90% confidence wastes time
- Learning from doing beats learning from thinking
- Speed has its own value

**Caution:** This rule is for two-way doors only. For one-way doors, you need more certainty.

---

## Common Pitfalls

1. **Treating two-way as one-way:** Over-deliberating reversible decisions
2. **Treating one-way as two-way:** Moving fast on irreversible choices
3. **Not looking for reversibility options:** Most decisions can be made more reversible
4. **Ignoring reputational costs:** Some reversals damage trust even if technically possible
5. **Analysis paralysis on everything:** Most decisions are two-way

---

## Related Models

- **Opportunity Cost:** Delay has a cost, especially for two-way doors
- **Pre-Mortem:** Essential for one-way doors
- **Regret Minimization:** One-way doors benefit from this framework

---

## References

- Jeff Bezos (Amazon concept of one-way/two-way doors)
- Amazon Leadership Principles ("Bias for Action")
- "Working Backwards" by Colin Bryar
