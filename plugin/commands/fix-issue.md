---
name: fix-issue
description: Read a GitHub Issue, analyze context, and implement a fix with TDD
argument-hint: <issue-number>
---

# /fix-issue - Guided Issue Resolution

You help fix a reported issue by reading its context and implementing a TDD fix.

## Step 1: Parse Argument

Extract issue number from the argument.

If no argument provided:
```
Usage: /fix-issue <issue-number>

Example: /fix-issue 12

Tip: Use /triage to see open issues and pick one to fix.
```
And stop.

If argument is not a valid number:
```
Invalid issue number: [argument]

Usage: /fix-issue <issue-number>
Example: /fix-issue 12
```
And stop.

## Step 2: Check GitHub CLI

```bash
gh auth status
```

If GitHub CLI not installed:
```
GitHub CLI (gh) not found.

Install it from: https://cli.github.com/

Then authenticate with: gh auth login
```
And stop.

If not authenticated:
```
GitHub CLI not authenticated.
To use /fix-issue, please run: gh auth login
```
And stop.

## Step 3: Fetch Issue Details

```bash
gh issue view NUMBER \
  --repo manuelturpin/ArtChiTech-framework \
  --json number,title,body,labels,state,url
```

If issue not found:
```
Issue #NUMBER not found.

The issue may have been closed, deleted, or the number is incorrect.

Use /triage to see open issues.
```
And stop.

If issue is already closed:
```
Issue #NUMBER is already closed.

State: closed
Title: [issue title]

Would you like to reopen it? (y/n)
```

If user confirms reopen:
```bash
gh issue reopen NUMBER --repo manuelturpin/ArtChiTech-framework
```

## Step 4: Display Issue Summary

Parse the issue data and extract:

1. **Type**: From labels (`bug`, `enhancement`, `question`)
2. **Priority**: From labels (`priority:critical`, `priority:high`, `priority:medium`, `priority:low`)
3. **ACT Context**: Parse from issue body if present (Version, Phase, Mode, Stack)

Display format:
```
+-------------------------------------------------------------+
|  Fixing Issue #NUMBER                                       |
+-------------------------------------------------------------+
|                                                             |
|  Title: [issue title]                                       |
|  Type: [bug/enhancement/question]                           |
|  Priority: [critical/high/medium/low/none]                  |
|  URL: [issue url]                                           |
|                                                             |
|  Description:                                               |
|  [issue description - first 500 chars]                      |
|                                                             |
|  ACT Context (from issue):                                  |
|  - Version: v1.1.0                                          |
|  - Phase: 4 - Development                                   |
|  - Mode: COMPLET                                            |
|  - Stack: react, typescript                                 |
|                                                             |
+-------------------------------------------------------------+
```

## Step 5: Analyze and Propose Diagnosis

Based on the issue context, analyze:

1. **Likely cause**: What is probably causing this issue
2. **Files to investigate**: Which files are likely involved
3. **Fix approach**: How to address the issue

Use the codebase to search for relevant files:
- For bugs: Search for error messages, function names mentioned
- For enhancements: Search for related features/components
- For questions: Search for documentation gaps

Display diagnosis:
```
Diagnosis

Likely cause:
[Analysis based on issue description and codebase exploration]

Files to investigate:
- plugin/commands/[command].md
- plugin/skills/[skill]/SKILL.md
- [other relevant files]

Proposed approach:
1. [First step]
2. [Second step]
3. [Third step]

Proceed with fix? (y/n)
```

Wait for user confirmation before proceeding.

## Step 6: Implement Fix with TDD

If user confirms, follow TDD approach:

### Step 6.1: Write Failing Test (if applicable)

For bugs, create or update a test that reproduces the issue:
```
Writing test to reproduce issue...

File: plugin/tests/[relevant-test].py
```

For enhancements, create a test for the new behavior:
```
Writing test for new functionality...
```

For questions, skip to documentation fix.

### Step 6.2: Implement the Fix

Apply the necessary changes to fix the issue:
```
Implementing fix...

Changes:
- Modified: plugin/commands/[file].md
- Added: [file] (if applicable)
```

### Step 6.3: Run Tests

```bash
# Run relevant tests
python3 -m pytest plugin/tests/ -v
```

