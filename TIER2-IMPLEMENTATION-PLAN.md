# Plan d'Implémentation ACT v2.5 — Tier 2

**Version :** 2.5
**Date :** 2026-02-02
**Statut :** 🔴 EN ATTENTE DE VALIDATION

---

## 📋 Rappel Méthodologie

### Approche : Incremental Feature Integration (IFI)

Chaque feature suit ce cycle :

```
1. SPEC     → Spécifier (fichier SPEC-{feature}.md)
2. SCAFFOLD → Créer la structure de fichiers
3. IMPL     → Implémenter le code/documentation
4. TEST     → Tester manuellement
5. DOC      → Documenter (README, CLAUDE.md)
6. COMMIT   → Commit avec tag
```

### Convention de commits

```
feat(act-v2.5): [PHASE-X.Y] Description courte

- Détail 1
- Détail 2
```

### Tags de progression

```
v2.5.0-beta.1   → Tier 2 feature 1 (Continuous Learning)
v2.5.0-beta.2   → Tier 2 feature 2 (Reflexion Pattern)
v2.5.0-beta.3   → Tier 2 feature 3 (Thinking Models)
v2.5.0-beta.4   → Tier 2 feature 4 (Context Handoff)
v2.5.0-beta.5   → Tier 2 feature 5 (5-Question Reboot)
```

---

## 📊 Récapitulatif Tier 2

| # | Feature | Source | Effort | Commits |
|---|---------|--------|--------|---------|
| 4.1 | Continuous Learning v2 | Everything CC | 4-5h | 6 |
| 4.2 | Reflexion Pattern | CEK | 2-3h | 4 |
| 4.3 | Thinking Models (12) | TÂCHES | 3-4h | 5 |
| 4.4 | Context Handoff Format | TÂCHES + Planning Files | 1-2h | 3 |
| 4.5 | 5-Question Reboot Test | Planning Files | 1h | 3 |
| **Total** | **5 features** | | **~11-15h** | **21 commits** |

---

## 🟠 Phase 4 — Tier 2 (SHOULD HAVE)

### 4.1 Continuous Learning v2
**Priorité :** 🔴 HAUTE
**Source :** Everything Claude Code
**Effort estimé :** 4-5h

#### Description
Système d'apprentissage continu avec observation des patterns et confidence scoring.

#### Architecture
```
Session → Hooks (observe) → observations.jsonl → Pattern Detection → instincts/
                                                                        ↓
                                                                   /act:evolve
                                                                        ↓
                                                                   skills/
```

#### Étapes

| Étape | Description | Commit |
|-------|-------------|--------|
| 4.1.1 | Créer `specs/SPEC-continuous-learning.md` | — |
| 4.1.2 | Créer structure `instincts/` avec README | ✅ `feat(act-v2.5): [4.1.2] Add instincts structure` |
| 4.1.3 | Créer `observations.jsonl` format et template | ✅ `feat(act-v2.5): [4.1.3] Add observations logging format` |
| 4.1.4 | Implémenter pattern detection dans skill | ✅ `feat(act-v2.5): [4.1.4] Implement pattern detection` |
| 4.1.5 | Implémenter confidence scoring (0.3-0.9) | ✅ `feat(act-v2.5): [4.1.5] Implement confidence scoring` |
| 4.1.6 | Créer command `/act:evolve` | ✅ `feat(act-v2.5): [4.1.6] Add /act:evolve command` |
| 4.1.7 | Documenter et mettre à jour README/CLAUDE.md | ✅ `feat(act-v2.5): [4.1.7] Document continuous learning` |
| **TAG** | | 🏷️ `v2.5.0-beta.1` |

#### Livrables
- [ ] `specs/SPEC-continuous-learning.md`
- [ ] `instincts/` directory avec structure
- [ ] `skills/continuous-learning/SKILL.md`
- [ ] `.act/observations.jsonl` format
- [ ] `commands/act/evolve.md`
- [ ] Documentation README/CLAUDE.md

#### Confidence Scoring
| Score | Niveau | Action |
|-------|--------|--------|
| 0.3-0.5 | Tentative | Suggérer seulement |
| 0.5-0.7 | Probable | Proposer avec explication |
| 0.7-0.9 | Certain | Appliquer automatiquement |

---

### 4.2 Reflexion Pattern
**Priorité :** 🟠 MOYENNE-HAUTE
**Source :** Context Engineering Kit (CEK)
**Effort estimé :** 2-3h

#### Description
Pattern de réflexion pour améliorer la qualité des outputs (+8-21% prouvé).

