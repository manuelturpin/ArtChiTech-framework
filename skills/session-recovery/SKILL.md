# Skill: Session Recovery

**Version:** 1.0.0
**Category:** Context Engineering
**Source:** Planning Files Framework

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

Ensure the catchup report answers these 5 questions:

| Question | How to Answer |
|----------|---------------|
| **1. Where am I?** | Current phase from state.md |
| **2. Where am I going?** | Remaining phases from plan.md |
| **3. What's the goal?** | Goal from config.yaml |
| **4. What have I learned?** | Key points from findings.md |
| **5. What have I done?** | Recent actions from progress.md |

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

Session Recovery s'intègre avec Session History pour offrir un contexte plus riche.

### Enhanced Catchup Report

Quand l'historique est activé, le catchup report peut inclure les sessions récentes :

```markdown
## 🔄 Session Recovery

**Projet :** ACT v2.5
**Dernière session :** 2026-02-02 03:30

### Sessions récentes
| Date | Durée | Résultat |
|------|-------|----------|
| 2026-02-02 03:30 | 45min | ✅ Model Selection |
| 2026-02-01 18:30 | 1h20 | ✅ Session Recovery |
| 2026-02-01 14:30 | 30min | ✅ Deviation Rules |

### Prochaines étapes
...
```

### Auto-Save on Session End

Quand une session se termine (via Stop Hook ou `/act:stop`) :

1. Collecter les données de session :
   - Heure de début/fin
   - Actions effectuées (depuis progress.md)
   - Commits créés (depuis git log)
   - État final (depuis state.md)

2. Générer le session log avec le template

3. Sauvegarder dans `.act/history/YYYY-MM-DD-HHmm.md`

4. Appliquer la rotation si nécessaire

### Rotation

Avant de sauvegarder une nouvelle session :

```
files = list(.act/history/*.md)
if len(files) >= config.history.maxSessions:
    oldest = sort_by_date(files)[0]
    delete(oldest)
save(new_session)
```

### Commands

| Command | Purpose |
|---------|---------|
| `/act:history` | Lister les sessions |
| `/act:replay <session>` | Voir une session passée |

### Configuration

```yaml
# In .act/config.yaml
history:
  enabled: true      # Activer/désactiver
  maxSessions: 10    # Nombre max de sessions
  autoSave: true     # Sauvegarde auto en fin de session
```

## Related

- [Context Engineering Skill](../context-engineering/SKILL.md)
- [/act:init Command](../../commands/act/init.md)
- [/act:resume Command](../../commands/act/resume.md)
- [/act:history Command](../../commands/act/history.md)
- [/act:replay Command](../../commands/act/replay.md)
- [Session History SPEC](../../specs/SPEC-session-history.md)

---

*Skill documentation for ACT v2.5 Session Recovery*
