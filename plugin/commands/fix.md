---
name: fix
description: Lister et corriger les erreurs prioritaires du projet
argument-hint: [error-id]
---

# /fix - Correction d'Erreurs

Tu aides a corriger les problemes bloquant la progression du projet.

## Sans Argument: Lister les Problemes

Analyse le projet en utilisant le skill `phase-scoring` et liste les problemes par priorite :

```
╭─────────────────────────────────────────────────────────────╮
│  🔧 Problemes Detectes                                      │
│                                                             │
│  Phase: [phase-name] - Score: [score]%                      │
│                                                             │
│  🔴 Critiques (bloquent /next):                             │
│  [1] Tests manquants - coverage < 60%                       │
│  [2] CI/CD non configure                                    │
│                                                             │
│  🟡 Importants:                                             │
│  [3] Documentation API incomplete                           │
│  [4] Pas de gestion d'erreurs                               │
│                                                             │
│  🟢 Suggestions:                                            │
│  [5] Ajouter TypeScript strict mode                         │
│                                                             │
│  Tapez /fix [numero] pour corriger un probleme.             │
╰─────────────────────────────────────────────────────────────╯
```

## Avec Argument: Corriger le Probleme

`/fix 1` → Focus sur le probleme #1

Selon le type de probleme :

### Probleme de Code
Utilise `superpowers:systematic-debugging` pour analyser et corriger.

### Probleme de Tests
Utilise `superpowers:test-driven-development` pour ajouter les tests.

### Probleme de Documentation
Guide l'utilisateur pour creer la documentation manquante.

### Probleme de Configuration
Guide l'utilisateur etape par etape (CI/CD, linting, etc.).

## Detection des Problemes

Pour chaque phase, verifie les criteres manquants :

### Phase 1 - Discovery
- README absent ou incomplet → 🔴 Critique
- Pas de definition du probleme → 🔴 Critique
- Pas de personas → 🟡 Important

### Phase 2 - Strategie
- Pas de roadmap → 🔴 Critique
- Business model non defini → 🟡 Important
- KPIs manquants → 🟢 Suggestion

### Phase 3 - Conception
- Pas d'architecture doc → 🔴 Critique
- Specs techniques absentes → 🟡 Important
- UI mockups manquants → 🟢 Suggestion

### Phase 4 - Developpement
- Pas de tests → 🔴 Critique
- CI/CD non configure → 🔴 Critique
- Code non documente → 🟡 Important

### Phase 5 - Qualite
- Coverage < 60% → 🔴 Critique
- Bugs critiques ouverts → 🔴 Critique
- Linting errors → 🟡 Important

### Phase 6 - Lancement
- Non deploye → 🔴 Critique
- Pas de monitoring → 🟡 Important
- Doc utilisateur absente → 🟡 Important

### Phase 7 - Croissance
- Pas d'analytics → 🔴 Critique
- Pas de feedback loop → 🟡 Important
- Pas de changelog → 🟢 Suggestion

## Apres Correction

Recalcule le score de la phase et affiche :
```
✅ Probleme corrige !
📊 Nouveau score phase [name]: [new-score]%
[Si score >= 70] 💡 Vous pouvez maintenant utiliser /next
```

## Si Aucun Probleme

```
✅ Aucun probleme detecte. Tout est vert!

💡 Continuez avec /next pour avancer
```
