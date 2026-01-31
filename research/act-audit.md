# Audit ACT Framework v2.1.1

**Date :** 2026-01-31  
**Phase :** 2 — Analyse interne  
**Objectif :** Comprendre ACT tel qu'il est pour identifier les améliorations

---

## 🎯 Vision d'ACT

**Mission :** Framework qui oriente un modèle IA pour réaliser des tâches de manière structurée, utilisant des agents dédiés (recherche, développement, sécurité).

**Cible :** Claude Code (priorité) → Généraliste (Cursor, Copilot, Aider)

**Principe :** Zéro dépendance externe (objectif : éliminer Superpowers)

---

## 🏗️ Architecture Actuelle

### Structure des fichiers

```
plugin/
├── commands/           # 14 slash commands
│   ├── act-project.md     # Hub principal
│   ├── act-onboard.md     # Audit projet existant
│   ├── act-status.md      # État du projet
│   ├── act-next.md        # Passer à la phase suivante
│   ├── act-fix.md         # Corriger les problèmes
│   ├── act-resume.md      # Reprendre une session
│   ├── act-help.md        # Aide contextuelle
│   ├── act-feedback.md    # Feedback utilisateur
│   ├── act-triage.md      # Triage des issues
│   ├── act-fix-issue.md   # Fix issue spécifique
│   ├── loop.md            # Boucle de dev
│   ├── loop-status.md     # Status de la boucle
│   ├── loop-complete.md   # Compléter la boucle
│   └── stories-generate.md # Générer des stories
│
├── agents/             # 7 agents
│   ├── project-orchestrator.md  # Coordinateur principal
│   ├── phase-controller.md      # Contrôle des phases
│   ├── context-manager.md       # Gestion contexte/état
│   ├── chunk-manager.md         # Découpage en chunks
│   ├── error-tracker.md         # Suivi des erreurs
│   ├── loop-executor.md         # Exécution des boucles
│   └── tips-engine.md           # Moteur de conseils
│
├── skills/             # 4 skills natifs
│   ├── state-management/   # Gestion d'état (.epct/)
│   ├── project-detection/  # Détection stack
│   ├── phase-scoring/      # Scoring des phases
│   └── claudemd-generator/ # Génération CLAUDE.md
│
├── references/         # Documentation
│   ├── phases/         # 7 phases documentées
│   ├── templates/      # Templates (PRD, etc.)
│   ├── schemas/        # JSON schemas
│   └── scoring/        # Critères de scoring
│
├── hooks/              # 1 hook
│   └── hooks.json      # SessionStart only
│
└── tests/              # Tests (unit, integration, validation)
```

### Les 7 Phases

| # | Phase | Objectif | Skill Superpowers |
|---|-------|----------|-------------------|
| 1 | Discovery | Valider le problème | brainstorming |
| 2 | Strategy | Définir la roadmap | brainstorming, writing-plans |
| 3 | Design | Architecture & UX | writing-plans |
| 4 | Development | Implémenter avec TDD | test-driven-development, code-review |
| 5 | Quality | Tester & valider | verification-before-completion, systematic-debugging |
| 6 | Launch | Déployer | verification-before-completion |
| 7 | Growth | Itérer & améliorer | systematic-debugging |

### Les 3 Modes

| Mode | Usage |
|------|-------|
| COMPLETE | Nouveau projet from scratch |
| FEATURE | Nouvelle feature |
| QUICK | Bugfix ou refactoring |

### État du projet (.epct/)

```json
{
  "version": "1.0.0",
  "project": { "name", "type", "stack", "created_at" },
  "phase": { "current", "name", "started_at" },
  "scores": { "discovery": 80, "strategy": 75, ... },
  "mode": "COMPLET",
  "currentChunk": { "file", "method", "status" },
  "completedChunks": [],
  "errors": { "active": 0, "blocking": false },
  "session": { "tokensEstimated", "contextRemaining" }
}
```

---

## ✅ Forces d'ACT

### 1. Structure claire en 7 phases
- Chaque phase a des critères Go/No-Go
- Anti-patterns documentés
- Métriques cibles définies

### 2. Gestion d'état robuste
- Persistence dans `.epct/`
- Checkpoints automatiques
- Recovery de session
- Estimation des tokens

### 3. Workflow TDD intégré
- Chunk-Test-Fix pattern
- Scoring par phase
- Code review obligatoire

### 4. Architecture agent-based
- 7 agents spécialisés
- Séparation des responsabilités
- Orchestration claire

### 5. Commands user-friendly
- `/act-project` comme hub central
- Aide contextuelle
- Menu interactif

---

## ❌ Faiblesses d'ACT

### 1. Dépendance forte à Superpowers ⚠️ CRITIQUE
- 6 skills Superpowers utilisés directement
- Si Superpowers change/disparaît → ACT cassé
- Pas de fallback

**Skills dépendants :**
- `superpowers:brainstorming`
- `superpowers:writing-plans`
- `superpowers:test-driven-development`
- `superpowers:code-review`
- `superpowers:verification-before-completion`
- `superpowers:systematic-debugging`

### 2. Pas de Context Engineering
- Pas de fichiers persistants type GSD (STATE.md, PROGRESS.md)
- Session recovery basique (checkpoints JSON)
- Pas de 3-file pattern

### 3. Pas de Scale-Adaptive
- Même workflow pour bug simple et gros projet
- Pas de "Simple Path" vs "Full Path" (comme BMAD)
- Les 7 phases sont obligatoires

