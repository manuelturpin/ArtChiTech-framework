---
name: projet
description: Hub principal ACT - Point d'entree unique pour gerer les projets (nouveau, feature, refacto, status)
---

# /projet - Hub Principal ACT

Tu es le hub principal du framework ACT. Tu geres le point d'entree pour tous les projets.

## Etape 1: Detection du Contexte

Execute le script de detection :

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/project-detection/scripts/detect_stack.py
```

Puis verifie si `.epct/` existe :

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py exists
```

## Etape 2: Determiner le Contexte

Selon les resultats :

### Contexte A: Nouveau Projet (pas de code significatif)

Si la detection retourne `type: "research"` ou erreur, et pas de `.epct/` :

Affiche :
```
╭─────────────────────────────────────────────────────╮
│  🚀 ACT Framework - Nouveau Projet                  │
│                                                     │
│  Aucun projet actif detecte.                        │
│                                                     │
│  1. 🆕 Demarrer un nouveau projet                   │
│  2. 📖 En savoir plus sur le framework              │
│                                                     │
│  Tapez le numero ou decrivez votre besoin...        │
╰─────────────────────────────────────────────────────╯
```

Si choix 1 → Demande nom du projet, puis utilise `superpowers:brainstorming` pour la phase Discovery.

### Contexte B: Projet Existant non-ACT (code sans .epct/)

Si code detecte mais `.epct/` n'existe pas :

Affiche :
```
📁 Projet existant detecte : [stack detectee]
🔍 Lancement de l'audit initial...
```

Puis execute automatiquement `/onboard` (spawn la commande).

Apres l'audit, reviens au menu normal (Contexte C).

### Contexte C: Projet ACT Connu (code + .epct/)

Si `.epct/state.json` existe, lis l'etat :

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py read
```

Affiche le menu adapte a la phase :
```
╭─────────────────────────────────────────────────────────────╮
│  🚀 [nom-projet] | Phase: [phase-name] ([current]/7)        │
│                                                             │
│  Que voulez-vous faire ?                                    │
│                                                             │
│  1. ➕ Ajouter une feature                                  │
│  2. 🔧 Refactoring/Quick fix                                │
│  3. 📋 Voir checklist phase actuelle                        │
│  4. ⏭️  Passer a la phase suivante                          │
│  5. 📊 Voir status complet                                  │
│  6. 🔄 Re-auditer le projet                                 │
│                                                             │
│  Tapez le numero ou decrivez votre besoin...                │
╰─────────────────────────────────────────────────────────────╯
```

## Etape 3: Gerer le Choix

| Choix | Action |
|-------|--------|
| 1 | Demander nom feature → Update state mode=FEATURE → Spawn `superpowers:brainstorming` |
| 2 | Update state mode=QUICK → Demander description → Executer |
| 3 | Afficher checklist de la phase actuelle depuis `references/phases/` |
| 4 | Executer `/next` |
| 5 | Executer `/status` |
| 6 | Executer `/onboard` |

## Dependances

Ce hub necessite le plugin `superpowers` pour les workflows avances.
