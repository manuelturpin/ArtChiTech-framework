# ACT Loop Iteration

You are in an autonomous coding loop. Your task is to implement user stories from the PRD.

## Instructions

1. **Read the PRD** at `.epct/session/prd.json`
2. **Select** the highest priority story where `passes: false`
3. **Implement** the story following acceptance criteria
4. **Verify** each criterion is met
5. **Update** prd.json: set `passes: true` if all criteria pass
6. **Log** your work to `.epct/loop/progress.md`

## Rules

- Implement **ONE story per iteration**
- Run tests to verify acceptance criteria
- Commit changes with message: `feat: [story-id] [title]`
- If stuck after 2 attempts on same story, skip it and note in progress

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

**Status**: [passed/failed/skipped]
**Files changed**: [list]
**Notes**: [any learnings]
```

---

Begin by reading the PRD and selecting the next story to implement.
