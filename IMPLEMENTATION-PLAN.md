# Plan d'Implémentation ACT v2.5

**Version :** 2.5
**Date :** 2026-02-02
**Statut :** 🔴 EN ATTENTE DE VALIDATION

---

## 📋 Méthodologie

### Approche : Incremental Feature Integration (IFI)

Chaque feature suit ce cycle :

```
1. SPEC     → Spécifier (fichier SPEC-{feature}.md)
2. SCAFFOLD → Créer la structure de fichiers
3. IMPL     → Implémenter le code
4. TEST     → Tester manuellement
5. DOC      → Documenter
6. COMMIT   → Commit avec tag
```

### Convention de commits

```
feat(act-v2.5): [PHASE-X.Y] Description courte

- Détail 1
- Détail 2

Closes #issue (si applicable)
```

### Tags de progression

```
v2.5.0-alpha.1  → Tier 1 feature 1 (Context Engineering)
v2.5.0-alpha.2  → Tier 1 feature 2 (Hooks System)
v2.5.0-alpha.3  → Tier 1 feature 3 (Iron Laws)
v2.5.0-alpha.4  → Tier 1 feature 4 (Scale-Adaptive)
v2.5.0-alpha.5  → Tier 1 feature 5 (Deviation Rules)
v2.5.0-alpha.6  → Tier 1 feature 6 (Session Recovery)
v2.5.0-alpha.7  → Tier 1 feature 7 (Model Selection)
v2.5.0-alpha.8  → Tier 1 feature 8 (Session History) ← NOUVEAU
v2.5.0-beta.1   → Tier 2 feature 1 (Continuous Learning)
...
v2.5.0-rc.1     → Tier 3 complet, ready for review
v2.5.0          → Release finale
```

---

## 🏗️ Phase 3 — Tier 1 (MUST HAVE)

### 3.1 Context Engineering (3-File Pattern)
**Priorité :** 🔴 CRITIQUE (fondation)
**Source :** Planning Files + GSD
**Effort estimé :** 2-3h

| Étape | Description | Commit |
|-------|-------------|--------|
| 3.1.1 | Créer `SPEC-context-engineering.md` | — |
| 3.1.2 | Créer structure `.act/` (config.yaml, state.md, plan.md, findings.md, progress.md) | ✅ `feat(act-v2.5): [3.1.2] Add .act/ directory structure` |
| 3.1.3 | Créer templates dans `templates/` | ✅ `feat(act-v2.5): [3.1.3] Add planning file templates` |
| 3.1.4 | Créer skill `skills/context-engineering/SKILL.md` | ✅ `feat(act-v2.5): [3.1.4] Add context-engineering skill` |
| 3.1.5 | Créer command `/act:init` pour initialiser un projet | ✅ `feat(act-v2.5): [3.1.5] Add /act:init command` |
| 3.1.6 | Tester sur projet exemple | — |
| 3.1.7 | Documenter dans README | ✅ `feat(act-v2.5): [3.1.7] Document context engineering` |
| **TAG** | | 🏷️ `v2.5.0-alpha.1` |

**Livrables :**
- [ ] `.act/` directory avec 5 fichiers
- [ ] `templates/` avec templates vides
- [ ] `skills/context-engineering/SKILL.md`
- [ ] `commands/act/init.md`
- [ ] Documentation README

---

### 3.2 Hooks System (Pre/Post/Stop)
**Priorité :** 🔴 CRITIQUE (automation)
**Source :** Planning Files + Everything CC
**Effort estimé :** 3-4h

