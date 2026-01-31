# Analyse Approfondie des Frameworks IA

**Date :** 2026-01-31  
**Objectif :** Analyse détaillée des frameworks concurrents pour améliorer ACT

---

## 🏆 Frameworks Méthodologiques Complets

### 1. BMAD-METHOD ⭐⭐⭐⭐⭐

**Repo :** https://github.com/bmad-code-org/BMAD-METHOD

**Philosophie :**
> "Traditional AI tools do the thinking for you, producing average results. BMad agents guide you through a structured process to bring out your best thinking in partnership with the AI."

**Features clés :**
- **21+ agents spécialisés** : PM, Architect, Developer, UX, Scrum Master, Quinn (QA)
- **50+ workflows guidés** : Couvrent analyse, planning, architecture, implémentation
- **Scale-Domain-Adaptive** : S'adapte automatiquement à la complexité du projet
- **Party Mode** : Plusieurs agents dans une session pour discussions collaboratives
- **AI Intelligent Help** : `/bmad-help` guide à chaque étape

**Paths :**
- **Simple Path (Quick Flow)** : Bug fixes, petites features → 3 commandes
  - `/quick-spec` → `/dev-story` → `/code-review`
- **Full Planning Path** : Produits complexes → 6+ commandes
  - `/product-brief` → `/create-prd` → `/create-architecture` → `/create-epics-and-stories` → `/sprint-planning` → `/create-story` → `/dev-story` → `/code-review`

**Modules additionnels :**
- BMad Builder (création de modules custom)
- Test Architect (TEA) - Enterprise testing
- Game Dev Studio
- Creative Intelligence Suite

**Installation :** `npx bmad-method install`

**🔥 À retenir pour ACT :**
- Scale-adaptive intelligence
- Party Mode (multi-agents en une session)
- Two paths (simple vs full)
- Documentation exemplaire

---

### 2. Get Shit Done (GSD) ⭐⭐⭐⭐⭐

**Repo :** https://github.com/glittercowboy/get-shit-done

**Philosophie :**
> "The complexity is in the system, not in your workflow. No enterprise roleplay bullshit."

**Problème résolu :** Context rot — la dégradation de qualité quand Claude remplit sa context window.

**Features clés :**
- **Context Engineering** : Fichiers persistants (PROJECT.md, STATE.md, REQUIREMENTS.md, ROADMAP.md)
- **XML Prompt Formatting** : Structure optimisée pour Claude
- **Multi-Agent Orchestration** : Orchestrator léger + agents spécialisés
- **Atomic Git Commits** : Un commit par tâche
- **Fresh context per plan** : 200k tokens pour chaque exécution

**Workflow :**
1. `/gsd:new-project` — Questions → Research → Requirements → Roadmap
2. `/gsd:discuss-phase N` — Capture décisions avant planning
3. `/gsd:plan-phase N` — Research + Plan + Verify
4. `/gsd:execute-phase N` — Parallel waves, fresh context
5. `/gsd:verify-work N` — User acceptance testing
6. `/gsd:complete-milestone` → `/gsd:new-milestone`

**Context Engineering Files :**
| File | Purpose |
|------|---------|
| PROJECT.md | Vision, always loaded |
| research/ | Ecosystem knowledge |
| REQUIREMENTS.md | Scoped v1/v2 requirements |
| ROADMAP.md | Where you're going |
| STATE.md | Decisions, blockers, position |
| PLAN.md | Atomic task with XML structure |
| SUMMARY.md | What happened, committed to history |

**Quick Mode :** `/gsd:quick` pour tâches ad-hoc

**Installation :** `npx get-shit-done-cc`

**🔥 À retenir pour ACT :**
- Context engineering pattern (fichiers persistants)
- Fresh context per execution
- XML prompt formatting
- Phase discuss → plan → execute → verify

---

### 3. Claude-Flow ⭐⭐⭐⭐

**Repo :** https://github.com/ruvnet/claude-flow

**Philosophie :** Enterprise-grade multi-agent orchestration with self-learning.

**Features clés :**
- **60+ agents spécialisés** : coder, tester, reviewer, architect, security...
- **Swarm Coordination** : Topologies (mesh/hierarchical/ring/star)
- **Consensus Algorithms** : Raft, Byzantine, Gossip, CRDT
- **RuVector Intelligence Layer** : Self-optimizing neural architecture
- **Multi-provider** : Claude, GPT, Gemini, Ollama

