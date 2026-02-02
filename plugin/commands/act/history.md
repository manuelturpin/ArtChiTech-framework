# Command: /act:history

**Version:** 1.0.0
**Category:** Session Management

---

## Usage

```
/act:history
/act:history [options]
```

## Description

Liste toutes les sessions de travail sauvegardées dans `.act/history/`. Affiche les métadonnées clés de chaque session pour une vue d'ensemble rapide.

## When to Use

- **Pour voir l'historique** du travail sur un projet
- **Pour trouver une session** spécifique à revoir
- **Pour les métriques** de temps passé sur le projet
- **Avant un /act:replay** pour trouver la bonne session

## Behavior

### Step 1: Check Configuration

```
Read .act/config.yaml
├── history.enabled = true → Proceed
└── history.enabled = false → Display "History disabled" message
```

### Step 2: List Sessions

```
List files in .act/history/
├── Files found → Parse and display
└── No files (only .gitkeep) → Display "No sessions" message
```

### Step 3: Parse Each Session

For each `.md` file in `.act/history/`:
1. Extract date/time from filename
2. Read Metadata section for:
   - Durée
   - Commits count
3. Read Résumé section for:
   - Résultat (✅/❌)

### Step 4: Display

Output formatted table sorted by date (newest first).

## Output Format

### Normal Output

```markdown
## 📜 Session History

| Date | Durée | Commits | Résultat |
|------|-------|---------|----------|
| 2026-02-02 03:30 | 45min | 3 | ✅ |
| 2026-02-01 18:30 | 1h20 | 7 | ✅ |
| 2026-02-01 14:30 | 30min | 2 | ✅ |

**Total:** 3 sessions | **Temps total:** ~2h35

---
Use `/act:replay <date>` to view session details.
Example: `/act:replay 2026-02-02-0330`
```

### No Sessions

```markdown
## 📜 Session History

📭 No sessions found.

Sessions are automatically saved when you use `/act:stop` or when a session ends.

### To create your first session
1. Work on your project using ACT
2. End your session with `/act:stop`
3. A session log will be saved automatically

---
*Session history is enabled. Sessions will be saved automatically.*
```

### History Disabled

```markdown
## 📜 Session History

⚠️ Session history is disabled.

To enable, update `.act/config.yaml`:

```yaml
history:
  enabled: true
  maxSessions: 10
  autoSave: true
```

Then restart your session.
```

## Options (Future)

| Option | Description |
|--------|-------------|
| `--limit N` | Show only last N sessions |
| `--from DATE` | Sessions from date onwards |
| `--to DATE` | Sessions until date |
| `--json` | Output as JSON |

## Examples

### Example 1: View History

```
User: /act:history

## 📜 Session History

| Date | Durée | Commits | Résultat |
|------|-------|---------|----------|
| 2026-02-02 03:30 | 45min | 3 | ✅ |
| 2026-02-01 18:30 | 1h20 | 7 | ✅ |
| 2026-02-01 14:30 | 30min | 2 | ✅ |

**Total:** 3 sessions | **Temps total:** ~2h35

---
Use `/act:replay <date>` to view session details.
```

### Example 2: Empty History

```
User: /act:history

## 📜 Session History

📭 No sessions found.

Sessions are automatically saved when you use `/act:stop`.
```

## Integration

### With /act:replay

Use `/act:history` to find sessions, then `/act:replay` to view details:

```
/act:history → Find session date → /act:replay 2026-02-01-1830
```

### With Session Recovery

Session Recovery can reference history for context:

```
/act:resume
├── Read state files
├── Optionally list recent sessions from history
└── Generate catchup report
```

## File Parsing

### Session File Format

```markdown
# Session 2026-02-02 03:30

## Metadata
- Durée: 45min
- Tokens utilisés: ~12k
- Commits: 3

## Résumé
- Objectif: Implement Session History
- Résultat: ✅ Complete
...
```

### Extraction Rules

| Field | Extraction Method |
|-------|-------------------|
| Date | Filename: `YYYY-MM-DD-HHmm.md` → `YYYY-MM-DD HH:mm` |
| Durée | Regex: `Durée: (.+)` |
| Commits | Regex: `Commits: (\d+)` |
| Résultat | Regex: `Résultat: (✅\|❌)` |

## Error Handling

| Error | Response |
|-------|----------|
| No .act/ directory | "No ACT session. Use /act:init to start." |
| No .act/history/ | Create directory automatically |
| Parse error | Skip file, show warning |
| Permission error | "Cannot read history. Check permissions." |

## Related Commands

| Command | Purpose |
|---------|---------|
| `/act:replay` | View session details |
| `/act:resume` | Resume work with catchup |
| `/act:stop` | End session (triggers auto-save) |

---

*Command documentation for ACT v2.5*
