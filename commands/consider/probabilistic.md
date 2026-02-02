# /consider:probabilistic

Think in odds and probabilities rather than certainties.

## Usage

```
/consider:probabilistic [decision or prediction]
```

## Description

Probabilistic Thinking means reasoning in terms of likelihood rather than certainty. Instead of "X will happen" or "X won't happen," think "X has a 70% chance." This leads to better decisions under uncertainty and more accurate beliefs.

Use when:
- Decisions involving uncertainty (most decisions)
- Risk assessment
- Forecasting outcomes
- Updating beliefs with new evidence

## Process

1. **Identify outcomes** — What are the possibilities?
2. **Assign probabilities** — Estimate each outcome's likelihood
3. **Calculate expected value** — EV = Σ(Probability × Value)
4. **Update with evidence** — Adjust probabilities as you learn
5. **Decide** — Choose best expected value (within risk tolerance)

## Example

```
/consider:probabilistic "Will we hit the launch deadline?"

BINARY (bad): "Yes" or "No"

PROBABILISTIC (better):
| Scenario | Probability | Impact |
|----------|-------------|--------|
| On time, full scope | 20% | Best |
| On time, reduced scope | 40% | Acceptable |
| 2 weeks late | 30% | Manageable |
| >1 month late | 10% | Problematic |

INSIGHT:
- Only 20% chance of ideal outcome
- 60% chance of "acceptable or better"
- 40% chance of some delay

DECISION:
Plan for reduced scope. Prepare stakeholders for possible delay.
```

## Bayesian Updating

When evidence arrives, update probabilities:
- **Prior:** 30% chance candidate has skill X
- **Evidence:** They aced technical test
- **Posterior:** ~70% chance they have skill X

## The 70% Rule (for reversible decisions)

If you're 70% confident and the decision is reversible, proceed. Waiting for 90% wastes time.

## Related

- **Full skill:** [skills/thinking/models/10-probabilistic.md](../../skills/thinking/models/10-probabilistic.md)
- **Combines well with:** `/consider:map-territory`, `/consider:pre-mortem`
