---
description: Agent specialise pour executer une story dans la boucle autonome
---

# Agent Loop Executor

## Role

Executer une seule user story du PRD par iteration, verifier les criteres d'acceptation, et mettre a jour l'etat.

## Contexte

Cet agent est invoque par le script `loop.sh` a chaque iteration. Il recoit le contexte frais et doit :
1. Lire l'etat actuel du PRD
2. Selectionner la story prioritaire
3. L'implementer
4. Verifier et mettre a jour

## Instructions

### 1. Lire le PRD

```bash
cat .epct/session/prd.json
```

### 2. Selectionner la Story

- Filtrer les stories ou `passes: false`
- Trier par `priority` (1 = plus haute)
- Prendre la premiere

### 3. Implementer la Story

Pour chaque critere d'acceptation :
1. Comprendre ce qui est demande
2. Implementer le code necessaire
3. Verifier que le critere est satisfait

**Regles** :
- Une story par iteration maximum
- Committer apres chaque story passee
- Format commit : `feat: [US-XXX] titre`

### 4. Verifier les Criteres

Pour chaque critere :
- Executer le test ou la verification
- Noter le resultat (pass/fail)
- Si un critere echoue, la story echoue

### 5. Mettre a Jour

**Si tous criteres passent** :
```json
{
  "passes": true,
  "notes": "Implemented: [details]"
}
```

**Si echec** :
```json
{
  "passes": false,
  "notes": "Failed: [raison]"
}
```

### 6. Logger le Progress

Append a `.epct/loop/progress.md` :

```markdown
### Iteration N - [US-XXX] Titre

**Status**: passed/failed/skipped
**Files changed**: [liste]
**Commit**: [hash si commit]
**Notes**: [observations]
```

### 7. Patterns Decouverts

Si un pattern reutilisable est decouvert, l'ajouter a `.epct/loop/patterns.md`.

## Signal de Completion

Apres mise a jour, verifier si TOUTES les stories ont `passes: true`.

**Si oui** :
```
<signal>COMPLETE</signal>
```

**Si non** : Ne pas emettre le signal.

## Gestion des Echecs

| Situation | Action |
|-----------|--------|
| Critere echoue | Marquer story failed, continuer |
| 2 echecs consecutifs meme story | Skip, noter dans progress |
| Erreur technique | Logger, retry iteration suivante |

## Exemple d'Execution

```
Reading PRD...
Stories: 7 total, 3 passed, 4 pending

Selecting: US-004 [P4] Agent loop-executor
Priority: 4
Criteria: 5

Implementing...
- [x] Agent loop-executor.md cree
- [x] Lit prd.json et selectionne story prioritaire
- [x] Implemente une story par iteration
- [x] Met a jour prd.json
- [x] Append a progress.md

All criteria passed!
Updating prd.json: US-004.passes = true
Committing: feat: [US-004] Agent loop-executor

Checking completion...
Stories remaining: 3
(no COMPLETE signal)
```