**Architecture layers :**
1. User Layer → CLI / MCP Server
2. Routing Layer → Q-Learning Router, MoE (8 experts), Skills (42+), Hooks (17)
3. Swarm Layer → Topologies, Consensus, Claims
4. Agent Layer → 60+ specialized agents
5. Resources → Memory (AgentDB), Providers, Workers (12)
6. RuVector → SONA, EWC++, Flash Attention, HNSW, LoRA

**Performance features :**
- Agent Booster (WASM) : 352x faster pour transformations simples
- Token Optimizer : 30-50% réduction
- Smart routing : Simple → WASM, Medium → Haiku, Complex → Opus + Swarm

**Anti-Drift Configuration :**
```javascript
swarm_init({
  topology: "hierarchical",
  maxAgents: 8,
  strategy: "specialized"
})
```

**Installation :** `npx claude-flow@alpha init --wizard`

**🔥 À retenir pour ACT :**
- Très complexe, peut-être over-engineered
- Concept de swarm coordination intéressant
- Anti-drift patterns
- Token optimization techniques

---

### 4. Superpowers ⭐⭐⭐⭐⭐

**Repo :** https://github.com/obra/superpowers  
**Note :** C'est notre dépendance actuelle !

**Philosophie :**
> "Complete software development workflow for coding agents, built on composable skills."

**Workflow automatique :**
1. **Brainstorming** — Teases spec from conversation, shows in chunks
2. **Git Worktrees** — Isolated workspace on new branch
3. **Writing Plans** — Bite-sized tasks (2-5 min each), exact file paths
4. **Subagent-Driven Development** — Fresh subagent per task, two-stage review
5. **TDD** — RED-GREEN-REFACTOR enforced
6. **Code Review** — Reviews against plan, severity blocking
7. **Finishing Branch** — Verify tests, merge/PR/keep/discard options

**Skills disponibles :**

| Category | Skills |
|----------|--------|
| Testing | test-driven-development |
| Debugging | systematic-debugging, verification-before-completion |
| Collaboration | brainstorming, writing-plans, executing-plans, dispatching-parallel-agents, requesting-code-review, receiving-code-review, using-git-worktrees, finishing-a-development-branch, subagent-driven-development |
| Meta | writing-skills, using-superpowers |

**Principes :**
- Test-Driven Development always
- Systematic over ad-hoc
- Complexity reduction
- Evidence over claims

**Installation :** `/plugin marketplace add obra/superpowers-marketplace`

**🔥 Pour ACT :**
- Skills qu'on utilise déjà
- Modèle de référence pour nos propres skills
- Patterns à intégrer nativement

---

### 5. Planning with Files (Manus-style) ⭐⭐⭐⭐

**Repo :** https://github.com/OthmanAdi/planning-with-files

**Philosophie :**
> "Work like Manus — the AI agent company Meta acquired for $2 billion."

**Problèmes résolus :**
- Volatile memory (TodoWrite disparaît au reset)
- Goal drift (après 50+ tool calls)
- Hidden errors (pas trackés)
- Context stuffing

**Le 3-File Pattern :**
```
task_plan.md    → Track phases and progress
findings.md     → Store research and findings  
progress.md     → Session log and test results
```

**Core Principle :**
```
Context Window = RAM (volatile, limited)
Filesystem = Disk (persistent, unlimited)
→ Anything important gets written to disk.
```

**Key Rules :**
- Create Plan First — Never start without task_plan.md
- The 2-Action Rule — Save findings after every 2 view/browser operations
- Log ALL Errors — They help avoid repetition
- Never Repeat Failures — Track attempts, mutate approach

**Session Recovery (v2.2.0+) :**
- Récupère automatiquement le contexte perdu après `/clear`
- Analyse les sessions précédentes

**Multi-IDE Support :** Claude Code, Gemini CLI, Moltbot, Kiro, Cursor, Continue, Kilocode, OpenCode, Codex, FactoryAI, Antigravity, CodeBuddy, AdaL CLI

**Installation :** `claude plugins install OthmanAdi/planning-with-files`

