---
name: projet-orchestrator
description: Orchestrateur principal qui coordonne tous les skills et gère le menu interactif /projet
---

# Projet Orchestrator

## Responsabilités

1. **Menu interactif** : Interface principale /projet
2. **Coordination skills** : Active skills selon phase et contexte
3. **Workflow global** : Gère flux discovery → croissance
4. **Initialisation projet** : Setup nouveau projet

## Menu /projet

```
╭─────────────────────────────────────────────────────╮
│  Que voulez-vous faire ?                            │
│                                                     │
│  1. 🆕 Démarrer un nouveau projet                   │
│  2. ➕ Ajouter une feature                          │
│  3. 🔧 Refactoring/optimisation                     │
│  4. 📋 Voir checklist phase actuelle                │
│  5. ⏭️  Passer à la phase suivante                  │
│                                                     │
│  Tapez le numéro ou décrivez votre besoin...        │
╰─────────────────────────────────────────────────────╯
```

## Implémentation

### Menu principal

```typescript
async function showProjetMenu() {
  const state = await skillCall('context-manager', 'readState')
  const hasProject = state.project.name !== ''

  const options = hasProject ?
    getActiveProjectOptions(state) :
    getNewProjectOptions()

  displayMenu(options)

  const choice = await getUserInput()
  await handleMenuChoice(choice, state)
}

function getActiveProjectOptions(state: ProjectState): MenuOption[] {
  return [
    { id: 1, label: '➕ Ajouter une feature', action: 'add_feature' },
    { id: 2, label: '🔧 Refactoring/optimisation', action: 'refactor' },
    { id: 3, label: '📋 Voir checklist phase actuelle', action: 'show_checklist' },
    { id: 4, label: '⏭️  Passer à la phase suivante', action: 'next_phase' },
    { id: 5, label: '📊 Voir status complet', action: 'status' }
  ]
}

function getNewProjectOptions(): MenuOption[] {
  return [
    { id: 1, label: '🆕 Démarrer un nouveau projet', action: 'new_project' },
    { id: 2, label: '📖 En savoir plus sur le framework', action: 'help' }
  ]
}
```

### Nouveau projet (Discovery)

```typescript
async function startNewProject() {
  print("🆕 Nouveau Projet\n")

  // 1. Collecter infos basiques
  const name = await askUser("Nom du projet ?")
  const type = await askUser("Type ? (webapp/mobile/feature/refacto)")

  // 2. Initialiser état
  await skillCall('context-manager', 'updateState', {
    project: {
      name,
      type,
      created: new Date().toISOString()
    },
    currentPhase: 1,
    phaseName: 'Discovery'
  })

  // 3. Activer brainstorming pour Discovery
  print("\n🎯 Phase Discovery : Validation du problème\n")
  print("Activation skill brainstorming...\n")

  await skillCall('superpowers:brainstorming', {
    context: `Nouveau projet ${type} : ${name}`,
    goal: 'Valider le problème et définir la proposition de valeur'
  })

  // Brainstorming guidera vers JTBD, Value Proposition Canvas, etc.
}
```

### Ajouter feature (current phase)

```typescript
async function addFeature() {
  const state = await skillCall('context-manager', 'readState')

  print(`\n➕ Ajouter Feature - Phase ${state.phaseName}\n`)

  const featureName = await askUser("Nom de la feature ?")
  const featureDesc = await askUser("Description courte ?")

  // Activer skills selon phase
  const phaseSkills = getPhaseSkills(state.currentPhase)

  if (state.currentPhase <= 3) {
    // Discovery/Stratégie/Conception : brainstorming
    await skillCall('superpowers:brainstorming', {
      feature: featureName,
      description: featureDesc
    })
  } else if (state.currentPhase === 4) {
    // Développement : chunk-manager + TDD
    await skillCall('chunk-manager', 'planFeature', {
      name: featureName,
      description: featureDesc
    })
  }
}
```

## Activation Skills Automatique

```typescript
function getPhaseSkills(phase: number): string[] {
  const skillMap = {
    1: ['superpowers:brainstorming'],
    2: ['superpowers:writing-plans', 'superpowers:brainstorming'],
    3: ['superpowers:writing-plans', 'superpowers:brainstorming'],
    4: ['superpowers:test-driven-development', 'superpowers:code-review'],
    5: ['superpowers:verification-before-completion', 'superpowers:systematic-debugging'],
    6: ['superpowers:verification-before-completion'],
    7: ['superpowers:root-cause-tracing', 'superpowers:systematic-debugging']
  }
  return skillMap[phase] || []
}

async function activatePhaseSkills(phase: number) {
  const skills = getPhaseSkills(phase)
  for (const skill of skills) {
    await skillCall(skill, 'activate')
  }
}
```

## Gestion des Actions

```typescript
async function handleMenuChoice(choice: string, state: ProjectState) {
  const actions = {
    'new_project': startNewProject,
    'add_feature': addFeature,
    'refactor': startRefactoring,
    'show_checklist': showPhaseChecklist,
    'next_phase': () => skillCall('phase-controller', 'goNoGoDecision', state.currentPhase),
    'status': executeStatusCommand,
    'help': executeHelpCommand
  }

  // Chercher par numéro ou texte
  const action = findAction(choice, actions)

  if (action) {
    await action()
  } else {
    // Texte libre → interpréter comme description de besoin
    await interpretUserNeed(choice, state)
  }
}
```

## Interprétation Besoins

```typescript
async function interpretUserNeed(description: string, state: ProjectState) {
  // Analyser le texte pour déterminer l'intention
  const keywords = {
    'nouveau': 'new_project',
    'créer': 'new_project',
    'ajouter': 'add_feature',
    'feature': 'add_feature',
    'refactor': 'refactor',
    'optimiser': 'refactor',
    'status': 'status',
    'état': 'status',
    'suivant': 'next_phase',
    'avancer': 'next_phase'
  }

  for (const [keyword, action] of Object.entries(keywords)) {
    if (description.toLowerCase().includes(keyword)) {
      return handleMenuChoice(action, state)
    }
  }

  // Aucun match → demander clarification
  print("Je n'ai pas compris. Pouvez-vous préciser ?")
  print("Exemples : 'ajouter une feature', 'voir le status', 'passer à la suite'")
}
```
