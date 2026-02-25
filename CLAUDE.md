# ArtChiTech Framework (ACT) v3.0

> Unified 7-phase methodology with multi-project orchestration, BMAD artefacts, and Superpowers integration.

## Hooks Behavior (MANDATORY)

**@.claude/rules/9-hooks-behavior.md**

Claude MUST apply these hooks automatically:
- **PreToolUse**: Refresh plan before Write/Edit/Bash
- **PostToolUse**: Update progress.md after modifications
- **Stop**: Verify all phases before declaring complete

---

## Language

- **Project language**: English (all code, docs, comments)
- **Conversation language**: French (discuss with user in French)

## Identity

- **Name**: ArtChiTech Framework
- **Shortcut**: ACT
- **Type**: Claude Code Plugin
- **Version**: 3.0.0-alpha

---

## ⚖️ Iron Laws

**These rules are NON-NEGOTIABLE. No exceptions. No shortcuts.**

### 1. TDD Iron Law
> **NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST**

- Write test → Run (FAIL) → Write code → Run (PASS)
- Code written before test? **DELETE IT. Start over.**

### 2. Debugging Iron Law
> **NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST**

- Investigate → Understand → Fix
- 3+ failed fixes = wrong architecture. STOP and reassess.

### 3. Verification Iron Law
> **NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE**

- Run the command → Read the output → THEN make the claim
- Never say "should work" or "I'm confident" without evidence

**Full details:** @rules/iron-laws.md  
**Checklist:** @templates/verification-checklist.md

---

## 🔀 Deviation Rules

When you discover something unexpected during execution, apply these rules:

| Rule | Trigger | Action |
|:----:|---------|--------|
| **1** | Bug discovered | 🔧 Auto-fix immediately |
| **2** | Missing critical (deps, config) | ➕ Auto-add immediately |
| **3** | Blocker (prevents progress) | 🚧 Auto-fix immediately |
| **4** | Architectural change | ⛔ **STOP & ASK USER** |
| **5** | Enhancement (nice-to-have) | 📝 Log to ISSUES.md, continue |

**Principle:** Rules 1-3, 5 = autonomous. Rule 4 = human decision required.

### Quick Decision
```
Can I fix this in < 5 min without changing how things work together?
├── YES → Rules 1, 2, or 3 (auto-handle)
└── NO  → Does it need a design decision?
          ├── YES → Rule 4 (STOP and ASK)
          └── NO  → Rule 5 (Log and continue)
```

**Full details:** @rules/deviation-rules.md  
**Enhancement log:** @templates/ISSUES.md

---

## 🔄 Session Recovery

When starting a new session, use `/act:resume` to detect and recover previous context.

### Automatic Detection
ACT detects existing `.act/` directory and generates a **Catchup Report**:

```markdown
## 🔄 Session Recovery

**Projet :** [project name]
**Dernière session :** [date/time]
**Phase actuelle :** [X/Y] ([phase name])
**Progression :** [X%]

### Dernières actions
- [recent action 1]
- [recent action 2]

### Prochaines étapes
- [next step 1]
- [next step 2]
```

### 5-Question Reboot Test
Verify context is complete using `/act:where-am-i`:

| # | Question | Source | Status |
|---|----------|--------|--------|
| 1 | Where am I? | `state.md` | ✅/❌ |
| 2 | Where am I going? | `plan.md` | ✅/❌ |
| 3 | What's the goal? | `config.yaml` | ✅/❌ |
| 4 | What have I learned? | `findings.md` | ✅/❌ |
| 5 | What have I done? | `progress.md` | ✅/❌ |

**Context Status:**
- 5/5 → ✅ Complete, ready to continue
- 3-4/5 → ⚠️ Partial, proceed with caution
- 0-2/5 → ❌ Incomplete, run `/act:init --repair`

**Full details:** @skills/session-recovery/SKILL.md  
**Spec:** @specs/SPEC-reboot-test.md  
**Commands:** `/act:resume`, `/act:where-am-i`

---

## 🪝 Hooks System

Hooks provide **100% reliable** automated triggers (vs skills ~50-80% reliability).

### The 3 Essential Hooks

| Hook | Trigger | Action |
|------|---------|--------|
| **PreToolUse** | Before Write/Edit/Bash | Refresh goals from `plan.md`, check alignment |
| **PostToolUse** | After Write/Edit | Remind to update `progress.md`, log changes |
| **Stop** | Before completion claim | Verify all phases have evidence |

### Why Hooks Matter