#### Process
```
1. Complete task
2. /act:reflect (auto-triggered par "reflect" dans prompt)
3. Improve output
4. /act:memorize (save insights to CLAUDE.md)
```

#### Étapes

| Étape | Description | Commit |
|-------|-------------|--------|
| 4.2.1 | Créer `specs/SPEC-reflexion.md` | — |
| 4.2.2 | Créer `skills/reflexion/SKILL.md` | ✅ `feat(act-v2.5): [4.2.2] Add reflexion skill` |
| 4.2.3 | Créer command `/act:reflect` | ✅ `feat(act-v2.5): [4.2.3] Add /act:reflect command` |
| 4.2.4 | Créer command `/act:memorize` | ✅ `feat(act-v2.5): [4.2.4] Add /act:memorize command` |
| 4.2.5 | Documenter et mettre à jour README/CLAUDE.md | ✅ `feat(act-v2.5): [4.2.5] Document reflexion pattern` |
| **TAG** | | 🏷️ `v2.5.0-beta.2` |

#### Livrables
- [ ] `specs/SPEC-reflexion.md`
- [ ] `skills/reflexion/SKILL.md`
- [ ] `commands/act/reflect.md`
- [ ] `commands/act/memorize.md`
- [ ] Documentation README/CLAUDE.md

---

### 4.3 Thinking Models (12)
**Priorité :** 🟠 MOYENNE
**Source :** TÂCHES CC Resources
**Effort estimé :** 3-4h

#### Description
12 modèles mentaux pour améliorer la réflexion et la résolution de problèmes.

#### Les 12 Thinking Models

| # | Command | Technique | Description |
|---|---------|-----------|-------------|
| 1 | `/consider:first-principles` | First Principles | Décomposer aux fondamentaux |
| 2 | `/consider:5-whys` | 5 Whys | Root cause analysis |
| 3 | `/consider:pareto` | Pareto (80/20) | Focus sur l'essentiel |
| 4 | `/consider:inversion` | Inversion | Résoudre à l'envers |
| 5 | `/consider:second-order` | Second-Order | Conséquences des conséquences |
| 6 | `/consider:regret-minimization` | Regret Minimization | Décision long-terme |
| 7 | `/consider:opportunity-cost` | Opportunity Cost | Coût des alternatives |
| 8 | `/consider:circle-of-competence` | Circle of Competence | Connaître ses limites |
| 9 | `/consider:map-territory` | Map vs Territory | Modèle vs réalité |
| 10 | `/consider:probabilistic` | Probabilistic Thinking | Raisonner en probabilités |
| 11 | `/consider:pre-mortem` | Pre-Mortem | Anticiper l'échec |
| 12 | `/consider:reversibility` | Reversibility | Décisions réversibles vs non |

#### Étapes

| Étape | Description | Commit |
|-------|-------------|--------|
| 4.3.1 | Créer `specs/SPEC-thinking-models.md` | — |
| 4.3.2 | Créer `skills/thinking/SKILL.md` avec overview | ✅ `feat(act-v2.5): [4.3.2] Add thinking skill` |
| 4.3.3 | Créer les 6 premiers modèles (1-6) | ✅ `feat(act-v2.5): [4.3.3] Add first 6 thinking models` |
| 4.3.4 | Créer les 6 derniers modèles (7-12) | ✅ `feat(act-v2.5): [4.3.4] Add last 6 thinking models` |
| 4.3.5 | Créer commands `/consider:*` | ✅ `feat(act-v2.5): [4.3.5] Add /consider commands` |
| 4.3.6 | Documenter et mettre à jour README/CLAUDE.md | ✅ `feat(act-v2.5): [4.3.6] Document thinking models` |
| **TAG** | | 🏷️ `v2.5.0-beta.3` |

#### Livrables
- [ ] `specs/SPEC-thinking-models.md`
- [ ] `skills/thinking/SKILL.md`
- [ ] `skills/thinking/models/` avec 12 fichiers
- [ ] `commands/consider/` avec 12 commands
- [ ] Documentation README/CLAUDE.md

---

### 4.4 Context Handoff Format
**Priorité :** 🟡 MOYENNE
**Source :** TÂCHES + Planning Files
**Effort estimé :** 1-2h

#### Description
Format standardisé pour transférer le contexte entre sessions ou agents.

