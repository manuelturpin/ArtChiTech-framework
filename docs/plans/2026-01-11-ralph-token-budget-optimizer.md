# Plan : Renforcement Loop Ralph + Token Budget Optimizer

> **Objectif** : Intégrer le Token Budget Optimizer dans le workflow Ralph
> **Branche** : `claude/test-deepsearch-pocket-watch-P5EDF`
> **Priorité** : Axe B (Token Budget) = Ultra Important
> **Date** : 2026-01-11

---

## 1. Synthèse du Rapport Multi-Agent

### Métriques Clés (Test 10 Jan 2026)

| Métrique | Valeur |
|----------|--------|
| Agents lancés | 11 parallèles |
| Durée | 14 minutes |
| Tokens consommés | ~610,000 |
| Quota utilisé | 72% |
| Qualité | 8.0/10 |
| Succès | 100% (11/11) |

### Problème Identifié

L'utilisateur n'est **pas averti du coût AVANT exécution**. Pas de guardrails pour éviter la surconsommation.

### Solution Proposée

```
DETECT → ESTIMATE → WARN → OPTIONS → EXECUTE → REPORT
```

---

## 2. Architecture Token Budget Optimizer

```
┌─────────────────────────────────────────────────────────────────────┐
│                    TOKEN BUDGET OPTIMIZER SYSTEM                     │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐  │
│  │  budget-config  │───▶│  budget-        │───▶│  budget-        │  │
│  │  .json          │    │  estimator.md   │    │  guardrails.md  │  │
│  │  (settings)     │    │  (agent)        │    │  (agent)        │  │
│  └─────────────────┘    └────────┬────────┘    └────────┬────────┘  │
│                                  │                       │           │
│                                  ▼                       ▼           │
│                         ┌─────────────────────────────────────┐     │
│                         │  /loop (modified command)           │     │
│                         │  - Appelle budget-estimator         │     │
│                         │  - Affiche estimation               │     │
│                         │  - Applique guardrails              │     │
│                         │  - Propose options utilisateur      │     │
│                         └─────────────────────────────────────┘     │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 3. Fichiers à Créer/Modifier

### Nouveaux Fichiers

| Fichier | Rôle |
|---------|------|
| `plugin/agents/budget-estimator.md` | Estime le coût tokens avant exécution |
| `plugin/agents/budget-guardrails.md` | Applique limites et propose alternatives |
| `plugin/references/budget/default-config.json` | Configuration par défaut |

### Fichiers à Modifier

| Fichier | Modification |
|---------|--------------|
| `plugin/commands/loop.md` | Intégrer estimation + warnings |
| `plugin/scripts/loop.sh` | Passer paramètres budget |

### Fichiers de State Projet (runtime)

```
.epct/
└── budget/
    ├── config.json      # Override local
    ├── usage.json       # Usage session courante
    └── history.json     # Historique exécutions