```
Agents often forget to:
- Re-check the plan before modifying code
- Update progress after completing work  
- Verify all phases before declaring done

Hooks make these checks AUTOMATIC and MANDATORY.
```

### Local Hooks

Projects can customize hooks via `.act/hooks.json`:

```bash
/act:init --with-hooks
```

| Capability | Example |
|------------|---------|
| Extend framework hooks | `"extends": "framework"` |
| Add context files | `"overrides": { "PreToolUse": { "config": { "additionalFiles": ["docs/API.md"] }}}` |
| Custom project hooks | `"hooks": { "PreDeploy": {...} }` |
| Disable hooks (prototype mode) | `"overrides": { "PostToolUse": { "enabled": false }}` |

**Full details:** @hooks/ and @specs/SPEC-hooks-system.md

---

## 📜 Session History

Session History saves a summary of each work session for traceability.

### Features
- **Auto-save** on session end (Stop Hook)
- **Rotation** to limit stored sessions (default: 10)
- **Replay** past sessions for context

### Commands

| Command | Description |
|---------|-------------|
| `/act:history` | List past sessions |
| `/act:replay <date>` | View details of a specific session |

### History Location
```
.act/
└── history/
    ├── 2026-02-01-1430.md
    ├── 2026-02-01-1830.md
    └── 2026-02-02-0330.md
```

**Full details:** @skills/session-recovery/SKILL.md

---

## 📤 Context Handoff

Transfer context between sessions or agents with a standardized format.

### Generate Handoff

```bash
/act:handoff              # Output to stdout
/act:handoff --save       # Save to .act/handoffs/
/act:handoff --format md  # Markdown instead of XML
/act:handoff --to agent   # Specify target agent
```

### Handoff Content

| Section | Contains |
|---------|----------|
| `metadata` | Project, timestamp, session ID |
| `original_task` | What was the goal |
| `work_completed` | Actions done |
| `work_remaining` | Tasks left |
| `attempted_approaches` | What worked/failed |
| `critical_context` | Must-not-lose info |
| `current_state` | Phase, progress, blockers |

### Integration with Recovery

When `/act:resume` finds a recent handoff (< 24h), it:
1. Parses handoff content
2. Enriches catchup report
3. Prioritizes `work_remaining`

**Full details:** @specs/SPEC-context-handoff.md  
**Template:** @templates/context-handoff.xml

---

## 🤖 Model Selection

ACT uses specialized agents with appropriate models for each task type.

### Strategy
```
Opus = PENSE et DÉCIDE (architectural, planning, review)
Sonnet = EXÉCUTE (implementation, testing)
Haiku = LIT et DOCUMENTE (documentation, simple tasks)
```

### Agents

| Agent | Model | Use When |
|-------|-------|----------|
| `planner` | opus | Starting a new feature, planning phases |
| `architect` | opus | Design decisions, architecture changes |
| `executor` | sonnet | Writing code, implementing features |
| `reviewer` | opus | Code review, quality validation |
| `tester` | sonnet | Writing and running tests |
| `documenter` | haiku | Updating docs, READMEs |

### Quick Reference
- **Deviation Rule 4** (architectural) → triggers `architect`
- **Implementation task** → use `executor`
- **Before merge** → call `reviewer`

**Full details:** @agents/README.md

---

## 🪞 Reflexion Pattern

Improve output quality through structured self-reflection (**+8-21% quality improvement** proven by CEK).

