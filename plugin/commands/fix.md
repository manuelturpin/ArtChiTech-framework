---
name: fix
command: /fix
description: Affiche l'erreur prioritaire et guide le debugging avec systematic-debugging skill
---

# /fix - Corriger Erreur Prioritaire

## Comportement

1. Lit `.epct/errors/active/` et priorise
2. Affiche erreur détaillée
3. Active `superpowers:systematic-debugging`
4. Guide investigation → fix → vérification
5. Marque erreur comme résolue

## Affichage

```
❌ Erreur #001 - CRITIQUE

Chunk : UserService.create
File  : src/services/UserService.ts:42
Type  : assertion_failed

Message:
Expected user.email to be defined

Stack trace:
  at UserService.create (src/services/UserService.ts:42:15)
  at test_user_creation (tests/services/UserService.test.ts:15:28)

Context:
  Phase: Développement (4/7)
  Tentatives de fix: 0
  Créée: il y a 15 min

🔍 Activation systematic-debugging skill...
```

## Implémentation

```typescript
async function executeFixCommand() {
  // 1. Lister erreurs et prioriser
  const errors = await skillCall('error-tracker', 'listActiveErrors')

  if (errors.length === 0) {
    print("✅ Aucune erreur en attente. Tout est vert!")
    return
  }

  const priorityError = errors[0] // Déjà triée par priorité

  // 2. Afficher erreur
  printError(priorityError)

  // 3. Activer systematic-debugging
  print("\n🔍 Activation systematic-debugging skill...")

  await skillCall('superpowers:systematic-debugging', 'investigate', {
    error: priorityError,
    file: priorityError.file,
    line: priorityError.line,
    context: priorityError.context
  })

  // Systematic-debugging skill guide automatiquement :
  // - Root cause investigation
  // - Pattern analysis
  // - Hypothesis testing
  // - Implementation

  // 4. Après fix, vérifier tests
  print("\n✅ Fix implémenté. Vérification tests...")
  const testResult = await runTests(priorityError.chunk)

  if (testResult.passed) {
    print("✅ Tests PASSING")

    // 5. Marquer comme résolu
    await skillCall('error-tracker', 'resolveError', priorityError.id)

    // 6. Commit
    await gitCommit([priorityError.file], `fix: resolve ${priorityError.chunk} error`)

    print(`\n✅ Erreur ${priorityError.id} résolue`)

    // 7. Suggérer suite
    const remainingErrors = errors.length - 1
    if (remainingErrors > 0) {
      print(`\n💡 ${remainingErrors} erreur(s) restante(s). /fix à nouveau ?`)
    } else {
      print(`\n💡 Toutes les erreurs résolues ! Reprendre avec /next`)
    }
  } else {
    print("❌ Tests still FAILING")
    print("💡 Continue debugging ou demander de l'aide")
  }
}
```

## Intégration Systematic-Debugging

Le skill `superpowers:systematic-debugging` suit le processus :

**Phase 1 - Root Cause Investigation** :
- Traces back through call stack
- Adds instrumentation if needed
- Identifies source of invalid data

**Phase 2 - Pattern Analysis** :
- Checks for similar errors in codebase
- Identifies common patterns

**Phase 3 - Hypothesis Testing** :
- Forms hypotheses about cause
- Tests each hypothesis
- Confirms root cause

**Phase 4 - Implementation** :
- Implements fix
- Ensures fix doesn't break other tests
- Commits with clear message

## Cas Spéciaux

### Aucune erreur

```
✅ Aucune erreur en attente. Tout est vert!

💡 Continuez avec /next pour avancer
```

### Erreurs multiples

```
❌ Erreur #001 - CRITIQUE (prioritaire)
   ...

📋 2 autres erreurs en attente :
   - #002 (major) : TypeScript type mismatch
   - #003 (minor) : Lint warning unused var

💡 Résolvez #001 d'abord (bloquante)
```

### Fix échoué (2+ tentatives)

```
❌ Erreur #001 - CRITIQUE
   Tentatives de fix: 2

⚠️  Cette erreur persiste.
   Suggestions :
   - Vérifier les dépendances
   - Revoir la logique du test
   - Demander de l'aide externe

💡 Voulez-vous voir l'historique des tentatives ?
```
