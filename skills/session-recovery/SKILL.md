# Skill: Session Recovery

**Version:** 1.0.0
**Category:** Context Engineering
**Source:** Planning Files Framework
**Type:** Flexible

> **Self-Announcement:** When using this skill, announce: "Using Session Recovery skill to detect and recover previous session context."

---

## Purpose

Détecter les sessions précédentes et générer un rapport de rattrapage pour reprendre le travail efficacement après un reset de contexte.

## When to Use

- **Au démarrage d'une session** quand `.act/` existe
- **Après un reset de contexte** (context window full)
- **Manuellement** via `/act:resume`
- **En cas de doute** sur l'état du projet

## Session Detection

### Step 1: Check for .act/ Directory

```
If .act/ exists:
  → Previous session detected
  → Proceed to Step 2

If .act/ does not exist:
  → No previous session
  → Start fresh or use /act:init
```

### Step 2: Read State Files

Read these files in order:

1. **`.act/config.yaml`** - Project configuration
   - Project name
   - Start date
   - Goals

2. **`.act/state.md`** - Current state
   - Current phase (e.g., "Phase 3: Iron Laws")
   - Progress percentage
   - Last update date/time
   - Active blockers

3. **`.act/progress.md`** - Session history
   - Recent commits
   - Actions taken
   - Timestamps

4. **`.act/plan.md`** - Implementation plan
   - All phases
   - Completed vs remaining tasks

### Step 3: Extract Key Information

| Information | Source | Format |
|-------------|--------|--------|
| Project name | config.yaml | String |
| Last update | state.md | Date/Time |
| Current phase | state.md | "Phase X: Name" |
| Progress | state.md | Percentage |
| Recent actions | progress.md | Last 5 entries |
| Next steps | plan.md | Next 3 incomplete |
| Blockers | state.md | List (may be empty) |

## Catchup Report

### Standard Format

```markdown
## 🔄 Session Recovery

**Projet :** [project name]
**Dernière session :** [last update date/time]
**Phase actuelle :** [phase X/total] [phase name]
**Progression :** [X%]

### Dernières actions
- [most recent action]
- [previous action]
- [earlier action]

### Prochaines étapes
- [immediate next step]
- [following step]
- [subsequent step]
```

### With Blockers

If blockers exist, add:

```markdown
### ⚠️ Blockers
- [blocker 1]
- [blocker 2]

### Actions requises
- [action to unblock]
```

### Quick Mode Format

For Quick Mode sessions, use condensed format:

```markdown
## 🔄 Session Recovery (Quick)

**Phase :** [current] → **Next:** [immediate action]
**Progress :** [X%] | **Blocker:** [none/description]
```

## 5-Question Reboot Test

The 5-Question Reboot Test is a **mandatory verification step** after context recovery. It ensures the agent can answer fundamental questions about the project before resuming work.

### The 5 Questions

| # | Question | Source | Expected Answer |
|---|----------|--------|-----------------|
| 1 | **Where am I?** | `.act/state.md` | Current phase, task, progress |
| 2 | **Where am I going?** | `.act/plan.md` | Remaining phases, next steps |
| 3 | **What's the goal?** | `.act/config.yaml` | Project objective |
| 4 | **What have I learned?** | `.act/findings.md` | Key discoveries, decisions |
| 5 | **What have I done?** | `.act/progress.md` | Recent actions, commits |

### Checklist

Before resuming work, verify each question:

- [ ] **Q1: Where am I?**
  - Read `state.md` → Extract current phase
  - Verify phase number and name
  - Check for active blockers
  - Status: ✅ if phase found, ❌ if file missing

- [ ] **Q2: Where am I going?**
  - Read `plan.md` → Find unchecked items
  - List next 2-3 tasks
  - Identify remaining phases
  - Status: ✅ if tasks found, ⚠️ if all complete

- [ ] **Q3: What's the goal?**
  - Read `config.yaml` → Extract project name/goal
  - Verify goal is clear and actionable
  - Status: ✅ if goal found, ❌ if config missing

- [ ] **Q4: What have I learned?**
  - Read `findings.md` → Extract key discoveries
  - Look for important decisions
  - Note technical choices made
  - Status: ✅ if findings exist, ⚠️ if empty (normal for early phases)

- [ ] **Q5: What have I done?**
  - Read `progress.md` → Get last 3-5 entries
  - Cross-reference with git log if available
  - Status: ✅ if recent actions found, ⚠️ if empty

### Validation

| Score | Status | Action |
|-------|--------|--------|
| 5/5 | ✅ Complete | Ready to continue |
| 3-4/5 | ⚠️ Partial | Proceed with caution |
| 0-2/5 | ❌ Incomplete | Run `/act:init --repair` |

### What If an Answer Is Missing?

| Question | If Missing | Recovery |
|----------|------------|----------|
| Q1 | state.md not found | Run `/act:init --repair` |
| Q2 | plan.md not found | Run `/act:init --repair` |
| Q3 | config.yaml not found | Run `/act:init --repair` |
| Q4 | findings.md empty | Normal early on, continue |
| Q5 | progress.md empty | Check git log for history |

### Output Format

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

### Command

