# Probabilistic Thinking

> **"The test of a first-rate intelligence is the ability to hold two opposing ideas in mind at the same time and still retain the ability to function."** — F. Scott Fitzgerald

## What Is It?

Probabilistic Thinking means reasoning in terms of likelihood rather than certainty. Instead of "X will happen" or "X won't happen," think "X has a 70% chance of happening." This leads to better decisions under uncertainty and more accurate beliefs.

## When to Use

- Any decision involving uncertainty (most decisions)
- Risk assessment
- Forecasting outcomes
- Evaluating claims and evidence
- Investment decisions
- Updating beliefs as new information arrives

## When NOT to Use

- When certainty is possible and cheap to obtain
- For simple, binary decisions with clear answers
- When probability itself is unknowable (true uncertainty)

---

## Process

### Step 1: Identify Outcomes
What are the possible outcomes?

### Step 2: Assign Probabilities
What's your best estimate of each outcome's likelihood?

### Step 3: Calculate Expected Value
EV = Σ(Probability × Value) for all outcomes

### Step 4: Update with Evidence
As new information arrives, update probabilities.

### Step 5: Make Decision
Choose the option with best expected value (or acceptable risk).

---

## Example: Project Planning

### Situation
"Will we hit the launch deadline?"

### Binary Thinking (Bad)
"Yes, we'll hit it." or "No, we won't."

### Probabilistic Thinking (Better)

**Outcomes:**
| Scenario | Probability | Impact |
|----------|-------------|--------|
| On time, full scope | 20% | Best case |
| On time, reduced scope | 40% | Acceptable |
| 2 weeks late | 30% | Manageable |
| >1 month late | 10% | Problematic |

**Insight:**
- Only 20% chance of ideal outcome
- 60% chance of "acceptable or better"
- 40% chance of some delay

**Decision:**
Plan for reduced scope. Prepare stakeholders for possible 2-week delay.

---

## Example: Investment Decision

### Situation
"Should I invest in this startup?"

### Probabilistic Analysis

**Outcomes:**
| Scenario | Probability | Return | EV |
|----------|-------------|--------|-----|
| Fails completely | 60% | -$10k | -$6k |
| Modest success | 25% | +$20k | +$5k |
| Big success | 14% | +$100k | +$14k |
| Unicorn | 1% | +$1M | +$10k |

**Expected Value:** -$6k + $5k + $14k + $10k = **+$23k**

**But also consider:**
- Can I afford to lose $10k? (downside risk)
- Is my probability estimate accurate? (calibration)
- What's my portfolio context? (diversification)

**Decision:** Invest, but size appropriately for the 60% failure probability.

---

## Example: Debugging

### Situation
"The app is crashing. What's the cause?"

### Probabilistic Diagnosis

**Hypotheses:**
| Cause | Prior Probability |
|-------|-------------------|
| Recent code change | 40% |
| Infrastructure issue | 25% |
| Data corruption | 20% |
| Third-party API | 10% |
| Unknown | 5% |

**Evidence gathered:** Crash started exactly at deploy time.

**Updated probabilities:**
| Cause | Posterior Probability |
|-------|----------------------|
| Recent code change | 75% |
| Infrastructure issue | 10% |
| Data corruption | 10% |
| Third-party API | 4% |
| Unknown | 1% |

**Decision:** Focus investigation on recent code change first.

---

## Example: Hiring

### Situation
"Should we extend an offer to this candidate?"

### Probabilistic Analysis

**Outcomes:**
| Scenario | Probability | Value |
|----------|-------------|-------|
| Star performer | 15% | +$500k/year |
| Good performer | 50% | +$150k/year |
| Mediocre | 25% | +$50k/year |
| Bad hire (let go) | 10% | -$100k (cost) |

**Expected Value:**
(0.15 × $500k) + (0.50 × $150k) + (0.25 × $50k) + (0.10 × -$100k)
= $75k + $75k + $12.5k - $10k = **+$152.5k/year**

**Decision:** Make the offer (positive EV). But also invest in onboarding to shift probability toward "good" and "star."

---

## Bayesian Updating

When new evidence arrives, update your probabilities:

```
P(Hypothesis | Evidence) = [P(Evidence | Hypothesis) × P(Hypothesis)] / P(Evidence)
```

### Simplified Process

1. **Start with prior:** Your initial probability estimate
2. **See evidence:** New information arrives
3. **Ask:** How likely is this evidence if hypothesis is true vs. false?
4. **Update:** Adjust probability accordingly

### Example

**Prior:** 30% chance candidate has skill X (based on resume)
**Evidence:** They aced a technical test on skill X
**Update:**
- If they have skill X, 90% chance they'd ace the test
- If they don't have skill X, 20% chance they'd ace by luck
- **Posterior:** ~70% chance they have skill X

---

## Calibration

Good probabilistic thinking requires calibration: when you say 70%, it should happen ~70% of the time.

### Testing Your Calibration

1. Make predictions with explicit probabilities
2. Track outcomes
3. Check: Do your 70% predictions come true ~70% of the time?

### Common Calibration Errors

- **Overconfidence:** 90% predictions come true only 60%
- **Underconfidence:** 50% predictions come true 80%
- **Binary thinking:** Only using 0%, 50%, 100%

---

## Template

Use this when applying Probabilistic Thinking:

```markdown
## Situation
[What are you trying to predict or decide?]

## Possible Outcomes
| Outcome | Probability | Value/Impact | EV |
|---------|-------------|--------------|-----|
| [O1] | [X]% | [+/- $Y] | [$] |
| [O2] | [X]% | [+/- $Y] | [$] |
| [O3] | [X]% | [+/- $Y] | [$] |
| [O4] | [X]% | [+/- $Y] | [$] |
| **Total** | 100% | | **[Total EV]** |

## Evidence Check
Does my probability estimate account for:
- [ ] Base rates (how often does this happen generally?)
- [ ] Inside view (specifics of this situation)
- [ ] My track record (am I usually over/underconfident?)

## Key Uncertainties
What could most change these probabilities?
- [Uncertainty 1]
- [Uncertainty 2]

## Decision
Given EV of [X] and risk tolerance of [Y], I will [action].

## Update Triggers
If [event] occurs, update [probability] to [new value].
```

---

## Expected Value vs. Risk Tolerance

High EV doesn't always mean "do it."

| EV | Variance | Decision |
|----|----------|----------|
| +$100, low variance | Go ahead |
| +$100, high variance | Depends on risk tolerance |
| +$1M, 99% chance of -$500k | Only if you can absorb the loss |

Factor in:
- **Risk tolerance:** Can you survive the downside?
- **Frequency:** One-time vs. repeated decisions
- **Reversibility:** Can you undo if wrong?

---

## Common Pitfalls

1. **False precision:** "37.5% chance" — you don't know that precisely
2. **Ignoring base rates:** Your situation isn't special; start with what usually happens
3. **Not updating:** New evidence should change probabilities
4. **Binary thinking:** "It'll either work or it won't" (not useful)
5. **Neglecting tail risks:** Low probability × catastrophic impact = significant risk

---

## Related Models

- **Map vs Territory** — Your probability estimates are maps of reality
- **Pre-Mortem** — What's the probability of each failure mode?
- **Reversibility** — High-uncertainty decisions need reversibility

---

## References

- Nate Silver's "The Signal and the Noise"
- Philip Tetlock's "Superforecasting"
- Bayes' Theorem (foundation of probabilistic updating)
