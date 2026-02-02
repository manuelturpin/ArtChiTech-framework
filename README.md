# ACT Framework

![Version](https://img.shields.io/badge/version-2.5.0--alpha-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Claude Code](https://img.shields.io/badge/Claude%20Code-plugin-purple)

> **Ship better projects.** From idea to production, guided by AI.

You start a project. Three weeks later, you're lost in your own code. Sound familiar?

ACT gives your projects structure without the overhead. 7 phases. Clear milestones. No more "where was I?"

## What's New in v2.5

### 🧠 Context Engineering

The biggest upgrade: **your AI never forgets**.

```
Context Window = RAM (volatile, limited)
Filesystem = Disk (persistent, unlimited)
```

ACT v2.5 introduces the **3-File Pattern** — persistent files that maintain context across sessions:

```
.act/
├── config.yaml      # Project configuration
├── state.md         # Current state (quick glance)
├── plan.md          # Phases, progress, decisions
├── findings.md      # Research & discoveries
└── progress.md      # Session log
```

**Result:** Start a session, pick up exactly where you left off. No more re-explaining context.

### ✨ Key Features

- **Session Recovery** — Automatic "catchup report" when resuming
- **5-Question Reboot Test** — Verify context is complete
- **Context Handoff** — Seamless transfer between sessions

---

## Quick Start

### Initialize ACT in your project

```bash
/act:init
```

This creates the `.act/` directory with all context files.

### Check status

```bash
/act:status
```

### Start working

Edit `.act/plan.md` to define your goal and phases, then begin!

---

## The .act/ Directory

| File | Purpose | Update When |
|------|---------|-------------|
| `config.yaml` | Project settings | Setup |
| `state.md` | Current state | Each milestone |
| `plan.md` | Phases & progress | Phase transitions |
| `findings.md` | Research & discoveries | New learnings |
| `progress.md` | Session log | Continuously |

### Example: state.md

```markdown
# ACT State

## Current
- **Phase:** 3/5 (Implementation)
- **Task:** Building auth module
- **Blocker:** None

## Quick Stats
- **Progress:** 60%
- **Last Update:** 2026-02-01 14:30
```

---

## The 7 Phases

```
1. Discovery    →  Validate the problem
2. Strategy     →  Define the roadmap
3. Design       →  Architecture & UX
4. Development  →  Build with TDD
5. Quality      →  Test & validate
6. Launch       →  Deploy & ship
7. Growth       →  Iterate & improve
```

Each phase has **Go/No-Go criteria**. No skipping steps.

---

## Commands

### Core Commands

| Command | Description |
|---------|-------------|
| `/act:init` | Initialize ACT in a project |
| `/act:quick` | Start quick mode (small tasks) |
| `/act:full` | Start full mode (complex projects) |
| `/act:status` | Show current state |
| `/act:recover` | Recovery from previous session |
| `/act:handoff` | Generate handoff for session transfer |

### Legacy Commands (v2.1)

| Command | Description |
|---------|-------------|
| `/act-project` | Your project hub |
| `/act-next` | Move to next phase |
| `/act-fix` | Fix blocking issues |

---

## Session Recovery

When you start a new session, ACT automatically:

1. Detects existing `.act/` directory
2. Reads the context files
3. Generates a **Catchup Report**:

```markdown
## 🔄 Session Recovery

**Project:** auth-module
**Last Session:** 2026-02-01 14:30

**Current State:**
- Phase: 3/5 (Implementation)
- Task: Building login endpoint
- Progress: 60%

**Recent Findings:**
- JWT preferred over sessions
- Legacy auth has vulnerabilities

**Next Steps:**
1. Complete login endpoint
2. Add password reset
```

### 5-Question Reboot Test

To verify context is complete, answer these:

| Question | Source |
|----------|--------|
| Where am I? | `state.md` |
| Where am I going? | `plan.md` |
| What's the goal? | `plan.md` |
| What have I learned? | `findings.md` |
| What have I done? | `progress.md` |

---

## Project Structure

```
your-project/
├── .act/                    # ACT context (v2.5)
│   ├── config.yaml
│   ├── state.md
│   ├── plan.md
│   ├── findings.md
│   └── progress.md
├── .claude/                 # Claude Code integration
│   └── commands/
└── your code...
```

---

## Skills

ACT v2.5 includes skills that provide detailed guidance:

| Skill | Purpose |
|-------|---------|
| `context-engineering` | 3-File Pattern, session recovery |
| (coming) `hooks` | Automated context refresh |
| (coming) `iron-laws` | Quality enforcement |

---

## Requirements

- Claude Code or compatible AI assistant
- Git (recommended)

---

## Installation

ACT v2.5 is project-local. Just run:

```bash
/act:init
```

Or manually create the `.act/` directory using the templates in `templates/act/`.

---

## Migration from v2.1

ACT v2.5 is backward compatible. Your existing `.epct/` state is preserved.

To upgrade:
1. Run `/act:init` in your project
2. ACT creates `.act/` alongside existing files
3. Migrate state manually if needed

---

## Philosophy

> **"Context Window = RAM, Filesystem = Disk"**

The core insight: AI assistants "forget" because context isn't persisted. ACT solves this by treating the filesystem as persistent memory.

### Design Principles

1. **Persistence over conversation** — Write it down, don't just say it
2. **Structure over chaos** — Clear files, clear roles
3. **Recovery over restart** — Never lose progress
4. **Evidence over claims** — Show, don't tell

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## License

[MIT](LICENSE) — Manuel Turpin

---

<p align="center">
  <strong>Stop winging it. Start shipping.</strong>
</p>

---

## Scale-Adaptive Mode

Not every task needs the same process depth. ACT v2.5 introduces **Scale-Adaptive Mode**.

### Quick Mode (`/act:quick`)

For small, well-defined tasks:

```bash
/act:quick Fix the login timeout bug
```

| Aspect | Quick Mode |
|--------|------------|
| **When** | Bug fixes, small features, refactoring |
| **Phases** | Plan → Execute → Verify (3 phases) |
| **Duration** | < 1 day |
| **Research** | Skip |

### Full Mode (`/act:full`)

For complex projects:

```bash
/act:full Build user authentication system
```

| Aspect | Full Mode |
|--------|-----------|
| **When** | New products, major features, migrations |
| **Phases** | All 7 ACT phases |
| **Duration** | Days to weeks |
| **Research** | Full discovery phase |

### When to Use Which?

```
Is it well-defined + known solution + < 1 day + no architecture?
├── YES → /act:quick
└── NO  → /act:full
```

### Mode Switching

- **Escalation:** If Quick Mode reveals complexity → auto-switch to Full Mode
- **De-escalation:** If Full Mode is overkill after Strategy → can switch to Quick Mode

---

## Roadmap to v2.5 Final

- [x] Context Engineering (3-File Pattern)
- [x] Hooks System (Pre/Post/Stop)
- [x] Iron Laws (TDD, Debug, Verification)
- [x] Scale-Adaptive (Quick vs Full mode)
- [ ] Session Recovery automation
