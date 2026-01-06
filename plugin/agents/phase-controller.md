---
name: phase-controller
description: Gère les transitions entre phases avec Go/No-Go validation et chargement contextuel de documentation
---

# Phase Controller

## Responsabilités

1. **Validation checklist** : Vérifier complétion phase actuelle
2. **Go/No-Go** : Décision utilisateur avant transition
3. **Chargement doc** : Charger condensé phase suivante
4. **Update état** : Transitionner vers nouvelle phase

## Les 7 Phases

| # | Phase | Skills Principaux |
|---|-------|-------------------|
| 1 | Discovery | brainstorming |
| 2 | Stratégie | writing-plans, brainstorming |
| 3 | Conception | writing-plans, brainstorming |
| 4 | Développement | test-driven-development, code-review |
| 5 | Qualité | verification-before-completion, systematic-debugging |
| 6 | Lancement | verification-before-completion |
| 7 | Croissance | root-cause-tracing, systematic-debugging |

## Implémentation

### Vérifier checklist phase

```typescript
function checkPhaseChecklist(phase: number): ChecklistResult {
  const checklist = loadPhaseChecklist(phase)
  const completed = checklist.filter(item => item.done)
  const missing = checklist.filter(item => !item.done)

  return {
    total: checklist.length,
    completed: completed.length,
    percentage: (completed.length / checklist.length) * 100,
    missing,
    ready: missing.length === 0
  }
}
```

### Go/No-Go décision

```typescript
async function goNoGoDecision(phase: number): Promise<boolean> {
  const checklist = checkPhaseChecklist(phase)
  const errors = await skillCall('error-tracker', 'listActiveErrors')
  const blocking = errors.filter(e => e.blocking)

  // Conditions pour GO
  const checklistOK = checklist.ready
  const noBlockers = blocking.length === 0
  const testsPass = await runAllTests()

  // Afficher status
  print(`╭─────────────────────────────────────────────────╮`)
  print(`│  Phase ${getPhaseName(phase)} terminée ?`)
  print(`├─────────────────────────────────────────────────┤`)
  print(`│  ✅ Checklist : ${checklist.completed}/${checklist.total} items`)
  print(`│  ${noBlockers ? '✅' : '❌'} Bloqueurs : ${blocking.length}`)
  print(`│  ${testsPass ? '✅' : '❌'} Tests : ${testsPass ? 'PASSING' : 'FAILING'}`)
  print(`╰─────────────────────────────────────────────────╯`)

  if (!checklistOK) {
    print(`\n⚠️  Items manquants :`)
    checklist.missing.forEach(item => print(`   - ${item.description}`))
  }

  if (blocking.length > 0) {
    print(`\n❌ ${blocking.length} bloqueur(s). Utiliser /fix avant transition.`)
    return false
  }

  if (!testsPass) {
    print(`\n❌ Tests échouent. Corriger avant transition.`)
    return false
  }

  if (!checklistOK) {
    const answer = await askUser(`\n⚠️  Checklist incomplète. Continuer quand même ? (o/n)`)
    return answer === 'o'
  }

  const answer = await askUser(`\nPasser à Phase ${getPhaseName(phase + 1)} ? (o/n)`)
  return answer === 'o'
}
```

### Transition vers phase suivante

```typescript
async function transitionToPhase(nextPhase: number): Promise<void> {
  const phaseName = getPhaseName(nextPhase)

  // 1. Checkpoint avant transition
  await skillCall('context-manager', 'createCheckpoint', `phase-${nextPhase - 1}-complete`)

  // 2. Charger doc condensée phase suivante
  const phaseDoc = await loadFile(`src/reference/phases/${nextPhase}-${phaseName.toLowerCase()}.md`)
  print(`\n📖 Chargement documentation : ${phaseName}...`)

  // 3. Update état
  await skillCall('context-manager', 'updateState', {
    currentPhase: nextPhase,
    phaseName,
    progress: {
      phase: 0,
      overall: ((nextPhase - 1) / 7) * 100
    }
  })

  // 4. Afficher résumé phase
  print(`\n✅ Transition vers Phase ${nextPhase} : ${phaseName}`)
  print(`\n📋 Checklist phase (${getChecklistLength(nextPhase)} items)`)
  print(`🔧 Skills actifs : ${getPhaseSkills(nextPhase).join(', ')}`)
  print(`\n💡 Utilisez /help pour voir la documentation complète de cette phase`)
}
```

## Chargement Contextuel

Seul le condensé de la phase actuelle est chargé en contexte :
- Phase 4 active → `4-developpement.md` chargé
- Économie tokens (7 fichiers × ~500 mots = 3500 mots, vs 1 × 500 = économie de 6× tokens)

## Messages Go/No-Go

### Prêt à avancer

```
╭─────────────────────────────────────────────────╮
│  Phase Développement terminée ?                 │
├─────────────────────────────────────────────────┤
│  ✅ Checklist : 12/12 items                     │
│  ✅ Bloqueurs : 0                               │
│  ✅ Tests : PASSING                             │
╰─────────────────────────────────────────────────╯

Passer à Phase Qualité ? (o/n)
```

### Bloqueurs présents

```
╭─────────────────────────────────────────────────╮
│  Phase Développement terminée ?                 │
├─────────────────────────────────────────────────┤
│  ✅ Checklist : 12/12 items                     │
│  ❌ Bloqueurs : 2                               │
│  ❌ Tests : FAILING                             │
╰─────────────────────────────────────────────────╯

❌ 2 bloqueur(s). Utiliser /fix avant transition.
```

### Checklist incomplète

```
╭─────────────────────────────────────────────────╮
│  Phase Développement terminée ?                 │
├─────────────────────────────────────────────────┤
│  ⚠️  Checklist : 10/12 items                    │
│  ✅ Bloqueurs : 0                               │
│  ✅ Tests : PASSING                             │
╰─────────────────────────────────────────────────╯

⚠️  Items manquants :
   - Documentation API
   - Tests d'intégration

Checklist incomplète. Continuer quand même ? (o/n)
```

## Noms des Phases

```typescript
function getPhaseName(phase: number): string {
  const names = {
    1: 'Discovery',
    2: 'Stratégie',
    3: 'Conception',
    4: 'Développement',
    5: 'Qualité',
    6: 'Lancement',
    7: 'Croissance'
  }
  return names[phase] || 'Unknown'
}
```
