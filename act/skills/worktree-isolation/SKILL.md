---
name: worktree-isolation
description: Git worktree isolation for parallel feature development without branch switching
---

# Skill: Worktree Isolation

**Version:** 1.0.0
**Category:** Development
**Type:** Flexible

> **Self-Announcement:** When using this skill, announce: "Using Worktree Isolation skill to work on a task in an isolated git worktree."

## Purpose

Isolate feature development using git worktrees to prevent context pollution between tasks. Each task gets its own working directory, branch, and clean state.

## Why Worktrees?

| Problem | Without Worktrees | With Worktrees |
|---------|------------------|----------------|
| Context pollution | Uncommitted changes from Task A leak into Task B | Each task has a clean working directory |
| Branch switching | Stash, switch, unstash — fragile and error-prone | Each task is already on its own branch |
| Parallel work | Can only work on one branch at a time | Multiple branches active simultaneously |
| Review isolation | Reviewer sees mixed changes | Each worktree = one task = one review |

## When to Use

| Situation | Use Worktree? |
|-----------|--------------|
| New feature implementation | ✅ Yes |
| Bug fix that needs isolation | ✅ Yes |
| Subagent executing a task | ✅ Yes (always) |
| Quick one-file edit | ❌ No (overkill) |
| Spike / exploration | ✅ Yes (easy to discard) |

## Workflow

### 1. Create Worktree

```bash
# From main repo
git worktree add <directory> -b <branch-name>
```

**Directory selection:** See [Directory Selection](directory-selection.md)

### 2. Work in Worktree

```bash
cd <worktree-directory>
# Work normally — edit, test, commit
```

### 3. Finish Worktree

When done, choose a finish strategy: See [Finishing Branch](finishing-branch.md)

### 4. Cleanup

```bash
# Remove worktree
git worktree remove <directory>

# Or if already deleted
git worktree prune
```

## Quick Reference

```bash
# List worktrees
git worktree list

# Create worktree
git worktree add .worktrees/feat-login -b feature/login

# Remove worktree
git worktree remove .worktrees/feat-login

# Cleanup stale entries
git worktree prune
```

## Integration with ACT

### With Subagent-Driven Development
Each subagent executor works in its own worktree:
1. Controller creates worktree for the task
2. Subagent is dispatched with worktree path
3. Subagent works, commits, returns status
4. Controller reviews, then merges or discards

### With Hooks
- **PreToolUse:** Verify `.gitignore` includes worktree directory
- **PostToolUse:** Log worktree creation/removal in progress.md

### With Session Recovery
Worktree state is included in handoff:
```markdown
## Active Worktrees
- .worktrees/feat-login → feature/login (in progress)
- .worktrees/fix-auth → fix/auth-timeout (review pending)
```

## Related

- [Directory Selection](directory-selection.md) — Where to put worktrees
- [Finishing Branch](finishing-branch.md) — How to complete worktree work
- [Subagent-Driven Development](../subagent-development/SKILL.md) — Uses worktrees per task

---

*Skill version: 1.0 — ACT v3.5*
