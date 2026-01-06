---
name: projet
command: /projet
description: Hub principal interactif pour gérer le projet (nouveau, feature, refacto, status)
---

# /projet - Hub Principal

## Comportement

Point d'entrée principal du framework. Menu adaptatif selon :
- Existence d'un projet actif
- Phase actuelle
- État (erreurs, progression, etc.)

## Affichage - Nouveau Projet

```
╭─────────────────────────────────────────────────────╮
│  🚀 Framework Projet Claude Code                    │
│                                                     │
│  Aucun projet actif.                                │
│                                                     │
│  1. 🆕 Démarrer un nouveau projet                   │
│  2. 📖 En savoir plus sur le framework              │
│                                                     │
│  Tapez le numéro ou décrivez votre besoin...        │
╰─────────────────────────────────────────────────────╯
```

## Affichage - Projet Actif

```
╭─────────────────────────────────────────────────────╮
│  🚀 mon-app | Phase: Développement (4/7)            │
│                                                     │
│  Que voulez-vous faire ?                            │
│                                                     │
│  1. ➕ Ajouter une feature                          │
│  2. 🔧 Refactoring/optimisation                     │
│  3. 📋 Voir checklist phase actuelle                │
│  4. ⏭️  Passer à la phase suivante                  │
│  5. 📊 Voir status complet                          │
│                                                     │
│  Tapez le numéro ou décrivez votre besoin...        │
╰─────────────────────────────────────────────────────╯
```

## Implémentation

```typescript
async function executeProjetCommand(args?: string) {
  // Si argument direct (ex: /projet status)
  if (args) {
    return await executeShortcut(args)
  }

  // Sinon, menu interactif
  await skillCall('projet-orchestrator', 'showProjetMenu')
}

function executeShortcut(command: string) {
  const shortcuts = {
    'status': () => executeStatusCommand(),
    'fix': () => executeFixCommand(),
    'resume': () => executeResumeCommand(),
    'next': () => executeNextCommand(),
    'help': () => executeHelpCommand()
  }

  return shortcuts[command]?.() || print(`Commande inconnue: ${command}`)
}
```

## Raccourcis

| Commande | Équivalent |
|----------|------------|
| `/projet status` | `/status` |
| `/projet fix` | `/fix` |
| `/projet resume` | `/resume` |
| `/projet next` | `/next` |
| `/projet help` | `/help` |

## Flux Nouveau Projet

```
/projet
  ↓
Choix: "1. Démarrer un nouveau projet"
  ↓
Nom du projet ? → "mon-app"
  ↓
Type ? → "webapp"
  ↓
🎯 Phase Discovery activée
  ↓
Skill brainstorming activé
  ↓
[Guide validation problème...]
```

## Flux Feature

```
/projet
  ↓
Choix: "1. Ajouter une feature"
  ↓
Nom de la feature ? → "User Authentication"
  ↓
Description courte ? → "Login/logout avec JWT"
  ↓
[Selon phase actuelle:]
  - Phase 1-3: brainstorming activé
  - Phase 4: chunk-manager activé
  ↓
[Guide implémentation...]
```

## Entrée Texte Libre

```
/projet
  ↓
Input: "je veux ajouter une feature de paiement"
  ↓
[Interprétation: add_feature]
  ↓
Feature détectée: "paiement"
Confirmer ? (o/n)
```

## Intégration avec Autres Commandes

Le hub /projet coordonne toutes les autres commandes :

```
┌─────────────────────────────────────────────────────┐
│                     /projet                         │
│                        │                            │
│    ┌─────────┬─────────┼─────────┬─────────┐       │
│    │         │         │         │         │       │
│    ▼         ▼         ▼         ▼         ▼       │
│ /resume  /status    /fix     /next     /help       │
│                                                     │
│    │         │         │         │         │       │
│    └─────────┴─────────┴─────────┴─────────┘       │
│                        │                            │
│                        ▼                            │
│              Skills Framework                       │
│   (context-manager, chunk-manager, phase-controller,│
│    error-tracker, projet-orchestrator)              │
└─────────────────────────────────────────────────────┘
```
