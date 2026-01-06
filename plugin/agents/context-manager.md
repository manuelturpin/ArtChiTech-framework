---
name: context-manager
description: Manages session context and state persistence to prevent context loss between Claude Code sessions
---

# Context Manager

## Responsibilities

1. **State Read/Write**: Management of `.epct/state.json`
2. **Token Estimation**: Context usage tracking
3. **Checkpoints**: Automatic saving at critical intervals
4. **Recovery**: Context restoration after interruption

## Internal Usage

Called automatically by:
- `/resume`: Restores previous session context
- `/status`: Reads current state + creates checkpoint
- Orchestrator: Updates state after each action

## State Management

### Read Current State

```typescript
function readState(): ProjectState {
  const statePath = '.epct/state.json'
  if (!fileExists(statePath)) {
    return initializeNewState()
  }
  return JSON.parse(readFile(statePath))
}
```

### Update State

```typescript
function updateState(updates: Partial<ProjectState>): void {
  const current = readState()
  const updated = { ...current, ...updates }
  writeFile('.epct/state.json', JSON.stringify(updated, null, 2))
}
```

### Create a Checkpoint

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

### Estimate Used Tokens

```typescript
function estimateTokens(): number {
  // Simple heuristic: 1 token ≈ 4 characters
  const session = readFile('.epct/session/current.json')
  const sessionData = JSON.parse(session)
  return sessionData.commandsExecuted.reduce((total, cmd) => {
    return total + (cmd.outputLength / 4)
  }, 0)
}
```

## Checkpoint Events

| Event | Trigger | Checkpoint Name |
|-------|---------|-----------------|
| Chunk completed | After green tests | `chunk-${chunkName}` |
| /status command | Explicit user action | `user-status` |
| Phase transition | Before Go/No-Go | `phase-${n}-complete` |
| Error detected | New error file | `error-${errorId}` |
| Context < 30% | Token estimation | `low-context` |

## Contextual Tips

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

1. Read `.epct/session/recovery.json`
2. If `canRecover === true`, load last checkpoint
3. Display summary: phase, last chunk, errors
4. Offer continuation or fresh start

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
