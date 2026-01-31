# Deep Analysis: Claude Code PM (CCPM)

**Date :** 2026-01-31
**Repo :** https://github.com/automazeio/ccpm

---

## 🎯 Concept Core

> "Ship better using spec-driven development, GitHub issues, Git worktrees, and multiple AI agents running in parallel."

**Approche :** Spec-driven + GitHub Issues + Parallel execution

---

## 🔄 Workflow

```
PRD Creation → Epic Planning → Task Decomposition → GitHub Sync → Parallel Execution
```

### Phases

1. 🧠 **Brainstorm** — Think deeper than comfortable
2. 📝 **Document** — Write specs leaving nothing to interpretation
3. 📐 **Plan** — Architect with explicit technical decisions
4. ⚡ **Execute** — Build exactly what was specified
5. 📊 **Track** — Transparent progress

---

## 🆚 Comparaison

| Traditional | CCPM |
|-------------|------|
| Context lost between sessions | Persistent context |
| Serial task execution | Parallel agents |
| "Vibe coding" from memory | Spec-driven |
| Progress hidden in branches | GitHub audit trail |
| Manual coordination | Intelligent `/pm:next` |

---

## 📂 Structure

```
.claude/
├── CLAUDE.md           # Always-on instructions
├── agents/             # Task-oriented agents
├── commands/
│   ├── context/        # Create, update, prime context
│   ├── pm/             # ← Project management (this system)
│   └── testing/        # Test commands
├── context/            # Project-wide context
├── epics/              # ← PM's local workspace
│   └── [epic-name]/
│       ├── epic.md
│       ├── [#].md      # Individual tasks
│       └── updates/    # WIP updates
├── prds/               # ← PRD files
└── rules/
```

---

## 🔧 Commands Clés

| Command | Action |
|---------|--------|
| `/pm:prd-new` | Create PRD through guided brainstorming |
| `/pm:prd-parse` | Transform PRD into technical epic |
| `/pm:epic-oneshot` | Push to GitHub + start parallel |
| `/pm:issue-start` | Start working on issue |
| `/pm:next` | Intelligent next task |

---

## 🎯 Why GitHub Issues?

### Team Collaboration
- Multiple Claude instances simultaneously
- Human devs see AI progress in real-time
- Visible context for all

### Human-AI Handoffs
- AI starts, human finishes (or vice versa)
- Progress visible to everyone
- Natural code reviews via PR comments

### Single Source of Truth
- Issue state = project state
- Comments = audit trail
- Labels = organization

---

## 📐 Core Principle

> **"Every line of code must trace back to a specification."**

No vibe coding. No shortcuts. No assumptions.

---

## 🎯 Patterns à Extraire pour ACT

### ✅ À intégrer (Tier 1)

| Pattern | Pertinence ACT |
|---------|----------------|
| **PRD → Epic → Tasks** | Workflow structuré |
| **GitHub Issues integration** | Single source of truth |
| **Parallel execution** | Git worktrees |
| **Spec-driven** | No vibe coding |

### ✅ À intégrer (Tier 2)

| Pattern | Notes |
|---------|-------|
| `/pm:next` | Intelligent task selection |
| Epic structure | epic.md + task files |
| Updates folder | WIP tracking |

---

## 💡 Insights

1. **GitHub as Database** — Issues = project state
2. **Parallel Agents** — Git worktrees enable true parallelism
3. **Full Traceability** — PRD → Epic → Issue → Code → PR
4. **Team-Compatible** — Works with humans + AI together

---

## 🔗 Liens

- [README](https://github.com/automazeio/ccpm)
- [Chinese Docs](https://github.com/automazeio/ccpm/blob/main/zh-docs/README_ZH.md)

---

*Analysé par Archi — 2026-01-31*
