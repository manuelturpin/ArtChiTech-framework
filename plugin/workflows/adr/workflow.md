# ADR Workflow

> Architecture Decision Records capture significant technical decisions with context and consequences.

## When to Create an ADR

- Choosing between frameworks or libraries
- Defining data storage patterns
- Selecting communication protocols
- Making infrastructure decisions
- Changing established patterns
- Any Rule 4 deviation (architectural change)

## Process

### Step 1: Identify Decision
Recognize when an architectural decision is being made (often triggered by ACT Deviation Rule 4).

### Step 2: Gather Context
- What problem are we solving?
- What constraints exist?
- Who is affected?

### Step 3: Explore Alternatives
Use `/act:party` or `/consider:first-principles` to explore options systematically.

### Step 4: Document Decision
Fill in the ADR template with:
- Context (the "why")
- Decision (the "what")
- Consequences (the impact)
- Alternatives considered (what else was evaluated)

### Step 5: Store ADR
Save to `.act/architecture/ADR-{NUMBER}-{slug}.md`

### Step 6: Review
Have the `architect` agent review the ADR for completeness.

## Naming Convention

ADRs are numbered sequentially:
- `ADR-001-choose-database.md`
- `ADR-002-api-authentication.md`
- `ADR-003-monorepo-structure.md`

## Integration with ACT Phases

| Phase | ADR Role |
|-------|----------|
| Discovery | Problem context documentation |
| Strategy | High-level architectural decisions |
| Design | Detailed technical decisions |
| Development | Implementation-level decisions |

## ADR States

```
Proposed → Accepted → [Deprecated | Superseded]
```

- **Proposed**: Under discussion
- **Accepted**: Decision made and active
- **Deprecated**: No longer relevant
- **Superseded**: Replaced by a newer ADR

---
*ACT v3.0 - Architecture Decision Records*
