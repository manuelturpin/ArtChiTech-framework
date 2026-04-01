# Finishing a Worktree Branch

> How to complete work in a worktree and integrate it back.

## Finish Strategies

### Strategy 1: Merge (Default)

Merge the worktree branch back into the parent branch.

```bash
# From main repo (not the worktree)
git merge <branch-name>

# Then cleanup
git worktree remove <worktree-path>
git branch -d <branch-name>
```

**Use when:** Feature is complete and reviewed.

### Strategy 2: Pull Request

Push the branch and create a PR for team review.

```bash
# From the worktree
git push -u origin <branch-name>

# Create PR
gh pr create --title "feat: description" --body "..."

# After merge, cleanup
git worktree remove <worktree-path>
git branch -d <branch-name>
```

**Use when:** Team collaboration, formal review needed.

### Strategy 3: Squash Merge

Combine all worktree commits into one clean commit.

```bash
# From main repo
git merge --squash <branch-name>
git commit -m "feat: complete description"

# Cleanup
git worktree remove <worktree-path>
git branch -D <branch-name>
```

**Use when:** Worktree has messy commit history.

### Strategy 4: Keep (Pause)

Keep the worktree for later work.

```bash
# Just leave it
# List to remember later:
git worktree list
```

**Use when:** Work is paused, will resume later.

### Strategy 5: Discard

Abandon the worktree and its changes.

```bash
# Remove worktree (forces removal even with changes)
git worktree remove --force <worktree-path>

# Delete the branch
git branch -D <branch-name>
```

**Use when:** Spike/exploration that didn't work out.

## Decision Guide

```
Is the work complete?
├── YES → Was it reviewed?
│         ├── YES → Merge or Squash Merge
│         └── NO  → Create PR
└── NO  → Will you continue later?
          ├── YES → Keep
          └── NO  → Discard
```

## Post-Finish Checklist

After finishing a worktree:

- [ ] Worktree removed (`git worktree remove`)
- [ ] Branch deleted (if merged)
- [ ] `git worktree prune` run
- [ ] Progress.md updated

---

*ACT v3.5 — Finishing Worktree Branches*
