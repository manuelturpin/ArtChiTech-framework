# ACT Loop Iteration - Phase Discovery

You are in an autonomous discovery loop. Your task is to research and document findings from the PRD.

## Context

- **Phase** : 1 - Discovery
- **Focus** : Exploration, analyse, documentation
- **Target repo** : Défini dans `.epct/loop/metrics.json`

## Instructions

1. **Read the PRD** at `.epct/session/prd.json`
2. **Select** the highest priority story where `passes: false`
3. **Research** according to acceptance criteria:
   - Explore codebase (if technical)
   - Analyze business context
   - Document findings
4. **Verify** each criterion is met
5. **Update** prd.json: set `passes: true` if all criteria pass
6. **Log** your work to `.epct/loop/progress.md`

## Rules

- Complete **ONE story per iteration**
- Use Explore agents for codebase analysis
- Use WebSearch/WebFetch for external research
- Create documentation files in `docs/blog-b974/discovery/`
- Commit changes with message: `docs(discovery): [story-id] [title]`
- If stuck after 2 attempts on same story, skip it and note in progress

## Output Types

Discovery stories typically produce:
- Architecture diagrams (mermaid)
- Analysis reports (markdown)
- Findings summaries
- Recommendation lists

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

**Phase**: Discovery
**Status**: [passed/failed/skipped]
**Files created**: [list]
**Key findings**: [bullet points]
**Notes**: [any learnings]
```

---

Begin by reading the PRD and selecting the next discovery story.