If tests fail:
```
Tests failed. Reviewing implementation...

[Error details]

Adjusting fix...
```

Iterate until tests pass.

### Step 6.4: Verify Fix

```
Verification complete.

- Tests passing
- Issue behavior resolved
- No regressions detected
```

## Step 7: Commit with Issue Reference

Stage and commit changes with the issue reference:

```bash
git add -A
git commit -m "fix: [brief description]

Fixes #NUMBER

- [Change 1]
- [Change 2]

Generated with [Claude Code](https://claude.com/claude-code)"
```

Display:
```
Committed: fix: [description]

Changes will auto-close issue #NUMBER when merged to main.
```

## Step 8: Create PR (Optional)

Ask user:
```
Create a Pull Request for this fix? (y/n)
```

If user confirms:

### Step 8.1: Create Branch (if needed)

If on main branch:
```bash
git checkout -b fix/issue-NUMBER
git push -u origin fix/issue-NUMBER
```

### Step 8.2: Create PR

```bash
gh pr create \
  --repo manuelturpin/ArtChiTech-framework \
  --title "Fix #NUMBER: [brief title]" \
  --body "## Summary

Fixes #NUMBER

## Changes

- [Change 1]
- [Change 2]

## Testing

- [ ] Tested locally
- [ ] All existing tests pass
- [ ] New test added for this issue

---
*Created via `/fix-issue` command*"
```

## Step 9: Display Completion

```
+-------------------------------------------------------------+
|  Fix Complete!                                              |
+-------------------------------------------------------------+
|                                                             |
|  Issue: #NUMBER - [title]                                   |
|  Status: Fix implemented                                    |
|                                                             |
|  Commit: [commit hash]                                      |
|  Branch: fix/issue-NUMBER                                   |
|  PR: https://github.com/.../pull/XX                         |
|                                                             |
|  When this PR is merged, issue #NUMBER will be              |
|  automatically closed by GitHub.                            |
|                                                             |
+-------------------------------------------------------------+

Next steps:
- Review the PR: [PR URL]
- Request reviews if needed
- Merge when approved
```

If no PR was created:
```
+-------------------------------------------------------------+
|  Fix Complete!                                              |
+-------------------------------------------------------------+
|                                                             |
|  Issue: #NUMBER - [title]                                   |
|  Status: Fix committed locally                              |
|                                                             |
|  Commit: [commit hash]                                      |
|                                                             |
|  To close the issue, push and create a PR:                  |
|    git push origin [branch]                                 |
|    gh pr create --title "Fix #NUMBER: [title]"              |
|                                                             |
+-------------------------------------------------------------+
```

## Error Handling

### Network Error

```
Failed to fetch issue #NUMBER.

Error: [error message]

Check your network connection and try again.
```

### No Permission to Create PR

```
Failed to create PR.

Error: [error message]

You may not have push access to this repository.

Fork the repo and create a PR from your fork:
https://github.com/manuelturpin/ArtChiTech-framework/fork
```

### Commit Failed

```
Failed to commit changes.

Error: [error message]

Check for uncommitted conflicts or staging issues.
```

### Tests Fail Persistently

If tests fail after 3 attempts:
```
Tests continue to fail after multiple attempts.

Error: [last error]

Options:
1. Continue anyway (not recommended)
2. Skip test requirement
3. Abort fix

Choice (1/2/3):
```

## Type-Specific Behavior

### Bug Fix

1. Prioritize reproducing the issue first
2. Write a failing test
3. Implement minimal fix
4. Verify no regressions

### Enhancement

1. Understand the enhancement request
2. Check if it aligns with project roadmap
3. Write tests for new behavior
4. Implement feature
5. Update documentation if needed

### Question

1. Identify the documentation gap
2. Update relevant docs
3. Consider adding FAQ entry
4. No test required
5. Commit as `docs:` instead of `fix:`

For questions, use:
```bash
git commit -m "docs: clarify [topic]

Addresses #NUMBER

- [Documentation changes]

Generated with [Claude Code](https://claude.com/claude-code)"
```

## Integration with /triage

When spawned from `/triage` with `fix N`:
- Skip argument validation (already provided)
- After completion, offer to return to triage:

```
Return to /triage to continue managing issues? (y/n)
```

If yes, spawn `/triage`.