| Étape | Description | Commit |
|-------|-------------|--------|
| 3.2.1 | Créer `SPEC-hooks-system.md` | — |
| 3.2.2 | Créer `hooks/hooks.json` (structure) | ✅ `feat(act-v2.5): [3.2.2] Add hooks.json structure` |
| 3.2.3 | Implémenter PreToolUse hook (refresh goals) | ✅ `feat(act-v2.5): [3.2.3] Implement PreToolUse hook` |
| 3.2.4 | Implémenter PostToolUse hook (update status) | ✅ `feat(act-v2.5): [3.2.4] Implement PostToolUse hook` |
| 3.2.5 | Implémenter Stop hook (completion check) | ✅ `feat(act-v2.5): [3.2.5] Implement Stop hook` |
| 3.2.6 | Tester les 3 hooks | — |
| 3.2.7 | Documenter | ✅ `feat(act-v2.5): [3.2.7] Document hooks system` |
| **TAG** | | 🏷️ `v2.5.0-alpha.2` |

**Livrables :**
- [ ] `hooks/hooks.json`
- [ ] 3 hooks fonctionnels
- [ ] Documentation

---

### 3.3 Iron Laws (TDD, Debug, Verification)
**Priorité :** 🟠 HAUTE
**Source :** Superpowers
**Effort estimé :** 1-2h

| Étape | Description | Commit |
|-------|-------------|--------|
| 3.3.1 | Créer `SPEC-iron-laws.md` | — |
| 3.3.2 | Créer `rules/iron-laws.md` avec les 3 lois | ✅ `feat(act-v2.5): [3.3.2] Add iron laws rules` |
| 3.3.3 | Intégrer dans CLAUDE.md principal | ✅ `feat(act-v2.5): [3.3.3] Integrate iron laws in CLAUDE.md` |
| 3.3.4 | Créer checklist de vérification | ✅ `feat(act-v2.5): [3.3.4] Add verification checklist` |
| **TAG** | | 🏷️ `v2.5.0-alpha.3` |

**Livrables :**
- [ ] `rules/iron-laws.md`
- [ ] CLAUDE.md mis à jour
- [ ] Checklist vérification

---

### 3.4 Scale-Adaptive (Quick vs Full Mode)
**Priorité :** 🟠 HAUTE
**Source :** BMAD + GSD
**Effort estimé :** 2-3h

| Étape | Description | Commit |
|-------|-------------|--------|
| 3.4.1 | Créer `SPEC-scale-adaptive.md` | — |
| 3.4.2 | Définir critères Quick vs Full dans `rules/scale-adaptive.md` | ✅ `feat(act-v2.5): [3.4.2] Add scale-adaptive rules` |
| 3.4.3 | Créer command `/act:quick` | ✅ `feat(act-v2.5): [3.4.3] Add /act:quick command` |
| 3.4.4 | Créer command `/act:full` | ✅ `feat(act-v2.5): [3.4.4] Add /act:full command` |
| 3.4.5 | Documenter les cas d'usage | ✅ `feat(act-v2.5): [3.4.5] Document scale-adaptive modes` |
| **TAG** | | 🏷️ `v2.5.0-alpha.4` |

**Livrables :**
- [ ] `rules/scale-adaptive.md`
- [ ] `commands/act/quick.md`
- [ ] `commands/act/full.md`
- [ ] Documentation

---

### 3.5 Deviation Rules (5 règles auto-handling)
**Priorité :** 🟠 HAUTE
**Source :** GSD + TÂCHES
**Effort estimé :** 1-2h

| Étape | Description | Commit |
|-------|-------------|--------|
| 3.5.1 | Créer `SPEC-deviation-rules.md` | — |
| 3.5.2 | Créer `rules/deviation-rules.md` avec 5 règles | ✅ `feat(act-v2.5): [3.5.2] Add deviation rules` |
| 3.5.3 | Créer `templates/ISSUES.md` pour enhancements | ✅ `feat(act-v2.5): [3.5.3] Add ISSUES.md template` |
| 3.5.4 | Intégrer dans workflow principal | ✅ `feat(act-v2.5): [3.5.4] Integrate deviation rules` |
| **TAG** | | 🏷️ `v2.5.0-alpha.5` |

**Livrables :**
- [ ] `rules/deviation-rules.md`
- [ ] `templates/ISSUES.md`
- [ ] Intégration workflow

