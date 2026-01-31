# Analyse Approfondie : Everything Claude Code

**Date :** 2026-01-31  
**Repo :** https://github.com/affaan-m/everything-claude-code  
**Auteur :** Affaan Mustafa (Anthropic hackathon winner)  
**Priorité :** CRITIQUE (continuous learning + model selection)

---

## 📊 Vue d'ensemble

**Type :** Collection complète de configs Claude Code battle-tested  
**Focus :** Agents spécialisés, continuous learning, hooks cross-platform  
**License :** MIT  
**Installation :** `/plugin marketplace add affaan-m/everything-claude-code`  
**Origine :** 10+ mois d'utilisation intensive quotidienne, projet gagnant hackathon Anthropic (zenith.chat)

---

## 🏗️ Architecture

### Structure des fichiers

```
everything-claude-code/
├── .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── agents/                    # 12 agents spécialisés
│   ├── planner.md            # Implementation planning (opus)
│   ├── architect.md          # System design (opus)
│   ├── tdd-guide.md          # TDD workflow (sonnet)
│   ├── code-reviewer.md      # Code review (opus)
│   ├── security-reviewer.md  # Security analysis (opus)
│   ├── build-error-resolver.md # Fix builds (sonnet)
│   ├── e2e-runner.md         # Playwright E2E (sonnet)
│   ├── refactor-cleaner.md   # Dead code cleanup (sonnet)
│   ├── doc-updater.md        # Documentation (haiku)
│   ├── database-reviewer.md  # Database review
│   ├── go-reviewer.md        # Go code review (opus)
│   └── go-build-resolver.md  # Go builds (sonnet)
├── skills/                    # 22 skills
│   ├── continuous-learning/   # v1 (Stop hook)
│   ├── continuous-learning-v2/ # v2 (Instincts)
│   ├── iterative-retrieval/
│   ├── strategic-compact/
│   ├── tdd-workflow/
│   ├── verification-loop/
│   ├── eval-harness/
│   ├── security-review/
│   ├── coding-standards/
│   ├── backend-patterns/
│   ├── frontend-patterns/
│   ├── golang-patterns/
│   ├── golang-testing/
│   ├── springboot-*/         # 4 skills Spring
│   ├── java-coding-standards/
│   ├── jpa-patterns/
│   ├── postgres-patterns/
│   ├── clickhouse-io/
│   └── project-guidelines-example/
├── commands/                  # 23 commands
│   ├── tdd.md
│   ├── plan.md
│   ├── code-review.md
│   ├── build-fix.md
│   ├── e2e.md
│   ├── learn.md              # Extract patterns mid-session
│   ├── checkpoint.md
│   ├── verify.md
│   ├── evolve.md             # Cluster instincts → skills
│   ├── instinct-status.md
│   ├── instinct-import.md
│   ├── instinct-export.md
│   ├── skill-create.md
│   └── ...
├── rules/                     # 8 rules modulaires
│   ├── security.md
│   ├── coding-style.md
│   ├── testing.md
│   ├── git-workflow.md
│   ├── agents.md
│   ├── performance.md
│   ├── hooks.md
│   └── patterns.md
├── hooks/
│   └── hooks.json            # Configuration complète
├── scripts/                   # Cross-platform Node.js
│   ├── lib/
│   │   ├── utils.js
│   │   └── package-manager.js
│   └── hooks/
│       ├── session-start.js
│       ├── session-end.js
│       ├── pre-compact.js
│       ├── suggest-compact.js
│       └── evaluate-session.js
├── contexts/                  # Dynamic system prompts
│   ├── dev.md
│   ├── review.md
│   └── research.md
└── mcp-configs/
    └── mcp-servers.json
```

---

## 👥 Les 12 Agents Spécialisés

### Model Selection Strategy

| Agent | Model | Raison |
|-------|-------|--------|
| **planner** | opus | Décisions architecturales, haut impact |
| **architect** | opus | Design système, raisonnement profond |
| **code-reviewer** | opus | Qualité et sécurité |
| **security-reviewer** | opus | Analyse vulnérabilités |
| **go-reviewer** | opus | Complexité Go |
| **tdd-guide** | sonnet | Suit instructions explicites |
| **build-error-resolver** | sonnet | Fixes techniques |
| **e2e-runner** | sonnet | Exécution tests |
| **refactor-cleaner** | sonnet | Nettoyage code |
| **go-build-resolver** | sonnet | Fixes Go |
| **database-reviewer** | sonnet | Analyse DB |
| **doc-updater** | haiku | Tâches simples, lecture seule |

**Philosophie :**
- **Opus** → Complex decisions, maximum reasoning
- **Sonnet** → Execution, follows explicit instructions
- **Haiku** → Lightweight, frequent invocation, 3x cost savings

### Structure d'un Agent

```yaml
---
name: planner
description: Expert planning specialist for complex features...
tools: ["Read", "Grep", "Glob"]
model: opus
---

You are an expert planning specialist...

## Your Role
- Analyze requirements
- Break down complex features
- Identify dependencies

## Planning Process
### 1. Requirements Analysis
### 2. Architecture Review
### 3. Step Breakdown
### 4. Implementation Order

## Plan Format
[Template Markdown détaillé]

## Best Practices
[7 principes]

## Red Flags to Check
[Liste de code smells]
```

