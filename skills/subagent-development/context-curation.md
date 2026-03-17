# Context Curation

> How to prepare the right context for a subagent. Less is more.

## The Problem

Subagents work best with focused, relevant context. Dumping everything into their prompt leads to:
- **Distraction** — Important details buried in noise
- **Token waste** — Context budget spent on irrelevant files
- **Confusion** — Contradictory or outdated information

## The Curation Process

### Step 1: Identify Required Files

For each task, determine:

| Category | Examples | Priority |
|----------|---------|----------|
| **Must Read** | Files to modify, direct dependencies | Always include |
| **Should Read** | Related interfaces, type definitions | Include if small |
| **Could Read** | Similar implementations, examples | Include only if needed |
| **Skip** | Unrelated code, historical files | Never include |

### Step 2: Estimate Token Budget

Rule of thumb:
- **Implementation task:** ~20K tokens of context max
- **Review task:** ~30K tokens (needs more code to review)
- **Testing task:** ~15K tokens (focused on test patterns)

### Step 3: Curate the Context Package

For each included file, ask:
1. Does the subagent need the FULL file or just a section?
2. Can I summarize instead of including verbatim?
3. Is this file stable or likely to change during execution?

### Step 4: Add Architecture Notes

Brief notes that aren't in the code:
- Design decisions made earlier
- Constraints from the PRD
- Conventions to follow
- Gotchas specific to this area

## Context Package Template

```markdown
## Context for Task: [Task Name]

### Files to Read (in order)
1. `src/types/user.ts` — User type definitions
2. `src/services/auth.ts` — Auth service (you'll modify this)
3. `tests/auth.test.ts` — Existing test patterns

### Architecture Notes
- We use JWT with RS256 (decision from ADR-003)
- All services are dependency-injected
- Error format: `{ code: string, message: string }`

### Conventions
- camelCase for variables/functions
- PascalCase for types/classes
- Tests co-located with source in `__tests__/`

### Out of Scope
- Do NOT modify `src/middleware/` (separate task)
- Do NOT add new dependencies
```

## Anti-Patterns

| Anti-Pattern | Problem | Fix |
|-------------|---------|-----|
| **Kitchen Sink** | Include every file "just in case" | Only files directly relevant |
| **No Architecture Notes** | Subagent reinvents decisions | Include key decisions |
| **Stale Context** | File changed since curation | Re-read before dispatch |
| **Missing Types** | Subagent invents type definitions | Always include type files |
| **No Conventions** | Inconsistent code style | Always include conventions |

## Curation Checklist

Before dispatching, verify:

- [ ] All files to modify are included
- [ ] Type definitions for modified files are included
- [ ] Architecture decisions relevant to task are noted
- [ ] Project conventions are specified
- [ ] Scope boundaries are clear (what NOT to touch)
- [ ] Token budget is reasonable (< 30K for most tasks)

---

*ACT v3.5 — Context Curation*
