# ACT Framework v3.5

![Version](https://img.shields.io/badge/version-3.5.0--alpha-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Claude Code](https://img.shields.io/badge/Claude%20Code-plugin-purple)

> **Ship better projects.** From idea to production, guided by AI.

You start a project. Three weeks later, you're lost in your own code. Sound familiar?

ACT gives your projects structure without the overhead. 7 phases. Clear milestones. No more "where was I?"

## What's New in v3.5 — Agentic Execution

ACT v3.5 transforms the framework from project planning into orchestrated agentic execution.

### New Capabilities

| Feature | Description |
|---------|-------------|
| **Subagent-Driven Development** | Orchestrate tasks through specialized subagents with fresh context |
| **Two-Stage Review** | Spec compliance then code quality, with review loop |
| **5-Level Scale** | Auto-detect task complexity (Level 0-4), replaces Quick/Full |
| **Worktree Isolation** | Git worktrees for isolated feature development |
| **Adaptive Replanning** | Reassess plan after each phase/milestone |
| **Dispatch Templates** | Standardized prompts for subagent communication |
| **Shell Script Hooks** | Real executable hooks (not just markdown rules) |
| **Review Tools** | Adversarial review, edge case hunter, implementation readiness gate |
| **Stuck Detection** | Mechanical Rule of 3 — escalate after 3 failed fixes |
| **Skill Testing** | TDD methodology for skill development itself |

### New Skills (4)
- `subagent-development` — SDD orchestration controller workflow
- `worktree-isolation` — Git worktree isolation for features
- `adaptive-replanning` — Plan reassessment after phases
- `skill-testing` — RED-GREEN-REFACTOR for skills

### New Commands
- `/act:start` — Start task with auto-detected complexity level

### Enhanced
- Iron Laws: companion docs, 10+ rationalizations, Red Flags sections
- All skills: Type classification (Rigid/Flexible) + Self-Announcement
- Workflows: step-file sharding for token efficiency
- CI: automated skill/command/workflow validation

### Backward Compatible
All v3.0 projects work unchanged. New features are opt-in.

---

## What's New in v2.6

### 🏗️ Consolidated Architecture

All commands are now in a single location with clean namespacing:

```
plugin/commands/
├── act/              # 24 ACT commands (/act:*)
├── consider/         # 12 thinking models (/consider:*)
└── *.md              # 9 utility commands
```

### 🪝 Hooks System

Automated behavioral triggers that are **100% reliable** (vs skills ~50-80%):

| Hook | Trigger | Action |
|------|---------|--------|
| **PreToolUse** | Before Write/Edit/Bash | Refresh goals from plan |
| **PostToolUse** | After Write/Edit | Update progress log |
| **Stop** | Before completion | Verify all phases have evidence |

### 🤖 Agent System

Load specialized agents with `/act:agent`:

| Agent | Model | Role |
|-------|-------|------|
| `planner` | opus | Planning, decomposition |
| `architect` | opus | Design decisions |
| `executor` | sonnet | Implementation |
| `reviewer` | opus | Code review |
| `tester` | sonnet | Tests |
| `documenter` | haiku | Documentation |

### ✨ Key Features

- **Context Engineering** — 3-File Pattern for persistent AI memory
- **Session Recovery** — Automatic catchup report when resuming
- **Iron Laws** — TDD, Debugging, Verification (non-negotiable)
- **Deviation Rules** — Controlled autonomy (Rules 1-5)
- **12 Thinking Models** — `/consider:*` commands

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
| `/act:where-am-i` | Quick 5-question context check |
| `/act:handoff` | Generate handoff for session transfer |
| `/act:history` | List past sessions (Session History) |
| `/act:replay` | View details of a past session |
| `/act:diff` | Show changes since last session |
| `/act:reflect` | Reflect on task to improve quality (+8-21%) |
| `/act:memorize` | Save important insights for future reference |
| `/act:sync-github` | Sync project state with GitHub Issues |
| `/act:audit-skill` | Audit a specific skill |
| `/act:audit-command` | Audit a specific command |
| `/act:audit-agent` | Audit a specific agent |
| `/act:audit-all` | Full framework audit |
| `/act:heal` | Auto-repair audit issues |
| `/act:start` | Start task with auto-detected complexity level |

### Thinking Models

| Command | Description |
|---------|-------------|
| `/consider:first-principles` | Break down to fundamentals |
| `/consider:5-whys` | Root cause analysis |
| `/consider:pareto` | Focus 80/20 |
| `/consider:inversion` | Solve backwards |
| `/consider:second-order` | Consequences of consequences |
| `/consider:pre-mortem` | Anticipate failure |

### Agent Commands

| Command | Description |
|---------|-------------|
| `/act:agent <name>` | Load a specialized agent |
| `/act:agent reset` | Clear agent context |
| `/act:party "<topic>"` | Multi-perspective discussion |

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

To verify context is complete, use `/act:where-am-i`:

```
/act:where-am-i
```

This runs a quick check against the 5 essential questions:

| # | Question | Source | Status |
|---|----------|--------|--------|
| 1 | Where am I? | `state.md` | Current phase |
| 2 | Where am I going? | `plan.md` | Remaining phases |
| 3 | What's the goal? | `config.yaml` | Project objective |
| 4 | What have I learned? | `findings.md` | Key discoveries |
| 5 | What have I done? | `progress.md` | Recent actions |

**Context Status:**
- ✅ Complete (5/5) → Ready to continue
- ⚠️ Partial (3-4/5) → Proceed with caution
- ❌ Incomplete (0-2/5) → Run `/act:init --repair`

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
| [`reflexion`](skills/reflexion/) | Improve output quality through reflection (+8-21%) |
| [`auditor`](skills/auditor/) | Audit and repair framework components |
| [`github-integration`](skills/github-integration/) | Sync with GitHub Issues |
| [`subagent-development`](skills/subagent-development/) | SDD orchestration controller workflow |
| [`worktree-isolation`](skills/worktree-isolation/) | Git worktree isolation for features |
| [`adaptive-replanning`](skills/adaptive-replanning/) | Plan reassessment after phases |
| [`skill-testing`](skills/skill-testing/) | RED-GREEN-REFACTOR for skills |

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

### From GitHub (recommended)

```bash
# Install locally in your project (default)
curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/v3.0-alpha/scripts/install.sh | bash

# Install globally for all projects
curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/v3.0-alpha/scripts/install.sh | bash -s -- --global
```

### Local Installation Structure

```
your-project/
└── .claude/
    ├── commands/
    │   ├── act/           # 27+ ACT commands
    │   └── consider/      # 12 thinking models
    ├── skills/            # 14 skills
    ├── workflows/         # BMAD workflows
    ├── rules/             # Iron Laws, Deviation Rules
    ├── templates/         # Project templates
    ├── references/        # Phase definitions, scoring
    ├── agents/prompts/    # Dispatch templates
    └── hooks/scripts/     # Hook scripts
```

### Global Installation Structure

```
~/.claude/
└── plugins/
    └── act/              # Full plugin with all components
```

### After Installation

Restart Claude Code and run:

```bash
/act:init
```

This creates the `.act/` directory with context files in your project.

---

## Migration from Previous Versions

### From v2.5 to v2.6

v2.6 is fully backward compatible. Just reinstall:

```bash
curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/v3.0-alpha/scripts/install.sh | bash
```

### From v2.1 or earlier

1. Install v2.6 (see Installation)
2. Run `/act:init` in your project
3. Your `.act/` directory will be created
4. Migrate any `.epct/` state manually if needed

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

## Context Handoff

Transfer context seamlessly between sessions or agents with a standardized format.

### What is Context Handoff?

A structured document (XML or Markdown) that captures:
- Original task description
- Completed and remaining work
- Attempted approaches (what worked/failed)
- Critical context (must-not-lose information)
- Current state snapshot

### Generate Handoff

```bash
/act:handoff              # Output to stdout
/act:handoff --save       # Save to .act/handoffs/
/act:handoff --format md  # Use markdown format
/act:handoff --to agent   # Specify target agent
```

### Example Output

```xml
<context_handoff>
  <metadata>
    <project>ACT v2.5</project>
    <timestamp>2026-02-02T10:30:00Z</timestamp>
  </metadata>
  <original_task>Implement Phase 4</original_task>
  <work_completed>
    - Created spec document
    - Created template
  </work_completed>
  <work_remaining>
    - Create command
    - Update documentation
  </work_remaining>
  <current_state>
    Phase: 4/6
    Progress: 60%
  </current_state>
</context_handoff>
```

### Integration with Session Recovery

When resuming (`/act:resume`), if a recent handoff exists:
1. Handoff is automatically detected
2. Enriches the catchup report
3. Prioritizes remaining work from handoff

**Details:** See `specs/SPEC-context-handoff.md`

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

## Reflexion Pattern

Improve output quality through structured self-reflection. Research shows **+8-21% improvement** in task quality.

### Process

```
1. Complete task
2. /act:reflect (analyze what worked/didn't)
3. Improve output based on insights
4. /act:memorize (save important lessons)
```

### The 4 Questions

After completing a task, ask yourself:

1. **What worked well?** — Identify successful patterns
2. **What could be improved?** — Find quality gaps
3. **What did I learn?** — Extract insights
4. **What would I do differently?** — Consider alternatives

### Commands

| Command | Purpose |
|---------|---------|
| `/act:reflect [topic]` | Trigger reflection on a topic or recent task |
| `/act:memorize <insight>` | Save insight to `.act/findings.md` or CLAUDE.md |

### When to Reflect

| Trigger | Action |
|---------|--------|
| Complex task completed | Always reflect |
| User requests review | Always reflect |
| "reflect" in prompt | Auto-triggered |
| Simple mechanical task | Skip (overhead > benefit) |

### Example

```markdown
## Reflexion: API Implementation

### What Worked Well ✅
- Clean separation of concerns
- Good test coverage (87%)

### What Could Be Improved 🔧
- Response time on search (800ms → target 200ms)
- Missing rate limiting docs

### What I Learned 💡
- Database indexes are 10x impact on search
- Early performance testing prevents late surprises

### What I'd Do Differently 🔄
- Add performance benchmarks from day 1
```

**Details:** See `skills/reflexion/SKILL.md`

---

## Thinking Models

ACT v2.5 includes **12 mental models** to enhance decision-making and problem-solving. Each model provides a structured thinking approach for different situations.

### The /consider Commands

| # | Command | Description |
|---|---------|-------------|
| 1 | `/consider:first-principles` | Break down to fundamentals |
| 2 | `/consider:5-whys` | Root cause analysis |
| 3 | `/consider:pareto` | Focus 80/20 |
| 4 | `/consider:inversion` | Solve backwards |
| 5 | `/consider:second-order` | Consequences of consequences |
| 6 | `/consider:regret-minimization` | Long-term decision making |
| 7 | `/consider:opportunity-cost` | Cost of alternatives |
| 8 | `/consider:circle-of-competence` | Know your limits |
| 9 | `/consider:map-territory` | Model vs reality |
| 10 | `/consider:probabilistic` | Reason in probabilities |
| 11 | `/consider:pre-mortem` | Anticipate failure |
| 12 | `/consider:reversibility` | Reversible vs irreversible decisions |

### Usage Example

```bash
# Before making a technical decision
/consider:second-order Should we adopt this new framework?

# When debugging a recurring issue
/consider:5-whys Why do deployments fail on Fridays?

# When prioritizing features
/consider:pareto Which features will deliver the most value?
```

### When to Use

| Situation | Recommended Model |
|-----------|-------------------|
| Architecture decision | `first-principles`, `second-order` |
| Bug investigation | `5-whys`, `inversion` |
| Feature prioritization | `pareto`, `opportunity-cost` |
| Risk assessment | `pre-mortem`, `reversibility` |
| Strategic planning | `regret-minimization`, `probabilistic` |

**Details:** See `skills/thinking/SKILL.md`

---

## Continuous Learning

ACT v2.5 introduces a **Continuous Learning** system that observes your work patterns and improves automatically over time.

### How It Works

```
Session → Observe → Log → Detect Patterns → Generate Instincts → Evolve Skills
```

1. **Observation** — ACT observes corrections, preferences, errors, and successes
2. **Pattern Detection** — Recurring behaviors (≥3 occurrences) are identified
3. **Confidence Scoring** — Each pattern gets a confidence score (0.0-1.0)
4. **Instincts** — Low-confidence patterns become suggestions
5. **Skills** — High-confidence patterns become automatic rules

### Confidence Levels

| Score | Level | AI Behavior |
|-------|-------|-------------|
| 0.0-0.3 | Noise | Ignore |
| 0.3-0.5 | Tentative | Suggest, ask confirmation |
| 0.5-0.7 | Probable | Propose, apply if no objection |
| 0.7-0.9 | Certain | Apply automatically |
| 0.9-1.0 | Established | Always apply, don't mention |

### Commands

| Command | Description |
|---------|-------------|
| `/act:evolve` | Analyze observations and evolve the system |
| `/act:evolve --dry-run` | Preview changes without applying |

### Instincts vs Skills

| Aspect | Instinct | Skill |
|--------|----------|-------|
| Confidence | 0.5-0.7 | ≥0.7 |
| Application | Suggestion | Automatic |
| Location | `instincts/` | `skills/` |
| Lifespan | Temporary | Permanent |

### Example

```
Day 1: You correct camelCase → snake_case (observation logged)
Day 2: You correct again (pattern detected)
Day 3: You correct a third time (instinct created: "prefer snake_case")
Day 5: You validate the suggestion (confidence +0.2)
Day 7: /act:evolve promotes instinct to skill (confidence ≥0.7)
```

Now ACT automatically uses snake_case without asking.

**Details:** See `specs/SPEC-continuous-learning.md`

---

## GitHub Integration

Synchronize your ACT project with GitHub Issues for integrated project management.

### Quick Start

```bash
# Configure token
export GITHUB_TOKEN=ghp_xxxxx

# Initialize labels and Issues
/act:sync-github --push --labels
```

### Commands

```bash
/act:sync-github              # Show diff local ↔ GitHub
/act:sync-github --push       # Push local state to GitHub Issues
/act:sync-github --pull       # Pull GitHub state to local
/act:sync-github --dry-run    # Preview changes
/act:sync-github --labels     # Create/update labels
```

### Features

| Local | → | GitHub |
|-------|---|--------|
| Phase in `plan.md` | → | Issue `[Phase N] Name` |
| Tasks `- [ ]` / `- [x]` | ↔ | Checkboxes in Issue body |
| Phase state (✅🔄⏳) | → | Labels + open/closed |
| Session in `progress.md` | → | Issue comment |
| Context handoff | → | PR description |

### Configuration

```yaml
# .act/config.yaml
github:
  enabled: true
  repo: owner/repo  # Auto-detected if not set
  sync:
    issues: true
    labels: true
```

### Labels Created

- `phase-1` through `phase-7` — Phase identification
- `in-progress` — Currently active
- `pending` — Not yet started
- `blocked` — Blocked
- `act-managed` — Managed by ACT

**Details:** See `skills/github-integration/SKILL.md` and `specs/SPEC-github-integration.md`

---

## Multi-IDE Support

ACT methodology works with any AI coding assistant. Export your configuration to other IDEs.

### Supported IDEs

| IDE | Config Directory | Format |
|-----|-----------------|--------|
| Claude Code | `.claude/` | CLAUDE.md (native) |
| Cursor | `.cursor/rules/` | Markdown rules |
| Windsurf | `.windsurf/rules/` | Markdown rules |
| Aider | `.aider/` | YAML + conventions |
| Continue | `.continue/` | JSON config |
| Copilot | `.github/` | copilot-instructions.md |

### Export Command

```bash
# Export for specific IDE
/act:export --ide cursor

# Export for all supported IDEs
/act:export --all

# Preview without writing
/act:export --ide aider --dry-run

# Force overwrite existing files
/act:export --ide cursor --force
```

### What Gets Exported

Each export includes:
- **Iron Laws** — TDD, Debugging, Verification rules
- **Deviation Rules** — Autonomous vs human decision rules
- **Session Recovery** — 5-question context check
- **Reflexion Pattern** — Quality improvement process

### Example: Export to Cursor

```bash
/act:export --ide cursor
```

Creates:
```
.cursor/
└── rules/
    └── act-rules.md
```

**Details:** See `specs/SPEC-multi-ide.md` and `tools/ide-export/`

---

## Version History

### v2.6.0 (Current)

- [x] Consolidated architecture (single command location)
- [x] Hooks behavior rules (mandatory triggers)
- [x] `/act:agent` command (load specialized agents)
- [x] `/act:verify-hooks` command
- [x] Install script with local/global options
- [x] Removed duplicate v1 commands
- [x] 24 ACT commands + 12 thinking models

### v2.5.0

- [x] Context Engineering (3-File Pattern)
- [x] Hooks System (Pre/Post/Stop)
- [x] Iron Laws (TDD, Debug, Verification)
- [x] Scale-Adaptive (Quick vs Full mode)
- [x] Deviation Rules (Controlled autonomy)
- [x] Session Recovery automation
- [x] Model Selection (Agent system)
- [x] Context Handoff format
- [x] Reflexion Pattern (+8-21% quality)
- [x] Continuous Learning
- [x] GitHub Integration
- [x] Party Mode
- [x] Multi-IDE Support
- [x] Agent Auditors

---

## Party Mode

Explore decisions through **multiple perspectives** with simulated expert personas.

### The 5 Personas

| Emoji | Persona | Perspective |
|-------|---------|-------------|
| 🏛️ | Architect | System view, patterns, scalability |
| 💻 | Developer | Implementation, pragmatism, effort |
| 🔍 | Reviewer | Quality, edge cases, tests |
| 👤 | User Advocate | UX, simplicity, adoption |
| 😈 | Devil's Advocate | Risks, alternatives, challenges |

### Usage

```bash
# Full discussion (5 agents, 3 rounds)
/act:party "Should we migrate to microservices?"

# Select specific agents
/act:party "REST vs GraphQL" --agents architect,developer

# Quick single round
/act:party "Naming convention" --rounds 1

# With summary synthesis
/act:party "Is this refactoring worth it?" --summary
```

### Options

| Option | Description | Default |
|--------|-------------|---------|
| `--agents <list>` | Agents to include | All 5 |
| `--rounds <n>` | Number of discussion rounds | 3 |
| `--summary` | Generate synthesis at end | false |
| `--format <type>` | Output format (discussion/table/summary) | discussion |

### When to Use

- Architecture decisions with trade-offs
- Technical choices needing exploration
- Challenging your own assumptions
- Before irreversible decisions

**Details:** See `skills/party-mode/SKILL.md` and `specs/SPEC-party-mode.md`

---

## Agent Auditors

Keep your ACT framework healthy with automated audits and repairs.

### Audit Commands

| Command | Description |
|---------|-------------|
| `/act:audit-skill <name>` | Audit a specific skill |
| `/act:audit-command <name>` | Audit a specific command |
| `/act:audit-agent <name>` | Audit a specific agent |
| `/act:audit-all` | Comprehensive framework audit |
| `/act:heal <target>` | Auto-repair identified issues |

### Audit Checks

Each audit performs 5 checks:

| Check | What It Verifies |
|-------|-----------------|
| **Structure** | Required files present |
| **Format** | Valid markdown, required sections |
| **References** | Internal links functional |
| **Consistency** | Coherence with other files |
| **Completeness** | No TODO/FIXME forgotten |

### Example Report

```markdown
## Audit Report: skill/context-engineering

| Check | Status | Details |
|-------|--------|---------|
| Structure | ✅ | SKILL.md present |
| Format | ✅ | All sections found |
| References | ⚠️ | 1 broken link |
| Consistency | ✅ | Listed in README |
| Completeness | ✅ | No TODOs found |

**Score: 4/5** (80%)
**Issues:** 1 warning
```

### Healing

Fix issues automatically:

```bash
# Preview fixes
/act:heal skills/context-engineering --dry-run

# Apply safe fixes only
/act:heal skills/context-engineering --auto

# Apply all fixes (including templates)
/act:heal skills/context-engineering --force
```

### Best Practices

1. **Run audits regularly** — At least before major releases
2. **Fix warnings promptly** — They tend to accumulate
3. **Use `--dry-run` first** — Before auto-healing
4. **Integrate with CI** — Catch issues early

**Details:** See `specs/SPEC-agent-auditors.md` and `skills/auditor/SKILL.md`
