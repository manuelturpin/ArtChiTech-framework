---
name: chunk-manager
description: Breaks down work into testable chunks and manages the chunk-test-fix workflow with automatic TDD integration
---

# Chunk Manager

## Responsibilities

1. **Automatic breakdown**: Identify chunks (functions/methods ~50 lines)
2. **TDD Workflow**: Orchestrate RED → GREEN → REFACTOR per chunk
3. **Progress tracking**: Track completed vs remaining chunks
4. **Error blocking**: Prevent advancement if tests fail

## Chunk Definition

A chunk is:
- 1 function OR 1 method
- Maximum ~50 lines of code
- Testable in isolation
- Single responsibility (SRP)

## Workflow per Chunk

```
┌─────────────┐    ┌─────────┐    ┌─────────┐
│ Implement   │───▶│  Test   │───▶│ Green?  │
│  1 chunk    │    │ chunk   │    │         │
└─────────────┘    └─────────┘    └────┬────┘
                                       │
                         ┌─────────────┴─────────────┐
                         │                           │
                        YES                         NO
                         │                           │
                         ▼                           ▼
                   ┌───────────┐            ┌──────────────┐
                   │   Next    │            │  Fix error   │
                   │   chunk   │            │ before next  │
                   └───────────┘            └──────────────┘
```

## Implementation

### Identify chunks

```typescript
function identifyChunks(file: string, feature: string): Chunk[] {
  // Analyze code to identify methods/functions
  const ast = parseFile(file)
  const methods = extractMethods(ast)

  return methods.map(method => ({
    file,
    name: method.name,
    lineStart: method.lineStart,
    lineEnd: method.lineEnd,
    size: method.lineEnd - method.lineStart,
    dependencies: method.dependencies,
    status: 'pending'
  }))
}
```

### Execute chunk workflow

```typescript
async function executeChunkWorkflow(chunk: Chunk): Promise<ChunkResult> {
  // 1. Activate TDD skill
  await skillCall('superpowers:test-driven-development', 'activate')

  // 2. RED: Write failing test
  print(`\n🔴 RED: Writing failing test for ${chunk.name}`)
  const testFile = await writeTest(chunk)
  const redResult = await runTest(testFile)

  if (redResult.passed) {
    throw new Error('Test should fail initially (RED phase)')
  }

  // 3. GREEN: Implement minimum
  print(`\n🟢 GREEN: Implementing ${chunk.name}`)
  await implementChunk(chunk)
  const greenResult = await runTest(testFile)

  if (!greenResult.passed) {
    // Error detected → block
    await skillCall('error-tracker', 'recordError', {
      chunk: chunk.name,
      test: testFile,
      error: greenResult.error
    })
    return { status: 'failed', error: greenResult.error }
  }

  // 4. REFACTOR (optional if simple)
  print(`\n🔧 REFACTOR: Reviewing ${chunk.name}`)
  const needsRefactor = await shouldRefactor(chunk)
  if (needsRefactor) {
    await refactorChunk(chunk)
    await runTest(testFile) // Re-verify after refactor
  }

  // 5. Commit
  await gitCommit([chunk.file, testFile], `feat: implement ${chunk.name}`)

  // 6. Update state
  await skillCall('context-manager', 'updateState', {
    currentChunk: {
      file: chunk.file,
      method: chunk.name,
      status: 'completed'
    }
  })

  return { status: 'success' }
}
```

### Propose next chunk

```typescript
function getNextChunk(): Chunk | null {
  const chunks = loadChunks()
  const pending = chunks.filter(c => c.status === 'pending')

  if (pending.length === 0) {
    return null
  }

  // Prioritize by dependencies (chunks without dependencies first)
  const independent = pending.filter(c => c.dependencies.length === 0)
  return independent[0] || pending[0]
}
```

## Integration with Error Tracker

If test fails:
1. Create error file in `.epct/errors/active/`
2. Block progression (don't propose next chunk)
3. Display message: "❌ Tests failed. Use /fix to resolve before continuing."

## User Messages

### Chunk started

```
🔄 Starting chunk: UserService.create
   File: src/services/UserService.ts:42-89
   Size: 47 lines
   Dependencies: 0

🔴 RED phase: Writing failing test...
```

### Chunk succeeded

```
✅ Chunk complete: UserService.create
   Tests: ✅ PASSING
   Committed: feat: implement UserService.create

💡 Next chunk: UserService.update (3 remaining)
```

### Chunk failed

```
❌ Chunk failed: UserService.create
   Tests: ❌ FAILING
   Error: Expected user.email to be defined

⚠️  Fix required before continuing.
   Use /fix to debug and resolve.
```
