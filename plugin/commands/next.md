---
name: next
description: Verifier les criteres Go/No-Go et passer a la phase suivante
---

# /next - Phase Suivante

Tu geres la transition vers la phase suivante du projet ACT.

## Etape 1: Lire l'Etat

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py read
```

Si phase actuelle = 7, affiche :
```
🎉 Felicitations ! Vous etes en phase Croissance (7/7).
C'est la derniere phase - continuez a iterer !
```

## Etape 2: Verifier Go/No-Go

Le score de la phase actuelle doit etre >= 70% pour passer.

Consulte les criteres dans le skill `phase-scoring` :
- Discovery : README, probleme defini, users
- Strategie : Roadmap, business model
- Conception : Architecture, specs
- Developpement : Code, tests, CI
- Qualite : Coverage, bugs
- Lancement : Deploy, monitoring
- Croissance : Analytics, feedback

## Etape 3a: Si Criteres OK (score >= 70)

Affiche :
```
╭─────────────────────────────────────────────────────────────╮
│  ✅ Phase [current] : [name] terminee !                     │
│                                                             │
│  Score: [score]%                                            │
│  Criteres valides:                                          │
│  ✓ [critere 1]                                              │
│  ✓ [critere 2]                                              │
│  ✓ [critere 3]                                              │
│                                                             │
│  Passer a la phase [next] : [next-name] ?                   │
│  [o/n]                                                      │
╰─────────────────────────────────────────────────────────────╯
```

Si oui :
1. Cree un checkpoint
2. Met a jour la phase

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py checkpoint
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py update \
  --updates '{"phase": {"current": [next], "name": "[next-name]", "started_at": "[now]"}}'
```

Affiche :
```
🎯 Phase [next-name] activee !
💡 Utilisez /projet pour voir les actions disponibles.
```

## Etape 3b: Si Criteres NON OK (score < 70)

Affiche :
```
╭─────────────────────────────────────────────────────────────╮
│  ❌ Impossible de passer a la phase suivante                │
│                                                             │
│  Phase actuelle: [name] ([current]/7)                       │
│  Score: [score]% (minimum requis: 70%)                      │
│                                                             │
│  Criteres manquants:                                        │
│  ✗ [critere manquant 1]                                     │
│  ✗ [critere manquant 2]                                     │
│                                                             │
│  💡 Actions recommandees:                                   │
│  1. [action pour critere 1]                                 │
│  2. [action pour critere 2]                                 │
│                                                             │
│  Utilisez /fix pour corriger les problemes.                 │
╰─────────────────────────────────────────────────────────────╯
```

## Noms des Phases

| Phase | Nom |
|-------|-----|
| 1 | Discovery |
| 2 | Strategie |
| 3 | Conception |
| 4 | Developpement |
| 5 | Qualite |
| 6 | Lancement |
| 7 | Croissance |

## Criteres Go/No-Go par Phase

### Phase 1 → 2 (Discovery → Strategie)
- README avec probleme documente
- Personas/users definis
- Validation initiale faite

### Phase 2 → 3 (Strategie → Conception)
- Roadmap definie
- Business model documente
- KPIs identifies

### Phase 3 → 4 (Conception → Developpement)
- Architecture documentee
- Tech stack choisi
- Specs techniques ecrites

### Phase 4 → 5 (Developpement → Qualite)
- Code source present
- Tests ecrits
- CI/CD configure

### Phase 5 → 6 (Qualite → Lancement)
- Coverage >= 60%
- Pas de bugs critiques
- Performance validee

### Phase 6 → 7 (Lancement → Croissance)
- Deploye en production
- Monitoring en place
- Documentation utilisateur
