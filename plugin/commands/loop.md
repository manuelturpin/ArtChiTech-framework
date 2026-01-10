---
description: Lance la boucle autonome pour executer les stories du PRD
---

# /loop

## Objectif

Lancer la boucle autonome qui execute les user stories une par une jusqu'a completion ou timeout.

## Usage

```
/loop [max_iterations]
```

- `max_iterations` : Nombre maximum d'iterations (default: 10)

## Prerequis

- Fichier `.epct/session/prd.json` existant
- Au moins une story avec `passes: false`

## Comportement

1. **Verifier** que prd.json existe
2. **Compter** les stories restantes
3. **Lancer** le script `loop.sh`
4. **Pour chaque iteration** :
   - Selectionner story prioritaire non-passee
   - Executer via agent loop-executor
   - Verifier acceptance criteria
   - Mettre a jour prd.json
   - Logger dans progress.md
5. **Terminer** quand :
   - Toutes stories passent → `<signal>COMPLETE</signal>`
   - Max iterations atteint → echec
   - Story bloquee 2x → skip et continuer

## Output

```
=== ACT Loop Started ===
Stories: 5 pending, 0 done
Max iterations: 10

--- Iteration 1/10 ---
Story: US-001 [P1] Structure fichiers
Status: PASSED

--- Iteration 2/10 ---
Story: US-002 [P2] Commande stories-generate
Status: PASSED

...

=== COMPLETE ===
All 5 stories passed in 5 iterations.
See progress: .epct/loop/progress.md
```

## Gestion des Erreurs

| Situation | Comportement |
|-----------|--------------|
| prd.json manquant | Erreur + suggerer /stories-generate |
| Aucune story pending | Message "Rien a faire" |
| Story echoue 1x | Retry a l'iteration suivante |
| Story echoue 2x | Skip + noter dans progress |
| Max iterations | Exit avec message |

## Interruption

- `Ctrl+C` pour arreter la boucle
- Progress sauvegarde a chaque iteration
- Reprendre avec `/loop` (continue depuis dernier etat)

## Fichiers Modifies

| Fichier | Modification |
|---------|--------------|
| `.epct/session/prd.json` | `passes: true/false`, `notes` |
| `.epct/loop/progress.md` | Append iterations |
| `.epct/loop/patterns.md` | Patterns decouverts |
| Code source | Implementation des stories |
