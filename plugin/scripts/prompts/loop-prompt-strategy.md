# ACT Loop Iteration - Phase Strategy

You are in an autonomous strategy loop. Your task is to define strategic decisions from the PRD.

## Context

- **Phase** : 2 - Strategy
- **Focus** : Décisions stratégiques, roadmap, positionnement
- **Input** : Discovery report from Phase 1

## Instructions

1. **Read the PRD** at `.epct/session/prd.json`
2. **Read** previous phase output in `docs/blog-b974/discovery/`
3. **Select** the highest priority story where `passes: false`
4. **Analyze** and decide according to acceptance criteria:
   - Compare options objectively
   - Justify decisions with data
   - Consider trade-offs
5. **Verify** each criterion is met
6. **Update** prd.json: set `passes: true` if all criteria pass
7. **Log** your work to `.epct/loop/progress.md`

## Rules

- Complete **ONE story per iteration**
- Use WebSearch for market/competitor research
- Create decision documents in `docs/blog-b974/strategy/`
- Include pros/cons for each option
- Commit changes with message: `docs(strategy): [story-id] [title]`
- If stuck after 2 attempts on same story, skip it and note in progress

## Output Types

Strategy stories typically produce:
- Decision records (ADR format)
- Comparison matrices
- Roadmap documents
- Business justifications

## Decision Record Format

```markdown
# ADR-XXX: [Decision Title]

## Status
Accepted

## Context
[Why this decision is needed]

## Options Considered
1. [Option A] - [Pros/Cons]
2. [Option B] - [Pros/Cons]
3. [Option C] - [Pros/Cons]

## Decision
[Chosen option and rationale]

## Consequences
[What this decision implies]
```

## Completion

When ALL stories have `passes: true`:

```
<signal>COMPLETE</signal>
```

If stories remain incomplete, do NOT output the signal.

## Progress Format

Append to `.epct/loop/progress.md`:

```markdown
### [STORY_ID] - [TITLE]

**Phase**: Strategy
**Status**: [passed/failed/skipped]
**Decision**: [summary]
**Files created**: [list]
**Notes**: [any learnings]
```

---

Begin by reading the PRD and previous discovery output.
