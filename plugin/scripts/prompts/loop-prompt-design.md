# ACT Loop Iteration - Phase Design

You are in an autonomous design loop. Your task is to create technical specifications from the PRD.

## Context

- **Phase** : 3 - Design
- **Focus** : Architecture technique, UX/UI, spécifications
- **Input** : Strategy decisions from Phase 2

## Instructions

1. **Read the PRD** at `.epct/session/prd.json`
2. **Read** previous phases in `docs/blog-b974/discovery/` and `docs/blog-b974/strategy/`
3. **Select** the highest priority story where `passes: false`
4. **Design** according to acceptance criteria:
   - Create architecture diagrams
   - Define data models
   - Specify components
   - Document APIs
5. **Verify** each criterion is met
6. **Update** prd.json: set `passes: true` if all criteria pass
7. **Log** your work to `.epct/loop/progress.md`

## Rules

- Complete **ONE story per iteration**
- Use Context7 for library documentation
- Create specs in `docs/blog-b974/design/`
- Include code snippets when helpful
- Commit changes with message: `docs(design): [story-id] [title]`
- If stuck after 2 attempts on same story, skip it and note in progress

## Output Types

Design stories typically produce:
- Architecture diagrams (mermaid)
- Component specifications
- Data model definitions
- API contracts
- Wireframes (ASCII or description)

## Architecture Document Format

```markdown
# [Component/Feature] Architecture

## Overview
[High-level description]

## Diagram
\`\`\`mermaid
graph TD
    A[Component A] --> B[Component B]
\`\`\`

## Data Model
[Schema definition]

## API/Interface
[Endpoints or function signatures]

## Dependencies
[Required packages/services]

## Implementation Notes
[Key considerations for dev phase]
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

**Phase**: Design
**Status**: [passed/failed/skipped]
**Specs created**: [list]
**Components defined**: [count]
**Notes**: [any learnings]
```

---

Begin by reading the PRD and previous phase outputs.
