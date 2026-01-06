---
name: chunk-manager
description: Découpe le travail en chunks testables et gère le workflow chunk-test-fix avec intégration TDD automatique
---

# Chunk Manager

## Responsabilités

1. **Découpage automatique** : Identifier chunks (fonctions/méthodes ~50 lignes)
2. **Workflow TDD** : Orchestrer RED → GREEN → REFACTOR par chunk
3. **Tracking progression** : Suivre chunks complétés vs restants
4. **Blocage sur erreur** : Empêcher avancement si tests échouent

## Définition d'un Chunk

Un chunk est :
- 1 fonction OU 1 méthode
- Maximum ~50 lignes de code
- Testable de manière isolée
- Responsabilité unique (SRP)

## Workflow par Chunk

```
┌─────────────┐    ┌─────────┐    ┌─────────┐
│ Implémenter │───▶│ Tester  │───▶│  Vert?  │
│  1 chunk    │    │ le chunk│    │         │
└─────────────┘    └─────────┘    └────┬────┘
                                       │
                         ┌─────────────┴─────────────┐
                         │                           │
                        OUI                         NON
                         │                           │
                         ▼                           ▼
                   ┌───────────┐            ┌──────────────┐
                   │  Chunk    │            │ Fix erreur   │
                   │  suivant  │            │ avant suite  │
                   └───────────┘            └──────────────┘
```

## Implémentation

### Identifier les chunks

```typescript
function identifyChunks(file: string, feature: string): Chunk[] {
  // Analyse du code pour identifier méthodes/fonctions
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

### Exécuter workflow chunk

```typescript
async function executeChunkWorkflow(chunk: Chunk): Promise<ChunkResult> {
  // 1. Activer TDD skill
  await skillCall('superpowers:test-driven-development', 'activate')

  // 2. RED : Écrire test qui échoue
  print(`\n🔴 RED: Writing failing test for ${chunk.name}`)
  const testFile = await writeTest(chunk)
  const redResult = await runTest(testFile)

  if (redResult.passed) {
    throw new Error('Test should fail initially (RED phase)')
  }

  // 3. GREEN : Implémenter minimum
  print(`\n🟢 GREEN: Implementing ${chunk.name}`)
  await implementChunk(chunk)
  const greenResult = await runTest(testFile)

  if (!greenResult.passed) {
    // Erreur détectée → bloquer
    await skillCall('error-tracker', 'recordError', {
      chunk: chunk.name,
      test: testFile,
      error: greenResult.error
    })
    return { status: 'failed', error: greenResult.error }
  }

  // 4. REFACTOR (optionnel si simple)
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

### Proposer chunk suivant

```typescript
function getNextChunk(): Chunk | null {
  const chunks = loadChunks()
  const pending = chunks.filter(c => c.status === 'pending')

  if (pending.length === 0) {
    return null
  }

  // Prioriser par dépendances (chunks sans dépendances d'abord)
  const independent = pending.filter(c => c.dependencies.length === 0)
  return independent[0] || pending[0]
}
```

## Intégration avec Error Tracker

Si test échoue :
1. Créer fichier erreur dans `.epct/errors/active/`
2. Bloquer progression (ne pas proposer chunk suivant)
3. Afficher message : "❌ Tests failed. Use /fix to resolve before continuing."

## Messages Utilisateur

### Chunk démarré

```
🔄 Starting chunk: UserService.create
   File: src/services/UserService.ts:42-89
   Size: 47 lines
   Dependencies: 0

🔴 RED phase: Writing failing test...
```

### Chunk réussi

```
✅ Chunk complete: UserService.create
   Tests: ✅ PASSING
   Committed: feat: implement UserService.create

💡 Next chunk: UserService.update (3 remaining)
```

### Chunk échoué

```
❌ Chunk failed: UserService.create
   Tests: ❌ FAILING
   Error: Expected user.email to be defined

⚠️  Fix required before continuing.
   Use /fix to debug and resolve.
```
