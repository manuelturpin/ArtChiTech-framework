# Changelog - ACT Framework

## [2.7.0] - 2026-02-04

### 🎯 Native Skills - Zero External Dependencies

Cette version élimine la dépendance au plugin externe `superpowers` en migrant vers des skills natifs intégrés.

### ✨ Nouveautés

#### 6 Skills Natifs
- `@skills/brainstorming/SKILL.md` — Génération d'idées structurée
- `@skills/tdd/SKILL.md` — Test-Driven Development
- `@skills/code-review/SKILL.md` — Revue de code systématique
- `@skills/debugging/SKILL.md` — Debugging méthodique
- `@skills/verification/SKILL.md` — Vérification avant complétion
- `@skills/writing-plans/SKILL.md` — Rédaction de plans

#### Outils
- Script `verify_dependencies.sh` pour vérifier l'absence de dépendances externes
- Guide de migration `docs/MIGRATION-FROM-SUPERPOWERS.md`

### 🔧 Changements

- `plugin.json` : `"plugins": []` — Plus aucune dépendance externe
- Tous les workflows migrent de `superpowers:*` vers `@skills/*/SKILL.md`
- Documentation mise à jour (installation.md, README.md)

### 📊 Impact

| Métrique | Avant | Après |
|----------|-------|-------|
| Dépendances externes | superpowers | **0** |
| Skills natifs | 0 | **6** |
| Refs superpowers (code actif) | 139+ | **0** |

### 🏆 Bénéfices

- ✅ Framework 100% autonome
- ✅ Fonctionne offline
- ✅ Skills personnalisables localement
- ✅ Installation simplifiée

---

## [2.6.0] - 2026-02-03

### 🏗️ Architecture Consolidée

- Installation locale/globale avec options
- Copie des répertoires cachés en install global
- Documentation README mise à jour

---

## [2.5.0] - 2026-02-02

### 🎉 Major Release - Agentic Coding Toolkit v2.5

Cette version majeure apporte 28 nouvelles features organisées en 3 tiers.

### Tier 1 - Core Features (MUST HAVE)

#### Context Engineering
- Nouveau système 3-File Pattern (.act/)
- Fichiers : config.yaml, state.md, plan.md, findings.md, progress.md
- Command `/act:init` pour initialiser un projet

#### Hooks System
- 5 hooks : PreToolUse, PostToolUse, Stop, PreSession, OnError
- Configuration dans hooks/hooks.json
- Support des hooks locaux par projet

#### Iron Laws
- TDD Iron Law : No production code without failing test
- Debugging Iron Law : No fixes without root cause investigation
- Verification Iron Law : No completion claims without fresh evidence

#### Scale-Adaptive
- Quick Mode (3 phases) pour tâches simples
- Full Mode (7 phases) pour projets complexes
- Commands `/act:quick` et `/act:full`

#### Deviation Rules
- 5 règles d'auto-handling
- Rules 1-3, 5 : autonome
- Rule 4 : demande confirmation pour décisions architecturales

#### Session Recovery
- Catchup report automatique
- Command `/act:resume`
- Intégration avec Session History

#### Model Selection
- 6 agents avec modèles appropriés
- Opus pour réflexion, Sonnet pour exécution, Haiku pour documentation

#### Session History
- Historique des sessions dans .act/history/
- Commands `/act:history` et `/act:replay`
- Rotation automatique

### Tier 1 - Améliorations

- `/act:validate` - Validation de la structure .act/
- PreSession hook - Lecture automatique du contexte
- Timestamps automatiques dans progress.md
- OnError hook - Gestion des erreurs
- Hooks locaux par projet
- `/act:diff` - Diff entre sessions
- `/act:status` - Estimation de temps
- Template .gitignore pour ACT

### Tier 2 - Enhanced Features (SHOULD HAVE)

#### Continuous Learning v2
- Observations logging (observations.jsonl)
- Pattern detection
- Confidence scoring (0.3-0.9)
- Command `/act:evolve`
- Structure instincts/

#### Reflexion Pattern
- Amélioration qualité +8-21%
- Commands `/act:reflect` et `/act:memorize`
- 4 questions de réflexion

#### Thinking Models (12)
- 12 modèles mentaux
- Commands `/consider:*`
- First Principles, 5 Whys, Pareto, Inversion, etc.

#### Context Handoff
- Format XML standardisé
- Command `/act:handoff`
- Intégration avec Session Recovery

#### 5-Question Reboot Test
- Validation du contexte après reset
- Command `/act:where-am-i`
- 5 questions clés

### Tier 3 - Extended Features (NICE TO HAVE)

#### Multi-IDE Support
- Export pour Cursor, Windsurf, Aider, Continue, Copilot
- Command `/act:export`
- Templates par IDE

#### GitHub Integration
- Sync Issues ↔ plan.md
- Command `/act:sync-github`
- Templates PR/Issue

#### Party Mode
- Discussion multi-agents
- 5 personas : Architect, Developer, Reviewer, User Advocate, Devil's Advocate
- Command `/act:party`

#### Agent Auditors
- Audit des skills, commands, agents
- Commands `/act:audit-*`
- Auto-repair avec `/act:heal`

### 📊 Statistiques

- **Features totales :** 28
- **Commits :** 70+
- **Tags :** 17 (alpha.1-8, beta.1-5, rc.1-4)
- **Tests :** 100% pass rate
- **Documentation :** README.md, CLAUDE.md, 20+ specs

### 🙏 Credits

Basé sur l'analyse de 9 frameworks :
- Superpowers, BMAD-METHOD, GSD, Planning Files
- Everything Claude Code, Context Engineering Kit
- TÂCHES CC Resources, Claude-Flow, CCPM