**🔥 À retenir pour ACT :**
- 3-file pattern simple et efficace
- Session recovery automatique
- Multi-IDE support

---

### 6. Everything Claude Code ⭐⭐⭐⭐

**Repo :** https://github.com/affaan-m/everything-claude-code

**Type :** Collection complète, pas un framework unifié

**Contenu :**

| Category | Content |
|----------|---------|
| Agents | planner, architect, tdd-guide, code-reviewer, security-reviewer, build-error-resolver, e2e-runner, refactor-cleaner, doc-updater, go-reviewer |
| Skills | coding-standards, backend-patterns, frontend-patterns, continuous-learning, iterative-retrieval, strategic-compact, tdd-workflow, security-review, eval-harness, verification-loop, golang-patterns |
| Commands | /tdd, /plan, /e2e, /code-review, /build-fix, /refactor-clean, /learn, /checkpoint, /verify, /skill-create |
| Rules | security, coding-style, testing, git-workflow, agents, performance |
| Hooks | memory-persistence, strategic-compact |

**Guides importants :**
- Token Optimization
- Memory Persistence
- Continuous Learning — Auto-extract patterns into skills
- Verification Loops
- Parallelization (Git worktrees)
- Subagent Orchestration

**Continuous Learning v2 :**
- `/instinct-status` — View learned instincts
- `/instinct-import` / `/instinct-export` — Share instincts
- `/evolve` — Cluster instincts into skills

**Skill Creator :** Génère des skills depuis git history

**Cross-Platform :** Windows, macOS, Linux (scripts Node.js)

**Installation :** `/plugin marketplace add affaan-m/everything-claude-code`

**🔥 À retenir pour ACT :**
- Continuous learning concept
- Memory persistence hooks
- Skill creator from git history
- Modular (pick what you need)

---

### 7. Claude Code PM (CCPM) ⭐⭐⭐⭐

**Repo :** https://github.com/automazeio/ccpm

**Philosophie :** Spec-driven development avec GitHub Issues comme database.

**Pourquoi GitHub Issues ?**
- True Team Collaboration — Multiple Claude instances simultanées
- Seamless Human-AI Handoffs — Progress visible pour tous
- Scalable Beyond Solo — Distributed teams synchronized
- Single Source of Truth — No separate databases

**Core Principle :** No Vibe Coding
> Every line of code must trace back to a specification.

**5-Phase Discipline :**
1. 🧠 Brainstorm — Think deeper than comfortable
2. 📝 Document — Specs that leave nothing to interpretation
3. 📐 Plan — Architect with explicit decisions
4. ⚡ Execute — Build exactly what was specified
5. 📊 Track — Transparent progress

**Workflow Phases :**
1. `/pm:prd-new` — PRD creation via brainstorming
2. `/pm:prd-parse` — Transform PRD to epic
3. `/pm:epic-decompose` — Break into tasks
4. `/pm:epic-sync` — Push to GitHub Issues
5. `/pm:issue-start` — Execute with specialized agent

**Parallel Execution :**
> One issue = Multiple parallel work streams (DB, Service, API, UI, Tests)

**Commands :** 20+ commands (PRD, Epic, Issue, Workflow, Sync, Maintenance)

**🔥 À retenir pour ACT :**
- GitHub Issues as database (collaboration)
- PRD → Epic → Tasks flow
- Parallel execution concept
- Full traceability

---

### 8. AB Method ⭐⭐⭐

**Repo :** https://github.com/ayoubben18/ab-method

**Philosophie :** Incremental missions with specialized subagents.

**Key Principles :**
- One Task at a Time — Laser focus
- Incremental Missions — Each builds on previous
- Backend First — For full-stack, start with backend (types)
- Validation Checkpoints — User validates before implementation
- Continuous Documentation

**Task Status Flow :**
```
Brainstormed → Validated → In dev → Testing → Completed
```

**Structure :**
```
tasks/[task-name]/
├── progress-tracker.md
└── mission-*.md
```

**Mission Types :**
- Backend Mission — Coordinates backend-architect + backend-developer
- Frontend Mission — Coordinates UX expert + frontend-developer
- Planning Mission — Research and design decisions

