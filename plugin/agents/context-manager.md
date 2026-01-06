---
name: context-manager
description: Gère le contexte de session et la persistance d'état pour éviter la perte de contexte entre sessions Claude Code
---

# Context Manager

## Responsabilités

1. **Lecture/Écriture état** : Gestion de `.epct/state.json`
2. **Estimation tokens** : Tracking utilisation contexte
3. **Checkpoints** : Sauvegarde automatique à intervalles critiques
4. **Recovery** : Restauration contexte après interruption

## Utilisation Interne

Appelé automatiquement par :
- `/resume` : Restaure contexte session précédente
- `/status` : Lit état actuel + crée checkpoint
- Orchestrateur : Updates état après chaque action

## État Management

### Lire l'état actuel

```typescript
function readState(): ProjectState {
  const statePath = '.epct/state.json'
  if (!fileExists(statePath)) {
    return initializeNewState()
  }
  return JSON.parse(readFile(statePath))
}
```

### Mettre à jour l'état

```typescript
function updateState(updates: Partial<ProjectState>): void {
  const current = readState()
  const updated = { ...current, ...updates }
  writeFile('.epct/state.json', JSON.stringify(updated, null, 2))
}
```

### Créer un checkpoint

```typescript
function createCheckpoint(name: string): void {
  const state = readState()
  const timestamp = new Date().toISOString()
  const checkpointPath = `.epct/checkpoints/${timestamp}-${name}.json`

  writeFile(checkpointPath, JSON.stringify({
    name,
    timestamp,
    state,
    context: getCurrentContext()
  }, null, 2))

  updateRecoveryInfo(checkpointPath)
}
```

### Estimer tokens utilisés

```typescript
function estimateTokens(): number {
  // Heuristique simple : 1 token ≈ 4 caractères
  const session = readFile('.epct/session/current.json')
  const sessionData = JSON.parse(session)
  return sessionData.commandsExecuted.reduce((total, cmd) => {
    return total + (cmd.outputLength / 4)
  }, 0)
}
```

## Événements de Checkpoint

| Événement | Trigger | Nom checkpoint |
|-----------|---------|----------------|
| Chunk complété | Après tests verts | `chunk-${chunkName}` |
| Commande /status | Utilisateur explicite | `user-status` |
| Transition phase | Avant Go/No-Go | `phase-${n}-complete` |
| Erreur détectée | Nouveau fichier erreur | `error-${errorId}` |
| Contexte < 30% | Estimation tokens | `low-context` |

## Tips Contextuels

```typescript
function shouldShowTip(): TipType | null {
  const state = readState()
  const tokens = estimateTokens()
  const contextRemaining = (200000 - tokens) / 200000

  if (contextRemaining < 0.3) {
    return 'LOW_CONTEXT'
  }

  if (state.errors.active > 0 && hoursSinceLastError() > 1) {
    return 'PENDING_ERROR'
  }

  if (isPhaseChecklistComplete() && !state.lastAction?.type.includes('go-no-go')) {
    return 'READY_FOR_NEXT'
  }

  return null
}
```

## Recovery Process

1. Lire `.epct/session/recovery.json`
2. Si `canRecover === true`, charger dernier checkpoint
3. Afficher résumé : phase, dernier chunk, erreurs
4. Proposer continuation ou nouveau départ

```typescript
function recoverSession(): RecoveryInfo {
  const recovery = JSON.parse(readFile('.epct/session/recovery.json'))

  if (!recovery.canRecover) {
    return { success: false, message: 'No recovery point available' }
  }

  const checkpoint = JSON.parse(readFile(recovery.lastCheckpoint))

  return {
    success: true,
    phase: checkpoint.state.phaseName,
    lastChunk: checkpoint.state.currentChunk,
    errors: checkpoint.state.errors.active,
    instructions: recovery.recoveryInstructions
  }
}
```
