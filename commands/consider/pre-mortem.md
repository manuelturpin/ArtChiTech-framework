# /consider:pre-mortem

Imagine the project has already failed, then work backwards to identify why.

## Usage

```
/consider:pre-mortem [project or initiative]
```

## Description

A Pre-Mortem imagines future failure to prevent it. Unlike a post-mortem (after failure), a pre-mortem (before launch) lets you prevent failures rather than just analyze them. It legitimizes criticism and surfaces hidden risks.

Use when:
- Before launching a major project
- Before irreversible decisions
- When everyone agrees it'll work (groupthink warning)
- Before major releases or deployments

## Process

1. **Assume failure** — "It's 6 months from now. This failed spectacularly."
2. **Brainstorm causes** — "What went wrong? Why did it fail?"
3. **Prioritize risks** — Which are most likely? Most damaging?
4. **Develop mitigations** — How to prevent or detect each?
5. **Update plan** — Build mitigations in

## Example

```
/consider:pre-mortem "Product launch"

SETUP:
"It's 6 months from now. Our launch was a disaster."

WHAT WENT WRONG:
- Onboarding too complex, 80% dropped off
- Server couldn't handle traffic
- Critical bug in payment flow
- Marketing spent on wrong channels
- Support team overwhelmed

PRIORITIZED:
| Failure | Likelihood | Impact | Priority |
|---------|------------|--------|----------|
| Onboarding drop-off | High | High | P0 |
| Server capacity | Medium | Critical | P0 |
| Payment bug | Medium | High | P1 |

MITIGATIONS:
P0 - Onboarding: Usability tests, simplify to 3 steps
P0 - Capacity: Load test at 3x, auto-scaling ready
P1 - Payment: Dedicated QA, real card testing
```

## Why It Works

- **Permission to dissent** — Legitimizes criticism
- **Prospective hindsight** — Improves prediction accuracy ~30%
- **Reduces overconfidence** — Counters optimism bias

## Related

- **Full skill:** [skills/thinking/models/11-pre-mortem.md](../../skills/thinking/models/11-pre-mortem.md)
- **Combines well with:** `/consider:inversion`, `/consider:second-order`
