---
name: phase-controller
description: Manages transitions between phases with Go/No-Go validation and contextual documentation loading
---

# Phase Controller

## Responsibilities

1. **Checklist validation**: Verify completion of current phase
2. **Go/No-Go**: User decision before transition
3. **Doc loading**: Load condensed next phase documentation
4. **State update**: Transition to new phase

## The 7 Phases

| # | Phase | Main Skills |
|---|-------|-------------------|
| 1 | Discovery | brainstorming |
| 2 | Strategy | writing-plans, brainstorming |
| 3 | Design | writing-plans, brainstorming |
| 4 | Development | test-driven-development, code-review |
| 5 | Quality | verification-before-completion, systematic-debugging |
| 6 | Launch | verification-before-completion |
| 7 | Growth | root-cause-tracing, systematic-debugging |

## Implementation

### Check phase checklist

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

### Go/No-Go decision

```typescript
async function goNoGoDecision(phase: number): Promise<boolean> {
  const checklist = checkPhaseChecklist(phase)
  const errors = await skillCall('error-tracker', 'listActiveErrors')
  const blocking = errors.filter(e => e.blocking)

  // Conditions for GO
  const checklistOK = checklist.ready
  const noBlockers = blocking.length === 0
  const testsPass = await runAllTests()

  // Display status
  print(`╭─────────────────────────────────────────────────╮`)
  print(`│  Phase ${getPhaseName(phase)} complete?`)
  print(`├─────────────────────────────────────────────────┤`)
  print(`│  ✅ Checklist: ${checklist.completed}/${checklist.total} items`)
  print(`│  ${noBlockers ? '✅' : '❌'} Blockers: ${blocking.length}`)
  print(`│  ${testsPass ? '✅' : '❌'} Tests: ${testsPass ? 'PASSING' : 'FAILING'}`)
  print(`╰─────────────────────────────────────────────────╯`)

  if (!checklistOK) {
    print(`\n⚠️  Missing items:`)
    checklist.missing.forEach(item => print(`   - ${item.description}`))
  }

  if (blocking.length > 0) {
    print(`\n❌ ${blocking.length} blocker(s). Use /fix before transition.`)
    return false
  }

  if (!testsPass) {
    print(`\n❌ Tests failing. Fix before transition.`)
    return false
  }

  if (!checklistOK) {
    const answer = await askUser(`\n⚠️  Checklist incomplete. Continue anyway? (y/n)`)
    return answer === 'y'
  }

  const answer = await askUser(`\nProceed to Phase ${getPhaseName(phase + 1)}? (y/n)`)
  return answer === 'y'
}
```

### Transition to next phase

```typescript
async function transitionToPhase(nextPhase: number): Promise<void> {
  const phaseName = getPhaseName(nextPhase)

  // 1. Checkpoint before transition
  await skillCall('context-manager', 'createCheckpoint', `phase-${nextPhase - 1}-complete`)

  // 2. Load condensed next phase doc
  const phaseDoc = await loadFile(`src/reference/phases/${nextPhase}-${phaseName.toLowerCase()}.md`)
  print(`\n📖 Loading documentation: ${phaseName}...`)

  // 3. Update state
  await skillCall('context-manager', 'updateState', {
    currentPhase: nextPhase,
    phaseName,
    progress: {
      phase: 0,
      overall: ((nextPhase - 1) / 7) * 100
    }
  })

  // 4. Display phase summary
  print(`\n✅ Transition to Phase ${nextPhase}: ${phaseName}`)
  print(`\n📋 Phase checklist (${getChecklistLength(nextPhase)} items)`)
  print(`🔧 Active skills: ${getPhaseSkills(nextPhase).join(', ')}`)
  print(`\n💡 Use /help to see the complete documentation for this phase`)
}
```

## Contextual Loading

Only the condensed version of the current phase is loaded in context:
- Phase 4 active → `4-development.md` loaded
- Token savings (7 files × ~500 words = 3500 words, vs 1 × 500 = 6× token savings)

## Go/No-Go Messages

### Ready to proceed

```
╭─────────────────────────────────────────────────╮
│  Phase Development complete?                    │
├─────────────────────────────────────────────────┤
│  ✅ Checklist: 12/12 items                      │
│  ✅ Blockers: 0                                 │
│  ✅ Tests: PASSING                              │
╰─────────────────────────────────────────────────╯

Proceed to Phase Quality? (y/n)
```

### Blockers present

```
╭─────────────────────────────────────────────────╮
│  Phase Development complete?                    │
├─────────────────────────────────────────────────┤
│  ✅ Checklist: 12/12 items                      │
│  ❌ Blockers: 2                                 │
│  ❌ Tests: FAILING                              │
╰─────────────────────────────────────────────────╯

❌ 2 blocker(s). Use /fix before transition.
```

### Checklist incomplete

```
╭─────────────────────────────────────────────────╮
│  Phase Development complete?                    │
├─────────────────────────────────────────────────┤
│  ⚠️  Checklist: 10/12 items                     │
│  ✅ Blockers: 0                                 │
│  ✅ Tests: PASSING                              │
╰─────────────────────────────────────────────────╯

⚠️  Missing items:
   - API Documentation
   - Integration tests

Checklist incomplete. Continue anyway? (y/n)
```

## Phase Names

```typescript
function getPhaseName(phase: number): string {
  const names = {
    1: 'Discovery',
    2: 'Strategy',
    3: 'Design',
    4: 'Development',
    5: 'Quality',
    6: 'Launch',
    7: 'Growth'
  }
  return names[phase] || 'Unknown'
}
```