### 4. Pas d'apprentissage
- Pas de compound learning
- Pas d'extraction de patterns
- Pas de reflexion/self-refinement

### 5. Hooks limités
- Un seul hook (SessionStart)
- Pas de PreToolUse, PostToolUse, Stop
- Pas de hooks pour validation automatique

### 6. Skills natifs insuffisants
- Seulement 4 skills natifs
- Manque : TDD, debugging, planning, code-review
- Tout délégué à Superpowers

### 7. Mono-IDE
- Claude Code uniquement
- Pas de support Cursor, Gemini CLI, OpenCode
- Format non portable

### 8. Pas de Generator/Validator pattern
- Pas de validation automatique
- Pas de self-healing

---

## 📊 Comparaison ACT vs Concurrents

| Feature | ACT | BMAD | GSD | Superpowers | Planning Files |
|---------|-----|------|-----|-------------|----------------|
| Phases structurées | ✅ 7 | ✅ | ✅ | ✅ | ❌ |
| Scale-adaptive | ❌ | ✅ | ❌ | ❌ | ❌ |
| Context engineering | ❌ | ❌ | ✅ | ❌ | ✅ |
| Session recovery | ⚠️ Basic | ❌ | ✅ | ❌ | ✅ |
| Multi-IDE | ❌ | ❌ | ✅ | ✅ | ✅ |
| Zero dependencies | ❌ | ✅ | ✅ | ✅ | ✅ |
| Native TDD | ❌ | ✅ | ❌ | ✅ | ❌ |
| Learning/Reflexion | ❌ | ❌ | ❌ | ❌ | ❌ |
| Hooks avancés | ❌ | ❌ | ❌ | ❌ | ✅ |
| Generator/Validator | ❌ | ❌ | ❌ | ❌ | ❌ |

---

## 🎯 Gap Analysis : ACT Actuel → ACT Cible

### Tier 1 : CRITIQUE (MVP)

| Gap | Actuel | Cible | Effort |
|-----|--------|-------|--------|
| Dépendance Superpowers | 6 skills externes | 0 externe | 🔴 High |
| Context Engineering | Rien | 3-file pattern | 🟠 Medium |
| Session Recovery | JSON checkpoint | Full recovery | 🟠 Medium |
| Scale-Adaptive | 1 path | Simple + Full | 🟠 Medium |

### Tier 2 : IMPORTANT

| Gap | Actuel | Cible | Effort |
|-----|--------|-------|--------|
| Multi-IDE | Claude Code only | +Cursor, Gemini | 🟠 Medium |
| Hooks avancés | 1 hook | Pre/Post/Stop | 🟢 Low |
| Generator/Validator | Rien | Auto-validation | 🟠 Medium |

### Tier 3 : NICE-TO-HAVE

| Gap | Actuel | Cible | Effort |
|-----|--------|-------|--------|
| Learning/Reflexion | Rien | Compound learning | 🔴 High |
| Thinking Models | Rien | First principles, etc. | 🟢 Low |
| Party Mode | Rien | Multi-agent session | 🔴 High |

---

## 📋 Inventaire des Skills Superpowers à Remplacer

### 1. brainstorming → ACT native
**Utilisé par :** Discovery, Strategy, Design  
**Fonctionnalités :**
- Socratic design refinement
- Questions until clear spec
- Shows design in chunks for validation

**À créer :** `skills/brainstorming/SKILL.md`

### 2. writing-plans → ACT native
**Utilisé par :** Strategy, Design  
**Fonctionnalités :**
- Bite-sized tasks (2-5 min)
- Exact file paths, complete code
- Verification steps

**À créer :** `skills/writing-plans/SKILL.md`

### 3. test-driven-development → ACT native
**Utilisé par :** Development  
**Fonctionnalités :**
- RED-GREEN-REFACTOR enforced
- Deletes code written before tests
- Chunk-based approach

**À créer :** `skills/tdd/SKILL.md`

### 4. code-review → ACT native
**Utilisé par :** Development  
**Fonctionnalités :**
- Reviews against plan
- Severity blocking
- Pre-review checklist

**À créer :** `skills/code-review/SKILL.md`

### 5. verification-before-completion → ACT native
**Utilisé par :** Quality, Launch  
**Fonctionnalités :**
- Ensure it's actually fixed
- Evidence over claims

**À créer :** `skills/verification/SKILL.md`

### 6. systematic-debugging → ACT native
**Utilisé par :** Quality, Growth  
**Fonctionnalités :**
- 4-phase root cause process
- Hypothesis testing
- Defense in depth

**À créer :** `skills/debugging/SKILL.md`

---

## 🚀 Recommandations

### Immédiat (Sprint 1)
1. **Créer les 6 skills natifs** pour remplacer Superpowers
2. **Implémenter 3-file pattern** (plan.md, findings.md, progress.md)
3. **Ajouter hooks Pre/Post/Stop**

### Court terme (Sprint 2)
4. **Scale-Adaptive** : Simple Path (3 commands) + Full Path (7 phases)
5. **Session Recovery avancée** : Multi-vector data extraction
6. **Multi-IDE** : Format compatible Cursor/Gemini

### Moyen terme (Sprint 3+)
7. **Generator/Validator pattern** pour auto-validation
8. **Compound Learning** : Extraire patterns des sessions
9. **Reflexion** : Self-refinement après chaque phase

---

*Audit réalisé le 2026-01-31 par Archi*
*Phase 2 : Analyse interne — COMPLÈTE*