---

### 3.6 Session Recovery
**Priorité :** 🟡 MOYENNE
**Source :** Planning Files
**Effort estimé :** 2-3h

| Étape | Description | Commit |
|-------|-------------|--------|
| 3.6.1 | Créer `SPEC-session-recovery.md` | — |
| 3.6.2 | Créer skill `skills/session-recovery/SKILL.md` | ✅ `feat(act-v2.5): [3.6.2] Add session-recovery skill` |
| 3.6.3 | Implémenter détection de sessions précédentes | ✅ `feat(act-v2.5): [3.6.3] Implement session detection` |
| 3.6.4 | Implémenter génération catchup report | ✅ `feat(act-v2.5): [3.6.4] Implement catchup report` |
| 3.6.5 | Créer command `/act:resume` | ✅ `feat(act-v2.5): [3.6.5] Add /act:resume command` |
| **TAG** | | 🏷️ `v2.5.0-alpha.6` |

**Livrables :**
- [ ] `skills/session-recovery/SKILL.md`
- [ ] `commands/act/resume.md`
- [ ] Catchup report fonctionnel

---

### 3.7 Model Selection par Agent
**Priorité :** 🟡 MOYENNE
**Source :** Everything CC + GSD
**Effort estimé :** 2-3h

| Étape | Description | Commit |
|-------|-------------|--------|
| 3.7.1 | Créer `SPEC-model-selection.md` | — |
| 3.7.2 | Définir mapping agents → models dans `.act/config.yaml` | ✅ `feat(act-v2.5): [3.7.2] Add model selection config` |
| 3.7.3 | Créer agents de base (planner, executor, reviewer...) | ✅ `feat(act-v2.5): [3.7.3] Add base agents` |
| 3.7.4 | Documenter stratégie de sélection | ✅ `feat(act-v2.5): [3.7.4] Document model selection` |
| **TAG** | | 🏷️ `v2.5.0-alpha.7` |

**Livrables :**
- [ ] Config model selection dans `.act/config.yaml`
- [ ] `agents/` avec 6 agents de base
- [ ] Documentation

---

### 3.8 Session History (Historique des sessions)
**Priorité :** 🟡 MOYENNE
**Source :** Nouvelle feature (demande Manu)
**Effort estimé :** 2-3h

| Étape | Description | Commit |
|-------|-------------|--------|
| 3.8.1 | Créer `SPEC-session-history.md` | — |
| 3.8.2 | Créer structure `.act/history/` avec format YYYY-MM-DD-HHmm.md | ✅ `feat(act-v2.5): [3.8.2] Add session history structure` |
| 3.8.3 | Implémenter auto-save en fin de session | ✅ `feat(act-v2.5): [3.8.3] Implement session auto-save` |
| 3.8.4 | Implémenter rotation/cleanup (garder N dernières) | ✅ `feat(act-v2.5): [3.8.4] Implement history rotation` |
| 3.8.5 | Créer command `/act:history` (lister sessions) | ✅ `feat(act-v2.5): [3.8.5] Add /act:history command` |
| 3.8.6 | Créer command `/act:replay <session>` (revoir une session) | ✅ `feat(act-v2.5): [3.8.6] Add /act:replay command` |
| 3.8.7 | Intégrer avec Session Recovery | ✅ `feat(act-v2.5): [3.8.7] Integrate history with recovery` |
| **TAG** | | 🏷️ `v2.5.0-alpha.8` |

**Livrables :**
- [ ] `.act/history/` directory
- [ ] Auto-save session logs
- [ ] Rotation configurable (défaut: 10 sessions)
- [ ] `commands/act/history.md`
- [ ] `commands/act/replay.md`
- [ ] Intégration avec catchup report