Use `/act:where-am-i` to execute the 5-Question Test on demand:

```bash
/act:where-am-i
```

**Full specification:** [SPEC-reboot-test.md](../../specs/SPEC-reboot-test.md)

## Decision Flow

```
┌─────────────────────────────────┐
│ New Session / Context Reset     │
└───────────────┬─────────────────┘
                │
                ▼
        ┌───────────────┐
        │  .act/ exists? │
        └───────┬───────┘
                │
        ┌───────┴───────┐
        │               │
       Yes              No
        │               │
        ▼               ▼
┌───────────────┐ ┌───────────────┐
│ Read state    │ │ No recovery   │
│ files         │ │ needed        │
└───────┬───────┘ └───────────────┘
        │
        ▼
┌───────────────┐
│ Generate      │
│ catchup       │
│ report        │
└───────┬───────┘
        │
        ▼
┌───────────────┐
│ Display       │
│ report        │
└───────┬───────┘
        │
        ▼
┌───────────────┐
│ Ready to      │
│ continue      │
└───────────────┘
```

## Error Handling

### Missing Files

If some `.act/` files are missing:

```markdown
## 🔄 Session Recovery (Partial)

⚠️ Some files are missing:
- [x] config.yaml ✓
- [x] state.md ✓
- [ ] progress.md ❌
- [x] plan.md ✓

**Available information:**
[Report with available data]

**Recommendation:** Run `/act:init` to restore missing files
```

### Corrupted State

If state.md shows inconsistent data:

```markdown
## 🔄 Session Recovery

⚠️ State inconsistency detected:
- state.md says Phase 3, but progress.md shows Phase 4 commits

**Recommendation:** Verify state manually and update state.md
```

## Integration

### With PostToolUse Hook

The PostToolUse hook ensures progress.md stays current:

```
After each Write/Edit → Update progress.md
After each commit → Log commit to progress.md
```

This keeps session recovery data fresh.

### With Stop Hook

The Stop hook verifies state before session ends:

```
Before stopping → Verify state.md is accurate
Before stopping → Add "Session ended" entry to progress.md
```

### With /act:init

If no session exists:

```
User: /act:resume
System: No previous session found. Use /act:init to start a new project.
```

## Examples

### Example 1: Normal Recovery

```markdown
## 🔄 Session Recovery

**Projet :** ACT v2.5
**Dernière session :** 2026-02-02 04:00 UTC
**Phase actuelle :** 5/6 (Deviation Rules)
**Progression :** 83%

### Dernières actions
- Created deviation-rules.md with 5 rules
- Added ISSUES.md template
- Updated CLAUDE.md with deviation rules section
- Created tag v2.5.0-alpha.5

### Prochaines étapes
- Begin Phase 6: Session Recovery
- Create SPEC-session-recovery.md
- Implement /act:resume command
```

### Example 2: Recovery with Blocker

```markdown
## 🔄 Session Recovery

**Projet :** MyApp
**Dernière session :** 2026-02-01 15:30 UTC
**Phase actuelle :** 4/7 (Implementation)
**Progression :** 45%

### Dernières actions
- Started database migration
- Encountered schema conflict
- Logged issue to ISSUES.md

### ⚠️ Blockers
- Schema conflict between v1 and v2 tables
- Requires architectural decision (Rule 4)

### Actions requises
- Decide: Migrate in-place or parallel tables?
- User input needed before continuing
```

## Best Practices

1. **Always check for .act/** at session start
2. **Read state.md first** - it's the quickest summary
3. **Scan progress.md** for recent context
4. **Trust the files** - they're the source of truth
5. **Update state.md** when resuming work

## Session History Integration

Session Recovery integrates with Session History for richer context on resume. When history is enabled, the catchup report includes recent sessions (date, duration, result). Sessions are auto-saved on end via the Stop Hook, with automatic rotation to limit stored files.

**Full details:** [Advanced Features](advanced-features.md#session-history-integration)

## History Directory

Session history files are stored in `.act/history/` using the naming pattern `YYYY-MM-DD-HHmm.md`. Each file captures duration, phase, actions performed, commits, and end state. Rotation is controlled by `maxSessions` in config (default: 10).

**Full details:** [Advanced Features](advanced-features.md#history-directory)

## Context Handoff Integration

Session Recovery works with the Context Handoff format for richer recovery. When `/act:resume` finds a recent handoff (< 24h) in `.act/handoffs/latest.xml`, it parses the content and enriches the catchup report with completed/remaining work, attempted approaches, and critical context.

**Full details:** [Advanced Features](advanced-features.md#context-handoff-integration)

## Related

- [Context Engineering Skill](../context-engineering/SKILL.md)
- [/act:init Command](../../commands/act/init.md)
- [/act:resume Command](../../commands/act/resume.md)
- [/act:handoff Command](../../commands/act/handoff.md)
- [/act:history Command](../../commands/act/history.md)
- [/act:replay Command](../../commands/act/replay.md)
- [Session History SPEC](../../specs/SPEC-session-history.md)
- [Context Handoff SPEC](../../specs/SPEC-context-handoff.md)

---

*Skill documentation for ACT v2.5 Session Recovery*
