---
description: Start a task with auto-detected complexity level (0-4)
---

# /act:start

## Description

Start a new task with automatic complexity level detection. Replaces the need to choose between `/act:quick` and `/act:full` — the framework determines the right level of process.

## Usage

```bash
/act:start <task description>
/act:start <task description> --level <0-4>
/act:start <task description> --level auto
```

## Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `<task description>` | What you want to accomplish | Required |
| `--level <0-4>` | Override auto-detection | auto |

## Auto-Detection

When no level is specified, assess:

1. **Scope:** How many files/modules affected?
2. **Unknowns:** How much is unclear?
3. **Risk:** What's the blast radius if something goes wrong?
4. **Duration:** How long will this likely take?

Score each 0-4, take the maximum as the level.

## Behavior by Level

### Level 0: Atomic
1. Skip `.act/` initialization
2. Execute the change directly
3. Verify (run tests if applicable)
4. Commit

### Level 1: Micro
1. Create minimal `.act/plan.md`
2. Execute tasks
3. Verify all tasks complete
4. Commit

### Level 2: Standard
1. Initialize `.act/` with config + state + plan
2. Run abbreviated phases (Strategy → Design → Development → Quality → Launch)
3. Two-stage review recommended
4. Tag completion

### Level 3: Complex
1. Full `.act/` initialization
2. Run all 7 ACT phases
3. Two-stage review mandatory
4. SDD for implementation
5. Full verification checklist

### Level 4: Product
1. Full `.act/` + BMAD artefacts
2. PRD workflow → Story decomposition → ADR workflow
3. All 7 phases with formal gate reviews
4. SDD with worktree isolation
5. Full verification + stakeholder sign-off

## Examples

```bash
# Auto-detect level
/act:start Fix the login timeout bug
# → Detected: Level 1 (Micro) — small scope, known solution

/act:start Add payment integration with Stripe
# → Detected: Level 3 (Complex) — cross-cutting, significant unknowns

/act:start Build a new CLI tool for data migration
# → Detected: Level 4 (Product) — new system, multiple components

# Override level
/act:start Refactor auth module --level 2
```

## Interaction with Existing Commands

| Command | Behavior in v3.5 |
|---------|-------------------|
| `/act:start` | New primary command, auto-detects level |
| `/act:quick` | Alias for `/act:start --level 1` |
| `/act:full` | Alias for `/act:start --level 3` |
| `/act:init` | Low-level init, still works independently |

---

*ACT v3.5 — Scale-Adaptive Start Command*
