---
name: project-orchestrator
description: Main orchestrator that coordinates all skills and manages the /project interactive menu
---

# Project Orchestrator

## Responsibilities

1. **Interactive menu**: Main /project interface
2. **Skills coordination**: Activates skills based on phase and context
3. **Global workflow**: Manages flow from discovery to growth
4. **Project initialization**: New project setup

## /project Menu

```
╭─────────────────────────────────────────────────────╮
│  What would you like to do?                         │
│                                                     │
│  1. 🆕 Start a new project                          │
│  2. ➕ Add a feature                                │
│  3. 🔧 Refactoring/optimization                     │
│  4. 📋 View current phase checklist                 │
│  5. ⏭️  Move to next phase                          │
│                                                     │
│  Type a number or describe your need...             │
╰─────────────────────────────────────────────────────╯
```

## Implementation

### Main menu

```typescript
async function showProjectMenu() {
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
    { id: 1, label: '➕ Add a feature', action: 'add_feature' },
    { id: 2, label: '🔧 Refactoring/optimization', action: 'refactor' },
    { id: 3, label: '📋 View current phase checklist', action: 'show_checklist' },
    { id: 4, label: '⏭️  Move to next phase', action: 'next_phase' },
    { id: 5, label: '📊 View full status', action: 'status' }
  ]
}

function getNewProjectOptions(): MenuOption[] {
  return [
    { id: 1, label: '🆕 Start a new project', action: 'new_project' },
    { id: 2, label: '📖 Learn more about the framework', action: 'help' }
  ]
}
```

### New project (Discovery)

```typescript
async function startNewProject() {
  print("🆕 New Project\n")

  // 1. Collect basic info
  const name = await askUser("Project name?")
  const type = await askUser("Type? (webapp/mobile/feature/refactor)")

  // 2. Initialize state
  await skillCall('context-manager', 'updateState', {
    project: {
      name,
      type,
      created: new Date().toISOString()
    },
    currentPhase: 1,
    phaseName: 'Discovery'
  })

  // 3. Activate brainstorming for Discovery
  print("\n🎯 Discovery Phase: Problem Validation\n")
  print("Activating brainstorming skill...\n")

  await skillCall('superpowers:brainstorming', {
    context: `New ${type} project: ${name}`,
    goal: 'Validate the problem and define the value proposition'
  })

  // Brainstorming will guide towards JTBD, Value Proposition Canvas, etc.
}
```

### Add feature (current phase)

```typescript
async function addFeature() {
  const state = await skillCall('context-manager', 'readState')

  print(`\n➕ Add Feature - ${state.phaseName} Phase\n`)

  const featureName = await askUser("Feature name?")
  const featureDesc = await askUser("Short description?")

  // Activate skills based on phase
  const phaseSkills = getPhaseSkills(state.currentPhase)

  if (state.currentPhase <= 3) {
    // Discovery/Strategy/Design: brainstorming
    await skillCall('superpowers:brainstorming', {
      feature: featureName,
      description: featureDesc
    })
  } else if (state.currentPhase === 4) {
    // Development: chunk-manager + TDD
    await skillCall('chunk-manager', 'planFeature', {
      name: featureName,
      description: featureDesc
    })
  }
}
```

## Automatic Skills Activation

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

## Action Handling

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

  // Search by number or text
  const action = findAction(choice, actions)

  if (action) {
    await action()
  } else {
    // Free text → interpret as need description
    await interpretUserNeed(choice, state)
  }
}
```

## Need Interpretation

```typescript
async function interpretUserNeed(description: string, state: ProjectState) {
  // Analyze text to determine intent
  const keywords = {
    'new': 'new_project',
    'create': 'new_project',
    'add': 'add_feature',
    'feature': 'add_feature',
    'refactor': 'refactor',
    'optimize': 'refactor',
    'status': 'status',
    'state': 'status',
    'next': 'next_phase',
    'advance': 'next_phase'
  }

  for (const [keyword, action] of Object.entries(keywords)) {
    if (description.toLowerCase().includes(keyword)) {
      return handleMenuChoice(action, state)
    }
  }

  // No match → ask for clarification
  print("I didn't understand. Can you clarify?")
  print("Examples: 'add a feature', 'view status', 'move to next phase'")
}
```
