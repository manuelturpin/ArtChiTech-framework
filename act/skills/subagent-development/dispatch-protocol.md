# Dispatch Protocol

> How the controller dispatches tasks to subagents.

## The Dispatch Cycle

```
Controller                    Subagent
    |                            |
    |-- 1. Curate context ------>|
    |-- 2. Select template ----->|
    |-- 3. Dispatch ------------>|
    |                            |-- 4. Execute
    |                            |-- 5. Self-review
    |                            |-- 6. Commit
    |<-- 7. Return status -------|
    |-- 8. Evaluate result       |
    +-- 9. Next action           |
```

## Step-by-Step

### 1. Select the Right Template

| Task Type | Template | Model |
|-----------|----------|-------|
| Implementation | `implementer-dispatch.md` | Sonnet |
| Spec Review | `spec-reviewer-dispatch.md` | Opus |
| Quality Review | `quality-reviewer-dispatch.md` | Opus |
| Plan Review | `plan-reviewer-dispatch.md` | Opus |
| Testing | `tester-dispatch.md` | Sonnet |

### 2. Curate Context

See [Context Curation](context-curation.md) for full details.

**Key rule:** Less is more. Only include files directly relevant to the task.

### 3. Fill the Template

Replace all `{{PLACEHOLDERS}}` with actual values:
- Task description and acceptance criteria
- File paths to read
- Architecture notes
- Project conventions

### 4. Dispatch

Use the Agent tool with appropriate model:

```
Agent(
  model: "sonnet",  // or "opus" for reviewers
  prompt: [filled template],
  isolation: "worktree"  // optional
)
```

### 5. Evaluate the Result

Check the returned status code and act accordingly:

| Status | Controller Action |
|--------|-------------------|
| DONE | Proceed to review |
| DONE_WITH_CONCERNS | Review concerns, decide if re-dispatch needed |
| NEEDS_CONTEXT | Provide missing info, re-dispatch |
| BLOCKED | Assess blocker, may need Deviation Rule 4 |

### 6. Track Progress

Log each dispatch in `.act/progress.md`:

```markdown
### [HH:MM] Subagent Dispatch
- **Task:** Task description
- **Agent:** implementer / reviewer
- **Status:** DONE / BLOCKED / etc.
- **Files:** list of modified files
```

## Dispatch Rules

1. **One task per dispatch** — Never bundle multiple tasks
2. **Include acceptance criteria** — Subagent must know when they're done
3. **Specify scope boundaries** — What files are off-limits
4. **Set Iron Laws expectation** — TDD, debugging, verification
5. **Request atomic commit** — One commit per task

## Anti-Patterns

| Anti-Pattern | Problem | Fix |
|-------------|---------|-----|
| Dump all files as context | Pollutes subagent's focus | Curate to relevant files only |
| Vague task description | Subagent guesses wrong | Specific acceptance criteria |
| No scope boundaries | Subagent modifies unrelated code | Explicit file scope |
| Skip review after dispatch | Quality not verified | Always review |
| Re-dispatch without new info | Same failure repeats | Add context or change approach |

---

*ACT v3.5 — Dispatch Protocol*
