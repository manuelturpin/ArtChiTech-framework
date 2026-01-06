---
name: resume
description: Reprendre une session de travail precedente
---

# /resume - Reprise de Session

Tu aides a reprendre le travail la ou il s'etait arrete.

## Etape 1: Verifier l'Etat

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py read
```

Si pas de `.epct/`, affiche :
```
❌ Aucun projet ACT a reprendre.
💡 Utilisez /projet pour commencer.
```

## Etape 2: Analyser le Contexte

Affiche le resume :
```
╭─────────────────────────────────────────────────────────────╮
│  🔄 Reprise de Session                                      │
│                                                             │
│  Projet: [project.name]                                     │
│  Phase: [phase.name] ([phase.current]/7)                    │
│  Mode: [mode]                                               │
│                                                             │
```

Si `current_feature` existe :
```
│  Feature en cours: [current_feature.name]                   │
│  Progress: [chunks_completed]/[chunks_total] chunks         │
│                                                             │
│  Derniere action: [description]                             │
│                                                             │
│  Continuer cette feature ? [o/n]                            │
╰─────────────────────────────────────────────────────────────╯
```

Sinon :
```
│  Aucune tache en cours.                                     │
│                                                             │
│  Options:                                                   │
│  1. Voir le status complet (/status)                        │
│  2. Continuer la phase actuelle (/projet)                   │
│  3. Restaurer un checkpoint precedent                       │
╰─────────────────────────────────────────────────────────────╯
```

## Etape 3: Restaurer un Checkpoint (si demande)

Liste les checkpoints disponibles :
```bash
ls -la .epct/history/checkpoints/
```

```
Checkpoints disponibles:
[1] 2026-01-06T10-30-00.json - Phase 3, Score 85%
[2] 2026-01-05T15-45-00.json - Phase 3, Score 70%
[3] 2026-01-04T09-00-00.json - Phase 2, Score 65%

Restaurer lequel ? [numero]
```

Si choix fait :
```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py recover \
  --checkpoint-file "[filename]"
```

## Apres Restauration

Affiche :
```
✅ Checkpoint restaure !

📊 Etat actuel:
   Phase: [phase.name] ([phase.current]/7)
   Score: [score]%

💡 Utilisez /status pour voir les details.
```

## Cas Speciaux

### Session Ancienne (> 7 jours)

```
⚠️  Session trouvee mais ancienne (il y a [X] jours)

Le contexte peut etre incomplet ou obsolete.
Recommandation : /onboard pour re-auditer le projet.

Continuer quand meme ? [o/n]
```

### Plusieurs Features en Cours

Si le state montre plusieurs features non terminees :

```
⚠️  Plusieurs features detectees :

1. [feature1.name] - [status]
2. [feature2.name] - [status]

Laquelle continuer ? [numero]
```

### Aucun Checkpoint

Si `.epct/history/checkpoints/` est vide :

```
📁 Aucun checkpoint sauvegarde.

Le projet est en phase [phase.name].
Utilisez /status pour voir l'etat actuel.
```
