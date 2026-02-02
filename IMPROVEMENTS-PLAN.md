# Plan d'Implémentation des Améliorations ACT v2.5

**Date :** 2026-02-02
**Basé sur :** Rapport Final des Tests Sandbox
**Statut :** 🔴 EN ATTENTE DE VALIDATION

---

## 📋 Résumé

| Type | Quantité |
|------|----------|
| Bug mineur à corriger | 1 |
| Améliorations haute priorité | 3 |
| Améliorations moyenne priorité | 4 |
| Améliorations basse priorité | 3 |
| **Total** | **11** |

---

## 🐛 Bug Mineur

### B1. Type de projet non documenté
**Source :** Test 1 - Context Engineering
**Problème :** Le type "cli" utilisé dans les tests n'est pas dans la liste documentée

**Correction :**
- Mettre à jour `templates/act/config.yaml.template` avec les types valides
- Ajouter : `product | cli | app | library | service | refactor | bugfix`
- Mettre à jour la documentation dans `commands/act/init.md`

**Commit :** `fix(act-v2.5): [B1] Add missing project types to template`

---

## 🔴 Priorité Haute (3)

### H1. Validation automatique `.act/`
**Source :** Test 1 - Context Engineering
**Description :** Commande `/act:validate` pour vérifier la conformité des fichiers .act/

**Implémentation :**
1. Créer `specs/SPEC-act-validate.md`
2. Créer `commands/act/validate.md` avec :
   - Vérification présence des 5 fichiers requis
   - Validation structure YAML de config.yaml
   - Vérification cohérence state.md ↔ plan.md
   - Output : rapport de validation avec ✅/❌

**Commit :** `feat(act-v2.5): [H1] Add /act:validate command`

---

### H2. Hook PreSession
**Source :** Test 2 - Hooks System
**Description :** Hook pour lire automatiquement `state.md` au démarrage de session

**Implémentation :**
1. Mettre à jour `specs/SPEC-hooks-system.md`
2. Ajouter dans `hooks/hooks.json` :
   ```json
   "PreSession": {
     "enabled": true,
     "description": "Read state.md at session start",
     "triggers": ["session_start"],
     "action": "refresh_context",
     "config": {
       "files": ["state.md", "plan.md"]
     }
   }
   ```
3. Créer `hooks/pre-session.md` avec documentation
4. Mettre à jour `hooks/README.md`

**Commit :** `feat(act-v2.5): [H2] Add PreSession hook`

---

### H3. Timestamps automatiques
**Source :** Test 6 - Session Recovery
**Description :** Timestamps automatiques dans `progress.md` lors des logs

**Implémentation :**
1. Mettre à jour `templates/act/progress.md.template` avec format timestamp
2. Mettre à jour `skills/context-engineering/SKILL.md` avec instructions
3. Format : `[YYYY-MM-DD HH:mm] Action description`
4. Mettre à jour PostToolUse hook pour inclure timestamp

**Commit :** `feat(act-v2.5): [H3] Add automatic timestamps to progress.md`

---

## 🟠 Priorité Moyenne (4)

### M1. Hook ErrorRecovery
**Source :** Test 2 - Hooks System
**Description :** Hook pour gérer les échecs d'opérations

**Implémentation :**
1. Ajouter dans `hooks/hooks.json` :
   ```json
   "OnError": {
     "enabled": true,
     "description": "Handle operation failures",
     "triggers": ["tool_error", "command_failure"],
     "action": "log_and_suggest",
     "config": {
       "logTo": "progress.md",
       "suggestRetry": true
     }
   }
   ```
2. Créer `hooks/on-error.md` avec documentation
3. Intégrer avec Deviation Rules (Rule 3 - Blockers)

**Commit :** `feat(act-v2.5): [M1] Add OnError hook`

---

### M2. Hooks custom par projet
**Source :** Test 2 - Hooks System
**Description :** Permettre des hooks spécifiques dans `.act/hooks.json` local

**Implémentation :**
1. Mettre à jour `specs/SPEC-hooks-system.md` avec section "Local Hooks"
2. Ajouter template `.act/hooks.json.template`
3. Documenter la hiérarchie : projet > framework
4. Mettre à jour `skills/context-engineering/SKILL.md`

**Commit :** `feat(act-v2.5): [M2] Add support for project-local hooks`

---

### M3. Types de projet clarifiés
**Source :** Test 1 - Context Engineering
**Description :** Documenter la liste complète des types valides

