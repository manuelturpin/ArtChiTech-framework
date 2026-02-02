# Analyse Approfondie : Claude Code PM (CCPM)

**Date :** 2026-01-31  
**Repo :** https://github.com/automazeio/ccpm  
**Auteur :** Ran Aroussi (@aroussi, automaze.io)  
**Priorité :** HIGH (GitHub integration + parallel execution)

---

## 📊 Vue d'ensemble

**Type :** Project management workflow pour Claude Code  
**Focus :** Spec-driven development + GitHub Issues + Parallel agents  
**License :** MIT  
**Installation :** `curl -sSL https://automaze.io/ccpm/install | bash`  
**Slogan :** "Ship better using spec-driven development"

---

## 🏗️ Architecture

### Structure des fichiers

```
.claude/
├── CLAUDE.md              # Always-on instructions
├── agents/                # Task-oriented agents
├── commands/
│   ├── context/           # Create, update, prime context
│   ├── pm/                # ← Project management (this system)
│   │   ├── prd-new.md
│   │   ├── prd-parse.md
│   │   ├── epic-decompose.md
│   │   ├── epic-sync.md
│   │   ├── epic-oneshot.md
│   │   ├── issue-start.md
│   │   ├── issue-sync.md
│   │   ├── next.md
│   │   └── ...
│   └── testing/           # Test commands
├── context/               # Project-wide context
├── epics/                 # ← PM's local workspace
│   └── [epic-name]/
│       ├── epic.md        # Implementation plan
│       ├── [#].md         # Individual tasks
│       └── updates/       # WIP updates
├── prds/                  # ← PRD files
└── rules/                 # Rule files
```

---

## 🔄 Workflow Principal

```
PRD Creation → Epic Planning → Task Decomposition → GitHub Sync → Parallel Execution
```

### 5 Phases

| Phase | Command | Output |
|-------|---------|--------|
| 1. PRD Creation | `/pm:prd-new feature-name` | `.claude/prds/feature-name.md` |
| 2. Implementation Planning | `/pm:prd-parse feature-name` | `.claude/epics/feature-name/epic.md` |
| 3. Task Decomposition | `/pm:epic-decompose feature-name` | `.claude/epics/feature-name/[task].md` |
| 4. GitHub Sync | `/pm:epic-sync feature-name` | GitHub Issues créés |
| 5. Execution | `/pm:issue-start 1234` | Travail parallèle |

### Oneshot Workflow

```bash
/pm:epic-oneshot feature-name  # Decompose + Sync en une commande
```

---

## 📋 Commands (30+)

### PRD Commands
| Command | Action |
|---------|--------|
| `/pm:prd-new` | Launch brainstorming for new PRD |
| `/pm:prd-parse` | Convert PRD to implementation epic |
| `/pm:prd-list` | List all PRDs |
| `/pm:prd-edit` | Edit existing PRD |
| `/pm:prd-status` | Show PRD implementation status |

### Epic Commands
| Command | Action |
|---------|--------|
| `/pm:epic-decompose` | Break epic into task files |
| `/pm:epic-sync` | Push epic and tasks to GitHub |
| `/pm:epic-oneshot` | Decompose + sync in one command |
| `/pm:epic-list` | List all epics |
| `/pm:epic-show` | Display epic and its tasks |
| `/pm:epic-close` | Mark epic as complete |
| `/pm:epic-start` | Launch parallel swarm |
| `/pm:epic-merge` | Clean merge when done |

### Issue Commands
| Command | Action |
|---------|--------|
| `/pm:issue-show` | Display issue details |
| `/pm:issue-start` | Begin work with specialized agent |
| `/pm:issue-sync` | Push updates to GitHub |
| `/pm:issue-close` | Mark complete |
| `/pm:issue-analyze` | Analyze parallelization |

### Workflow Commands
| Command | Action |
|---------|--------|
| `/pm:next` | Show next priority issue |
| `/pm:status` | Overall project dashboard |
| `/pm:standup` | Daily standup report |
| `/pm:blocked` | Show blocked tasks |
| `/pm:in-progress` | List WIP |

---

## ⚡ Parallel Execution System (KILLER FEATURE)

### Le Concept

> "Issues Aren't Atomic. One issue = Multiple parallel work streams."

**Exemple : "Implement user authentication"**

| Agent | Responsabilité |
|-------|----------------|
| Agent 1 | Database tables and migrations |
| Agent 2 | Service layer and business logic |
| Agent 3 | API endpoints and middleware |
| Agent 4 | UI components and forms |
| Agent 5 | Test suites and documentation |

**Tous travaillent SIMULTANÉMENT** dans le même worktree.

### The Math of Velocity

