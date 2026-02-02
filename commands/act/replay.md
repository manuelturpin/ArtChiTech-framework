# Command: /act:replay

**Version:** 1.0.0
**Category:** Session Management

---

## Usage

```
/act:replay <session>
/act:replay last
/act:replay -1
```

## Description

Affiche les détails complets d'une session passée. Permet de revoir ce qui a été fait, les commits effectués, et l'état du projet à la fin de cette session.

## When to Use

- **Pour revoir une session** passée en détail
- **Pour comprendre** ce qui a été fait un jour spécifique
- **Pour le contexte** avant de reprendre un travail
- **Pour l'audit** du travail effectué

## Arguments

| Argument | Description | Example |
|----------|-------------|---------|
| `<date>` | Date/heure de la session | `2026-02-01-1830` |
| `last` | Dernière session | `/act:replay last` |
| `-N` | Nième session depuis la fin | `/act:replay -2` (avant-dernière) |

## Behavior

### Step 1: Parse Argument

```
/act:replay <arg>
├── arg = "last" → Get most recent session
├── arg = "-N" → Get Nth from end
└── arg = date → Find session by date
```

### Step 2: Locate Session File

```
.act/history/
├── Find matching file
│   ├── Found → Read content
│   └── Not found → Error message
```

### Step 3: Display

Output full session log with formatting.

## Output Format

### Session Found

```markdown
## 📜 Session Replay: 2026-02-01 18:30

# Session 2026-02-01 18:30

## Metadata
- Durée: 1h20
- Tokens utilisés: ~25k
- Commits: 7

## Résumé
- Objectif: Implement Session Recovery feature
- Résultat: ✅ Complete

## Actions clés
1. Created SPEC-session-recovery.md
2. Implemented /act:resume command
3. Updated SKILL.md with recovery logic
4. Added catchup report format
5. Integrated with hooks system

## Commits
- `a1b2c3d` - feat(act-v2.5): [3.6.1] Add session recovery spec
- `e4f5g6h` - feat(act-v2.5): [3.6.2] Implement /act:resume
- `i7j8k9l` - feat(act-v2.5): [3.6.3] Add catchup report
- `m0n1o2p` - feat(act-v2.5): [3.6.4] Integrate with hooks

## État final
- Phase: 6/6 (Session Recovery)
- Prochaine: Testing & validation

## Notes
Session productive. Toutes les fonctionnalités prévues implémentées.
Quelques ajustements mineurs à faire sur le format du catchup report.

---
📍 End of session log
```

### Session Not Found

```markdown
## 📜 Session Replay

❌ Session not found: `2026-02-01-1830`

### Available sessions:
- 2026-02-02-0330
- 2026-02-01-1430
- 2026-01-31-2200

Use `/act:history` to list all sessions.
```

### No Sessions

```markdown
## 📜 Session Replay

📭 No sessions available to replay.

Sessions are saved automatically when you use `/act:stop`.
Start working and end your session to create history.
```

### Invalid Argument

```markdown
## 📜 Session Replay

⚠️ Invalid argument: `invalid-date`

### Valid formats:
- Date: `/act:replay 2026-02-01-1830`
- Last session: `/act:replay last`
- Relative: `/act:replay -1` (last), `/act:replay -2` (before last)
```

## Examples

### Example 1: Replay by Date

```
User: /act:replay 2026-02-01-1830

## 📜 Session Replay: 2026-02-01 18:30

[Full session log...]
```

### Example 2: Replay Last Session

```
User: /act:replay last

## 📜 Session Replay: 2026-02-02 03:30

[Full session log of most recent session...]
```

### Example 3: Replay Relative

```
User: /act:replay -2

## 📜 Session Replay: 2026-02-01 14:30

[Full session log of session before last...]
```

## Date Matching

### Exact Match

```
/act:replay 2026-02-01-1830
→ Looks for .act/history/2026-02-01-1830.md
```

### Partial Match (Future Enhancement)

```
/act:replay 2026-02-01
→ If multiple sessions that day, list them
→ If single session, display it
```

## Integration

### With /act:history

Typical workflow:

```
1. /act:history → View all sessions
2. Find interesting session date
3. /act:replay <date> → View details
```

### With /act:resume

For context before resuming:

```
1. /act:resume → Get current state
2. /act:replay last → See what was done last time
3. Continue work
```

## Error Handling

| Error | Response |
|-------|----------|
| No .act/ directory | "No ACT session. Use /act:init to start." |
| No history directory | "No session history. Complete a session first." |
| Session not found | List available sessions |
| Invalid date format | Show valid formats |
| File read error | "Cannot read session file. Check permissions." |

## Related Commands

| Command | Purpose |
|---------|---------|
| `/act:history` | List all sessions |
| `/act:resume` | Resume with catchup report |
| `/act:stop` | End session (saves to history) |

---

*Command documentation for ACT v2.5*
