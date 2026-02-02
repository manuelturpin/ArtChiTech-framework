# /consider:pareto

Apply the 80/20 rule to identify the vital few items that drive most of the results.

## Usage

```
/consider:pareto [items or situation]
```

## Description

The Pareto Principle states that roughly 80% of effects come from 20% of causes. Use it to focus resources on what matters most, cutting through overwhelm to find high-impact actions.

Use when:
- Prioritizing features or tasks
- Debugging (which bugs cause most problems?)
- Resource allocation
- Time management
- Any situation with limited resources

## Process

1. **List all items** — Enumerate everything
2. **Measure impact** — Quantify each item's contribution
3. **Rank by impact** — Sort highest to lowest
4. **Find vital few** — Identify the ~20% causing ~80% of impact
5. **Focus ruthlessly** — Allocate resources to the vital few

## Example

```
/consider:pareto "20 feature requests"

ANALYSIS:
| Feature | Usage Impact | Revenue Impact |
|---------|--------------|----------------|
| Export PDF | 60% | 40% |
| API access | 30% | 50% |
| Mobile app | 70% | 45% |
| Dark mode | 5% | 0% |
| ... | ... | ... |

VITAL FEW (20%):
- Export PDF (60% usage, low effort)
- API access (50% revenue)
- Mobile app (70% usage)
- Search improvements (80% of churned users requested)

DECISION: Focus 80% of engineering on these 4 features
```

## Caution

- Don't completely ignore the 80% (compliance, safety)
- Re-analyze regularly — vital few change over time
- The ratio varies (90/10, 70/30, etc.)

## Related

- **Full skill:** [skills/thinking/models/03-pareto.md](../../skills/thinking/models/03-pareto.md)
- **Combines well with:** `/consider:opportunity-cost`, `/consider:reversibility`