**Implémentation :**
1. Créer section dans `commands/act/init.md` :
   | Type | Description | Exemple |
   |------|-------------|---------|
   | `product` | Nouveau produit complet | SaaS app |
   | `cli` | Application ligne de commande | TaskFlow |
   | `app` | Application desktop/mobile | Electron app |
   | `library` | Package réutilisable | npm package |
   | `service` | Microservice/API | REST API |
   | `refactor` | Refactoring existant | Migration v2 |
   | `bugfix` | Correction de bug | Hotfix |

2. Mettre à jour README.md avec la liste

**Commit :** `docs(act-v2.5): [M3] Document all project types`

---

### M4. History directory usage
**Source :** Test 1 - Context Engineering
**Description :** Documenter l'usage prévu du dossier `.act/history/`

**Implémentation :**
1. Mettre à jour `skills/session-recovery/SKILL.md` avec section dédiée
2. Documenter dans README.md :
   - Format des fichiers : `YYYY-MM-DD-HHmm.md`
   - Rotation automatique (maxSessions)
   - Commandes `/act:history` et `/act:replay`
3. Ajouter exemple dans `templates/`

**Commit :** `docs(act-v2.5): [M4] Document .act/history/ usage`

---

## 🟢 Priorité Basse (3)

### L1. Diff entre sessions
**Source :** Test 6 - Session Recovery
**Description :** Afficher un diff depuis la dernière session pour les gros projets

**Implémentation :**
1. Créer `commands/act/diff.md` pour `/act:diff`
2. Comparer :
   - Fichiers modifiés depuis dernière session
   - Changements dans state.md
   - Nouveaux commits
3. Format output compact

**Commit :** `feat(act-v2.5): [L1] Add /act:diff command`

---

### L2. Estimation temps restant
**Source :** Test 6 - Session Recovery
**Description :** Calculer automatiquement basé sur la vélocité observée

**Implémentation :**
1. Ajouter section dans `state.md` template :
   ```markdown
   ## Velocity
   - Sessions completed: X
   - Average session duration: Xh
   - Phases completed: X/Y
   - Estimated remaining: ~Xh
   ```
2. Mettre à jour `/act:status` pour afficher l'estimation
3. Documenter le calcul

**Commit :** `feat(act-v2.5): [L2] Add time estimation to state.md`

---

### L3. Git integration améliorée
**Source :** Test 1 - Context Engineering
**Description :** Template `.gitignore` pour `.act/history/` si données sensibles

**Implémentation :**
1. Ajouter option dans `/act:init` : `--gitignore-history`
2. Créer template `.gitignore` pour ACT :
   ```
   # ACT v2.5 - Optional ignores
   # .act/history/     # Uncomment if sessions contain sensitive data
   # .act/findings.md  # Uncomment if research is confidential
   ```
3. Documenter dans README.md

**Commit :** `feat(act-v2.5): [L3] Add .gitignore template for ACT`

---

## 📊 Récapitulatif

| ID | Amélioration | Priorité | Effort | Commit |
|----|--------------|----------|--------|--------|
| B1 | Types projet dans template | Bug | 15min | fix |
| H1 | /act:validate | Haute | 1h | feat |
| H2 | PreSession hook | Haute | 45min | feat |
| H3 | Timestamps auto | Haute | 30min | feat |
| M1 | OnError hook | Moyenne | 45min | feat |
| M2 | Hooks custom projet | Moyenne | 1h | feat |
| M3 | Types projet docs | Moyenne | 30min | docs |
| M4 | History usage docs | Moyenne | 30min | docs |
| L1 | /act:diff | Basse | 1h30 | feat |
| L2 | Estimation temps | Basse | 1h | feat |
| L3 | .gitignore template | Basse | 30min | feat |

**Effort total estimé :** ~8-9 heures

---

## 🚀 Ordre d'exécution suggéré

### Phase 1 : Corrections immédiates (1h)
1. B1 - Types projet template
2. M3 - Types projet docs
3. M4 - History usage docs

### Phase 2 : Hooks & Validation (2h30)
4. H1 - /act:validate
5. H2 - PreSession hook
6. H3 - Timestamps auto
7. M1 - OnError hook

### Phase 3 : Extensibilité (1h)
8. M2 - Hooks custom projet

### Phase 4 : Nice-to-have (3h)
9. L1 - /act:diff
10. L2 - Estimation temps
11. L3 - .gitignore template

---

## ✅ Validation

**Avant de commencer, confirmer :**

- [ ] Ordre d'exécution OK
- [ ] Priorités OK
- [ ] Estimations réalistes
- [ ] Toutes les améliorations incluses

---

*Plan créé le 2026-02-02 par Archi*
*En attente de validation par Manu*
