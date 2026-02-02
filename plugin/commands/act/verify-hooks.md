# Command: /act:verify-hooks

## Purpose

Vérifie que la session respecte les hooks ACT et affiche un rapport de conformité.

---

## Syntax

```
/act:verify-hooks
```

---

## Execution Steps

### Step 1: Check ACT Project

```bash
if [ ! -d ".act" ]; then
  echo "❌ No ACT project found. Run /act:init first."
  exit 1
fi
```

### Step 2: Read Recent Activity

Check `.act/progress.md` for recent logged actions:

```
recent_actions = parse_progress_md(".act/progress.md")
count_logged = count(recent_actions in last 24h)
```

### Step 3: Verify PreToolUse Compliance

Check if actions are aligned with plan:

```
plan_phase = get_current_phase(".act/state.md")
recent_files = get_modified_files(git status)
alignment = check_files_vs_phase(recent_files, plan_phase)
```

### Step 4: Verify PostToolUse Compliance

Check if modifications are logged:

```
git_changes = get_recent_commits()
progress_entries = get_progress_entries()
logged_ratio = match_commits_to_entries(git_changes, progress_entries)
```

### Step 5: Verify Stop Hook Readiness

Check completion requirements:

```
plan_phases = parse_plan(".act/plan.md")
completed_phases = count([p for p in plan_phases if p.completed])
evidence_count = verify_evidence(plan_phases)
```

---

## Output Format

```markdown
## 🔄 Hook Compliance Check

**Project:** [project name]
**Date:** [current date/time]

### Hook Status

| Hook | Status | Details |
|------|--------|---------|
| PreToolUse | ✅/⚠️/❌ | [status detail] |
| PostToolUse | ✅/⚠️/❌ | [status detail] |
| Stop | ✅/⚠️/❌ | [status detail] |

### Recent Actions (last 24h)

| Time | Action | Logged |
|------|--------|--------|
| HH:MM | [action description] | ✅/❌ |
| HH:MM | [action description] | ✅/❌ |

### Logging Ratio
- **Actions taken:** X
- **Actions logged:** Y
- **Compliance:** Y/X (Z%)

### Stop Hook Readiness

| Phase | Evidence | Status |
|-------|----------|--------|
| 1. Discovery | findings.md | ✅ |
| 2. Strategy | plan approved | ✅ |
| 3. Design | specs written | ✅ |
| 4. Development | code + tests | ⚠️ (tests pending) |

**Ready to declare complete:** ✅ Yes / ❌ No

### Recommendations

- [Recommendation 1]
- [Recommendation 2]
```

---

## Status Definitions

### PreToolUse Status

| Status | Meaning |
|--------|---------|
| ✅ Active | Plan refreshed recently, actions aligned |
| ⚠️ Warning | Some actions may be misaligned |
| ❌ Inactive | Plan not read, actions not checked |

### PostToolUse Status

| Status | Meaning |
|--------|---------|
| ✅ Active | >80% actions logged |
| ⚠️ Warning | 50-80% actions logged |
| ❌ Inactive | <50% actions logged |

### Stop Status

| Status | Meaning |
|--------|---------|
| ✅ Ready | All phases have evidence |
| ⚠️ Partial | Some phases missing evidence |
| ❌ Not Ready | Many phases incomplete |

---

## Examples

### Example 1: Good Compliance

```markdown
## 🔄 Hook Compliance Check

**Project:** auth-module
**Date:** 2026-02-02 21:30

### Hook Status

| Hook | Status | Details |
|------|--------|---------|
| PreToolUse | ✅ Active | Plan refreshed 5min ago |
| PostToolUse | ✅ Active | 8/8 actions logged |
| Stop | ⚠️ Partial | 3/5 phases complete |

### Logging Ratio
- **Actions taken:** 8
- **Actions logged:** 8
- **Compliance:** 100%

### Recommendations

- Complete Phase 4 (Development) tests
- Run verification before declaring complete
```

### Example 2: Poor Compliance

```markdown
## 🔄 Hook Compliance Check

**Project:** my-project
**Date:** 2026-02-02 21:30

### Hook Status

| Hook | Status | Details |
|------|--------|---------|
| PreToolUse | ❌ Inactive | Plan not read in session |
| PostToolUse | ⚠️ Warning | 3/10 actions logged |
| Stop | ❌ Not Ready | 1/5 phases complete |

### Logging Ratio
- **Actions taken:** 10
- **Actions logged:** 3
- **Compliance:** 30%

### Recommendations

- Read .act/plan.md to refresh context
- Log recent actions to progress.md
- Complete more phases before declaring done
```

---

## Related Commands

| Command | Description |
|---------|-------------|
| `/act:status` | View current project state |
| `/act:resume` | Recover from previous session |
| `/act:where-am-i` | Quick 5-question context check |

---

*Command version: 1.0*
*ACT version: 2.5*
