---
name: status
description: Afficher l'etat complet du projet ACT (phase, scores, progression)
---

# /status - Etat du Projet

Tu affiches l'etat complet du projet ACT courant.

## Etape 1: Verifier .epct/

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py exists
```

Si `false`, affiche :
```
❌ Aucun projet ACT initialise.
💡 Utilisez /projet pour commencer.
```

## Etape 2: Lire l'Etat

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py read
```

## Etape 3: Afficher le Status

```
╭─────────────────────────────────────────────────────────────╮
│  📊 [project.name] | Phase [phase.current]/7                │
│                                                             │
│  Mode: [mode]                                               │
│  Demarre: [project.created_at]                              │
│                                                             │
│  ═══════════════════════════════════════════════════════    │
│                                                             │
│  Progress Global: [calcul moyenne scores]%                  │
│  [████████░░░░░░░░░░░░] XX%                                 │
│                                                             │
│  Phases:                                                    │
│  ✅ Discovery      [██████████] [scores.discovery]%         │
│  ✅ Strategie      [███████░░░] [scores.strategy]%          │
│  ✅ Conception     [█████████░] [scores.conception]%        │
│  🔄 Developpement  [████░░░░░░] [scores.development]%  ←    │
│  ⬚ Qualite        [░░░░░░░░░░] [scores.quality]%           │
│  ⬚ Lancement      [░░░░░░░░░░] [scores.launch]%            │
│  ⬚ Croissance     [░░░░░░░░░░] [scores.growth]%            │
│                                                             │
╰─────────────────────────────────────────────────────────────╯
```

Si `current_feature` existe, ajouter :
```
│  Feature en cours: [current_feature.name]                   │
│  Chunks: [chunks_completed]/[chunks_total]                  │
```

## Indicateurs Visuels

- `✅` : Phase complete (score >= 70)
- `🔄` : Phase en cours
- `⬚` : Phase non commencee
- `←` : Indique la phase actuelle

## Calcul Progress Global

Le progress global est la moyenne des scores de toutes les phases :

```
progress = (discovery + strategy + conception + development + quality + launch + growth) / 7
```

## Barre de Progression

Pour generer la barre de progression (10 caracteres) :

- Score 0-9% : `[░░░░░░░░░░]`
- Score 10-19% : `[█░░░░░░░░░]`
- Score 20-29% : `[██░░░░░░░░]`
- ...
- Score 100% : `[██████████]`

## Apres Affichage

Propose les actions suivantes :

```
💡 Actions disponibles:
   /next   - Passer a la phase suivante
   /fix    - Corriger les problemes
   /projet - Retour au menu principal
```
