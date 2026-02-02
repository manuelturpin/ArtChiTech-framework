# Plan d'Implémentation ACT v2.5 — Tier 3

**Version :** 2.5
**Date :** 2026-02-02
**Statut :** 🔴 EN ATTENTE DE VALIDATION

---

## 📋 Rappel Méthodologie

### Approche : Incremental Feature Integration (IFI)

```
1. SPEC     → Spécifier (fichier SPEC-{feature}.md)
2. SCAFFOLD → Créer la structure de fichiers
3. IMPL     → Implémenter le code/documentation
4. TEST     → Tester manuellement
5. DOC      → Documenter (README, CLAUDE.md)
6. COMMIT   → Commit avec tag
```

### Tags de progression

```
v2.5.0-rc.1   → Tier 3 feature 1 (Multi-IDE Support)
v2.5.0-rc.2   → Tier 3 feature 2 (GitHub Integration)
v2.5.0-rc.3   → Tier 3 feature 3 (Party Mode)
v2.5.0-rc.4   → Tier 3 feature 4 (Agent Auditors)
v2.5.0        → Release finale (après validation)
```

---

## 📊 Récapitulatif Tier 3

| # | Feature | Source | Effort | Commits |
|---|---------|--------|--------|---------|
| 5.1 | Multi-IDE Support | Planning Files | 2-3h | 4 |
| 5.2 | GitHub Integration | CCPM | 3-4h | 5 |
| 5.3 | Party Mode | BMAD | 2-3h | 4 |
| 5.4 | Agent Auditors | TÂCHES | 2h | 4 |
| **Total** | **4 features** | | **~9-12h** | **17 commits** |

---

## 🟢 Phase 5 — Tier 3 (NICE TO HAVE)

### 5.1 Multi-IDE Support
**Priorité :** 🟢 NICE-TO-HAVE
**Source :** Planning Files
**Effort estimé :** 2-3h

#### Description
Permettre à ACT de fonctionner avec différents IDEs (Claude Code, Cursor, Windsurf, Aider, etc.) en générant des configurations spécifiques.

#### IDEs supportés
| IDE | Config Directory | Format |
|-----|-----------------|--------|
| Claude Code | `.claude/` | CLAUDE.md |
| Cursor | `.cursor/` | rules/ |
| Windsurf | `.windsurf/` | rules/ |
| Aider | `.aider/` | .aider.conf.yml |
| Continue | `.continue/` | config.json |
| Copilot | `.github/` | copilot-instructions.md |

#### Étapes

| Étape | Description | Commit |
|-------|-------------|--------|
| 5.1.1 | Créer `specs/SPEC-multi-ide.md` | — |
| 5.1.2 | Créer générateurs dans `tools/ide-export/` | ✅ `feat(act-v2.5): [5.1.2] Add IDE export generators` |
| 5.1.3 | Créer templates pour chaque IDE | ✅ `feat(act-v2.5): [5.1.3] Add IDE-specific templates` |
| 5.1.4 | Créer command `/act:export` | ✅ `feat(act-v2.5): [5.1.4] Add /act:export command` |
| 5.1.5 | Documenter et mettre à jour README/CLAUDE.md | ✅ `feat(act-v2.5): [5.1.5] Document multi-IDE support` |
| **TAG** | | 🏷️ `v2.5.0-rc.1` |

#### Livrables
- [ ] `specs/SPEC-multi-ide.md`
- [ ] `tools/ide-export/` avec générateurs
- [ ] `templates/ide/` avec templates par IDE
- [ ] `commands/act/export.md`
- [ ] Documentation README/CLAUDE.md

#### Command /act:export
```
/act:export [--ide <cursor|windsurf|aider|continue|copilot>] [--all]

Options:
  --ide     Exporter pour un IDE spécifique
  --all     Exporter pour tous les IDEs supportés
  --force   Écraser les fichiers existants
```

---

### 5.2 GitHub Integration
**Priorité :** 🟢 NICE-TO-HAVE
**Source :** CCPM
**Effort estimé :** 3-4h

#### Description
Synchroniser l'état du projet ACT avec GitHub Issues pour une gestion de projet intégrée.

#### Features
- Créer des Issues depuis `.act/plan.md`
- Mettre à jour les Issues depuis `progress.md`
- Lier les commits aux phases
- Générer des PR descriptions

#### Étapes

| Étape | Description | Commit |
|-------|-------------|--------|
| 5.2.1 | Créer `specs/SPEC-github-integration.md` | — |
| 5.2.2 | Créer `skills/github-integration/SKILL.md` | ✅ `feat(act-v2.5): [5.2.2] Add github-integration skill` |
| 5.2.3 | Implémenter sync Issues ↔ plan.md | ✅ `feat(act-v2.5): [5.2.3] Add GitHub Issues sync` |
| 5.2.4 | Créer command `/act:sync-github` | ✅ `feat(act-v2.5): [5.2.4] Add /act:sync-github command` |
| 5.2.5 | Créer templates PR/Issue | ✅ `feat(act-v2.5): [5.2.5] Add GitHub templates` |
| 5.2.6 | Documenter et mettre à jour README/CLAUDE.md | ✅ `feat(act-v2.5): [5.2.6] Document GitHub integration` |
| **TAG** | | 🏷️ `v2.5.0-rc.2` |

#### Livrables
- [ ] `specs/SPEC-github-integration.md`
- [ ] `skills/github-integration/SKILL.md`
- [ ] `commands/act/sync-github.md`
- [ ] `templates/github/` (issue.md, pr.md)
- [ ] Documentation README/CLAUDE.md

