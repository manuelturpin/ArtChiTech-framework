# ArtChiTech Framework (ACT)

> Claude Code plugin for 7-phase project management.

## Language

- **Project language**: English (all code, docs, comments)
- **Conversation language**: French (discuss with user in French)

## Identity

- **Name**: ArtChiTech Framework
- **Shortcut**: ACT
- **Type**: Claude Code Plugin

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
Verify context is complete by answering:

| Question | Source |
|----------|--------|
| Where am I? | `state.md` |
| Where am I going? | `plan.md` |
| What's the goal? | `config.yaml` |
| What have I learned? | `findings.md` |
| What have I done? | `progress.md` |

**Full details:** @skills/session-recovery/SKILL.md  
**Command:** `/act:resume`

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

### ACT v2.5 Commands

| Command | Description |
|---------|-------------|
| `/act:init` | Initialize ACT in a project |
| `/act:quick` | Start quick mode (small tasks) |
| `/act:full` | Start full mode (complex projects) |
| `/act:validate` | Validate .act/ file conformity |
| `/act:resume` | Recover from previous session |
| `/act:history` | List past sessions |
| `/act:replay` | View details of a past session |
| `/act:diff` | Show changes since last session |
| `/act:status` | Show current state with velocity |