**Format session log :**
```markdown
# Session 2026-02-02 03:30

## Metadata
- Durée: 45min
- Tokens utilisés: ~12k
- Commits: 3

## Résumé
- Objectif: Implémenter Context Engineering
- Résultat: ✅ Complété

## Actions clés
1. Créé .act/ structure
2. Ajouté templates
3. Testé sur projet exemple

## État final
- Phase: 3.1 ✅
- Prochaine: 3.2 Hooks System
```

---

## 🟠 Phase 4 — Tier 2 (SHOULD HAVE)

### 4.1 Continuous Learning v2
**Source :** Everything CC
**Effort estimé :** 4-5h

| Étape | Description | Commit |
|-------|-------------|--------|
| 4.1.1 | Créer `SPEC-continuous-learning.md` | — |
| 4.1.2 | Créer structure `instincts/` | ✅ `feat(act-v2.5): [4.1.2] Add instincts structure` |
| 4.1.3 | Implémenter observation logging | ✅ `feat(act-v2.5): [4.1.3] Implement observation logging` |
| 4.1.4 | Implémenter pattern detection | ✅ `feat(act-v2.5): [4.1.4] Implement pattern detection` |
| 4.1.5 | Implémenter confidence scoring | ✅ `feat(act-v2.5): [4.1.5] Implement confidence scoring` |
| 4.1.6 | Créer command `/act:evolve` | ✅ `feat(act-v2.5): [4.1.6] Add /act:evolve command` |
| **TAG** | | 🏷️ `v2.5.0-beta.1` |

---

### 4.2 Reflexion Pattern
**Source :** CEK
**Effort estimé :** 2-3h

| Étape | Description | Commit |
|-------|-------------|--------|
| 4.2.1 | Créer `SPEC-reflexion.md` | — |
| 4.2.2 | Créer skill `skills/reflexion/SKILL.md` | ✅ `feat(act-v2.5): [4.2.2] Add reflexion skill` |
| 4.2.3 | Créer command `/act:reflect` | ✅ `feat(act-v2.5): [4.2.3] Add /act:reflect command` |
| 4.2.4 | Créer command `/act:memorize` | ✅ `feat(act-v2.5): [4.2.4] Add /act:memorize command` |
| **TAG** | | 🏷️ `v2.5.0-beta.2` |

---

### 4.3 Thinking Models (12)
**Source :** TÂCHES
**Effort estimé :** 3-4h

| Étape | Description | Commit |
|-------|-------------|--------|
| 4.3.1 | Créer `SPEC-thinking-models.md` | — |
| 4.3.2 | Créer `skills/thinking/SKILL.md` | ✅ `feat(act-v2.5): [4.3.2] Add thinking skill` |
| 4.3.3 | Implémenter 6 premiers modèles | ✅ `feat(act-v2.5): [4.3.3] Add first 6 thinking models` |
| 4.3.4 | Implémenter 6 derniers modèles | ✅ `feat(act-v2.5): [4.3.4] Add last 6 thinking models` |
| 4.3.5 | Créer commands `/consider:*` | ✅ `feat(act-v2.5): [4.3.5] Add /consider commands` |
| **TAG** | | 🏷️ `v2.5.0-beta.3` |

---

### 4.4 Context Handoff Format
**Source :** TÂCHES + Planning Files
**Effort estimé :** 1-2h

| Étape | Description | Commit |
|-------|-------------|--------|
| 4.4.1 | Créer `SPEC-context-handoff.md` | — |
| 4.4.2 | Créer template handoff XML | ✅ `feat(act-v2.5): [4.4.2] Add handoff template` |
| 4.4.3 | Créer command `/act:handoff` | ✅ `feat(act-v2.5): [4.4.3] Add /act:handoff command` |
| **TAG** | | 🏷️ `v2.5.0-beta.4` |

---

### 4.5 5-Question Reboot Test
**Source :** Planning Files
**Effort estimé :** 1h

