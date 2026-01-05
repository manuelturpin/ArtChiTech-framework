---
name: resume
command: /resume
description: Reprend la session précédente en restaurant le contexte et l'état du projet
---

# /resume - Reprendre Session

## Comportement

1. Lit `.epct/session/recovery.json`
2. Charge le dernier checkpoint si disponible
3. Affiche résumé de la dernière session
4. Propose de continuer ou recommencer

## Affichage

```
📍 Dernière session : il y a 2h
   Phase : Développement (4/7)
   Dernier chunk : UserService.update ✅
   Prochain : UserService.delete
   Erreurs en attente : 0

   Continuer avec UserService.delete ? (o/n)
```

## Implémentation

```typescript
async function executeResumeCommand() {
  // 1. Utiliser context-manager pour recovery
  const recovery = await skillCall('context-manager', 'recoverSession')

  if (!recovery.success) {
    print("Aucune session précédente trouvée.")
    print("Utilisez /projet pour démarrer un nouveau projet.")
    return
  }

  // 2. Afficher résumé
  const timeSince = getTimeSince(recovery.checkpoint.timestamp)
  print(`📍 Dernière session : ${timeSince}`)
  print(`   Phase : ${recovery.phase}`)

  if (recovery.lastChunk) {
    print(`   Dernier chunk : ${recovery.lastChunk.method} ✅`)
    print(`   Prochain : ${getNextChunk()}`)
  }

  print(`   Erreurs en attente : ${recovery.errors}`)
  print()

  // 3. Proposer continuation
  if (recovery.errors > 0) {
    print(`   ⚠️  Il y a ${recovery.errors} erreur(s) en attente.`)
    print(`   Recommandation : /fix avant de continuer`)
    print()
  }

  const answer = await askUser("Continuer où vous en étiez ? (o/n)")

  if (answer === 'o') {
    await skillCall('context-manager', 'restoreContext', recovery.checkpoint)
    print("✅ Contexte restauré. Prêt à continuer.")

    if (recovery.errors === 0 && recovery.nextChunk) {
      print(`💡 Prochain : implémenter ${recovery.nextChunk}`)
    }
  } else {
    print("Session non restaurée. Utilisez /projet pour démarrer.")
  }
}
```

## Cas Spéciaux

### Aucune session précédente

```
Aucune session précédente trouvée.
Utilisez /projet pour démarrer un nouveau projet.
```

### Erreurs en attente

```
📍 Dernière session : il y a 30 min
   Phase : Développement
   Dernier chunk : UserService.create ❌

   ⚠️  1 erreur en attente : assertion failed

   Recommandation : /fix avant de continuer

   Voir l'erreur maintenant ? (o/n)
```

### Contexte incomplet (> 7 jours)

```
📍 Session trouvée mais ancienne (il y a 8 jours)

   ⚠️  Le contexte peut être incomplet.
   Recommander : /status pour voir l'état puis décider.

   Tenter restauration ? (o/n)
```
