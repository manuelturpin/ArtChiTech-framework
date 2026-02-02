# SPEC: 5-Question Reboot Test

**Version:** 1.0.0  
**Status:** Active  
**Created:** 2026-02-02  
**Updated:** 2026-02-02

---

## Objective

Formalize a rapid test to verify that context has been correctly recovered after a context reset. The 5-Question Reboot Test ensures the AI agent can answer fundamental questions about the project state before resuming work.

## Problem Statement

After a context reset (context window full, new session, or manual restart), the AI agent loses all conversational context. Without proper verification, the agent might:

- Start work without understanding current phase
- Duplicate already-completed work
- Miss important learnings and decisions
- Work toward outdated goals

The 5-Question Reboot Test provides a **quick sanity check** to ensure context recovery was successful.

---

## The 5 Questions

| # | Question | Source File | Expected Answer |
|---|----------|-------------|-----------------|
| 1 | **Where am I?** | `.act/state.md` | Current phase and task |
| 2 | **Where am I going?** | `.act/plan.md` | Remaining phases and next steps |
| 3 | **What's the goal?** | `.act/config.yaml` | Project objective |
| 4 | **What have I learned?** | `.act/findings.md` | Key discoveries and decisions |
| 5 | **What have I done?** | `.act/progress.md` | Recent actions and commits |

---

## Data Sources

### Question 1: Where am I?

**Source:** `.act/state.md`

**Extract:**
- `Current.Phase` — Current phase number and name
- `Current.Task` — Active task description
- `Current.Blocker` — Any active blockers
- `Quick Stats.Progress` — Progress percentage

**Example answer:** "Phase 3/5 (Implementation) - Building auth module - 60% complete"

### Question 2: Where am I going?

**Source:** `.act/plan.md`

**Extract:**
- Remaining unchecked phases
- Next 2-3 tasks in current phase
- Any pending decisions

**Example answer:** "Testing, Launch, Growth phases remaining. Next: Complete login endpoint, Add password reset"

### Question 3: What's the goal?

**Source:** `.act/config.yaml`

**Extract:**
- `project.name` — Project name
- `project.goal` — Main objective (if defined)
- `project.type` — Project type (cli, product, etc.)

**Example answer:** "Build TaskFlow CLI - a command-line task management tool"

### Question 4: What have I learned?

**Source:** `.act/findings.md`

**Extract:**
- Key discoveries section
- Important decisions made
- Technical choices and rationale

**Example answer:** "argparse preferred over click for simplicity, UUIDs for task IDs, JSON storage for v1"

### Question 5: What have I done?

**Source:** `.act/progress.md`

**Extract:**
- Last 3-5 actions
- Recent commits (from git log if needed)
- Timestamps for context

**Example answer:** "CLI parser implemented, add_task command working, unit tests passing"

---

## Response Format

### Full Format (Table)

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
```

### Condensed Format (Quick Mode)

```markdown
## 🔄 Context Check

✅ **5/5** | Phase 3/5 | Goal: TaskFlow CLI | Ready to continue
```

### Status Indicators

| Status | Icon | Meaning |
|--------|------|---------|
| Complete | ✅ | Answer found and valid |
| Partial | ⚠️ | Answer incomplete or stale |
| Missing | ❌ | Source file missing or empty |

---

## Success Criteria

### Complete Context (5/5)

All 5 questions answered with ✅ status:

```
Context Status: ✅ Complete (5/5)
→ Ready to continue work
```

### Partial Context (3-4/5)

Some questions answered, some missing:

```
Context Status: ⚠️ Partial (4/5)
Missing: findings.md
→ Can continue with caution, consider reviewing history
```

### Incomplete Context (0-2/5)

Critical context missing:

```
Context Status: ❌ Incomplete (2/5)
Missing: state.md, plan.md, findings.md
→ Run /act:init --repair or verify .act/ directory
```

---

## Validation Rules

### Question 1 Validation

```
IF state.md exists AND contains "Phase:" section:
  → ✅ Extract phase info
ELSE IF state.md missing:
  → ❌ "state.md not found"
ELSE:
  → ⚠️ "state.md incomplete"
```

### Question 2 Validation

```
IF plan.md exists AND has unchecked items:
  → ✅ Extract remaining tasks
