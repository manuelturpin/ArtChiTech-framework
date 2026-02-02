# /consider:inversion

Approach a problem backwards: instead of asking "how to succeed," ask "how to guarantee failure," then avoid those things.

## Usage

```
/consider:inversion [goal]
```

## Description

Inversion flips the problem. It's often easier to identify what causes failure than what ensures success. By listing failure modes and avoiding them, you create a robust plan.

Use when:
- Stuck on a problem
- Risk management and planning
- Designing robust systems
- Writing requirements (what must NOT happen)

## Process

1. **State the goal** — What are you trying to achieve?
2. **Invert the question** — "What would guarantee failure?"
3. **List failure modes** — Brainstorm everything that ensures failure
4. **Invert back** — Turn each into something to avoid
5. **Design against failure** — Build plan around NOT doing those things

## Example

```
/consider:inversion "Make this project successful"

INVERTED: How would I guarantee this project fails?

FAILURE MODES:
- Unclear requirements
- No communication with stakeholders
- No milestones or deadlines
- Single point of failure
- Scope creep without pushback
- No testing
- Ignore feedback

INVERTED PLAN:
✅ Crystal clear requirements (written, approved)
✅ Weekly stakeholder updates
✅ Milestones every 2 weeks
✅ Knowledge shared across team
✅ Formal change process for scope
✅ Comprehensive testing
✅ Feedback loops built in
```

## Caution

- Inversion finds safe paths, not innovative ones
- Avoiding failure ≠ maximizing success
- Use alongside forward-thinking models

## Related

- **Full skill:** [skills/thinking/models/04-inversion.md](../../skills/thinking/models/04-inversion.md)
- **Combines well with:** `/consider:pre-mortem`, `/consider:first-principles`
