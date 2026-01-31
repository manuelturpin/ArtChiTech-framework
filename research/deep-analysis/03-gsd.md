# Analyse Approfondie : GSD (Get Shit Done) v1.x

**Date :** 2026-01-31  
**Repo :** https://github.com/glittercowboy/get-shit-done  
**Auteur :** TÂCHES (glittercowboy)  
**Priorité :** CRITIQUE (context engineering reference)

---

## 📊 Vue d'ensemble

**Type :** Meta-prompting, context engineering, spec-driven development  
**Focus :** Résoudre le "context rot" — dégradation de qualité quand Claude remplit sa context window  
**License :** MIT  
**Installation :** `npx get-shit-done-cc`  
**Multi-IDE :** Claude Code, OpenCode, Gemini CLI

---

## 🏗️ Architecture

### Structure des fichiers

```
get-shit-done/
├── agents/               # 11 agents spécialisés
│   ├── gsd-planner.md
│   ├── gsd-executor.md
│   ├── gsd-roadmapper.md
│   ├── gsd-phase-researcher.md
│   ├── gsd-project-researcher.md
│   ├── gsd-research-synthesizer.md
│   ├── gsd-debugger.md
│   ├── gsd-codebase-mapper.md
│   ├── gsd-verifier.md
│   ├── gsd-plan-checker.md
│   └── gsd-integration-checker.md
│
├── commands/gsd/         # 25+ commands
│   ├── new-project.md    # Init complet
│   ├── plan-phase.md     # Planifier une phase
│   ├── execute-phase.md  # Exécuter une phase
│   ├── verify-work.md    # Vérifier le travail
│   ├── discuss-phase.md  # Discuter avant planning
│   ├── quick.md          # Mode rapide
│   └── ...
│
├── get-shit-done/
│   ├── references/       # Documentation technique
│   │   ├── model-profiles.md
│   │   ├── questioning.md
│   │   ├── verification-patterns.md
│   │   └── tdd.md
│   └── templates/        # Templates de fichiers
│
└── hooks/                # Hooks système
```

### Fichiers de Context Engineering (.planning/)

```
.planning/
├── PROJECT.md           # Vision, contexte, always loaded
├── config.json          # Mode, depth, parallelization
├── research/            # Recherche domain
│   ├── STACK.md
│   ├── FEATURES.md
│   ├── ARCHITECTURE.md
│   ├── PITFALLS.md
│   └── SUMMARY.md
├── REQUIREMENTS.md      # Requirements v1/v2/out-of-scope
├── ROADMAP.md           # Phases avec success criteria
├── STATE.md             # Mémoire du projet, position actuelle
├── phases/              # Plans par phase
│   └── XX-name/
│       ├── CONTEXT.md
│       ├── XX-YY-PLAN.md
│       └── XX-YY-SUMMARY.md
└── quick/               # Quick tasks séparés
```

---

## 🔄 Workflow Principal

```
/gsd:new-project
    ↓
[QUESTIONING] → Deep context gathering
    ↓
[RESEARCH] → 4 parallel researchers (optional)
    ↓
[REQUIREMENTS] → Scoped v1/v2/out-of-scope
    ↓
[ROADMAP] → Phases with success criteria
    ↓
/gsd:discuss-phase N → Capture implementation decisions
    ↓
/gsd:plan-phase N → Research + Plan + Verify
    ↓
/gsd:execute-phase N → Parallel waves, fresh context per plan
    ↓
/gsd:verify-work N → User acceptance testing
    ↓
/gsd:complete-milestone → Archive + tag release
```

---

## 🎯 Les 11 Agents

| Agent | Modèle (balanced) | Rôle |
|-------|-------------------|------|
| **gsd-planner** | opus | Architecture decisions, task design |
| **gsd-executor** | sonnet | Execute plans with atomic commits |
| **gsd-roadmapper** | sonnet | Create phases from requirements |
| **gsd-phase-researcher** | sonnet | Research before planning phase |
| **gsd-project-researcher** | sonnet | Domain research (stack, features) |
| **gsd-research-synthesizer** | sonnet | Synthesize research outputs |
| **gsd-debugger** | sonnet | Debug issues |
| **gsd-codebase-mapper** | haiku | Read-only exploration (brownfield) |
| **gsd-verifier** | sonnet | Verify deliverables match goals |
| **gsd-plan-checker** | sonnet | Verify plans achieve phase goal |
| **gsd-integration-checker** | sonnet | Check integration between phases |

---

## 💡 Model Profiles (Cost Optimization)

**Philosophie :** Smart allocation — Opus pour planning, Sonnet pour exécution.

| Profile | Use Case |
|---------|----------|
| **quality** | Opus partout, max reasoning |
| **balanced** | Opus planning, Sonnet execution (default) |
| **budget** | Sonnet/Haiku, minimal Opus |

**Rationale :**
- **Opus for planner** : Architecture decisions, high impact
- **Sonnet for executor** : Follows explicit instructions
- **Haiku for mapper** : Read-only, no reasoning needed

**🔥 Pattern unique : Changer le modèle par agent selon le rôle.**

---

## 📝 Deviation Rules (Auto-Fix)

L'executor applique ces règles automatiquement :

| Rule | Trigger | Action |
|------|---------|--------|
| **Rule 1: Auto-fix bugs** | Code doesn't work | Fix immediately |
| **Rule 2: Auto-add critical** | Missing essential features | Add immediately |
| **Rule 3: Auto-fix blocking** | Something prevents task | Fix to unblock |
| **Rule 4: Ask about architecture** | Structural modification | STOP, ask user |

**Priority :**
1. Rule 4 → STOP (architectural)
2. Rules 1-3 → Fix automatically
3. Unsure → Rule 4 (ask)