#### Format XML
```xml
<context_handoff>
  <original_task>...</original_task>
  <work_completed>...</work_completed>
  <work_remaining>...</work_remaining>
  <attempted_approaches>...</attempted_approaches>
  <critical_context>...</critical_context>
  <current_state>...</current_state>
</context_handoff>
```

#### Étapes

| Étape | Description | Commit |
|-------|-------------|--------|
| 4.4.1 | Créer `specs/SPEC-context-handoff.md` | — |
| 4.4.2 | Créer template handoff dans `templates/` | ✅ `feat(act-v2.5): [4.4.2] Add handoff template` |
| 4.4.3 | Créer command `/act:handoff` | ✅ `feat(act-v2.5): [4.4.3] Add /act:handoff command` |
| 4.4.4 | Intégrer avec Session Recovery | ✅ `feat(act-v2.5): [4.4.4] Integrate handoff with recovery` |
| **TAG** | | 🏷️ `v2.5.0-beta.4` |

#### Livrables
- [ ] `specs/SPEC-context-handoff.md`
- [ ] `templates/context-handoff.xml`
- [ ] `commands/act/handoff.md`
- [ ] Intégration Session Recovery
- [ ] Documentation README/CLAUDE.md

---

### 4.5 5-Question Reboot Test
**Priorité :** 🟡 MOYENNE
**Source :** Planning Files
**Effort estimé :** 1h

#### Description
Test rapide pour vérifier que le contexte a été correctement récupéré après un reset.

#### Les 5 Questions

| # | Question | Source |
|---|----------|--------|
| 1 | Where am I? | `.act/state.md` → Phase actuelle |
| 2 | Where am I going? | `.act/plan.md` → Phases restantes |
| 3 | What's the goal? | `.act/config.yaml` → Objectif projet |
| 4 | What have I learned? | `.act/findings.md` → Découvertes |
| 5 | What have I done? | `.act/progress.md` → Actions passées |

#### Étapes

| Étape | Description | Commit |
|-------|-------------|--------|
| 4.5.1 | Créer `specs/SPEC-reboot-test.md` | — |
| 4.5.2 | Intégrer dans Session Recovery skill | ✅ `feat(act-v2.5): [4.5.2] Integrate 5-question reboot test` |
| 4.5.3 | Créer command `/act:where-am-i` | ✅ `feat(act-v2.5): [4.5.3] Add /act:where-am-i command` |
| 4.5.4 | Documenter et mettre à jour README/CLAUDE.md | ✅ `feat(act-v2.5): [4.5.4] Document 5-question reboot test` |
| **TAG** | | 🏷️ `v2.5.0-beta.5` |

#### Livrables
- [ ] `specs/SPEC-reboot-test.md`
- [ ] Intégration dans `skills/session-recovery/SKILL.md`
- [ ] `commands/act/where-am-i.md`
- [ ] Documentation README/CLAUDE.md

---

## 📊 Récapitulatif Final

| Phase | Feature | Commits | Tag |
|-------|---------|---------|-----|
| 4.1 | Continuous Learning v2 | 6 | beta.1 |
| 4.2 | Reflexion Pattern | 4 | beta.2 |
| 4.3 | Thinking Models | 5 | beta.3 |
| 4.4 | Context Handoff | 3 | beta.4 |
| 4.5 | 5-Question Reboot | 3 | beta.5 |
| **Total** | **5 features** | **21** | **5 tags** |

---

## 🧪 Plan de Test

Après implémentation, tester chaque feature dans la sandbox :

| Test | Feature | Scénarios |
|------|---------|-----------|
| T1 | Continuous Learning | Observer patterns, générer instincts, /act:evolve |
| T2 | Reflexion | /act:reflect sur tâche, /act:memorize insight |
| T3 | Thinking Models | Utiliser 3-4 modèles sur problème réel |
| T4 | Context Handoff | Générer handoff, transférer à nouvelle session |
| T5 | 5-Question Reboot | /act:where-am-i après reset |

---

## 🚀 Ordre d'exécution

1. **4.1 Continuous Learning** (fondation pour l'apprentissage)
2. **4.2 Reflexion Pattern** (amélioration qualité)
3. **4.3 Thinking Models** (outils de réflexion)
4. **4.4 Context Handoff** (transfert contexte)
5. **4.5 5-Question Reboot** (validation récupération)

---

## ✅ Checklist de Validation

Avant de commencer, confirmer :

- [ ] Structure du plan OK
- [ ] Ordre des features OK
- [ ] Effort estimé réaliste
- [ ] Plan de test inclus

---

*Plan créé le 2026-02-02 par Archi*
*En attente de validation par Manu*