---

## 🧠 Continuous Learning v2 (KILLER FEATURE)

### Architecture

```
Session Activity
      │
      │ Hooks capture (100% reliable)
      ▼
┌─────────────────────────────────────────┐
│         observations.jsonl              │
│   (prompts, tool calls, outcomes)       │
└─────────────────────────────────────────┘
      │
      │ Observer agent (Haiku, background)
      ▼
┌─────────────────────────────────────────┐
│          PATTERN DETECTION              │
│   • User corrections → instinct         │
│   • Error resolutions → instinct        │
│   • Repeated workflows → instinct       │
└─────────────────────────────────────────┘
      │
      ▼
┌─────────────────────────────────────────┐
│         instincts/personal/             │
│   • prefer-functional.md (0.7)          │
│   • always-test-first.md (0.9)          │
└─────────────────────────────────────────┘
      │
      │ /evolve clusters
      ▼
┌─────────────────────────────────────────┐
│              evolved/                   │
│   • skills/                             │
│   • commands/                           │
│   • agents/                             │
└─────────────────────────────────────────┘
```

### Le Modèle d'Instinct

```yaml
---
id: prefer-functional-style
trigger: "when writing new functions"
confidence: 0.7
domain: "code-style"
source: "session-observation"
---

# Prefer Functional Style

## Action
Use functional patterns over classes when appropriate.

## Evidence
- Observed 5 instances of functional pattern preference
- User corrected class-based approach on 2025-01-15
```

### Confidence Scoring

| Score | Signification | Comportement |
|-------|---------------|--------------|
| 0.3 | Tentative | Suggéré mais pas forcé |
| 0.5 | Modéré | Appliqué si pertinent |
| 0.7 | Fort | Auto-approved |
| 0.9 | Near-certain | Core behavior |

### Évolution de la Confiance

**↑ Augmente quand :**
- Pattern répété observé
- User ne corrige pas le comportement suggéré
- Instincts similaires d'autres sources

**↓ Diminue quand :**
- User corrige explicitement
- Pattern non observé longtemps
- Evidence contradictoire

### v1 vs v2

| Aspect | v1 | v2 |
|--------|----|----|
| Observation | Stop hook (session end) | PreToolUse/PostToolUse (100% reliable) |
| Analyse | Main context | Background agent (Haiku) |
| Granularité | Full skills | Atomic instincts |
| Confidence | None | 0.3-0.9 weighted |
| Évolution | Direct to skill | Instincts → cluster → skill/command/agent |
| Partage | None | Export/import instincts |

### Commands associées

| Command | Action |
|---------|--------|
| `/learn` | Extract patterns mid-session |
| `/instinct-status` | Show learned instincts with confidence |
| `/evolve` | Cluster related instincts into skills |
| `/instinct-export` | Export instincts for sharing |
| `/instinct-import` | Import instincts from others |

---

## 🔧 Hooks System (Cross-Platform)

### Configuration (hooks.json)

**7 types de hooks configurés :**

| Hook | Déclencheur | Action |
|------|-------------|--------|
| **PreToolUse (dev server)** | `npm run dev` | BLOCK si pas dans tmux |
| **PreToolUse (long commands)** | npm/cargo/docker/pytest | Rappel tmux |
| **PreToolUse (git push)** | `git push` | Reminder review |
| **PreToolUse (Edit/Write)** | Tous | suggest-compact.js |
| **PostToolUse (Edit)** | `.ts/.tsx/.js/.jsx` | Auto-format Prettier |
| **PostToolUse (Edit)** | `.ts/.tsx` | TypeScript check |
| **PostToolUse (Edit)** | Code files | Warn console.log |
| **PostToolUse (Bash)** | `gh pr create` | Log PR URL |
| **PreCompact** | Compaction | Save state |
| **SessionStart** | New session | Load context |
| **SessionEnd** | End session | Persist + evaluate patterns |
| **Stop** | Stop | Check console.log |

### Cross-Platform (Node.js)

Tous les scripts sont en Node.js pour fonctionner sur Windows/macOS/Linux :

```javascript
// scripts/hooks/session-start.js
// scripts/hooks/session-end.js
// scripts/hooks/pre-compact.js
// scripts/hooks/suggest-compact.js
// scripts/hooks/evaluate-session.js
```

### Détection Package Manager

Priorité :
1. Variable env `CLAUDE_PACKAGE_MANAGER`
2. Config projet `.claude/package-manager.json`
3. package.json `packageManager` field
4. Lock file (package-lock, yarn.lock, pnpm-lock, bun.lockb)
5. Config globale `~/.claude/package-manager.json`
6. Fallback: premier disponible

---

## 📏 Rules (8 fichiers modulaires)

### security.md
- No hardcoded credentials
- SQL injection checks
- XSS prevention
- Input validation