### Process
```
1. Complete task
2. /act:reflect (auto-triggered by "reflect" in prompt)
3. Improve output
4. /act:memorize (save insights)
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
| `/act:reflect [topic]` | Reflect on task or topic |
| `/act:memorize <insight>` | Save insight to findings or CLAUDE.md |

### When to Use

| Situation | Action |
|-----------|--------|
| Complex task completed | Always reflect |
| "reflect" in prompt | Auto-triggered |
| User requests review | Always reflect |
| Simple mechanical task | Skip |

### Storage

- **`.act/findings.md`** — All reflexion insights (default)
- **`CLAUDE.md`** — Important, reusable insights (`--important` flag)

**Full details:** @skills/reflexion/SKILL.md

---

## 🧠 Thinking Models

Apply structured mental models to improve decision-making and problem-solving.

### The /consider Commands

| Command | Description |
|---------|-------------|
| `/consider:first-principles` | Break down to fundamentals |
| `/consider:5-whys` | Root cause analysis |
| `/consider:pareto` | Focus 80/20 |
| `/consider:inversion` | Solve backwards |
| `/consider:second-order` | Consequences of consequences |
| `/consider:regret-minimization` | Long-term decision making |
| `/consider:opportunity-cost` | Cost of alternatives |
| `/consider:circle-of-competence` | Know your limits |
| `/consider:map-territory` | Model vs reality |
| `/consider:probabilistic` | Reason in probabilities |
| `/consider:pre-mortem` | Anticipate failure |
| `/consider:reversibility` | Reversible vs irreversible decisions |

### Quick Reference

| Situation | Use |
|-----------|-----|
| Architecture decision | `first-principles`, `second-order` |
| Bug investigation | `5-whys`, `inversion` |
| Feature prioritization | `pareto`, `opportunity-cost` |
| Risk assessment | `pre-mortem`, `reversibility` |

**Full details:** @skills/thinking/SKILL.md

---

## 🎭 Party Mode

Explore decisions through **multiple perspectives** with simulated expert personas.

### The 5 Personas

| Emoji | Persona | Perspective |
|-------|---------|-------------|
| 🏛️ | Architect | System view, patterns, scalability |
| 💻 | Developer | Implementation, pragmatism, effort |
| 🔍 | Reviewer | Quality, edge cases, tests |
| 👤 | User Advocate | UX, simplicity, adoption |
| 😈 | Devil's Advocate | Risks, alternatives, challenges |

### Command

```bash
/act:party "<topic>" [--agents <list>] [--rounds <n>] [--summary] [--format <type>]
```

### Quick Reference

| Option | Description | Default |
|--------|-------------|---------|
| `--agents` | Agents to include (comma-separated) | All 5 |
| `--rounds` | Number of discussion rounds | 3 |
| `--summary` | Generate synthesis at end | false |
| `--format` | Output: discussion, table, summary | discussion |

### Examples

```bash
# Full discussion
/act:party "Should we use microservices or monolith?"

# Targeted discussion
/act:party "Error handling strategy" --agents architect,developer,reviewer

# Quick exploration
/act:party "Variable naming" --rounds 1

# Decision-focused
/act:party "Is this refactoring worth it?" --summary --format summary
```

### When to Use

| Situation | Recommended |
|-----------|-------------|
| Architecture decision | Full party (all 5) |
| Implementation choice | architect, developer |
| Quality concern | developer, reviewer |
| UX question | developer, user-advocate |
| Risk assessment | All + devil's advocate focus |

### Rules of Discussion

1. Each persona responds **independently** (no cross-influence)
2. Responses are **2-4 sentences** (concise)
3. **Disagreements welcome** (reveal trade-offs)
4. No **forced consensus**

**Full details:** @skills/party-mode/SKILL.md, @specs/SPEC-party-mode.md

---

## Rules

@.claude/rules/0-behavior.md

## Documentation

| Topic | File |
|-------|------|
| Framework & Phases | @.claude/rules/1-framework-overview.md |
| Architecture | @.claude/rules/2-architecture.md |
| Commands | @.claude/rules/3-command-development.md |
| Conventions | @.claude/rules/4-conventions.md |
| Tests | @.claude/rules/5-testing.md |
| Troubleshooting | @.claude/rules/6-troubleshooting.md |

## Quick Start

```bash
# Edit plugin
plugin/

# Test
cd test-apps/[app-name] && /onboard

# Commit
git commit -m "feat: description"
```

## 📁 Multi-Project Orchestrator (NEW v3.0)

Manage 4-6 projects simultaneously from a centralized registry.

### Commands

| Command | Description |
|---------|-------------|
| `/act:projects` | List, register, or scan for projects |
| `/act:switch <name>` | Switch context to another project |
| `/act:dashboard` | Multi-project overview with phases, progress, alerts |

### Architecture

```
~/.act/projects.yaml     ← Global registry (all projects)
    │
    ├── project-a/.act/  ← Per-project state (source of truth)
    ├── project-b/.act/
    └── project-c/.act/
```

### Quick Start

```bash
# Register current project
/act:projects --register .

# See all projects
/act:dashboard

