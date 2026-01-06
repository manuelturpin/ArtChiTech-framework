---
name: error-tracker
description: Track and prioritize errors, prevent progression while critical errors remain unresolved
---

# Error Tracker

## Responsibilities

1. **Error Recording**: Create files in `.epct/errors/active/`
2. **Prioritization**: Determine if error is blocking
3. **History**: Move to `resolved/` when fixed
4. **Alerts**: Notify if old errors remain untreated

## Error Structure

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

## Implementation

### Record Error

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

### Resolve Error

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

### List Active Errors

```typescript
function listActiveErrors(): ErrorRecord[] {
  const errorFiles = listFiles('.epct/errors/active/')
  return errorFiles
    .map(file => JSON.parse(readFile(file)))
    .sort((a, b) => {
      // Prioritize: blocking > severity > age
      if (a.blocking !== b.blocking) return a.blocking ? -1 : 1
      if (a.severity !== b.severity) {
        const severityOrder = { critical: 0, major: 1, minor: 2 }
        return severityOrder[a.severity] - severityOrder[b.severity]
      }
      return new Date(a.created).getTime() - new Date(b.created).getTime()
    })
}
```

## Severity and Blocking

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

## Error Types

| Type | Severity | Blocking |
|------|----------|----------|
| syntax_error | critical | ✅ |
| assertion_failed | critical | ✅ |
| type_error | major | ✅ |
| runtime_error | major | ✅ |
| lint_warning | minor | ❌ |
| deprecation | minor | ❌ |