#### Command /act:sync-github
```
/act:sync-github [--push | --pull] [--dry-run]

Options:
  --push     Pousser l'état local vers GitHub Issues
  --pull     Récupérer l'état des Issues vers local
  --dry-run  Afficher les changements sans les appliquer
```

---

### 5.3 Party Mode
**Priorité :** 🟢 NICE-TO-HAVE
**Source :** BMAD-METHOD
**Effort estimé :** 2-3h

#### Description
Mode de discussion multi-agents où plusieurs perspectives sont représentées dans une conversation.

#### Agents en Party Mode
| Agent | Perspective | Focus |
|-------|-------------|-------|
| Architect | Vue système | Structure, patterns |
| Developer | Implémentation | Code, pragmatisme |
| Reviewer | Qualité | Bugs, edge cases |
| User Advocate | UX | Utilisabilité |
| Devil's Advocate | Critique | Risques, problèmes |

#### Étapes

| Étape | Description | Commit |
|-------|-------------|--------|
| 5.3.1 | Créer `specs/SPEC-party-mode.md` | — |
| 5.3.2 | Créer `skills/party-mode/SKILL.md` | ✅ `feat(act-v2.5): [5.3.2] Add party-mode skill` |
| 5.3.3 | Définir les personas des agents | ✅ `feat(act-v2.5): [5.3.3] Add party mode personas` |
| 5.3.4 | Créer command `/act:party` | ✅ `feat(act-v2.5): [5.3.4] Add /act:party command` |
| 5.3.5 | Documenter et mettre à jour README/CLAUDE.md | ✅ `feat(act-v2.5): [5.3.5] Document party mode` |
| **TAG** | | 🏷️ `v2.5.0-rc.3` |

#### Livrables
- [ ] `specs/SPEC-party-mode.md`
- [ ] `skills/party-mode/SKILL.md`
- [ ] `skills/party-mode/personas/` (5 personas)
- [ ] `commands/act/party.md`
- [ ] Documentation README/CLAUDE.md

#### Command /act:party
```
/act:party "<topic>" [--agents <list>] [--rounds <n>]

Options:
  --agents   Liste des agents à inclure (défaut: tous)
  --rounds   Nombre de tours de discussion (défaut: 3)
  --summary  Générer un résumé à la fin

Exemple:
/act:party "Should we use microservices or monolith?"
```

---

### 5.4 Agent Auditors
**Priorité :** 🟢 NICE-TO-HAVE
**Source :** TÂCHES CC Resources
**Effort estimé :** 2h

#### Description
Outils pour auditer et réparer les skills, commands et agents du framework.

#### Commands
| Command | Description |
|---------|-------------|
| `/act:audit-skill <name>` | Vérifier un skill |
| `/act:audit-command <name>` | Vérifier une command |
| `/act:audit-agent <name>` | Vérifier un agent |
| `/act:heal <target>` | Réparer automatiquement |
| `/act:audit-all` | Audit complet du framework |

#### Étapes

| Étape | Description | Commit |
|-------|-------------|--------|
| 5.4.1 | Créer `specs/SPEC-agent-auditors.md` | — |
| 5.4.2 | Créer `skills/auditor/SKILL.md` | ✅ `feat(act-v2.5): [5.4.2] Add auditor skill` |
| 5.4.3 | Créer commands `/act:audit-*` | ✅ `feat(act-v2.5): [5.4.3] Add audit commands` |
| 5.4.4 | Créer command `/act:heal` | ✅ `feat(act-v2.5): [5.4.4] Add /act:heal command` |
| 5.4.5 | Documenter et mettre à jour README/CLAUDE.md | ✅ `feat(act-v2.5): [5.4.5] Document agent auditors` |
| **TAG** | | 🏷️ `v2.5.0-rc.4` |

#### Livrables
- [ ] `specs/SPEC-agent-auditors.md`
- [ ] `skills/auditor/SKILL.md`
- [ ] `commands/act/audit-skill.md`
- [ ] `commands/act/audit-command.md`
- [ ] `commands/act/audit-agent.md`
- [ ] `commands/act/audit-all.md`
- [ ] `commands/act/heal.md`
- [ ] Documentation README/CLAUDE.md

#### Audit Checks
| Check | Description |
|-------|-------------|
| Structure | Fichiers requis présents |
| Format | Markdown valide, sections requises |
| References | Liens internes fonctionnels |
| Consistency | Cohérence avec autres fichiers |
| Completeness | Pas de TODO/FIXME oubliés |

---

## 📊 Récapitulatif Final

| Phase | Feature | Commits | Tag |
|-------|---------|---------|-----|
| 5.1 | Multi-IDE Support | 4 | rc.1 |
| 5.2 | GitHub Integration | 5 | rc.2 |
| 5.3 | Party Mode | 4 | rc.3 |
| 5.4 | Agent Auditors | 4 | rc.4 |
| **Total** | **4 features** | **17** | **4 tags** |

---

## 🧪 Plan de Test

| Test | Feature | Scénarios |
|------|---------|-----------|
| T1 | Multi-IDE | Exporter pour Cursor, vérifier format |
| T2 | GitHub | Sync plan.md → Issues (dry-run) |
| T3 | Party Mode | Discussion sur choix technique |
| T4 | Auditors | Audit complet, heal un problème |

---

## 🚀 Ordre d'exécution

1. **5.1 Multi-IDE Support** (indépendant)
2. **5.2 GitHub Integration** (indépendant)
3. **5.3 Party Mode** (indépendant)
4. **5.4 Agent Auditors** (indépendant)

*Toutes les features sont indépendantes → parallélisation possible*

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
