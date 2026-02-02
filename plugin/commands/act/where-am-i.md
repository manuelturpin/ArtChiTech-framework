# Command: /act:where-am-i

**Version:** 1.0.0  
**Category:** Session Management

---

## Usage

```
/act:where-am-i
```

## Description

Executes the 5-Question Reboot Test to quickly verify context is complete. Unlike `/act:resume` which provides a full catchup report, `/act:where-am-i` focuses solely on answering the 5 essential questions.

## When to Use

- **Quick context check** without full session recovery
- **After reading files** to verify understanding
- **Mid-session** to confirm you're on track
- **Before major decisions** to ensure context is accurate

## The 5 Questions

| # | Question | Source | What to Extract |
|---|----------|--------|-----------------|
| 1 | Where am I? | `.act/state.md` | Current phase, task, blockers |
| 2 | Where am I going? | `.act/plan.md` | Remaining phases, next steps |
| 3 | What's the goal? | `.act/config.yaml` | Project objective |
| 4 | What have I learned? | `.act/findings.md` | Key discoveries, decisions |
| 5 | What have I done? | `.act/progress.md` | Recent actions, commits |

## Behavior

### Step 1: Check .act/ Directory

```
If .act/ exists:
  → Proceed to read files
If .act/ does not exist:
  → Display "No ACT session found" message
```

### Step 2: Read Source Files

Read each file and extract relevant information:

1. **state.md** → Current phase, progress %, blockers
2. **plan.md** → Unchecked phases/tasks
3. **config.yaml** → Project name and goal
4. **findings.md** → Key discoveries (last 3-5)
5. **progress.md** → Recent actions (last 3-5)

### Step 3: Validate Each Answer

For each question, assign a status:

| Status | Condition |
|--------|-----------|
| ✅ | File exists and contains valid data |
| ⚠️ | File exists but empty or stale |
| ❌ | File not found |

### Step 4: Calculate Context Status

```
5/5 ✅ → ✅ Complete
3-4/5 → ⚠️ Partial
0-2/5 → ❌ Incomplete
```

### Step 5: Display Results

Output the formatted table with context status.

## Output Format

### Complete Context (5/5)

```markdown
## 🔄 5-Question Reboot Test

| # | Question | Answer | Status |
|---|----------|--------|--------|
| 1 | Where am I? | Phase 3/5 - Implementation | ✅ |
| 2 | Where am I going? | Testing, Verification | ✅ |
| 3 | What's the goal? | Build TaskFlow CLI | ✅ |
| 4 | What have I learned? | argparse > click, UUIDs | ✅ |
| 5 | What have I done? | CLI parser, add_task | ✅ |

**Context Status:** ✅ Complete (5/5)

Ready to continue work.
```

### Partial Context (3-4/5)

```markdown
## 🔄 5-Question Reboot Test

| # | Question | Answer | Status |
|---|----------|--------|--------|
| 1 | Where am I? | Phase 2/5 - Strategy | ✅ |
| 2 | Where am I going? | Design, Development, Quality | ✅ |
| 3 | What's the goal? | Build MyApp API | ✅ |
| 4 | What have I learned? | (no findings yet) | ⚠️ |
| 5 | What have I done? | Initial project setup | ✅ |

**Context Status:** ⚠️ Partial (4/5)

Can continue. Note: No findings recorded yet (normal for early phases).
```

### Incomplete Context (0-2/5)

```markdown
## 🔄 5-Question Reboot Test

| # | Question | Answer | Status |
|---|----------|--------|--------|
| 1 | Where am I? | state.md not found | ❌ |
| 2 | Where am I going? | plan.md not found | ❌ |
| 3 | What's the goal? | Build MyTool | ✅ |
| 4 | What have I learned? | findings.md not found | ❌ |
| 5 | What have I done? | progress.md not found | ❌ |

**Context Status:** ❌ Incomplete (1/5)

**Recommendation:** Run `/act:init --repair` to restore missing files.
```

### No Session Found

```markdown
## 🔄 5-Question Reboot Test

❌ No ACT session found.

The `.act/` directory does not exist in this project.

**Options:**
1. Run `/act:init` to initialize ACT
2. Verify you're in the correct project directory
```

## Quick Mode Output

For condensed display in Quick Mode:

```markdown
## 🔄 Context Check

✅ **5/5** | Phase 3/5 | Goal: TaskFlow CLI | Ready to continue
```

Or if issues detected:

```markdown
## 🔄 Context Check

⚠️ **4/5** | Phase 2/5 | Missing: findings.md | Can proceed
```

## Examples

### Example 1: Mid-Project Check

```
User: /act:where-am-i

## 🔄 5-Question Reboot Test

| # | Question | Answer | Status |
|---|----------|--------|--------|
| 1 | Where am I? | Phase 4/6 - Testing | ✅ |
| 2 | Where am I going? | Launch, Growth | ✅ |
| 3 | What's the goal? | ACT Framework v2.5 | ✅ |
| 4 | What have I learned? | Hooks > Skills for reliability | ✅ |
| 5 | What have I done? | Session Recovery, Hooks System | ✅ |

**Context Status:** ✅ Complete (5/5)

Ready to continue work.
```

### Example 2: New Project

```
User: /act:where-am-i

## 🔄 5-Question Reboot Test

| # | Question | Answer | Status |
|---|----------|--------|--------|
| 1 | Where am I? | Phase 1/5 - Discovery | ✅ |
| 2 | Where am I going? | Strategy, Design, Development, Quality | ✅ |
| 3 | What's the goal? | Build Note-Taking App | ✅ |
| 4 | What have I learned? | (no findings yet) | ⚠️ |
| 5 | What have I done? | Project initialized | ✅ |

**Context Status:** ⚠️ Partial (4/5)

Can continue. Empty findings is normal at Phase 1.
```

### Example 3: Corrupted Session

```
User: /act:where-am-i

## 🔄 5-Question Reboot Test

| # | Question | Answer | Status |
|---|----------|--------|--------|
| 1 | Where am I? | state.md corrupted | ❌ |
| 2 | Where am I going? | Testing, Launch | ✅ |
| 3 | What's the goal? | Build API Gateway | ✅ |
| 4 | What have I learned? | GraphQL chosen, REST deprecated | ✅ |
| 5 | What have I done? | Auth module, Rate limiter | ✅ |

**Context Status:** ⚠️ Partial (4/5)

**Warning:** state.md appears corrupted. Consider running:
- `/act:init --repair` to restore
- Or manually update `.act/state.md`
```

## Flags (Future)

| Flag | Description |
|------|-------------|
| `--json` | Output as JSON for tooling |
| `--quick` | Condensed one-line output |
| `--verbose` | Include source excerpts |

## Comparison: /act:where-am-i vs /act:resume

| Aspect | /act:where-am-i | /act:resume |
|--------|-----------------|-------------|
| **Purpose** | Quick context check | Full session recovery |
| **Output** | 5-question table only | Full catchup report |
| **Speed** | Fast | Comprehensive |
| **Use case** | Verify understanding | Start of new session |

## Related Commands

| Command | Purpose |
|---------|---------|
| `/act:resume` | Full session recovery with catchup report |
| `/act:status` | Current state overview |
| `/act:diff` | Changes since last session |

## Error Handling

| Error | Response |
|-------|----------|
| No .act/ directory | "No ACT session found" |
| Missing file | Mark question as ❌ |
| Empty file | Mark question as ⚠️ |
| Parse error | Mark question as ❌ with details |

---

*Command documentation for ACT v2.5*
