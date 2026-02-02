# Plan de Test ACT v2.5 — Sandbox

**Date :** 2026-02-02
**Projet test :** TaskFlow CLI (gestionnaire de tâches en ligne de commande)
**Objectif :** Valider toutes les features Tier 1 dans un environnement contrôlé

---

## 📋 Méthodologie

### Approche
- Chaque feature testée par un **agent dédié**
- Résultats documentés dans `sandbox/results/`
- Rapport final consolidé

### Structure sandbox
```
sandbox/
├── TEST-PLAN.md          ← Ce fichier
├── taskflow/             ← Projet test
│   ├── .act/             ← Context Engineering
│   ├── src/              ← Code source
│   └── tests/            ← Tests unitaires
└── results/              ← Résultats des tests
    ├── 01-context-engineering.md
    ├── 02-hooks-system.md
    ├── 03-iron-laws.md
    ├── 04-scale-adaptive.md
    ├── 05-deviation-rules.md
    ├── 06-session-recovery.md
    ├── 07-model-selection.md
    ├── 08-session-history.md
    └── FINAL-REPORT.md
```

---

## 🧪 Tests par Feature

### Test 1 : Context Engineering
**Agent :** `test-1-context-engineering`
**Durée estimée :** 5-10 min

| Étape | Action | Résultat attendu |
|-------|--------|------------------|
| 1.1 | Créer `sandbox/taskflow/` | Dossier créé |
| 1.2 | Simuler `/act:init --name taskflow --type cli` | `.act/` créé avec 5 fichiers |
| 1.3 | Vérifier `config.yaml` | Contient project_name, version, created |
| 1.4 | Vérifier `state.md` | État initial correct |
| 1.5 | Vérifier `plan.md` | Template avec phases |
| 1.6 | Vérifier `findings.md` | Vide ou template |
| 1.7 | Vérifier `progress.md` | Session initiale loggée |

**Critères de succès :**
- [ ] 5 fichiers `.act/` créés
- [ ] Structure conforme aux templates
- [ ] Projet initialisé correctement

---

### Test 2 : Hooks System
**Agent :** `test-2-hooks-system`
**Durée estimée :** 5-10 min

| Étape | Action | Résultat attendu |
|-------|--------|------------------|
| 2.1 | Lire `hooks/hooks.json` | 3 hooks configurés |
| 2.2 | Simuler PreToolUse (avant Write) | Doit rappeler de lire plan.md |
| 2.3 | Simuler PostToolUse (après Write) | Doit rappeler de mettre à jour progress.md |
| 2.4 | Simuler Stop (avant completion) | Doit vérifier les preuves de completion |

**Critères de succès :**
- [ ] PreToolUse fonctionne
- [ ] PostToolUse fonctionne
- [ ] Stop hook vérifie les preuves

---

### Test 3 : Iron Laws
**Agent :** `test-3-iron-laws`
**Durée estimée :** 10-15 min

| Étape | Action | Résultat attendu |
|-------|--------|------------------|
| 3.1 | Implémenter feature SANS test d'abord | Violation TDD détectée |
| 3.2 | Implémenter feature AVEC test d'abord | TDD Iron Law respectée |
| 3.3 | Fixer un bug sans investigation | Violation Debugging détectée |
| 3.4 | Fixer un bug AVEC investigation root cause | Debugging Iron Law respectée |
| 3.5 | Dire "c'est fini" sans preuve | Violation Verification détectée |
| 3.6 | Compléter avec preuves fraîches | Verification Iron Law respectée |

**Critères de succès :**
- [ ] TDD Iron Law appliquée
- [ ] Debugging Iron Law appliquée
- [ ] Verification Iron Law appliquée

---

### Test 4 : Scale-Adaptive
**Agent :** `test-4-scale-adaptive`
**Durée estimée :** 10-15 min

| Étape | Action | Résultat attendu |
|-------|--------|------------------|
| 4.1 | Simuler `/act:quick "Add help command"` | Mode Quick activé (3 phases) |
| 4.2 | Vérifier workflow Quick | Skip research, focus execution |
| 4.3 | Simuler `/act:full "Add database layer"` | Mode Full activé (7 phases) |
| 4.4 | Vérifier workflow Full | Toutes les phases ACT |
| 4.5 | Tester escalation Quick → Full | Détection correcte |

**Critères de succès :**
- [ ] Quick mode fonctionne (3 phases)
- [ ] Full mode fonctionne (7 phases)
- [ ] Escalation détectée

---

### Test 5 : Deviation Rules
**Agent :** `test-5-deviation-rules`
**Durée estimée :** 10-15 min

