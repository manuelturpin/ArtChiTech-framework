# Superpowers Integration — ACT v3.0

> ACT v3.0 **orchestrates** Superpowers skills within its 7-phase methodology. Superpowers remain installed as a separate plugin, but ACT provides the entry points and context.

## Orchestration Principle

```
┌─────────────────────────────────────────────────┐
│  ACT v3.0 (Orchestrator)                        │
│                                                  │
│  Phase 1 Discovery ──→ brainstorming            │
│  Phase 2 Strategy  ──→ writing-plans            │
│  Phase 3 Design    ──→ brainstorming + plans    │
│  Phase 4 Development ─→ TDD + debugging         │
│  Phase 5 Quality   ──→ verification + review    │
│  Phase 6 Launch    ──→ verification             │
│  Phase 7 Growth    ──→ debugging                │
│                                                  │
│  ✅ One entry point per phase                    │
│  ✅ No duplication between ACT and Superpowers  │
│  ✅ Superpowers skills stay installed, ACT calls │
└─────────────────────────────────────────────────┘
```

**Key rule**: Users enter via ACT commands (`/act:full`, `/act:quick`), NOT directly via Superpowers skills. ACT provides the project context that Superpowers skills need.

---

## Required Superpowers Skills

| Skill | ACT Phase | ACT Iron Law | Purpose |
|-------|-----------|--------------|---------|
| `brainstorming` | 1 Discovery, 2 Strategy, 3 Design | - | Explore ideas, validate problems, define scope |
| `writing-plans` | 2 Strategy, 3 Design | - | Create structured implementation plans |
| `test-driven-development` | 4 Development | TDD Iron Law | RED→GREEN→REFACTOR cycle |
| `code-review` | 4 Development, 5 Quality | - | Review code quality and patterns |
| `verification-before-completion` | 5 Quality, 6 Launch | Verification Iron Law | Evidence before assertions |
| `systematic-debugging` | 4 Development, 5 Quality, 7 Growth | Debugging Iron Law | Methodical root cause investigation |

### Additional Superpowers Used

| Skill | When Used | Purpose |
|-------|-----------|---------|
| `dispatching-parallel-agents` | Any phase with independent tasks | Parallelize work across agents |
| `using-git-worktrees` | 4 Development | Isolate feature work |
| `finishing-a-development-branch` | 5 Quality → 6 Launch | Complete and merge work |
| `executing-plans` | Any phase | Execute implementation plans with checkpoints |
| `receiving-code-review` | 5 Quality | Process review feedback properly |

---

## Skills by Phase (Detailed)

### Phase 1: Discovery
- **`superpowers:brainstorming`** — Validate problem, explore user needs
- **ACT adds**: Research workflow, competitive analysis templates, PRD scaffolding

### Phase 2: Strategy
- **`superpowers:brainstorming`** — Define MVP scope, explore business models
- **`superpowers:writing-plans`** — Create implementation roadmap
- **ACT adds**: PRD workflow, Story decomposition, scale-adaptive depth

### Phase 3: Design
- **`superpowers:brainstorming`** — Explore architecture options
- **`superpowers:writing-plans`** — Document technical specifications
- **ACT adds**: ADR workflow, `/act:party` for multi-perspective architecture decisions

### Phase 4: Development
- **`superpowers:test-driven-development`** — Write tests first, implement after
- **`superpowers:code-review`** — Review implementation quality
- **`superpowers:systematic-debugging`** — Debug failures methodically
- **ACT adds**: Chunk-Test-Fix workflow, model selection (Sonnet for execution)

### Phase 5: Quality
- **`superpowers:verification-before-completion`** — Ensure all tests pass
- **`superpowers:systematic-debugging`** — Debug failing tests
- **`superpowers:requesting-code-review`** — Final review before merge
- **ACT adds**: All 3 Iron Laws enforced, Stop Hook verification

### Phase 6: Launch
- **`superpowers:verification-before-completion`** — Pre-launch checklist
- **ACT adds**: Deployment verification, monitoring setup

### Phase 7: Growth
- **`superpowers:systematic-debugging`** — Debug production issues
- **ACT adds**: Continuous learning, observations, `/act:evolve`

---

## Skills by Agent

| Agent | Model | Superpowers Used |
|-------|-------|------------------|
| `planner` | Opus | `brainstorming`, `writing-plans` |
| `architect` | Opus | `brainstorming`, `writing-plans` |
| `executor` | Sonnet | `test-driven-development`, `systematic-debugging` |
| `reviewer` | Opus | `code-review`, `verification-before-completion` |
| `tester` | Sonnet | `test-driven-development`, `systematic-debugging` |
| `documenter` | Haiku | (none — documentation only) |

---

## Iron Laws ↔ Superpowers Mapping

| Iron Law | Superpowers Enforcement | Phase |
|----------|------------------------|-------|
| TDD Iron Law | `test-driven-development` enforces RED→GREEN→REFACTOR | 4, 5 |
| Debugging Iron Law | `systematic-debugging` enforces root cause investigation | 4, 5, 7 |
| Verification Iron Law | `verification-before-completion` enforces evidence-first | 5, 6 |

---

## Installation Verification

```bash
# Check if superpowers plugin is installed
ls ~/.claude/plugins/cache/ | grep superpowers
```

## Fallback Behavior

When superpowers is not available, ACT provides built-in equivalents:

| Superpower | ACT Fallback |
|------------|-------------|
| `brainstorming` | ACT brainstorming workflow (`workflows/brainstorming/`) |
| `writing-plans` | Manual plan creation in `.act/plan.md` |
| `test-driven-development` | TDD Iron Law enforcement via hooks |
| `systematic-debugging` | Debugging Iron Law enforcement via hooks |
| `verification-before-completion` | Verification Iron Law + Stop Hook |
| `code-review` | `reviewer` agent with manual checklist |

ACT will log a recommendation:
```
💡 Install superpowers for enhanced ACT capabilities:
   See: https://github.com/superpowers-ai/superpowers
```

---

*ACT v3.0 — Superpowers Orchestration Layer*