ELSE IF all items checked:
  → ✅ "Project complete!"
ELSE IF plan.md missing:
  → ❌ "plan.md not found"
```

### Question 3 Validation

```
IF config.yaml exists AND has project.name:
  → ✅ Extract goal
ELSE IF config.yaml missing:
  → ❌ "config.yaml not found"
ELSE:
  → ⚠️ "Goal not defined in config"
```

### Question 4 Validation

```
IF findings.md exists AND has content:
  → ✅ Extract key findings
ELSE IF findings.md empty:
  → ⚠️ "No findings recorded yet"
ELSE IF findings.md missing:
  → ❌ "findings.md not found"
```

### Question 5 Validation

```
IF progress.md exists AND has recent entries:
  → ✅ Extract recent actions
ELSE IF progress.md empty:
  → ⚠️ "No progress recorded yet"
ELSE IF progress.md missing:
  → ❌ "progress.md not found"
```

---

## Failure Recovery

### Missing Files

| Missing File | Recovery Action |
|--------------|-----------------|
| `config.yaml` | Run `/act:init --repair` |
| `state.md` | Run `/act:init --repair` |
| `plan.md` | Run `/act:init --repair` |
| `findings.md` | Create empty file, mark Q4 as ⚠️ |
| `progress.md` | Create empty file, mark Q5 as ⚠️ |

### Stale Data

If data seems stale (last update > 7 days):

```markdown
⚠️ **Warning:** Last update was 10 days ago.
Consider verifying state is still accurate.
```

### Inconsistent Data

If state.md and progress.md show different phases:

```markdown
⚠️ **Warning:** State inconsistency detected.
- state.md shows Phase 3
- progress.md last entry mentions Phase 4

Verify current state manually.
```

---

## Integration

### With /act:resume

`/act:resume` should run the 5-Question Reboot Test as part of its catchup report:

```
/act:resume
  → Read .act/ files
  → Run 5-Question Test
  → Generate catchup report
  → Display results
```

### With /act:where-am-i

`/act:where-am-i` executes ONLY the 5-Question Test (no full recovery):

```
/act:where-am-i
  → Run 5-Question Test
  → Display formatted table
  → Show context status
```

### With Session Recovery Skill

The Session Recovery skill includes the 5-Question Test as a verification step:

```
Session Recovery Flow:
  1. Detect .act/ directory
  2. Read context files
  3. Run 5-Question Test ← HERE
  4. Generate catchup report
  5. Ready to work
```

---

## Usage Examples

### Example 1: Complete Context

```
User: /act:where-am-i

## 🔄 5-Question Reboot Test

| # | Question | Answer | Status |
|---|----------|--------|--------|
| 1 | Where am I? | Phase 4/6 - Testing | ✅ |
| 2 | Where am I going? | Launch, Growth | ✅ |
| 3 | What's the goal? | Build ACT Framework v2.5 | ✅ |
| 4 | What have I learned? | Hooks > Skills for reliability | ✅ |
| 5 | What have I done? | Session Recovery, Model Selection | ✅ |

**Context Status:** ✅ Complete (5/5)

Ready to continue work on Testing phase.
```

### Example 2: Partial Context

```
User: /act:where-am-i

## 🔄 5-Question Reboot Test

| # | Question | Answer | Status |
|---|----------|--------|--------|
| 1 | Where am I? | Phase 2/5 - Strategy | ✅ |
| 2 | Where am I going? | Design, Development, Quality | ✅ |
| 3 | What's the goal? | MyApp API | ✅ |
| 4 | What have I learned? | (no findings yet) | ⚠️ |
| 5 | What have I done? | Initial setup | ✅ |

**Context Status:** ⚠️ Partial (4/5)

Note: No findings recorded yet. This is normal for early phases.
```

### Example 3: Missing Files

```
User: /act:where-am-i

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

---

## Related Documents

- [Session Recovery Skill](../skills/session-recovery/SKILL.md)
- [/act:resume Command](../commands/act/resume.md)
- [/act:where-am-i Command](../commands/act/where-am-i.md)
- [Context Engineering Spec](./SPEC-context-engineering.md)

---

*Specification for ACT v2.5 5-Question Reboot Test*
