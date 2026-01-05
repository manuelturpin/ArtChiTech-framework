---
name: status
command: /status
description: Affiche l'état actuel du projet, la progression, et crée un checkpoint
---

# /status - État du Projet

## Comportement

1. Lit `.epct/state.json`
2. Calcule progression phase et globale
3. Liste tâches en cours, erreurs, prochaines étapes
4. Crée checkpoint automatique
5. Affiche tips contextuels si pertinent

## Affichage

```
╭─────────────────────────────────────────────────────╮
│  🚀 mon-app | Phase: Développement (4/7)           │
├─────────────────────────────────────────────────────┤
│  Progression phase : ████████░░░░░░░░ 52%          │
│  Santé projet      : 🟢 Vert (0 bloqueurs)         │
├─────────────────────────────────────────────────────┤
│  EN COURS (2)                                       │
│  ├─ 🔄 Implémenter UserService [chunk 2/4]         │
│  └─ 🔄 Tests unitaires auth module                 │
│                                                     │
│  ERREURS À CORRIGER (0)                            │
│                                                     │
│  PROCHAINES (3)                                    │
│  ├─ ○ Integration tests UserService                │
│  ├─ ○ Implémenter ProductService                   │
│  └─ ○ ...                                          │
╰─────────────────────────────────────────────────────╯

💡 Contexte : 65% restant. Bon pour continuer.

✅ Checkpoint créé : user-status
```

## Implémentation

```typescript
async function executeStatusCommand() {
  // 1. Lire état
  const state = await skillCall('context-manager', 'readState')

  // 2. Calculer métriques
  const phaseProgress = calculatePhaseProgress(state)
  const overallProgress = calculateOverallProgress(state)
  const health = determineProjectHealth(state)

  // 3. Afficher status box
  printBox({
    title: `🚀 ${state.project.name} | Phase: ${state.phaseName} (${state.currentPhase}/7)`,
    sections: [
      {
        label: 'Progression phase',
        value: progressBar(phaseProgress) + ` ${phaseProgress}%`
      },
      {
        label: 'Santé projet',
        value: healthIndicator(health)
      }
    ]
  })

  // 4. Lister tâches
  const inProgress = await getTasks('in_progress')
  const errors = await getErrors('active')
  const upcoming = await getTasks('upcoming', 3)

  printSection('EN COURS', inProgress)
  printSection('ERREURS À CORRIGER', errors)
  printSection('PROCHAINES', upcoming)

  // 5. Tips contextuels
  const tip = await skillCall('context-manager', 'shouldShowTip')
  if (tip) {
    print()
    printTip(tip)
  }

  // 6. Créer checkpoint
  await skillCall('context-manager', 'createCheckpoint', 'user-status')
  print()
  print('✅ Checkpoint créé : user-status')
}
```

## Calculs

### Progression Phase

```typescript
function calculatePhaseProgress(state: ProjectState): number {
  const checklist = getPhaseChecklist(state.currentPhase)
  const completed = checklist.filter(item => item.done).length
  return Math.round((completed / checklist.length) * 100)
}
```

### Santé Projet

```typescript
type Health = 'green' | 'yellow' | 'red'

function determineProjectHealth(state: ProjectState): Health {
  const blocking = state.errors.active > 0 && state.errors.blocking
  const stale = hoursSinceLastAction() > 24
  const contextLow = getContextRemaining() < 0.2

  if (blocking) return 'red'
  if (stale || contextLow) return 'yellow'
  return 'green'
}
```

## Indicateurs Santé

- 🟢 **Vert** : 0 bloqueurs, contexte OK, actif < 24h
- 🟡 **Jaune** : Avertissements (contexte bas, inactif, erreurs non-bloquantes)
- 🔴 **Rouge** : Bloqueurs actifs (erreurs critiques, tests fail, etc.)