| Étape | Description | Commit |
|-------|-------------|--------|
| 4.5.1 | Créer `SPEC-reboot-test.md` | — |
| 4.5.2 | Intégrer dans session-recovery | ✅ `feat(act-v2.5): [4.5.2] Add 5-question reboot test` |
| 4.5.3 | Créer command `/act:where-am-i` | ✅ `feat(act-v2.5): [4.5.3] Add /act:where-am-i command` |
| **TAG** | | 🏷️ `v2.5.0-beta.5` |

---

## 🟢 Phase 5 — Tier 3 (NICE TO HAVE)

### 5.1 Multi-IDE Support
**Source :** Planning Files
**Effort estimé :** 2-3h

| Étape | Description | Commit |
|-------|-------------|--------|
| 5.1.1 | Créer `SPEC-multi-ide.md` | — |
| 5.1.2 | Créer générateurs pour .cursor/, .gemini/, etc. | ✅ `feat(act-v2.5): [5.1.2] Add multi-IDE generators` |
| 5.1.3 | Créer command `/act:export` | ✅ `feat(act-v2.5): [5.1.3] Add /act:export command` |
| **TAG** | | 🏷️ `v2.5.0-rc.1` |

---

### 5.2 GitHub Integration
**Source :** CCPM
**Effort estimé :** 3-4h

| Étape | Description | Commit |
|-------|-------------|--------|
| 5.2.1 | Créer `SPEC-github-integration.md` | — |
| 5.2.2 | Implémenter sync Issues ↔ plan.md | ✅ `feat(act-v2.5): [5.2.2] Add GitHub Issues sync` |
| 5.2.3 | Créer command `/act:sync-github` | ✅ `feat(act-v2.5): [5.2.3] Add /act:sync-github command` |
| **TAG** | | 🏷️ `v2.5.0-rc.2` |

---

### 5.3 Party Mode
**Source :** BMAD
**Effort estimé :** 2-3h

| Étape | Description | Commit |
|-------|-------------|--------|
| 5.3.1 | Créer `SPEC-party-mode.md` | — |
| 5.3.2 | Implémenter conversation multi-agents | ✅ `feat(act-v2.5): [5.3.2] Add party mode` |
| 5.3.3 | Créer command `/act:party` | ✅ `feat(act-v2.5): [5.3.3] Add /act:party command` |
| **TAG** | | 🏷️ `v2.5.0-rc.3` |

---

### 5.4 Agent Auditors
**Source :** TÂCHES
**Effort estimé :** 2h

| Étape | Description | Commit |
|-------|-------------|--------|
| 5.4.1 | Créer `SPEC-agent-auditors.md` | — |
| 5.4.2 | Créer commands `/act:audit-*` | ✅ `feat(act-v2.5): [5.4.2] Add audit commands` |
| 5.4.3 | Créer command `/act:heal` | ✅ `feat(act-v2.5): [5.4.3] Add /act:heal command` |
| **TAG** | | 🏷️ `v2.5.0-rc.4` |

---

## 📊 Récapitulatif

| Phase | Features | Commits | Tags | Effort Total |
|-------|----------|---------|------|--------------|
| **Phase 3 (Tier 1)** | 8 | 34 | 8 alpha | ~17-23h |
| **Phase 4 (Tier 2)** | 5 | 15 | 5 beta | ~11-15h |
| **Phase 5 (Tier 3)** | 4 | 9 | 4 rc | ~9-12h |
| **TOTAL** | **17** | **58** | **17** | **~37-50h** |

---

## ✅ Checklist de Validation

Avant de commencer, confirmer :

- [ ] Structure du plan OK
- [ ] Méthodologie IFI OK
- [ ] Convention de commits OK
- [ ] Ordre des features OK
- [ ] Effort estimé réaliste
- [ ] Tags de progression OK

---

## 🚀 Prochaine Action

**Après validation :**
1. Créer branche `feature/act-v2.5-implementation`
2. Commencer par 3.1 Context Engineering
3. Suivre le cycle SPEC → SCAFFOLD → IMPL → TEST → DOC → COMMIT

---

*Plan créé le 2026-02-02 par Archi*
*En attente de validation par Manu*
