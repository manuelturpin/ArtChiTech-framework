---
name: next
command: /next
description: Passe à l'étape suivante (chunk ou phase) avec validation Go/No-Go
---

# /next - Étape Suivante

## Comportement Contextuel

### Si dans un chunk
- Proposer chunk suivant
- Vérifier tests du chunk actuel
- Bloquer si erreurs

### Si fin de phase
- Déclencher Go/No-Go
- Valider checklist
- Transitionner si approuvé

## Implémentation

```typescript
async function executeNextCommand() {
  const state = await skillCall('context-manager', 'readState')

  // 1. Déterminer contexte
  const inChunk = state.currentChunk !== null
  const phaseComplete = await isPhaseComplete(state.currentPhase)

  if (inChunk) {
    await handleNextChunk()
  } else if (phaseComplete) {
    await handleNextPhase(state.currentPhase)
  } else {
    print("💡 Continuez le travail en cours. Utilisez /status pour voir progression.")
  }
}

async function handleNextChunk() {
  // 1. Vérifier chunk actuel terminé
  const state = await skillCall('context-manager', 'readState')
  const currentChunk = state.currentChunk

  if (currentChunk.status !== 'completed') {
    print(`⚠️  Chunk actuel (${currentChunk.method}) non terminé`)
    print(`💡 Terminez-le ou utilisez /fix si erreur`)
    return
  }

  // 2. Récupérer chunk suivant
  const nextChunk = await skillCall('chunk-manager', 'getNextChunk')

  if (!nextChunk) {
    print("✅ Tous les chunks de cette tâche sont terminés!")
    print("💡 Utilisez /next à nouveau pour passer à la phase suivante")
    return
  }

  // 3. Proposer chunk suivant
  print(`\n📍 Chunk suivant : ${nextChunk.name}`)
  print(`   File: ${nextChunk.file}`)
  print(`   Lines: ${nextChunk.lineStart}-${nextChunk.lineEnd}`)
  print(`   Size: ${nextChunk.size} lines`)

  const answer = await askUser("Commencer ce chunk ? (o/n)")

  if (answer === 'o') {
    await skillCall('chunk-manager', 'executeChunkWorkflow', nextChunk)
  }
}

async function handleNextPhase(currentPhase: number) {
  // 1. Go/No-Go
  const approved = await skillCall('phase-controller', 'goNoGoDecision', currentPhase)

  if (!approved) {
    print("\n❌ Transition refusée ou conditions non remplies")
    print("💡 Complétez les items manquants puis /next à nouveau")
    return
  }

  // 2. Transition
  await skillCall('phase-controller', 'transitionToPhase', currentPhase + 1)
}
```

## Messages

### Chunk suivant disponible

```
📍 Chunk suivant : UserService.delete
   File: src/services/UserService.ts
   Lines: 120-165
   Size: 45 lines
   Dependencies: 0

Commencer ce chunk ? (o/n)
```

### Tous chunks terminés

```
✅ Tous les chunks de cette tâche sont terminés!

💡 Utilisez /next à nouveau pour passer à la phase suivante
```

### Chunk en cours non terminé

```
⚠️  Chunk actuel (UserService.update) non terminé

   Status: in_progress
   Tests: ❌ FAILING

💡 Terminez-le ou utilisez /fix si erreur
```

### Go/No-Go transition

```
╭─────────────────────────────────────────────────╮
│  Phase Développement terminée ?                 │
├─────────────────────────────────────────────────┤
│  ✅ Checklist : 12/12 items                     │
│  ✅ Bloqueurs : 0                               │
│  ✅ Tests : PASSING                             │
╰─────────────────────────────────────────────────╯

Passer à Phase Qualité ? (o/n)
```

### Phase finale (7/7)

```
╭─────────────────────────────────────────────────╮
│  Phase Croissance terminée ?                    │
├─────────────────────────────────────────────────┤
│  ✅ Checklist : 8/8 items                       │
│  ✅ Bloqueurs : 0                               │
│  ✅ Tests : PASSING                             │
╰─────────────────────────────────────────────────╯

🎉 Félicitations ! Projet terminé !

💡 Prochaines étapes suggérées :
   - Documenter les leçons apprises
   - Planifier la prochaine itération
   - Célébrer ! 🎊
```

## Cas spéciaux

### Erreurs bloquantes

```
❌ Impossible d'avancer

   2 erreur(s) bloquante(s) en attente

💡 Utilisez /fix pour les résoudre d'abord
```

### Rien en cours

```
💡 Aucune tâche en cours.

   Options :
   - /projet pour démarrer une nouvelle feature
   - /status pour voir l'état du projet
```
