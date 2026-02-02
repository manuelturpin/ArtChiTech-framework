# Command: /act:diff

## Purpose
Affiche les changements depuis la dernière session (ou entre deux sessions). Permet de comprendre rapidement ce qui a évolué dans le projet.

---

## Syntax

```
/act:diff [--from <session>] [--to <session>] [--files-only]
```

### Options

| Option | Description | Default |
|--------|-------------|---------|
| `--from` | Session de départ | Dernière session |
| `--to` | Session de fin | Session actuelle |
| `--files-only` | Affiche uniquement les fichiers modifiés | false |

---

## Usage Examples

```bash
# Diff depuis la dernière session
/act:diff

# Diff entre deux sessions spécifiques
/act:diff --from 2026-02-01-1430 --to 2026-02-02-0930

# Uniquement les fichiers modifiés
/act:diff --files-only
```

---

## Output Format

### Full Output (default)

```markdown
## 📊 Session Diff

**From:** 2026-02-01 14:30 → **To:** 2026-02-02 09:30

### Fichiers modifiés
- `src/cli.py` (+45, -12)
- `tests/test_cli.py` (+30, -0)
- `README.md` (+10, -3)

### Changements état
- **Phase:** 2/5 → 3/5
- **Progress:** 45% → 60%
- **Task:** "Setup API" → "Implement auth"

### Commits depuis dernière session
- `abc1234`: feat: Add list command
- `def5678`: fix: Validation bug
- `123abcd`: docs: Update README

### Findings ajoutés
- API rate limit discovered (100/min)
- JWT preferred over sessions
```

### Files-Only Output

```markdown
## 📁 Files Changed

| File | Changes |
|------|---------|
| src/cli.py | +45, -12 |
| tests/test_cli.py | +30, -0 |
| README.md | +10, -3 |

Total: 3 files, +85 insertions, -15 deletions
```

---

## Execution Steps

### Step 1: Resolve Sessions

```
from_session = --from OR latest_session_before_current()
to_session = --to OR current_session()
```

### Step 2: Load Session Data

```
from_state = load(.act/history/{from_session}.md)
to_state = load(.act/state.md) OR load(.act/history/{to_session}.md)
```

### Step 3: Compute File Diff

```bash
# Get commits between sessions
git log --oneline {from_timestamp}..{to_timestamp}

# Get file changes
git diff --stat {from_commit}..{to_commit}
```

### Step 4: Compute State Diff

```
phase_diff = from_state.phase → to_state.phase
progress_diff = from_state.progress → to_state.progress
task_diff = from_state.task → to_state.task
```

### Step 5: Extract New Findings

```
new_findings = findings_after(from_timestamp) - findings_before(from_timestamp)
```

### Step 6: Generate Output

```
IF --files-only THEN
  output_files_only()
ELSE
  output_full_diff()
```

---

## Integration with Session History

Le diff utilise les fichiers de `.act/history/` pour identifier les sessions :

```
.act/
└── history/
    ├── 2026-02-01-1430.md  # Session 1
    ├── 2026-02-01-1830.md  # Session 2
    └── 2026-02-02-0930.md  # Session 3 (current)
```

Chaque fichier contient un snapshot de l'état à ce moment.

---

## Use Cases

### 1. Morning Catchup
```bash
/act:diff
# Voir tout ce qui a changé depuis hier
```

### 2. PR Review Preparation
```bash
/act:diff --files-only
# Liste des fichiers à inclure dans la PR
```

### 3. Progress Report
```bash
/act:diff --from 2026-02-01-0900
# Montrer l'avancement depuis le début de la semaine
```

---

## Error Handling

### No Previous Session
```
⚠️ No previous session found.
This appears to be the first session.
Use /act:history to see all sessions.
```

### Session Not Found
```
❌ Session not found: 2026-02-01-1430
Available sessions:
- 2026-02-01-1830
- 2026-02-02-0930

Use /act:history to list all sessions.
```

---

## Related Commands

| Command | Description |
|---------|-------------|
| `/act:history` | List all past sessions |
| `/act:replay <date>` | View details of a specific session |
| `/act:status` | Show current state |
| `/act:resume` | Recover from previous session |

---

*Command version: 1.0*
*ACT version: 2.5*
