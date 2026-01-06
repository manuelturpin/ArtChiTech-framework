---
name: tips-engine
description: Generates contextual tips and anti-patterns based on phase and situation
---

# Tips Engine

## Responsibilities

1. **Contextual tips**: Display help based on situation
2. **Anti-patterns**: Alert on common mistakes
3. **Recommendations**: Suggest next action

## Tips by Situation

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
    message: "Limited context (~30% remaining). Finish current chunk then /status to save.",
    priority: 'high'
  },
  PENDING_ERROR: {
    icon: '⚠️',
    message: "Pending error. /fix recommended before continuing.",
    priority: 'high'
  },
  READY_FOR_NEXT: {
    icon: '✅',
    message: "Phase checklist complete. /next to validate and proceed.",
    priority: 'medium'
  },
  LONG_SESSION: {
    icon: '⏰',
    message: "Long session (> 2h). A /status will create a save point.",
    priority: 'low'
  },
  FIRST_SESSION: {
    icon: '👋',
    message: "Welcome! Type /resume to continue or /projet to start.",
    priority: 'medium'
  },
  BLOCKED: {
    icon: '🚫',
    message: "Blocked by critical errors. Resolve with /fix before continuing.",
    priority: 'high'
  },
  IDLE: {
    icon: '💤',
    message: "Project inactive for 24h. /status to see where you left off.",
    priority: 'low'
  }
}
```

## Situation Detection

```typescript
function detectSituation(state: ProjectState): TipSituation | null {
  // Priority: HIGH > MEDIUM > LOW

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

## Anti-Patterns by Phase

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

## Tip Display

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

## Integration

Automatically called by:
- `/status`: Displays relevant tip
- `/projet`: Displays tip if situation detected
- After each action: Checks conditions
