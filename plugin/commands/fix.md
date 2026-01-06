---
name: fix
description: List and fix priority errors in the project
argument-hint: [error-id]
---

# /fix - Error Correction

You help fix problems blocking project progress.

## Without Argument: List Problems

Analyze the project using the `phase-scoring` skill and list problems by priority:

```
╭─────────────────────────────────────────────────────────────╮
│  🔧 Problems Detected                                       │
│                                                             │
│  Phase: [phase-name] - Score: [score]%                      │
│                                                             │
│  🔴 Critical (block /next):                                 │
│  [1] Missing tests - coverage < 60%                         │
│  [2] CI/CD not configured                                   │
│                                                             │
│  🟡 Important:                                              │
│  [3] Incomplete API documentation                           │
│  [4] No error handling                                      │
│                                                             │
│  🟢 Suggestions:                                            │
│  [5] Add TypeScript strict mode                             │
│                                                             │
│  Type /fix [number] to fix a problem.                       │
╰─────────────────────────────────────────────────────────────╯
```

## With Argument: Fix the Problem

`/fix 1` → Focus on problem #1

Depending on the problem type:

### Code Problem
Use `superpowers:systematic-debugging` to analyze and fix.

### Test Problem
Use `superpowers:test-driven-development` to add tests.

### Documentation Problem
Guide the user to create the missing documentation.

### Configuration Problem
Guide the user step by step (CI/CD, linting, etc.).

## Problem Detection

For each phase, check for missing criteria:

### Phase 1 - Discovery
- README missing or incomplete → 🔴 Critical
- No problem definition → 🔴 Critical
- No personas → 🟡 Important

### Phase 2 - Strategy
- No roadmap → 🔴 Critical
- Business model not defined → 🟡 Important
- Missing KPIs → 🟢 Suggestion

### Phase 3 - Design
- No architecture doc → 🔴 Critical
- Technical specs missing → 🟡 Important
- UI mockups missing → 🟢 Suggestion

### Phase 4 - Development
- No tests → 🔴 Critical
- CI/CD not configured → 🔴 Critical
- Undocumented code → 🟡 Important

### Phase 5 - Quality
- Coverage < 60% → 🔴 Critical
- Critical bugs open → 🔴 Critical
- Linting errors → 🟡 Important

### Phase 6 - Launch
- Not deployed → 🔴 Critical
- No monitoring → 🟡 Important
- User doc missing → 🟡 Important

### Phase 7 - Growth
- No analytics → 🔴 Critical
- No feedback loop → 🟡 Important
- No changelog → 🟢 Suggestion

## After Correction

Recalculate the phase score and display:
```
✅ Problem fixed!
📊 New phase [name] score: [new-score]%
[If score >= 70] 💡 You can now use /next
```

## If No Problems

```
✅ No problems detected. Everything is green!

💡 Continue with /next to move forward
```
