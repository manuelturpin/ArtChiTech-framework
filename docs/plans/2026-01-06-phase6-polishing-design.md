# Phase 6 - Polishing - Design

> Design validated on 2026-01-06

## Objective

Validate ACT on real projects before public release v1.2.0, with integrated feedback system.

## Decisions

| Decision | Choice |
|----------|--------|
| Feedback mechanism | `/feedback` command + GitHub Issues |
| Capture level | Standard (state, version, phase, stack, last command) |
| Auto-labels | Type (bug/enhancement/question) + Priority (critical/high/medium/low) |
| Project types | Multi-types basic: Webapp, API, CLI |
| User testing | Progressive: new project first, then existing |
| Test results | VALIDATION-REPORT.md + GitHub Issues for critical bugs |

## Deliverables

### 1. Enhanced install.sh

- Check Python 3.8+, Git, Claude Code installed
- Check superpowers plugin installed
- Check permissions ~/.claude/plugins/
- Clear error messages if prerequisite missing
- Post-install verification message

### 2. Command /feedback

**Flow:**
1. Ask problem type (Bug/Suggestion/Question)
2. Ask description
3. Auto-capture context (Standard level):
   - ACT version
   - Current phase
   - Mode (COMPLET/FEATURE/QUICK)
   - Detected stack
   - Last command executed
   - state.json extract (no sensitive data)
4. Auto-assign labels (type + priority)
5. Create GitHub Issue via `gh issue create`
6. Display issue link

**Priority detection:**
- Crash/blocking → `priority:critical`
- Broken functionality → `priority:high`
- Degraded → `priority:medium`
- Cosmetic → `priority:low`

### 3. Command /triage

**Purpose:** Maintainer view of open issues

**Display:**
```
📋 Open Issues (5)

🔴 #12 [critical] Crash on /next command
🟠 #11 [high] Score not updated after phase
🟡 #10 [medium] Typo in help message
🔵 #9  [low] Add dark mode suggestion
❓ #8  [question] How to reset project?

Actions: [1] Fix issue  [2] Assign  [3] Close
```

**Features:**
- List issues sorted by priority
- Filter by type/priority
- Batch actions (assign, close, fix)

### 4. Command /fix-issue <number>

**Flow:**
1. Read GitHub issue (captured context)
2. Reproduce environment if possible
3. Analyze and propose diagnosis
4. Generate fix plan (TDD)
5. Implement with tests
6. Create PR linked to issue
7. Auto-close issue when PR merged

### 5. Validation Tests

**Claude Tests (automated):**

| Type | Project | Tests |
|------|---------|-------|
| Webapp | React/TypeScript/Vite | /project → /onboard → phases 1-4, all commands |
| API | Node/Express | /project → /onboard → API-specific scoring |
| CLI | Python/Click | /project → /onboard → CLI-specific scoring, QUICK mode |

**User Tests (progressive):**

| Step | Description |
|------|-------------|
| 1 | New guided project (webapp starter) |
| 2 | Existing project (user's choice) |

### 6. Deliverable Files

- `VALIDATION-REPORT.md` - Complete test results
- GitHub Issues - Auto-created for critical bugs
- Starter project - Ready for user testing

## Workflow

```
install.sh → Claude Tests → User Tests → /feedback
     ↓
/triage → /fix-issue → PR → Auto-close → v1.2.0
```

## Success Criteria

- 3 project types validated (Webapp, API, CLI)
- User manual tests pass
- Issue pipeline functional
- Zero critical bugs open
- Tag v1.2.0 ready