# Switch to another project
/act:switch pocket-watch-ai
```

**Full details:** @skills/orchestrator/SKILL.md

---

## 📄 BMAD Artefacts (NEW v3.0)

ACT v3.0 integrates structured artefacts from the BMAD methodology.

### Product Requirements Document (PRD)

Created during **Phase 2: Strategy** using `workflows/prd/`:
- 7 structured sections (Vision, Users, Features, Tech, Metrics, Constraints, Timeline)
- Three modes: Create, Validate, Edit
- Stored in `.act/prd.md`

### Architecture Decision Records (ADR)

Created during **Phase 3: Design** using `workflows/adr/`:
- Captures architectural decisions with context, alternatives, consequences
- Triggered by Deviation Rule 4 (architectural changes)
- Stored in `.act/architecture/ADR-NNN-slug.md`

### Story Decomposition

Created during **Phase 2: Strategy** using `workflows/stories/`:
- Breaks PRD into Epics → Stories
- Estimation and prioritization
- Stored in `.act/stories/`

**Workflows:** @plugin/workflows/prd/, @plugin/workflows/adr/, @plugin/workflows/stories/

---

## Main Commands

| Command | Description |
|---------|-------------|
| `/project` | Main interactive hub |
| `/onboard` | Audit a project |
| `/status` | Project state |
| `/next` | Next step |
| `/fix` | Fix issues |
| `/resume` | Resume session |
| `/help` | Contextual help |

### ACT v3.0 Commands

| Command | Description |
|---------|-------------|
| `/act:init` | Initialize ACT in a project |
| `/act:quick` | Start quick mode (small tasks) |
| `/act:full` | Start full mode (complex projects) |
| `/act:validate` | Validate .act/ file conformity |
| `/act:resume` | Recover from previous session |
| `/act:where-am-i` | Quick 5-question context check |
| `/act:history` | List past sessions |
| `/act:replay` | View details of a past session |
| `/act:diff` | Show changes since last session |
| `/act:status` | Show current state with velocity |
| `/act:handoff` | Generate context handoff for transfer |
| `/act:reflect` | Reflect on task to improve quality (+8-21%) |
| `/act:memorize` | Save important insights for future reference |
| `/act:evolve` | Analyze observations and evolve the system |
| `/act:projects` | **[NEW v3.0]** List/register/scan projects |
| `/act:switch` | **[NEW v3.0]** Switch context to another project |
| `/act:dashboard` | **[NEW v3.0]** Multi-project overview dashboard |
| `/act:sync-github` | Sync project state with GitHub Issues |
| `/act:export` | Export ACT config to other IDEs (Cursor, Windsurf, etc.) |
| `/act:audit-skill` | Audit a specific skill |
| `/act:audit-command` | Audit a specific command |
| `/act:audit-agent` | Audit a specific agent |
| `/act:audit-all` | Full framework audit |
| `/act:heal` | Auto-repair audit issues |

---

## 🔍 Agent Auditors

Audit and repair framework components to maintain health and consistency.

### Commands

| Command | Description |
|---------|-------------|
| `/act:audit-skill <name>` | Audit a specific skill |
| `/act:audit-command <name>` | Audit a specific command |
| `/act:audit-agent <name>` | Audit a specific agent |
| `/act:audit-all` | Comprehensive framework audit |
| `/act:heal <target>` | Auto-repair identified issues |

### Audit Checks

| Check | What It Verifies |
|-------|-----------------|
| **Structure** | Required files present |
| **Format** | Valid markdown, required sections |
| **References** | Internal links functional |
| **Consistency** | Coherence with other files |
| **Completeness** | No TODO/FIXME forgotten |

### Report Format

```markdown
## Audit Report: skill/<name>

| Check | Status | Details |
|-------|--------|---------|
| Structure | ✅ | SKILL.md present |
| Format | ✅ | All required sections found |
| References | ⚠️ | 1 broken link found |
| Consistency | ✅ | Consistent with docs |
| Completeness | ✅ | No TODOs found |

**Score: 4/5** (80%)
**Issues:** 1 warning
```

### Healing Options

| Option | Description |
|--------|-------------|
| `--dry-run` | Preview fixes without applying |
| `--auto` | Apply safe fixes only |
| `--force` | Apply all fixes including templates |
| `--backup` | Create backup before modifying |

### When to Audit

| Trigger | Action |
|---------|--------|
| Before release | `/act:audit-all` |
| After refactoring | `/act:audit-all --quick` |
| New component added | Audit that component |
| CI/CD pipeline | `/act:audit-all --fail-on-error` |

**Full details:** @specs/SPEC-agent-auditors.md, @skills/auditor/SKILL.md

---

## 🐙 GitHub Integration

Synchronize your ACT project state with GitHub Issues for integrated project management.

### Features

| Feature | Description |
|---------|-------------|
| **Phase → Issues** | Each phase becomes a GitHub Issue |
| **Tasks → Checkboxes** | Tasks sync bidirectionally |
| **State → Labels** | `in-progress`, `pending`, `completed` |
| **Progress → Comments** | Session updates as Issue comments |
| **Handoff → PR** | Generate PR descriptions from context |

### Quick Start

```bash
# 1. Configure token
export GITHUB_TOKEN=ghp_xxxxx

