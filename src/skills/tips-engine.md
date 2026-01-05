---
name: tips-engine
description: Génère tips contextuels et anti-patterns selon phase et situation
---

# Tips Engine

## Responsabilités

1. **Tips contextuels** : Afficher aide selon situation
2. **Anti-patterns** : Alerter sur erreurs courantes
3. **Recommendations** : Suggérer prochaine action

## Tips par Situation

```typescript
type TipSituation =
  | 'LOW_CONTEXT'
  | 'PENDING_ERROR'
  | 'READY_FOR_NEXT'
  | 'LONG_SESSION'
  | 'FIRST_SESSION'
  | 'BLOCKED'
  | 'IDLE'

const tips: Record<TipSituation, Tip> = {
  LOW_CONTEXT: {
    icon: '💡',
    message: "Contexte limité (~30% restant). Terminez le chunk actuel puis /status pour sauvegarder.",
    priority: 'high'
  },
  PENDING_ERROR: {
    icon: '⚠️',
    message: "Erreur en attente. /fix recommandé avant de continuer.",
    priority: 'high'
  },
  READY_FOR_NEXT: {
    icon: '✅',
    message: "Checklist phase complète. /next pour valider et avancer.",
    priority: 'medium'
  },
  LONG_SESSION: {
    icon: '⏰',
    message: "Session longue (> 2h). Un /status créera un point de sauvegarde.",
    priority: 'low'
  },
  FIRST_SESSION: {
    icon: '👋',
    message: "Bienvenue ! Tapez /resume pour reprendre ou /projet pour commencer.",
    priority: 'medium'
  },
  BLOCKED: {
    icon: '🚫',
    message: "Bloqué par erreurs critiques. Résolvez avec /fix avant de continuer.",
    priority: 'high'
  },
  IDLE: {
    icon: '💤',
    message: "Projet inactif depuis 24h. /status pour voir où vous en êtes.",
    priority: 'low'
  }
}
```

## Détection Situation

```typescript
function detectSituation(state: ProjectState): TipSituation | null {
  // Priorité : HIGH > MEDIUM > LOW

  // HIGH priority
  if (state.errors.blocking) {
    return 'BLOCKED'
  }

  if (getContextRemaining() < 0.3) {
    return 'LOW_CONTEXT'
  }

  if (state.errors.active > 0) {
    return 'PENDING_ERROR'
  }

  // MEDIUM priority
  if (isPhaseChecklistComplete(state.currentPhase)) {
    return 'READY_FOR_NEXT'
  }

  if (isFirstSession()) {
    return 'FIRST_SESSION'
  }

  // LOW priority
  if (getSessionDuration() > 2 * 60 * 60 * 1000) {
    return 'LONG_SESSION'
  }

  if (hoursSinceLastAction() > 24) {
    return 'IDLE'
  }

  return null
}
```

## Anti-Patterns par Phase

```typescript
function getPhaseAntiPatterns(phase: number): string[] {
  const antiPatterns = {
    1: [
      "Building before validation",
      "Solution-first thinking",
      "Skipping user research"
    ],
    2: [
      "Feature creep in MVP",
      "Unrealistic timelines",
      "Vague success metrics"
    ],
    3: [
      "Over-engineering",
      "Shiny object syndrome",
      "Skipping security planning"
    ],
    4: [
      "Skipping tests",
      "Big bang commits",
      "Cowboy coding"
    ],
    5: [
      "Testing in production only",
      "Ignoring edge cases",
      "Manual testing only"
    ],
    6: [
      "Big bang launch",
      "No rollback plan",
      "Ignoring metrics"
    ],
    7: [
      "Vanity metrics focus",
      "Ignoring churn",
      "Feature factory mode"
    ]
  }

  return antiPatterns[phase] || []
}
```

## Affichage Tips

```typescript
function displayTip(situation: TipSituation): void {
  const tip = tips[situation]

  if (tip.priority === 'high') {
    print(`\n${tip.icon} ${tip.message}\n`)
  } else {
    print(`${tip.icon} ${tip.message}`)
  }
}
```

## Intégration

Appelé automatiquement par :
- `/status` : Affiche tip pertinent
- `/projet` : Affiche tip si situation détectée
- Après chaque action : Vérifie conditions
