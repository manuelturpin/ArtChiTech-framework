# Worktree Directory Selection

> Where to place your git worktrees.

## Priority Order

Try these locations in order:

### 1. `.worktrees/` (Preferred)

Inside the repo root:

```
project/
├── .worktrees/        ← Worktrees here
│   ├── feat-login/
│   └── fix-auth/
├── src/
└── .gitignore         ← Must include .worktrees/
```

**Pros:** Close to project, easy to find
**Cons:** Must be in .gitignore

**Setup:**
```bash
mkdir -p .worktrees
echo ".worktrees/" >> .gitignore
```

### 2. `../worktrees/` (Alternative)

Sibling directory to the repo:

```
parent/
├── project/           ← Your repo
└── worktrees/         ← Worktrees here
    ├── project-feat-login/
    └── project-fix-auth/
```

**Pros:** Outside repo, no .gitignore needed
**Cons:** Farther from project

### 3. `/tmp/act-worktrees/` (Temporary)

System temp directory:

```
/tmp/act-worktrees/
├── project-feat-login/
└── project-fix-auth/
```

**Pros:** Auto-cleaned by OS, no pollution
**Cons:** Lost on reboot, harder to find

## Naming Convention

```
<feature-short-name>/
```

Examples:
- `.worktrees/feat-login/`
- `.worktrees/fix-timeout/`
- `.worktrees/refactor-auth/`

## .gitignore Setup

If using `.worktrees/` inside the repo:

```bash
# Add to .gitignore (if not already present)
echo ".worktrees/" >> .gitignore
```

**The PreToolUse hook should verify this automatically.**

## Decision Guide

```
Is the task long-lived (> 1 session)?
├── YES → Use .worktrees/ (persistent)
└── NO  → Is disk space a concern?
          ├── YES → Use /tmp/ (auto-cleaned)
          └── NO  → Use .worktrees/ (convenient)
```

---

*ACT v3.5 — Worktree Directory Selection*