**🔥 Pattern : Règles de déviation explicites permettent l'autonomie contrôlée.**

---

## 🔄 Checkpoint Protocol

**Types de checkpoints :**

| Type | Usage | Frequency |
|------|-------|-----------|
| **checkpoint:human-verify** | Visual/functional verification | 90% |
| **checkpoint:decision** | Implementation choices | 9% |
| **checkpoint:human-action** | Manual steps (email, 2FA) | 1% |

**Format de retour :**
```markdown
## CHECKPOINT REACHED

**Type:** human-verify
**Plan:** 01-01
**Progress:** 1/3 tasks complete

### Completed Tasks
| Task | Name | Commit | Files |
|------|------|--------|-------|

### Current Task
**Task 2:** Deploy to Vercel
**Status:** blocked

### Checkpoint Details
[What was built, how to verify]

### Awaiting
Type "approved" or describe issues.
```

**🔥 Pattern : Structure de checkpoint standardisée pour continuation.**

---

## ⚡ Quick Mode

**Pour :** Bug fixes, refactoring, small features

**Différences :**
- Skip research, plan-checker, verifier
- Fichiers dans `.planning/quick/` (séparé des phases)
- Update STATE.md (pas ROADMAP.md)
- Target ~30% context usage

**Process :**
```
/gsd:quick
    ↓
Planner (quick mode) → 1 plan, 1-3 tasks
    ↓
Executor → atomic commits
    ↓
STATE.md updated (Quick Tasks table)
```

**🔥 C'est le pattern Scale-Adaptive (simple vs full path).**

---

## 📋 Configuration Interactive

```json
{
  "mode": "yolo|interactive",
  "depth": "quick|standard|comprehensive",
  "parallelization": true|false,
  "commit_docs": true|false,
  "model_profile": "quality|balanced|budget",
  "workflow": {
    "research": true|false,
    "plan_check": true|false,
    "verifier": true|false
  }
}
```

**Depth affects planning :**
- **quick** : 3-5 phases, 1-3 plans each
- **standard** : 5-8 phases, 3-5 plans each
- **comprehensive** : 8-12 phases, 5-10 plans each

---

## 🔍 Deep Questioning Technique

Référence : `references/questioning.md`

**Principes :**
1. Ask ONE question at a time
2. Follow threads (each answer opens new threads)
3. Challenge vagueness
4. Make abstract concrete
5. Surface assumptions
6. Find edges
7. Reveal motivation

**Context checklist (internal) :**
- Purpose clear?
- Constraints known?
- Success criteria defined?
- Scope boundaries?

---

## 🧪 TDD Execution

L'executor peut exécuter des tasks avec `tdd="true"` :

```
RED   → Write failing test, commit
GREEN → Minimal code to pass, commit
REFACTOR → Clean up if needed, commit
```

**Chaque TDD task = 2-3 atomic commits.**

---

## ✅ Forces

1. **Context Engineering** : .planning/ avec fichiers persistants
2. **Model Profiles** : Cost optimization par agent
3. **Deviation Rules** : Autonomie contrôlée avec règles explicites
4. **Checkpoints** : Structure standardisée pour continuation
5. **Quick Mode** : Scale-adaptive (simple vs full)
6. **Deep Questioning** : Technique documentée
7. **Atomic Commits** : Un commit par task
8. **STATE.md** : Mémoire du projet
9. **Multi-IDE** : Claude Code, OpenCode, Gemini CLI
10. **Fresh context per plan** : Évite context rot

---

## ❌ Faiblesses

1. **Complexité** : Beaucoup de fichiers et concepts
2. **Pas de learning** : Pas de compound learning
3. **Pas de Party Mode** : Un agent à la fois
4. **Dépendance AskUserQuestion** : Nécessite interaction

---

## 🎯 À Intégrer dans ACT v2

### Tier 1 (MUST)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **.planning/ structure** | Fichiers persistants | 🔴 |
| **STATE.md** | Mémoire du projet | 🔴 |
| **Deviation Rules** | Auto-fix avec limites | 🔴 |
| **Checkpoint protocol** | Continuation standardisée | 🔴 |
| **Quick Mode** | Scale-adaptive | 🔴 |

### Tier 2 (SHOULD)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **Model Profiles** | Cost optimization | 🟠 |
| **Deep Questioning** | One question at a time | 🟠 |
| **Atomic Commits** | Un commit par task | 🟠 |
| **Fresh context per plan** | Anti context rot | 🟠 |

### Tier 3 (COULD)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **4 parallel researchers** | Domain research | 🟢 |
| **Depth config** | quick/standard/comprehensive | 🟢 |
| **Workflow toggles** | research/plan_check/verifier | 🟢 |

---

## 📝 Comparaison avec ACT Actuel

| Feature | GSD | ACT | Gap |
|---------|-----|-----|-----|
| Context files | ✅ .planning/ | ⚠️ .epct/ basic | À enrichir |
| STATE.md | ✅ Complet | ⚠️ state.json | À migrer vers MD |
| Scale-adaptive | ✅ Quick Mode | ❌ | À implémenter |
| Deviation Rules | ✅ | ❌ | À implémenter |
| Model Profiles | ✅ | ❌ | Nice-to-have |
| Atomic Commits | ✅ | ⚠️ Partiel | À améliorer |
| Multi-IDE | ✅ | ❌ | À implémenter |

---

## 📁 Fichiers à Étudier Plus Tard

- `agents/gsd-planner.md` — Full planner instructions
- `agents/gsd-debugger.md` — Debug patterns
- `get-shit-done/references/questioning.md` — Questioning techniques
- `get-shit-done/templates/` — All templates

---

*Analyse réalisée le 2026-01-31 par Archi*
*Framework 3/9 — GSD (Get Shit Done)*
