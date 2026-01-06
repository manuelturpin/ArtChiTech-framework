---
name: error-tracker
description: Track et priorise les erreurs, empêche progression tant qu'erreurs critiques non résolues
---

# Error Tracker

## Responsabilités

1. **Enregistrement erreurs** : Créer fichiers `.epct/errors/active/`
2. **Priorisation** : Déterminer si erreur bloquante
3. **Historique** : Déplacer vers `resolved/` quand fixé
4. **Alerts** : Notifier si erreurs anciennes non traitées

## Structure Erreur

```json
{
  "id": "001",
  "type": "assertion_failed",
  "chunk": "UserService.create",
  "file": "src/services/UserService.ts",
  "line": 42,
  "message": "Expected user.email to be defined",
  "stackTrace": "...",
  "context": {
    "phase": 4,
    "attemptedFixes": 0
  },
  "severity": "critical",
  "blocking": true,
  "created": "2026-01-04T14:30:00Z"
}
```

## Implémentation

### Enregistrer erreur

```typescript
async function recordError(error: ErrorInfo): Promise<string> {
  const errorId = generateErrorId()
  const errorPath = `.epct/errors/active/${errorId}.json`

  const errorRecord = {
    id: errorId,
    type: classifyError(error),
    chunk: error.chunk,
    file: error.file,
    line: error.line,
    message: error.message,
    stackTrace: error.stackTrace,
    context: {
      phase: getCurrentPhase(),
      attemptedFixes: 0
    },
    severity: determineSeverity(error),
    blocking: isBlocking(error),
    created: new Date().toISOString()
  }

  await writeFile(errorPath, JSON.stringify(errorRecord, null, 2))

  // Update state
  await skillCall('context-manager', 'updateState', {
    errors: {
      active: countActiveErrors() + 1,
      blocking: errorRecord.blocking
    }
  })

  return errorId
}
```

### Résoudre erreur

```typescript
async function resolveError(errorId: string): Promise<void> {
  const activePath = `.epct/errors/active/${errorId}.json`
  const resolvedPath = `.epct/errors/resolved/${errorId}.json`

  const error = JSON.parse(await readFile(activePath))
  error.resolved = new Date().toISOString()

  await writeFile(resolvedPath, JSON.stringify(error, null, 2))
  await deleteFile(activePath)

  await skillCall('context-manager', 'updateState', {
    errors: {
      active: countActiveErrors() - 1,
      blocking: hasBlockingErrors()
    }
  })
}
```

### Lister erreurs actives

```typescript
function listActiveErrors(): ErrorRecord[] {
  const errorFiles = listFiles('.epct/errors/active/')
  return errorFiles
    .map(file => JSON.parse(readFile(file)))
    .sort((a, b) => {
      // Prioriser : blocking > severity > age
      if (a.blocking !== b.blocking) return a.blocking ? -1 : 1
      if (a.severity !== b.severity) {
        const severityOrder = { critical: 0, major: 1, minor: 2 }
        return severityOrder[a.severity] - severityOrder[b.severity]
      }
      return new Date(a.created).getTime() - new Date(b.created).getTime()
    })
}
```

## Sévérité et Blocage

```typescript
function determineSeverity(error: ErrorInfo): Severity {
  if (error.type === 'syntax_error') return 'critical'
  if (error.type === 'assertion_failed') return 'critical'
  if (error.type === 'type_error') return 'major'
  if (error.type === 'lint_warning') return 'minor'
  return 'major'
}

function isBlocking(error: ErrorInfo): boolean {
  return error.severity === 'critical'
}
```

## Alerts

```typescript
function shouldAlertOldErrors(): boolean {
  const errors = listActiveErrors()
  const oneHourAgo = Date.now() - (60 * 60 * 1000)

  return errors.some(err =>
    new Date(err.created).getTime() < oneHourAgo &&
    err.blocking
  )
}
```

## Types d'Erreurs

| Type | Sévérité | Bloquant |
|------|----------|----------|
| syntax_error | critical | ✅ |
| assertion_failed | critical | ✅ |
| type_error | major | ✅ |
| runtime_error | major | ✅ |
| lint_warning | minor | ❌ |
| deprecation | minor | ❌ |