| Étape | Action | Résultat attendu |
|-------|--------|------------------|
| 5.1 | Simuler Rule 1 (Bug découvert) | Auto-fix immédiat |
| 5.2 | Simuler Rule 2 (Missing import) | Auto-add immédiat |
| 5.3 | Simuler Rule 3 (Blocker) | Auto-fix immédiat |
| 5.4 | Simuler Rule 4 (Changement archi) | STOP & ASK user |
| 5.5 | Simuler Rule 5 (Enhancement idea) | Log dans ISSUES.md |
| 5.6 | Vérifier ISSUES.md | Enhancement loggé correctement |

**Critères de succès :**
- [ ] Rules 1-3 auto-handled
- [ ] Rule 4 demande confirmation
- [ ] Rule 5 log dans ISSUES.md

---

### Test 6 : Session Recovery
**Agent :** `test-6-session-recovery`
**Durée estimée :** 5-10 min

| Étape | Action | Résultat attendu |
|-------|--------|------------------|
| 6.1 | Faire du travail dans taskflow | Progress logged |
| 6.2 | Simuler un reset de contexte | Contexte perdu |
| 6.3 | Simuler `/act:resume` | Catchup report généré |
| 6.4 | Vérifier 5-Question Reboot Test | Réponses correctes |
| 6.5 | Continuer le travail | Reprise fluide |

**Critères de succès :**
- [ ] Catchup report généré
- [ ] 5-Question Test répond correctement
- [ ] Reprise de session fluide

---

### Test 7 : Model Selection
**Agent :** `test-7-model-selection`
**Durée estimée :** 5 min

| Étape | Action | Résultat attendu |
|-------|--------|------------------|
| 7.1 | Lire `.act/config.yaml` models section | 6 agents configurés |
| 7.2 | Vérifier mapping planner → opus | Correct |
| 7.3 | Vérifier mapping executor → sonnet | Correct |
| 7.4 | Vérifier mapping documenter → haiku | Correct |
| 7.5 | Simuler tâche planning | Devrait utiliser opus |
| 7.6 | Simuler tâche execution | Devrait utiliser sonnet |

**Critères de succès :**
- [ ] Config models correcte
- [ ] Mapping agents → models correct
- [ ] Sélection appropriée selon tâche

---

### Test 8 : Session History
**Agent :** `test-8-session-history`
**Durée estimée :** 5-10 min

| Étape | Action | Résultat attendu |
|-------|--------|------------------|
| 8.1 | Vérifier `.act/history/` existe | Dossier présent |
| 8.2 | Faire une session de travail | Session loggée |
| 8.3 | Simuler `/act:history` | Liste des sessions |
| 8.4 | Simuler `/act:replay last` | Détails dernière session |
| 8.5 | Vérifier format session log | Conforme au template |
| 8.6 | Tester rotation (si > maxSessions) | Anciennes supprimées |

**Critères de succès :**
- [ ] History directory fonctionne
- [ ] /act:history liste les sessions
- [ ] /act:replay affiche les détails
- [ ] Format conforme

---

## 📊 Rapport Final

### Template résultat par test
```markdown
# Test X : [Feature Name]

## Résumé
- **Status :** ✅ PASS / ❌ FAIL / ⚠️ PARTIAL
- **Score :** X/Y critères

## Détails
| Étape | Résultat | Notes |
|-------|----------|-------|
| X.1 | ✅/❌ | ... |

## Bugs trouvés
- ...

## Améliorations suggérées
- ...
```

### Consolidation finale
```markdown
# FINAL-REPORT.md

## Résumé Exécutif
| Feature | Status | Score |
|---------|--------|-------|
| Context Engineering | ✅/❌ | X/Y |
| ... | ... | ... |

## Score Global
- Tests passés : X/8
- Critères validés : X/Y
- Bugs critiques : X
- Améliorations : X

## Conclusion
[Tier 1 prêt pour production / Corrections nécessaires]
```

---

## 🚀 Exécution

### Ordre des agents
1. `test-1-context-engineering` (crée le projet)
2. `test-2-hooks-system`
3. `test-3-iron-laws`
4. `test-4-scale-adaptive`
5. `test-5-deviation-rules`
6. `test-6-session-recovery`
7. `test-7-model-selection`
8. `test-8-session-history`
9. `test-final-report` (consolidation)

### Dépendances
- Test 1 doit être fait en premier (crée le projet)
- Tests 2-8 peuvent être parallélisés après Test 1
- Test final après tous les autres

---

## ✅ Validation

**Critères de validation globale :**
- [ ] 8/8 features testées
- [ ] Score global ≥ 90%
- [ ] 0 bugs critiques
- [ ] Rapport final généré

---

*Plan créé le 2026-02-02 par Archi*
*En attente de validation par Manu*
