# Command: /act:status

## Purpose
Affiche l'état courant du projet ACT, incluant la phase actuelle, la progression, et l'estimation du temps restant basée sur la vélocité observée.

---

## Syntax

```
/act:status [--verbose] [--velocity]
```

### Options

| Option | Description | Default |
|--------|-------------|---------|
| `--verbose` | Affiche toutes les informations détaillées | false |
| `--velocity` | Affiche uniquement les métriques de vélocité | false |

---

## Usage Examples

```bash
# Status rapide
/act:status

# Status détaillé avec toutes les métriques
/act:status --verbose

# Uniquement vélocité et estimations
/act:status --velocity
```

---

## Output Format

### Standard Output

```markdown
## 📊 ACT Status

**Project:** auth-module
**Phase:** 3/5 (Implementation)
**Progress:** 60%

### Current Task
Building login endpoint with JWT validation

### Blockers
None

### Next Steps
1. Complete login endpoint
2. Add password reset flow

### Velocity
- Sessions completed: 4
- Avg session duration: 2.5h
- Estimated remaining: ~5h (2 sessions)
```

### Verbose Output

```markdown
## 📊 ACT Status (Detailed)

**Project:** auth-module
**Type:** feature
**Scale:** full
**Started:** 2026-02-01

---

### Phase Progress
| Phase | Status | Duration |
|-------|--------|----------|
| 1. Context | ✅ Done | 1h |
| 2. Strategy | ✅ Done | 2h |
| 3. Implementation | 🔄 In Progress | 4h |
| 4. Quality | ⏳ Pending | - |
| 5. Launch | ⏳ Pending | - |

---

### Current State
- **Phase:** 3/5 (Implementation)
- **Task:** Building login endpoint
- **Progress:** 60%
- **Blocker:** None
- **Last Update:** 2026-02-02 09:30

---

### Velocity Metrics
- **Sessions completed:** 4
- **Total time:** 10h
- **Average session duration:** 2.5h
- **Phases completed:** 2/5
- **Average phase duration:** 3.5h
- **Estimated remaining:** ~5h (2 sessions)

---

### Recent Findings
- JWT preferred over sessions
- API rate limit: 100/min
- Legacy auth deprecated

---

### Recent Commits
- `abc1234`: feat: Add login endpoint
- `def5678`: test: Add auth tests
```

### Velocity-Only Output

```markdown
## ⏱️ Velocity Report

**Project:** auth-module

| Metric | Value |
|--------|-------|
| Sessions completed | 4 |
| Total time invested | 10h |
| Avg session duration | 2.5h |
| Phases completed | 2/5 |
| Avg phase duration | 3.5h |

### Estimation
- **Remaining phases:** 3
- **Estimated time:** ~10.5h
- **Estimated sessions:** ~4-5

### Trend
📈 Velocity increasing (+15% vs first half)
```

---

## Velocity Calculation

### Data Sources

```
sessions_count = count(.act/history/*.md)
total_duration = sum(session.end_time - session.start_time)
avg_session_duration = total_duration / sessions_count

phases_done = current_phase - 1
phases_total = total_phases (from plan.md)
avg_phase_duration = total_duration / phases_done

remaining_phases = phases_total - current_phase + 1
estimate = remaining_phases * avg_phase_duration
```

### Calculation Formula

```
Estimated Remaining = (Total Phases - Completed Phases) × Avg Phase Duration

Where:
- Avg Phase Duration = Total Time Invested ÷ Phases Completed
- Confidence increases with more data points (sessions > 3)
```

### Confidence Levels

| Sessions | Confidence | Display |
|----------|------------|---------|
| 1-2 | Low | "~Xh (rough estimate)" |
| 3-5 | Medium | "~Xh" |
| 6+ | High | "~Xh (±20%)" |

---

## Execution Steps

### Step 1: Load State

```
state = load(.act/state.md)
plan = load(.act/plan.md)
config = load(.act/config.yaml)
```

### Step 2: Calculate Velocity

```
history_files = list(.act/history/*.md)
sessions_count = len(history_files)

IF sessions_count >= 1 THEN
  total_duration = calculate_total_duration(history_files)
  phases_done = extract_phases_done(state)
  avg_phase_duration = total_duration / phases_done (if phases_done > 0)
  remaining = (total_phases - phases_done) * avg_phase_duration
```

### Step 3: Generate Output

```
IF --velocity THEN
  output_velocity_only()
ELSE IF --verbose THEN
  output_verbose()
ELSE
  output_standard()
```

---

## Integration

### With state.md

Le status lit directement depuis `state.md` :
- Phase courante
- Tâche active
- Blockers
- Progression

### With Session History

Utilise `.act/history/` pour calculer :
- Nombre de sessions
- Durée moyenne
- Vélocité

### With plan.md

Extrait depuis `plan.md` :
- Total des phases
- Objectif du projet
- Décisions récentes

---

## Related Commands

| Command | Description |
|---------|-------------|
| `/act:resume` | Recover from previous session |
| `/act:diff` | Show changes since last session |
| `/act:history` | List past sessions |

---

*Command version: 1.0*
*ACT version: 2.5*