| Approche | Calcul |
|----------|--------|
| Traditional | Epic 3 issues × 1 agent = 3 units |
| CCPM | Epic 3 issues × ~4 parallel = **12 agents** |

### Context Optimization

| Approche | Context Window |
|----------|----------------|
| Single-thread | Pollué par tout le code |
| Parallel agents | Main thread reste clean et stratégique |

> "Your main conversation becomes the conductor, not the orchestra."

### GitHub vs Local

| What GitHub Sees | What Actually Happens |
|------------------|----------------------|
| Clean, simple issues | Issue #1234 explose en 5 parallel agents |
| Progress updates | Agents coordonnent via Git commits |
| Completion status | Complex orchestration hidden |

---

## 🎯 Core Principle

> **"Every line of code must trace back to a specification."**

### 5-Phase Discipline

1. 🧠 **Brainstorm** — Think deeper than comfortable
2. 📝 **Document** — Write specs leaving nothing to interpretation
3. 📐 **Plan** — Architect with explicit technical decisions
4. ⚡ **Execute** — Build exactly what was specified
5. 📊 **Track** — Transparent progress at every step

**No vibe coding. No shortcuts. No assumptions.**

---

## 🔗 GitHub Integration

### Why GitHub Issues?

1. **True Team Collaboration**
   - Multiple Claude instances simultaneously
   - Human devs see AI progress in real-time
   - Team can jump in anywhere

2. **Seamless Human-AI Handoffs**
   - AI starts, human finishes (or vice versa)
   - Progress visible to everyone
   - Code reviews via PR comments

3. **Scalable Beyond Solo Work**
   - Add team members without friction
   - Multiple AI agents in parallel
   - Distributed teams synchronized

4. **Single Source of Truth**
   - No separate databases
   - Issue state = project state
   - Comments = audit trail

---

## 📊 Proven Results

| Metric | Improvement |
|--------|-------------|
| Context switching time | **-89%** |
| Parallel tasks | **5-8x** (vs 1 previously) |
| Bug rates | **-75%** |
| Feature delivery | **up to 3x faster** |

---

## ✅ Forces

1. **GitHub Native** : Issues as source of truth
2. **Parallel Execution** : 5-8 agents simultanément
3. **Spec-Driven** : Full traceability PRD → Code
4. **Context Preservation** : Main thread stays clean
5. **Intelligent Prioritization** : `/pm:next`
6. **Git Worktrees** : Isolation par epic
7. **Agent Specialization** : UI/API/DB agents
8. **Audit Trail** : Complete history in GitHub

---

## ❌ Faiblesses

1. **Dépendance GitHub** : Nécessite repo GitHub
2. **Setup complexe** : gh CLI + extensions
3. **Pas de Multi-IDE** : Claude Code only
4. **Pas de continuous learning** : Pas d'instincts
5. **Pas de hooks** : Pas d'automatisation Pre/Post
6. **Overhead** : Peut être trop pour petits projets

---

## 🎯 À Intégrer dans ACT v2

### Tier 1 (MUST)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **PRD → Epic → Tasks** | Workflow structuré | 🔴 |
| **Spec-Driven** | No vibe coding | 🔴 |
| **Full Traceability** | PRD → Code → Commit | 🔴 |
| **5-Phase Discipline** | Brainstorm → Track | 🔴 |

### Tier 2 (SHOULD)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **GitHub Integration** | Issues = project state | 🟠 |
| **/pm:next** | Intelligent task selection | 🟠 |
| **Epic structure** | epic.md + task files | 🟠 |
| **Parallel flag** | `parallel: true` for tasks | 🟠 |

### Tier 3 (COULD)

| Pattern | Description | Priorité |
|---------|-------------|----------|
| **Parallel agents** | Git worktrees | 🟢 |
| **Agent specialization** | UI/API/DB agents | 🟢 |
| **Updates folder** | WIP tracking | 🟢 |

---

## 📝 Comparaison avec ACT Actuel

| Feature | CCPM | ACT | Gap |
|---------|------|-----|-----|
| GitHub Integration | ✅ | ❌ | À considérer |
| Parallel Execution | ✅ | ❌ | Nice-to-have |
| Spec-Driven | ✅ | ✅ | Comparable |
| Phases | 5 | 7 | ACT more granular |
| PRD → Tasks | ✅ | ⚠️ Basic | À enrichir |
| Hooks | ❌ | ❌ | Planning Files better |
| Multi-IDE | ❌ | ❌ | Planning Files better |

---

## 📁 Fichiers à Étudier Plus Tard

- `.claude/commands/pm/` — All PM commands
- `.claude/agents/` — Specialized agents
- `.claude/context/` — Context management
- Installation scripts

---

*Analyse réalisée le 2026-01-31 par Archi*
*Framework 9/9 — Claude Code PM (CCPM)*