```

---

## 4. Modèle d'Estimation

### Coûts de Base (tokens)

| Opération | Coût Base | Notes |
|-----------|:---------:|-------|
| Agent standard | 50,000 | Tâche moyenne |
| Agent recherche | 60,000 | Web search + synthèse |
| Itération loop | 40,000 | Read + implement + test |
| Lecture fichier | 500 | Par fichier |
| Recherche web | 2,000 | Par query |

### Multiplicateurs

| Facteur | Multiplicateur |
|---------|:--------------:|
| Profondeur shallow | x0.5 |
| Profondeur standard | x1.0 |
| Profondeur deep | x2.0 |
| Agents parallèles | xN |
| Marge sécurité | +20% |

### Formule

```python
estimated = base_cost × agents × depth_mult × iterations × 1.2
quota_percent = estimated / DAILY_QUOTA × 100
```

---

## 5. Guardrails

### Limites Recommandées

| Guardrail | Valeur | Raison |
|-----------|:------:|--------|
| Max agents parallèles | 4 | Éviter 72% comme test |
| Max tokens/agent | 50,000 | Contrôle individuel |
| Max session | 40% quota | Buffer pour autre travail |
| Warning | > 20% quota | Confirmation requise |
| Hard stop | 80% quota | Protection quota |

### Modes d'Exécution

| Mode | Agents | Profondeur | Quota Max | Qualité |
|------|:------:|:----------:|:---------:|:-------:|
| Economy | 3 | shallow | 15% | 6/10 |
| Standard | 5 | standard | 30% | 7.5/10 |
| Thorough | 8 | deep | 50% | 8.5/10 |
| Exhaustive | 11+ | deep | 70%+ | 9/10 |

---

## 6. Intégration par Phase ACT

| Phase | Mode Default | Research | Max Quota |
|-------|-------------|:--------:|:---------:|
| 1 - Discovery | thorough | Yes | 60% |
| 2 - Strategy | standard | Yes | 40% |
| 3 - Design | standard | No | 30% |
| 4 - Development | standard | No | 30% |
| 5 - Quality | standard | No | 30% |
| 6 - Launch | economy | No | 20% |
| 7 - Growth | standard | Yes | 40% |

---

## 7. UX : Affichage Estimation

```
╭─────────────────────────────────────────────────╮
│  ACT LOOP - Budget Estimation                   │
├─────────────────────────────────────────────────┤
│                                                 │
│  Stories pending: 5                             │
│  Max iterations: 10                             │
│                                                 │
│  ESTIMATION                                     │
│  ├─ Tokens:    ~240,000                         │
│  ├─ Quota:     24%                              │
│  └─ Risk:      MEDIUM                           │
│                                                 │
│  Current quota used: 15%                        │
│  After loop:         39% (safe)                 │
│                                                 │
│  Ready to execute                               │
│                                                 │
│  [y] Execute | [e] Economy | [c] Cancel         │
╰─────────────────────────────────────────────────╯
```

---

## 8. UX : Blocage par Guardrails

```
╭─────────────────────────────────────────────────╮
│  EXECUTION BLOCKED                              │
├─────────────────────────────────────────────────┤
│                                                 │
│  Reason: Would exceed hard stop (80%)           │
│                                                 │
│  Current: 45% used                              │
│  Task:    50% estimated                         │
│  Total:   95% (exceeds limit)                   │
│                                                 │
│  Options:                                       │
│  [1] Reduce to 5 iterations (~25%)              │
│  [2] Use economy mode (~15%)                    │
│  [3] Schedule for later (reset in 3h)           │
│  [4] Force execute (not recommended)            │
│                                                 │
╰─────────────────────────────────────────────────╯
```

---

## 9. Plan d'Implémentation

### Phase 1 : Core (Quick Win) - 2h

| # | Tâche | Fichier |
|---|-------|---------|
| 1 | Créer config budget | `plugin/references/budget/default-config.json` |
| 2 | Créer agent estimator | `plugin/agents/budget-estimator.md` |
| 3 | Modifier /loop pour afficher estimation | `plugin/commands/loop.md` |

### Phase 2 : Guardrails - 2h

| # | Tâche | Fichier |
|---|-------|---------|
| 4 | Créer agent guardrails | `plugin/agents/budget-guardrails.md` |
| 5 | Intégrer validation dans /loop | `plugin/commands/loop.md` |
| 6 | Ajouter options utilisateur | `plugin/commands/loop.md` |

### Phase 3 : Intégration Phases - 1h

| # | Tâche | Fichier |
|---|-------|---------|
| 7 | Ajouter phase_settings dans config | `default-config.json` |
| 8 | Modifier phase-controller | `plugin/agents/phase-controller.md` |

### Phase 4 : Persistence - 1h

| # | Tâche | Fichier |
|---|-------|---------|
| 9 | Créer structure `.epct/budget/` | Structure |
| 10 | Logger usage | Script Python |

---

## 10. Critères de Validation

### Phase 1

- [ ] `/loop` affiche estimation AVANT exécution
- [ ] Estimation inclut: tokens, % quota, risk level
- [ ] Estimation basée sur nb stories et iterations

### Phase 2

- [ ] Warning si > 20% quota
- [ ] Bloqueur si > 80% quota
- [ ] Options proposées: economy, batch, cancel
- [ ] `--force` permet override

### Phase 3

- [ ] Phase Discovery = mode thorough par défaut
- [ ] Phases Dev/Quality limitées à 30%
- [ ] Settings lisibles depuis config

---

## 11. Fichiers Critiques

| Fichier | Priorité |
|---------|:--------:|
| `plugin/commands/loop.md` | **Haute** |
| `plugin/agents/budget-estimator.md` | **Haute** |
| `plugin/agents/budget-guardrails.md` | **Haute** |
| `plugin/references/budget/default-config.json` | **Haute** |
| `plugin/scripts/loop.sh` | Moyenne |
| `plugin/agents/phase-controller.md` | Moyenne |

---

## 12. Tests et Validation (AVANT Implémentation)

### Tests à Effectuer

| Test | Description | Statut |
|------|-------------|--------|
| Test loop.sh réel | Lancer `./loop.sh` avec claude CLI sur une feature | Pending |
| Test Phase 3 (Design) | Valider le workflow sur une tâche de conception | Pending |
| Test Phase 4 (Dev) | Valider le workflow sur une tâche de développement | Pending |
| Test Phase 5 (Quality) | Valider le workflow sur des tests | Pending |

### Pistes de Recherche

| Piste | Description | Priorité |
|-------|-------------|----------|
| Calibration modèle estimation | Affiner les coûts base avec données réelles | Haute |
| Benchmark phases | Mesurer consommation tokens par type de phase | Haute |
| Alternatives guardrails | Explorer d'autres mécanismes de protection | Moyenne |

### Note

> **DeepResearch ROI** : L'analyse approfondie du ROI (justification du gap temps/coût du rapport multi-agent) sera effectuée dans un contexte séparé, pas dans cette branche.

---

## 13. Prochaine Étape

**AVANT implémentation** :
1. Effectuer les tests sur les phases 3-4-5
2. Collecter des données réelles de consommation tokens
3. Valider le modèle d'estimation sur cas concrets

**PUIS implémenter Phase 1 (Core)** :
1. Créer la configuration budget
2. Créer l'agent budget-estimator
3. Modifier /loop pour afficher l'estimation

---

*Plan sauvegardé - En attente de tests et validation*
*Branche : claude/test-deepsearch-pocket-watch-P5EDF*
