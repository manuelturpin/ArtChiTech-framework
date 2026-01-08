# Handoff: Fix EPCT Initialization Flow

**Date**: 2026-01-08
**Commit**: `fe3a59f` (pushed to main)
**Status**: En attente de validation par tests manuels

---

## Contexte

Le système `.epct/` (suivi de projet) n'était pas correctement initialisé :
- `/act-project` (nouveau projet) : `.epct/` n'était jamais créé
- `/act-onboard` (projet existant) : `.epct/` était créé sans confirmation utilisateur

## Modifications effectuées

| Fichier | Modification |
|---------|--------------|
| `plugin/commands/act-project.md` | Ajout init `.epct/` après choix du nom (Context A) |
| `plugin/commands/act-onboard.md` | Ajout Step 4b - confirmation utilisateur avant init |
| `plugin/skills/claudemd-generator/SKILL.md` | Fix référence `stack.json` inexistant |

## À valider

**Tests manuels requis** :

1. **Test onboarding** : Sur un projet existant sans ACT
   - Lancer `/act-onboard`
   - Vérifier que la confirmation est demandée après l'audit
   - Tester les deux choix (1: init ACT, 2: audit only)

2. **Test nouveau projet** : Dans un dossier vide
   - Lancer `/act-project`
   - Choisir "Start a new project"
   - Vérifier que `.epct/state.json` est créé

## Prochaine session

- Attendre résultats des tests manuels
- Si OK → Marquer Task 4 comme completed
- Si bugs → Corriger et re-tester