# 2. Initialize labels and Issues
/act:sync-github --push --labels

# 3. After working, sync state
/act:sync-github --push
```

### Commands

| Command | Description |
|---------|-------------|
| `/act:sync-github` | Show diff between local and GitHub |
| `/act:sync-github --push` | Push local state to GitHub Issues |
| `/act:sync-github --pull` | Pull GitHub state to local |
| `/act:sync-github --dry-run` | Preview changes without applying |
| `/act:sync-github --labels` | Create/update ACT labels |

### Configuration

In `.act/config.yaml`:

```yaml
github:
  enabled: true
  repo: owner/repo  # Auto-detected if not set
  sync:
    issues: true
    labels: true
    milestones: false
    comments: false
```

### Labels Created

| Label | Description |
|-------|-------------|
| `phase-1` to `phase-7` | Phase identification |
| `in-progress` | Currently active phase |
| `pending` | Phase not yet started |
| `blocked` | Phase blocked |
| `act-managed` | Managed by ACT Framework |

### Workflow

```
Local plan.md ──push──► GitHub Issues
                          │
                          │ (team edits)
                          ▼
Local plan.md ◄──pull─── GitHub Issues
```

**Full details:** @skills/github-integration/SKILL.md  
**Spec:** @specs/SPEC-github-integration.md  
**Templates:** @templates/github/

---

## 🧬 Continuous Learning

ACT learns from your interactions to improve automatically.

### Observation Types

| Type | When | Example |
|------|------|---------|
| `pattern` | Recurring behavior detected | "Always uses atomic commits" |
| `correction` | User corrects AI | "Use camelCase not snake_case" |
| `preference` | Explicit or implicit preference | "Prefers inline docs" |
| `error` | AI mistake identified | "Tests not run before commit" |
| `success` | User validates action | "Format appreciated" |

### Confidence Levels

| Score | Level | AI Behavior |
|-------|-------|-------------|
| **0.3-0.5** | Tentative | 💬 Suggest (ask confirmation) |
| **0.5-0.7** | Probable | 📝 Propose (apply if no objection) |
| **0.7-0.9** | Certain | ✅ Apply automatically |
| **0.9-1.0** | Established | 🔒 Always apply (no mention) |

### Observation Logging

When observing a significant event, log to `.act/observations.jsonl`:

```json
{"timestamp": "2026-02-02T06:00:00Z", "type": "correction", "context": {"task": "naming"}, "observation": "Prefers camelCase", "confidence": 0.5}
```

### Pattern Detection

Log an observation when:
- User corrects an AI action
- User validates positively ("parfait", "bien")
- Same behavior repeats ≥3 times
- Error identified after AI action

### /act:evolve

Analyzes observations and evolves the system:

```bash
/act:evolve              # Standard analysis (7 days)
/act:evolve --dry-run    # Preview without changes
/act:evolve --since=30d  # Extended period
```

**Results:**
- **Confidence 0.5-0.7** → Creates instinct in `instincts/`
- **Confidence ≥0.7** → Updates skill in `skills/`

### Instincts

Temporary patterns in `instincts/`:
- Suggestions, not rules
- Can evolve into skills
- Can be deleted if wrong

**Full details:** @skills/continuous-learning/SKILL.md, @specs/SPEC-continuous-learning.md

---

## 🔌 Multi-IDE Support

Export ACT configuration to other AI coding assistants.

### Supported IDEs

| IDE | Config Directory | Format |
|-----|-----------------|--------|
| Claude Code | `.claude/` | CLAUDE.md (native) |
| Cursor | `.cursor/rules/` | Markdown rules |
| Windsurf | `.windsurf/rules/` | Markdown rules |
| Aider | `.aider/` | YAML + conventions |
| Continue | `.continue/` | JSON config |
| Copilot | `.github/` | copilot-instructions.md |

### Commands

```bash
/act:export --ide cursor       # Export for Cursor
/act:export --ide aider        # Export for Aider
/act:export --all              # Export for all IDEs
/act:export --ide cursor --force  # Overwrite existing
```

### What Gets Exported

- **Iron Laws** — TDD, Debugging, Verification
- **Deviation Rules** — Autonomous vs human decisions
- **Session Recovery** — 5-question context check
- **Reflexion Pattern** — Quality improvement

**Full details:** @specs/SPEC-multi-ide.md, @commands/act/export.md
