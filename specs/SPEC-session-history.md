# SPEC: Session History

**Version:** 1.0.0
**Status:** Implementing
**Author:** ACT v2.5 Team
**Date:** 2026-02-02

---

## Overview

Session History permet de sauvegarder automatiquement un résumé de chaque session de travail et de les consulter ultérieurement. Cette feature améliore la traçabilité et permet de revoir le travail effectué sur un projet.

## Problem Statement

Actuellement, Session Recovery permet de reprendre le travail après un reset de contexte, mais :
- Pas d'historique des sessions passées
- Impossible de revoir ce qui a été fait il y a plusieurs jours
- Les détails des sessions précédentes sont perdus
- Pas de métriques sur les sessions (durée, tokens, commits)

## Goals

1. **Persistence** : Sauvegarder chaque session dans un fichier dédié
2. **Traçabilité** : Pouvoir revoir les sessions passées
3. **Métriques** : Capturer durée, tokens, commits par session
4. **Rotation** : Éviter l'accumulation infinie de fichiers
5. **Intégration** : S'intégrer avec Session Recovery

## Non-Goals

- Analyse statistique avancée des sessions
- Export vers des outils externes
- Synchronisation multi-device
- Historique des modifications fichier par fichier

## Technical Design

### Directory Structure

```
.act/
├── history/
│   ├── .gitkeep
│   ├── 2026-02-01-1430.md
│   ├── 2026-02-01-1830.md
│   └── 2026-02-02-0330.md
├── config.yaml
├── state.md
├── plan.md
├── progress.md
└── findings.md
```

### File Naming Convention

Format: `YYYY-MM-DD-HHmm.md`

- **YYYY** : Année
- **MM** : Mois (01-12)
- **DD** : Jour (01-31)
- **HH** : Heure (00-23)
- **mm** : Minutes (00-59)

Exemple: `2026-02-02-0330.md` = 2 février 2026 à 03:30

### Session Log Format

```markdown
# Session 2026-02-02 03:30

## Metadata
- Durée: 45min
- Tokens utilisés: ~12k
- Commits: 3

## Résumé
- Objectif: [objectif de la session]
- Résultat: ✅/❌ [résultat]

## Actions clés
1. [action 1]
2. [action 2]
3. [action 3]

## Commits
- `abc1234` - feat(module): description
- `def5678` - fix(bug): description

## État final
- Phase: [phase actuelle]
- Prochaine: [prochaine étape]

## Notes
[observations, problèmes rencontrés, décisions prises]
```

### Configuration

Dans `.act/config.yaml` :

```yaml
history:
  enabled: true      # Activer/désactiver l'historique
  maxSessions: 10    # Nombre max de sessions à conserver
  autoSave: true     # Sauvegarde automatique en fin de session
```

### Auto-Save Trigger

La sauvegarde automatique se déclenche :

1. **Stop Hook** : Quand la commande `/act:stop` est appelée
2. **Session End** : Quand l'utilisateur termine explicitement
3. **Manual** : Via `/act:history save`

### Rotation Algorithm

```
When saving new session:
1. List all files in .act/history/ (excluding .gitkeep)
2. Sort by filename (chronological order)
3. If count >= maxSessions:
   a. Calculate files to delete = count - maxSessions + 1
   b. Delete oldest files
4. Save new session file
```

### Data Collection

Pendant la session, collecter :

| Data | Source | Storage |
|------|--------|---------|
| Start time | Session init | Memory |
| Actions | progress.md updates | Memory |
| Commits | Git log during session | Memory |
| Phase changes | state.md updates | Memory |
| Objective | User input / plan.md | Memory |

## Commands

### /act:history

Liste les sessions passées.

```
User: /act:history

## 📜 Session History

| Date | Durée | Commits | Résultat |
|------|-------|---------|----------|
| 2026-02-02 03:30 | 45min | 3 | ✅ |
| 2026-02-01 18:30 | 1h20 | 7 | ✅ |
| 2026-02-01 14:30 | 30min | 2 | ✅ |

Total: 3 sessions

Use `/act:replay <date>` to view details.
```

### /act:replay

Affiche les détails d'une session passée.

```
User: /act:replay 2026-02-01-1830

## 📜 Session Replay: 2026-02-01 18:30

[Full session log content]
```

Supports:
- Date exacte: `/act:replay 2026-02-01-1830`
- Raccourcis: `/act:replay last`, `/act:replay -1`

## Integration

### With Session Recovery

Le catchup report peut inclure un résumé des dernières sessions :

```markdown
## 🔄 Session Recovery

**Projet :** ACT v2.5
**Dernière session :** 2026-02-02 03:30

### Sessions récentes
- 2026-02-02 03:30 - Model Selection ✅
- 2026-02-01 18:30 - Session Recovery ✅
- 2026-02-01 14:30 - Deviation Rules ✅

### Prochaines étapes
...
```

### With Stop Hook

Le Stop Hook déclenche l'auto-save :

```
/act:stop
├── Verify state
├── Save session to history (if autoSave)
├── Display summary
└── Clean exit
```

## Error Handling

| Error | Response |
|-------|----------|
| History disabled | "Session history is disabled. Enable in config.yaml" |
| No sessions | "No sessions found. Start working to create history." |
| Session not found | "Session not found. Use /act:history to list available sessions." |
| Disk full | "Cannot save session: disk full. Consider reducing maxSessions." |
| Permission error | "Cannot write to .act/history/. Check permissions." |

## Security Considerations

- Les session logs peuvent contenir des informations sensibles
- `.act/history/` devrait être dans `.gitignore` si le projet est public
- Les tokens utilisés sont approximatifs (pas de données précises)

## Future Enhancements

1. **Search** : `/act:history search <keyword>`
2. **Compare** : `/act:history diff <session1> <session2>`
3. **Export** : `/act:history export --format=json`
4. **Stats** : `/act:history stats` (temps total, commits total, etc.)

## Test Scenarios

### Scenario 1: First Session

1. User starts working (no history exists)
2. User runs `/act:stop`
3. Session is saved to `.act/history/YYYY-MM-DD-HHmm.md`
4. Verify file format is correct

### Scenario 2: Rotation

1. Create 10 session files manually
2. Run auto-save
3. Verify oldest session is deleted
4. Verify 10 files remain

### Scenario 3: Replay

1. User runs `/act:replay 2026-02-01-1430`
2. System displays full session log
3. Format is readable and complete

### Scenario 4: History List

1. User runs `/act:history`
2. System lists all sessions
3. List is sorted chronologically (newest first)
4. Metadata is accurate

## Dependencies

- Session Recovery (for catchup integration)
- Stop Hook (for auto-save trigger)
- Progress tracking (for action collection)

## Rollout Plan

1. Create `.act/history/` structure
2. Implement session log format
3. Add auto-save on Stop Hook
4. Implement rotation
5. Add `/act:history` command
6. Add `/act:replay` command
7. Integrate with Session Recovery

---

*SPEC for ACT v2.5 Session History*