### coding-style.md
- Immutability patterns
- File organization
- MANY SMALL FILES principle

### testing.md
- TDD obligatoire
- 80% coverage requirement
- Tests before implementation

### git-workflow.md
- Commit format
- PR process
- Branch naming

### agents.md
- When to delegate
- Parallel execution
- Multi-perspective analysis

### performance.md
- **Model Selection Strategy** (Haiku/Sonnet/Opus)
- Context window management
- Ultrathink + Plan mode

---

## 📋 Commands (23)

| Command | Description |
|---------|-------------|
| `/tdd` | TDD workflow (RED-GREEN-REFACTOR) |
| `/plan` | Implementation planning |
| `/code-review` | Quality review |
| `/build-fix` | Fix build errors |
| `/e2e` | E2E test generation |
| `/refactor-clean` | Dead code removal |
| `/learn` | Extract patterns mid-session |
| `/checkpoint` | Save verification state |
| `/verify` | Run verification loop |
| `/evolve` | Cluster instincts into skills |
| `/instinct-status` | View learned instincts |
| `/instinct-import` | Import instincts |
| `/instinct-export` | Export instincts |
| `/skill-create` | Generate skills from git history |
| `/go-review` | Go code review |
| `/go-test` | Go TDD workflow |
| `/go-build` | Fix Go build errors |
| `/setup-pm` | Configure package manager |
| `/update-docs` | Update documentation |
| `/update-codemaps` | Update code maps |
| `/test-coverage` | Verify coverage |
| `/orchestrate` | Multi-agent orchestration |
| `/eval` | Evaluate session |

---

## 🎭 Contexts (Dynamic System Prompts)

| Context | Usage |
|---------|-------|
| `dev.md` | Development mode |
| `review.md` | Code review mode |
| `research.md` | Research/exploration mode |

Injection dynamique selon le mode de travail actuel.

---

## ✅ Forces

1. **Model Selection** : Opus/Sonnet/Haiku par agent selon la complexité
2. **Continuous Learning v2** : Instincts avec confidence scoring
3. **Cross-Platform** : Hooks en Node.js (Windows/macOS/Linux)
4. **12 Agents spécialisés** : Couvre tout le SDLC
5. **Rules modulaires** : Séparées par domaine
6. **Battle-tested** : 10+ mois production (zenith.chat)
7. **23 Commands** : Workflow complet
8. **Contexts dynamiques** : dev/review/research modes
9. **Session persistence** : PreCompact/SessionStart/SessionEnd
10. **Package manager detection** : Multi-tool support

---

## ❌ Faiblesses

1. **Complexité** : Beaucoup de fichiers à comprendre
2. **Pas de Multi-IDE** : Claude Code only
3. **Dépendance Node.js** : Hooks nécessitent Node
4. **Pas de 3-file pattern** : Pas de context engineering explicite
5. **Configuration manuelle** : Pas d'installer automatique

---

## 🎯 À Intégrer dans ACT v2

### Tier 1 (MUST)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **Model Selection** | Opus/Sonnet/Haiku per agent | 🔴 |
| **Continuous Learning v2** | Instincts avec confidence | 🔴 |
| **Agent structure** | name, description, tools, model | 🔴 |
| **Rules modulaires** | Un fichier par domaine | 🔴 |

### Tier 2 (SHOULD)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **Cross-platform hooks** | Node.js au lieu de bash | 🟠 |
| **Session persistence** | PreCompact/SessionStart/End | 🟠 |
| **TDD command** | RED-GREEN-REFACTOR structuré | 🟠 |
| **Confidence scoring** | 0.3-0.9 pour instincts | 🟠 |

### Tier 3 (COULD)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **/evolve command** | Cluster instincts → skills | 🟢 |
| **Contexts dynamiques** | dev/review/research | 🟢 |
| **Package manager detection** | Auto-detect npm/yarn/pnpm/bun | 🟢 |

---

## 📝 Comparaison avec ACT Actuel

| Feature | Everything CC | ACT | Gap |
|---------|--------------|-----|-----|
| Agents | ✅ 12 avec model selection | ⚠️ via Superpowers | À enrichir |
| Learning | ✅ Continuous v2 | ❌ | À implémenter |
| Hooks | ✅ Cross-platform | ❌ | À implémenter |
| Rules | ✅ 8 modulaires | ⚠️ Basic | À enrichir |
| Commands | ✅ 23 | ⚠️ Basic | À enrichir |
| Multi-IDE | ❌ | ❌ | Égalité |
| Context files | ❌ | ⚠️ Basic | Planning Files better |

---

## 📁 Fichiers à Étudier Plus Tard

- `skills/continuous-learning-v2/hooks/observe.sh` — Observer implementation
- `skills/iterative-retrieval/SKILL.md` — Progressive context refinement
- `skills/strategic-compact/SKILL.md` — Manual compaction suggestions
- `scripts/hooks/evaluate-session.js` — Pattern extraction logic

---

*Analyse réalisée le 2026-01-31 par Archi*
*Framework 5/9 — Everything Claude Code*
