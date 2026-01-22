---
description: Affiche la progression de la boucle autonome
---

# /loop-status

## Objectif

Afficher l'etat actuel de la boucle : stories done/pending/skipped, progression, derniers learnings.

## Usage

```
/loop-status
```

## Comportement

1. **Lire** `.epct/session/prd.json`
2. **Calculer** les statistiques
3. **Lire** les derniers entries de `progress.md`
4. **Afficher** le resume

## Output

```
=== Loop Status ===

Project: ACT-Ralph-Integration
Branch: feat/ralph-integration

Stories:
  [x] US-001 [P1] Structure fichiers
  [x] US-002 [P2] Commande stories-generate
  [x] US-003 [P3] Commande loop
  [ ] US-004 [P4] Agent loop-executor
  [ ] US-005 [P5] Commande loop-status
  [~] US-006 [P6] Integration next (skipped)
  [ ] US-007 [P7] Curation learnings

Progress: 3/7 (42%)
  Done: 3
  Pending: 3
  Skipped: 1

Last iteration: #4 - US-003 passed

Recent learnings:
  - Pattern: Commandes suivent structure standard
  - Pattern: Agents documentent criteres verification
```

## Legendes

| Symbole | Signification |
|---------|---------------|
| `[x]` | Story passee |
| `[ ]` | Story en attente |
| `[~]` | Story skipped (echec 2x) |
| `[!]` | Story en erreur |

## Cas Particuliers

| Situation | Output |
|-----------|--------|
| Pas de prd.json | "Aucune boucle active. Lancez /stories-generate" |
| Boucle complete | "Boucle terminee! Toutes les stories passees." |
| Boucle en cours | Affiche iteration courante |

## Fichiers Lus

- `.epct/session/prd.json` - Etat des stories
- `.epct/loop/progress.md` - Historique iterations
- `.epct/loop/patterns.md` - Learnings (optionnel)
