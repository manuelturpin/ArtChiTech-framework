# Command: /act:resume

**Version:** 1.0.0
**Category:** Session Management

---

## Usage

```
/act:resume
```

## Description

Déclenche la Session Recovery pour reprendre le travail après un reset de contexte. Analyse les fichiers `.act/` et génère un rapport de rattrapage.

## When to Use

- **Au démarrage d'une session** pour comprendre l'état du projet
- **Après un reset de contexte** (context window full)
- **Quand on reprend un projet** après une pause
- **En cas de doute** sur où on en était

## Behavior

### Step 1: Detection

```
Check if .act/ directory exists
├── Yes → Proceed to analysis
└── No  → Display "No session found" message
```

### Step 2: Analysis

Read and parse:
1. `.act/config.yaml` - Project configuration
2. `.act/state.md` - Current state
3. `.act/progress.md` - Session history
4. `.act/plan.md` - Implementation plan

### Step 3: Report Generation

Generate catchup report with:
- Project name
- Last session date/time
- Current phase and progress
- Recent actions (last 5)
- Next steps (next 3)
- Blockers (if any)

### Step 4: Display

Output the formatted catchup report to user.

## Output Format

### Normal Session Found

```markdown
## 🔄 Session Recovery

**Projet :** [project name]
**Dernière session :** [date/time]
**Phase actuelle :** [X/Y] ([phase name])
**Progression :** [X%]

### Dernières actions
- [action 1]
- [action 2]
- [action 3]

### Prochaines étapes
- [step 1]
- [step 2]
- [step 3]

---
✅ Ready to continue. What would you like to work on?
```

### With Blockers

```markdown
## 🔄 Session Recovery

**Projet :** [project name]
**Dernière session :** [date/time]
**Phase actuelle :** [X/Y] ([phase name])
**Progression :** [X%]

### ⚠️ Blockers
- [blocker 1]
- [blocker 2]

### Actions requises
Before continuing, we need to resolve:
1. [action for blocker 1]
2. [action for blocker 2]

---
🚧 Blockers detected. Address these before continuing.
```

### No Session Found

```markdown
## 🔄 Session Recovery

❌ No previous session found.

The `.act/` directory does not exist in this project.

### Options
1. **Start new session:** Use `/act:init` to initialize ACT
2. **Check location:** Verify you're in the correct project directory
3. **Manual setup:** Create `.act/` directory manually

---
Use `/act:init` to start a new ACT session.
```

### Partial Session (Missing Files)

```markdown
## 🔄 Session Recovery (Partial)

⚠️ Incomplete session data detected.

**Files found:**
- [x] config.yaml
- [x] state.md
- [ ] progress.md ❌
- [x] plan.md

### Available Information
**Projet :** [project name]
**Phase actuelle :** [X/Y]

### Recommendation
Some session files are missing. You can:
1. Continue with available data
2. Run `/act:init --repair` to restore missing files
```

## Examples

### Example 1: Resuming ACT v2.5 Work

```
User: /act:resume

## 🔄 Session Recovery

**Projet :** ACT v2.5
**Dernière session :** 2026-02-02 04:00 UTC
**Phase actuelle :** 5/6 (Deviation Rules)
**Progression :** 83%

### Dernières actions
- Created deviation-rules.md with 5 rules
- Added ISSUES.md template for Rule 5
- Updated CLAUDE.md with deviation rules
- Updated README.md documentation
- Created tag v2.5.0-alpha.5

### Prochaines étapes
- Begin Phase 6: Session Recovery
- Create SPEC-session-recovery.md
- Implement session detection logic

---
✅ Ready to continue. What would you like to work on?
```

### Example 2: New Project

```
User: /act:resume

## 🔄 Session Recovery

❌ No previous session found.

The `.act/` directory does not exist in this project.

### Options
1. **Start new session:** Use `/act:init` to initialize ACT
2. **Check location:** Verify you're in the correct project directory

---
Use `/act:init` to start a new ACT session.
```

## Integration

### With /act:init

If no session exists, suggest `/act:init`:

```
/act:resume → No session → Suggest /act:init
```

### With Hooks

Session Recovery relies on hooks keeping `.act/` files current:
- **PostToolUse** → Updates progress.md
- **Stop** → Ensures state.md is accurate

### With Scale-Adaptive

Report adapts to mode:
- **Quick Mode** → Condensed format
- **Full Mode** → Complete format

## Flags (Future)

| Flag | Description |
|------|-------------|
| `--verbose` | Include findings.md summary |
| `--quick` | Condensed one-line summary |
| `--json` | Output as JSON for tooling |

## Related Commands

| Command | Purpose |
|---------|---------|
| `/act:init` | Initialize new ACT session |
| `/act:status` | Quick status check |
| `/act:plan` | View/update plan |

## Error Handling

| Error | Response |
|-------|----------|
| No .act/ directory | "No session found" message |
| Missing files | Partial recovery with warning |
| Corrupted state | Warning + manual verification suggestion |
| Read permission error | Error message with suggestion |

---

*Command documentation for ACT v2.5*