**Commands :**
- `/create-task` — Create with technical details
- `/create-mission` — Transform task into missions
- `/extend-task` — Add missions to existing task
- `/analyze-project` — Full project analysis

**Installation :** `npx ab-method`

**🔥 À retenir pour ACT :**
- Mission-based approach
- Backend-first for full-stack
- Validation checkpoints
- Progress tracker pattern

---

### 9. Compound Engineering ⭐⭐⭐⭐

**Repo :** https://github.com/EveryInc/compound-engineering-plugin

**Philosophie :**
> "Each unit of engineering work should make subsequent units easier—not harder."

**Workflow :**
```
Plan → Work → Review → Compound → Repeat
```

| Command | Purpose |
|---------|---------|
| `/workflows:plan` | Turn ideas into detailed plans |
| `/workflows:work` | Execute with worktrees and tracking |
| `/workflows:review` | Multi-agent code review |
| `/workflows:compound` | Document learnings |

**Principle :** 80% planning + review, 20% execution

**Each cycle compounds :**
- Plans inform future plans
- Reviews catch more issues
- Patterns get documented

**🔥 À retenir pour ACT :**
- Compound learning concept
- 80/20 planning/execution ratio
- Learning from mistakes pattern

---

## 📚 Collections & Ressources

### awesome-claude-code
**Repo :** https://github.com/hesreallyhim/awesome-claude-code

Curated list de tout l'écosystème Claude Code :
- Agent Skills
- Workflows & Knowledge Guides
- Tooling (IDE integrations, Usage Monitors, Orchestrators)
- Hooks
- Slash-Commands
- CLAUDE.md Files
- Alternative Clients

**Highlights :**
- cc-devops-skills — DevOps detailed skills
- Trail of Bits Security Skills — Code auditing
- Context Engineering Kit — Token optimization patterns
- Claude Session Restore — Session recovery from git history

---

## 📊 Grille Comparative

| Framework | Phases | Agents | Skills | Multi-IDE | Zero-Dep | Learning | Scale-Adaptive |
|-----------|--------|--------|--------|-----------|----------|----------|----------------|
| BMAD | ✅ | 21+ | ✅ | ❌ | ✅ | ❌ | ✅ |
| GSD | ✅ | ✅ | ❌ | ✅ | ✅ | ❌ | ❌ |
| Claude-Flow | ❌ | 60+ | 42+ | ❌ | ❌ | ✅ | ✅ |
| Superpowers | ✅ | ❌ | 11+ | ✅ | ✅ | ❌ | ❌ |
| Planning Files | ❌ | ❌ | ❌ | ✅ | ✅ | ❌ | ❌ |
| Everything CC | ❌ | 10+ | 10+ | ❌ | ✅ | ✅ | ❌ |
| CCPM | ✅ | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ |
| AB Method | ✅ | ✅ | ❌ | ❌ | ✅ | ❌ | ❌ |
| Compound | ✅ | ❌ | ✅ | ✅ | ✅ | ✅ | ❌ |
| **ACT (current)** | ✅ (7) | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ |

---

## 🎯 Recommandations pour ACT

### À intégrer prioritairement :

1. **Context Engineering (GSD/Planning Files)**
   - Fichiers persistants (STATE.md, PROGRESS.md)
   - 3-file pattern
   - Session recovery

2. **Compound Learning (Everything CC/Compound)**
   - Apprendre des erreurs
   - Extraire patterns des sessions
   - Instincts/skills auto-générés

3. **Scale-Adaptive (BMAD)**
   - Détecter complexité du projet
   - Adapter profondeur de planning
   - Simple path vs Full path

4. **Native Skills (Superpowers → ACT)**
   - Remplacer dépendance par skills intégrés
   - TDD, systematic-debugging, brainstorming
   - Subagent patterns

5. **Multi-IDE Support (Planning Files/GSD)**
   - Claude Code prioritaire
   - Cursor, Gemini CLI, OpenCode
   - Format adaptable

### À éviter :

- ❌ Over-engineering (Claude-Flow = trop complexe)
- ❌ Dépendances externes (npm, services tiers)
- ❌ Swarm/consensus pour projets simples

---

*Document généré le 2026-01-31 par Archi*
*Phase 1 : Recherche approfondie — En cours*
