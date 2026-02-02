# /consider:reversibility

Determine if this is a one-way door (irreversible) or two-way door (reversible), then calibrate your response.

## Usage

```
/consider:reversibility [decision]
```

## Description

The Reversibility model distinguishes between one-way doors (irreversible decisions) and two-way doors (reversible decisions). This changes how much time and caution to apply: move fast on reversible decisions, slow on irreversible ones.

Use when:
- Any significant decision
- Resource allocation
- Architecture choices
- Business commitments

## Process

1. **Identify the decision** — What choice are you making?
2. **Classify the door** — One-way or two-way?
3. **Calibrate response:**
   - **One-way:** Deliberate carefully, seek input, consider alternatives
   - **Two-way:** Decide quickly, execute, adjust based on results
4. **Look for reversibility** — Can you convert one-way to two-way?

## Example

```
/consider:reversibility "Choose Database X or Y"

ONE-WAY INDICATORS:
- Data migration is painful
- Code tightly coupled to database
- Team learns database deeply

TWO-WAY INDICATORS:
- Can abstract the database layer
- Early stage, little data
- Similar interfaces

CLASSIFICATION: More one-way than two-way

APPROACH:
- Do proper evaluation
- Prototype with both
- Check long-term scalability

MAKING MORE REVERSIBLE:
- Use abstraction layer (repository pattern)
- Keep data model simple initially
- Document migration path
```

## Quick Reference

| Door Type | Examples | Approach |
|-----------|----------|----------|
| One-way | Selling business, major layoffs, public announcements | Deliberate, seek input, sleep on it |
| Two-way | A/B tests, feature flags, pricing experiments | Decide fast, learn, iterate |

## The 70% Rule

For two-way doors: if you're 70% confident, proceed. Waiting for 90% wastes time. (Only for reversible decisions!)

## Related

- **Full skill:** [skills/thinking/models/12-reversibility.md](../../skills/thinking/models/12-reversibility.md)
- **Combines well with:** `/consider:opportunity-cost`, `/consider:regret-minimization`
