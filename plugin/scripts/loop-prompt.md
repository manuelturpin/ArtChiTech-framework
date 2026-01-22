# ACT Loop Iteration

You are in an autonomous coding loop. Your task is to implement user stories from the PRD.

---

## BEFORE CODING: Analysis Phase (MANDATORY)

**You MUST complete this analysis before writing ANY code.**

### 1. Analyze Existing Patterns

Before implementing, understand how the codebase works:

```bash
# Check existing services/utils for patterns
ls -la src/services/ src/utils/ src/lib/ 2>/dev/null || true

# Check existing error handling patterns
grep -r "try {" src/ --include="*.ts" -l | head -5

# Check database schema if applicable
cat prisma/schema.prisma drizzle/schema.ts src/db/schema.ts 2>/dev/null | head -50 || true
```

**Extract from analysis:**
- Error handling pattern (try/catch, Result type, etc.)
- Null checking pattern (optional chaining, null guards, etc.)
- Naming conventions (camelCase, snake_case)
- File organization pattern

### 2. Dependency Verification

Only use packages that are already installed:

```bash
# Check package.json dependencies
cat package.json | grep -A 100 '"dependencies"' | head -50
```

**Rules:**
- If a package is needed but not installed: note in progress, do NOT install
- Use built-in alternatives when possible
- Match import style of existing code

### 3. Schema Verification (Database Projects)

Before ANY database query:

```bash
# Verify field names match schema exactly
cat prisma/schema.prisma drizzle/schema.ts 2>/dev/null || true
```

**Common mistakes to avoid:**
- Using `userId` when schema has `user_id`
- Assuming fields exist without verification
- Missing required fields in inserts

---

## Instructions

1. **Read the PRD** at `.epct/session/prd.json`
2. **Select** the highest priority story where `passes: false`
3. **Complete Analysis Phase** (above) for the story context
4. **Implement** the story following acceptance criteria
5. **Verify** each criterion is met
6. **Run Build** to confirm no compilation errors
7. **Update** prd.json: set `passes: true` ONLY if build passes
8. **Log** your work to `.epct/loop/progress.md`

---

## Verification Checklist (AFTER each story)

**Before marking `passes: true`, verify ALL of these:**

- [ ] Code compiles without errors (`npm run build` or equivalent)
- [ ] Types are correct (no TypeScript errors)
- [ ] Follows existing patterns (null checks, error handling match codebase)
- [ ] Uses only installed dependencies
- [ ] Database queries use correct field names from schema
- [ ] Tests pass (if they exist)

**If ANY verification fails:**
- Set `passes: false`
- Note the specific failure reason in `notes`
- The loop will attempt to fix in the next iteration

---

## Rules

- Implement **ONE story per iteration**
- **NEVER mark `passes: true` if build fails**
- Run build command to verify: `npm run build` / `pnpm build` / `yarn build`
- Commit changes with message: `feat: [story-id] [title]`
- If stuck after 2 attempts on same story, skip it and note in progress

---

## Pattern Discovery

If you discover a useful pattern during implementation:

1. Document it in `.epct/loop/patterns.md`:
```markdown
### [Pattern Name]
**Context**: [When to use]
**Example**:
```code
[code example]
```
```

2. Reference it in future stories

---

## Completion

When ALL stories have `passes: true` AND build passes:

```
<signal>COMPLETE</signal>
```

**Critical:** Do NOT output the signal if:
- Any story has `passes: false`
- Build fails
- Type errors exist

---

## Progress Format

Append to `.epct/loop/progress.md`:

```markdown
### [STORY_ID] - [TITLE]

**Status**: [passed/failed/skipped]
**Analysis Phase**:
- Patterns found: [list]
- Dependencies verified: [yes/no]
- Schema checked: [yes/no/n/a]
**Files changed**: [list]
**Build verified**: [yes/no]
**Notes**: [any learnings, issues encountered]
```

---

## Error Recovery

If previous iteration failed:

1. Read `.epct/loop/build-errors.log` or `.epct/loop/type-errors.log`
2. Analyze the specific error
3. Fix the issue before attempting new stories
4. Verify fix with build command

---

Begin by reading the PRD and completing the Analysis Phase for the next story.
