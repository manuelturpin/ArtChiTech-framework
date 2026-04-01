# Session Recovery: Advanced Features

> Detailed documentation for Session History, History Directory, and Context Handoff integrations.

---

## Session History Integration

Session Recovery s'integre avec Session History pour offrir un contexte plus riche.

### Enhanced Catchup Report

Quand l'historique est active, le catchup report peut inclure les sessions recentes :

```markdown
## Session Recovery

**Projet :** ACT v2.5
**Derniere session :** 2026-02-02 03:30

### Sessions recentes
| Date | Duree | Resultat |
|------|-------|----------|
| 2026-02-02 03:30 | 45min | Model Selection |
| 2026-02-01 18:30 | 1h20 | Session Recovery |
| 2026-02-01 14:30 | 30min | Deviation Rules |

### Prochaines etapes
...
```

### Auto-Save on Session End

Quand une session se termine (via Stop Hook ou `/act:stop`) :

1. Collecter les donnees de session :
   - Heure de debut/fin
   - Actions effectuees (depuis progress.md)
   - Commits crees (depuis git log)
   - Etat final (depuis state.md)

2. Generer le session log avec le template

3. Sauvegarder dans `.act/history/YYYY-MM-DD-HHmm.md`

4. Appliquer la rotation si necessaire

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
| `/act:replay <session>` | Voir une session passee |

### Configuration

```yaml
# In .act/config.yaml
history:
  enabled: true      # Activer/desactiver
  maxSessions: 10    # Nombre max de sessions
  autoSave: true     # Sauvegarde auto en fin de session
```

---

## History Directory

Session history is stored in `.act/history/` for persistence and recovery.

### File Format

Files are named using the pattern: `YYYY-MM-DD-HHmm.md`

Example:
```
.act/history/
├── 2026-02-01-1430.md
├── 2026-02-01-1830.md
├── 2026-02-02-0930.md
└── 2026-02-02-1500.md
```

### File Content Template

Each session file contains:

```markdown
# Session: YYYY-MM-DD HH:mm

## Summary
- **Duration:** X minutes
- **Phase:** [phase at session end]
- **Progress:** [X% -> Y%]

## Actions Performed
- [Action 1]
- [Action 2]
- ...

## Commits
- `abc1234` - Commit message 1
- `def5678` - Commit message 2

## State at End
- **Phase:** X/Y
- **Next task:** [description]
- **Blockers:** [none/list]
```

### Automatic Rotation

History rotation is controlled by `maxSessions` in config:

```yaml
# In .act/config.yaml
history:
  enabled: true
  maxSessions: 10    # Keep last 10 sessions
  autoSave: true     # Auto-save on session end
```

When `maxSessions` is reached, the oldest session file is automatically deleted before saving a new one.

### Associated Commands

| Command | Description |
|---------|-------------|
| `/act:history` | List all saved sessions |
| `/act:replay <session>` | View details of a specific session |
| `/act:resume` | Resume from latest session with catchup report |

### Manual Access

You can also browse history directly:

```bash
# List sessions
ls -la .act/history/

# View a specific session
cat .act/history/2026-02-01-1430.md
```

---

## Context Handoff Integration

Session Recovery works seamlessly with the Context Handoff format for richer recovery.

### What is Context Handoff?

A standardized XML/Markdown format for transferring context between sessions or agents. Contains:
- Original task description
- Completed and remaining work
- Attempted approaches (what worked/failed)
- Critical context (must-not-lose info)
- Current state snapshot

### Enhanced Recovery with Handoff

When a handoff file exists (`.act/handoffs/latest.xml`), recovery is enhanced:

```markdown
## Session Recovery (with Handoff)

**Projet :** ACT v2.5
**Derniere session :** 2026-02-02 10:30 UTC
**Handoff trouve :** Recent (< 24h)

### Contexte du handoff
**Tache originale :** Implement Phase 4 of ACT v2.5

### Travail effectue (depuis handoff)
- Created specs/SPEC-context-handoff.md
- Created templates/context-handoff.xml

### Travail restant (depuis handoff)
- Create commands/act/handoff.md
- Update session-recovery skill

### Approches tentees
- JSON format: Trop verbeux
- XML format: Adopte

### Contexte critique
- User prefers XML as primary format
- Must integrate with /act:resume
```

### Recovery Decision Flow

```
┌─────────────────────────────────┐
│ /act:resume                     │
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
│ Check for     │ │ No recovery   │
│ handoff       │ │ needed        │
└───────┬───────┘ └───────────────┘
        │
        ▼
┌─────────────────────────────────┐
│ handoffs/latest.xml exists      │
│ AND < 24h old?                  │
└───────────────┬─────────────────┘
        │
┌───────┴───────┐
│               │
Yes             No
│               │
▼               ▼
┌───────────────┐ ┌───────────────┐
│ Enhanced      │ │ Standard      │
│ recovery      │ │ recovery      │
│ (with handoff)│ │ (state only)  │
└───────────────┘ └───────────────┘
```

### Generating Handoff for Recovery

Before ending a session, generate a handoff:

```
/act:handoff --save
```

Or automatically with stop:

```
/act:stop --handoff
```

### Using Handoff with /act:resume

The `/act:resume` command automatically:

1. Checks for `.act/handoffs/latest.xml`
2. If recent (< 24h), parses handoff content
3. Enriches catchup report with handoff data
4. Prioritizes `work_remaining` from handoff

### Handoff vs State Files

| Aspect | State Files | Handoff |
|--------|-------------|---------|
| Purpose | Current state | Transfer context |
| Scope | Project snapshot | Session summary |
| Created | Continuously | On demand/session end |
| Includes | Phase, progress | + Approaches, recommendations |
| Format | Markdown | XML or Markdown |

**Use both together:**
- State files: Always up-to-date snapshot
- Handoff: Rich context for transitions

### Commands

| Command | Recovery Role |
|---------|---------------|
| `/act:resume` | Uses handoff if available |
| `/act:handoff` | Generates handoff |
| `/act:handoff --save` | Saves for later recovery |

---

*Advanced features documentation for ACT v2.5 Session Recovery*
