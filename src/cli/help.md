---
name: help
command: /help
description: Affiche l'aide contextuelle (phase actuelle, commandes, anti-patterns)
---

# /help - Aide Contextuelle

## Comportement

Affiche aide selon phase actuelle :
- Documentation phase condensée
- Liste des commandes
- Tips et anti-patterns pertinents

## Affichage

```
╭─────────────────────────────────────────────────────╮
│  📖 Aide - Phase Développement (4/7)                │
╰─────────────────────────────────────────────────────╯

## Objectif
Implémenter le MVP avec qualité

## Skills Actifs
- superpowers:test-driven-development
- superpowers:code-review

## Commandes

  /projet   Hub principal, menu interactif
  /resume   Reprendre session précédente
  /status   Voir état et progression
  /fix      Corriger erreur prioritaire
  /next     Passer à l'étape suivante
  /help     Cette aide

## Anti-Patterns à Éviter

  ⚠️  Skipping tests - "Je testerai plus tard" → jamais
  ⚠️  Big bang commits - Commits massifs difficiles à review
  ⚠️  Cowboy coding - Merge sans review

## Checklist Phase (12 items)

  ✅ Environment setup
  ✅ CI/CD pipeline
  🔄 Core features (en cours)
  ○  Tests unitaires
  ○  Tests d'intégration
  ...

💡 Tip: Utilisez /status pour voir la progression détaillée
```

## Implémentation

```typescript
async function executeHelpCommand(topic?: string) {
  const state = await skillCall('context-manager', 'readState')

  if (topic) {
    return await showSpecificHelp(topic)
  }

  // Header
  printBox({
    title: `📖 Aide - Phase ${state.phaseName} (${state.currentPhase}/7)`
  })

  // 1. Objectif phase
  const phaseDoc = await loadPhaseDoc(state.currentPhase)
  print(`\n## Objectif`)
  print(phaseDoc.objective)

  // 2. Skills actifs
  print(`\n## Skills Actifs`)
  const skills = getPhaseSkills(state.currentPhase)
  skills.forEach(skill => print(`- ${skill}`))

  // 3. Commandes
  print(`\n## Commandes\n`)
  printCommandList()

  // 4. Anti-patterns
  print(`\n## Anti-Patterns à Éviter\n`)
  const antiPatterns = await skillCall('tips-engine', 'getPhaseAntiPatterns', state.currentPhase)
  antiPatterns.forEach(ap => print(`  ⚠️  ${ap}`))

  // 5. Checklist résumé
  print(`\n## Checklist Phase (${getChecklistLength(state.currentPhase)} items)\n`)
  const checklist = await getPhaseChecklist(state.currentPhase)
  const preview = checklist.slice(0, 5)
  preview.forEach(item => {
    const icon = item.done ? '✅' : item.inProgress ? '🔄' : '○'
    print(`  ${icon} ${item.description}`)
  })
  if (checklist.length > 5) {
    print(`  ...`)
  }

  // 6. Tip contextuel
  const tip = await skillCall('tips-engine', 'detectSituation', state)
  if (tip) {
    print()
    await skillCall('tips-engine', 'displayTip', tip)
  }
}

function printCommandList() {
  const commands = [
    { cmd: '/projet', desc: 'Hub principal, menu interactif' },
    { cmd: '/resume', desc: 'Reprendre session précédente' },
    { cmd: '/status', desc: 'Voir état et progression' },
    { cmd: '/fix', desc: 'Corriger erreur prioritaire' },
    { cmd: '/next', desc: "Passer à l'étape suivante" },
    { cmd: '/help', desc: 'Cette aide' }
  ]

  commands.forEach(({ cmd, desc }) => {
    print(`  ${cmd.padEnd(10)} ${desc}`)
  })
}
```

## Aide Spécifique

```typescript
async function showSpecificHelp(topic: string) {
  const topics = {
    'commands': showCommandsHelp,
    'phases': showPhasesHelp,
    'workflow': showWorkflowHelp,
    'tdd': showTDDHelp,
    'errors': showErrorsHelp
  }

  const handler = topics[topic.toLowerCase()]
  if (handler) {
    await handler()
  } else {
    print(`Topic inconnu: ${topic}`)
    print(`Topics disponibles: ${Object.keys(topics).join(', ')}`)
  }
}
```

## Topics Disponibles

| Topic | Description |
|-------|-------------|
| `/help commands` | Liste complète des commandes |
| `/help phases` | Les 7 phases du framework |
| `/help workflow` | Workflow chunk-test-fix |
| `/help tdd` | Guide TDD détaillé |
| `/help errors` | Gestion des erreurs |
