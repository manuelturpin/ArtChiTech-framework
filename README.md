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

Use `--gitignore` to add a template `.gitignore` for sensitive data:

```bash
/act:init --gitignore
```

### Project Types

When initializing, specify the type that best matches your project:

| Type | Description | Example |
|------|-------------|---------|
| `product` | Nouveau produit complet | SaaS app |
| `cli` | Application ligne de commande | TaskFlow |
| `app` | Application desktop/mobile | Electron app |
| `library` | Package réutilisable | npm package |
| `service` | Microservice/API | REST API |
| `refactor` | Refactoring existant | Migration v2 |
| `bugfix` | Correction de bug | Hotfix |

```bash
/act:init --type cli --name "my-tool"
```

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

## Velocity
- Sessions completed: 4
- Average session duration: 2.5h
- Phases completed: 2/5
- Estimated remaining: ~15h
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
| `/act:validate` | Validate .act/ file conformity |
| `/act:resume` | Recovery from previous session |
| `/act:handoff` | Generate handoff for session transfer |
| `/act:history` | List past sessions (Session History) |
| `/act:replay` | View details of a past session |
| `/act:diff` | Show changes since last session |

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

### Session History

ACT stores session history in `.act/history/` for persistence across context resets.

```
.act/history/
├── 2026-02-01-1430.md    # Session from Feb 1, 14:30
├── 2026-02-01-1830.md    # Session from Feb 1, 18:30
└── 2026-02-02-0930.md    # Session from Feb 2, 09:30
```

**File format:** `YYYY-MM-DD-HHmm.md`

**Configuration:**
```yaml
# In .act/config.yaml
history:
  enabled: true
  maxSessions: 10    # Auto-rotate: keep last 10 sessions
  autoSave: true     # Save automatically on session end
```

**Commands:**
- `/act:history` — List all saved sessions
- `/act:replay <session>` — View details of a past session

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
| [`context-engineering`](skills/context-engineering/) | 3-File Pattern, session recovery |
| [`session-recovery`](skills/session-recovery/) | Resume work after context reset |
| [`iron-laws`](skills/iron-laws/) | Quality enforcement (TDD, Debug, Verify) |

### Hooks System

ACT v2.5 includes a [hooks system](hooks/) for automated context refresh:
- **PreToolUse** — Refresh goals before actions
- **PostToolUse** — Update progress after changes
- **Stop** — Verify completion before exit

#### Local Hooks

Projects can customize hooks via `.act/hooks.json`:

```bash
/act:init --with-hooks
```

This creates a local hooks file that can:
- **Extend** framework hooks (inherit base behavior)
- **Override** specific hook configurations
- **Add** project-specific custom hooks

Example: Add extra context files to PreToolUse:
```json
{
  "extends": "framework",
  "overrides": {
    "PreToolUse": {
      "config": { "additionalFiles": ["docs/API.md"] }
    }
  }
}
```

See [SPEC-hooks-system.md](specs/SPEC-hooks-system.md) for full documentation.

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

## Deviation Rules

When you encounter something unexpected during execution, ACT has clear rules for how to handle it:

### The 5 Rules

| Rule | Trigger | Action |
|:----:|---------|--------|
| **1** | Bug discovered | 🔧 Auto-fix immediately |
| **2** | Missing critical (deps, config) | ➕ Auto-add immediately |
| **3** | Blocker (prevents progress) | 🚧 Auto-fix immediately |
| **4** | Architectural change | ⛔ **STOP & ASK** |
| **5** | Enhancement (nice-to-have) | 📝 Log to ISSUES.md |

### Autonomy Distribution

```
┌─────────────────────────────────────┐
│  AUTONOMOUS (just do it):           │
│  ├── Rule 1: Bug → Fix it           │
│  ├── Rule 2: Missing → Add it       │
│  ├── Rule 3: Blocker → Unblock it   │
│  └── Rule 5: Enhancement → Log it   │
│                                     │
│  HUMAN REQUIRED (stop and ask):     │
│  └── Rule 4: Architectural change   │
└─────────────────────────────────────┘
```

### Quick Decision Guide

```
Can I fix this in < 5 min without changing how things work together?
├── YES → Rules 1, 2, or 3 (auto-handle)
└── NO  → Does it need a design decision?
          ├── YES → Rule 4 (STOP and ASK)
          └── NO  → Rule 5 (Log and continue)
```

### Examples

| Situation | Rule | Action |
|-----------|------|--------|
| Typo causing bug | 1 | Fix immediately |
| Missing npm package | 2 | Install immediately |
| Build won't compile | 3 | Fix immediately |
| "Should we use Redux or Context?" | 4 | STOP, ask user |
| "This could be more readable" | 5 | Log to ISSUES.md |

---

## Model Selection

ACT v2.5 optimizes cost/quality by selecting the right model for each task through specialized agents.

### Strategy

```
Opus = PENSE et DÉCIDE ($$$ - for critical decisions)
Sonnet = EXÉCUTE ($$ - for implementation)
Haiku = LIT et DOCUMENTE ($ - for simple tasks)
```

### Agent System

| Agent | Model | Role |
|-------|-------|------|
| `planner` | opus | Planning, task decomposition |
| `architect` | opus | System design, technical decisions |
| `executor` | sonnet | Implementation, code writing |
| `reviewer` | opus | Code review, quality validation |
| `tester` | sonnet | Test writing and execution |
| `documenter` | haiku | Documentation updates |

### Configuration

In `.act/config.yaml`:

```yaml
models:
  default: sonnet
  
  agents:
    planner: opus
    architect: opus
    executor: sonnet
    reviewer: opus
    tester: sonnet
    documenter: haiku
```

### Workflow

```
Full Mode:  planner → architect → executor ↔ tester → reviewer → documenter
Quick Mode: executor → tester → documenter
```

### Cost Savings

| Mode | Distribution | Savings vs Opus-only |
|------|--------------|----------------------|
| Quick | 80% sonnet, 20% haiku | ~60% |
| Full | 50% sonnet, 30% opus, 20% haiku | ~40% |

**Details:** See `agents/README.md`

---

## Roadmap to v2.5 Final

- [x] Context Engineering (3-File Pattern)
- [x] Hooks System (Pre/Post/Stop)
- [x] Iron Laws (TDD, Debug, Verification)
- [x] Scale-Adaptive (Quick vs Full mode)
- [x] Deviation Rules (Controlled autonomy)
- [x] Session Recovery automation
- [x] Model Selection (Agent system)
