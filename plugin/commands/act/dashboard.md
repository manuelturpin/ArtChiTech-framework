# Command: /act:dashboard

## Purpose
Vue d'ensemble ASCII de tous les projets enregistrés avec phases, scoring, timeline et alertes.

---

## Syntax

```
/act:dashboard [--compact] [--alerts-only]
```

### Options

| Option | Description | Default |
|--------|-------------|---------|
| (none) | Dashboard complet | - |
| `--compact` | Version condensée (une ligne par projet) | false |
| `--alerts-only` | Affiche uniquement les projets avec blockers/alertes | false |

---

## Usage Examples

```bash
# Dashboard complet
/act:dashboard

# Vue rapide
/act:dashboard --compact

# Voir uniquement les problèmes
/act:dashboard --alerts-only
```

---

## Output Format

### Full Dashboard

```markdown
╔══════════════════════════════════════════════════════════════════════╗
║                    🎯 ACT DASHBOARD — 4 Projects                    ║
╠══════════════════════════════════════════════════════════════════════╣
║                                                                      ║
║  📦 act-framework                                    🔄 Active       ║
║  ├── Phase: [████████████░░░░░░░░] 4/7 Development   55%            ║
║  ├── Last:  2h ago                                                   ║
║  └── Next:  Implement multi-project CLI commands                     ║
║                                                                      ║
║  📦 pocket-watch-ai                                  ⏸️ Paused       ║
║  ├── Phase: [██████░░░░░░░░░░░░░] 2/7 Strategy       30%            ║
║  ├── Last:  3d ago                                                   ║
║  └── Next:  Define MVP scope and technical stack                     ║
║                                                                      ║
║  📦 archi-bot                                        🔄 Active       ║
║  ├── Phase: [██████████████████░] 6/7 Launch          90%            ║
║  ├── Last:  1d ago                                                   ║
║  └── Next:  Deploy v2.1 to production                                ║
║                                                                      ║
║  📦 bonsai-tracker                                   ⚠️ Blocked      ║
║  ├── Phase: [███████████████░░░░] 5/7 Quality         75%            ║
║  ├── Last:  5d ago                                                   ║
║  ├── Next:  Fix failing integration tests                            ║
║  └── ⚠️ BLOCKER: Database migration conflict                         ║
║                                                                      ║
╠══════════════════════════════════════════════════════════════════════╣
║  Summary: 2 active | 1 paused | 1 blocked                           ║
║  Current: act-framework                                              ║
║  💡 /act:switch <name> to change context                             ║
╚══════════════════════════════════════════════════════════════════════╝
```

### Compact Dashboard

```markdown
## 📊 ACT Dashboard (Compact)

| Project | Phase | Progress | Status | Last Active |
|---------|-------|----------|--------|-------------|
| **→ act-framework** | 4/7 Dev | ████░░ 55% | 🔄 | 2h |
| pocket-watch-ai | 2/7 Str | ██░░░░ 30% | ⏸️ | 3d |
| archi-bot | 6/7 Lau | █████░ 90% | 🔄 | 1d |
| bonsai-tracker | 5/7 Qal | ████░░ 75% | ⚠️ | 5d |

→ = current project | 🔄 active | ⏸️ paused | ⚠️ blocked
```

### Alerts Only

```markdown
## ⚠️ ACT Alerts

### bonsai-tracker
- **Phase:** 5/7 Quality (75%)
- **Blocker:** Database migration conflict
- **Stale:** Last active 5 days ago
- **Action:** Resolve migration, then `/act:switch bonsai-tracker`

### pocket-watch-ai
- **Phase:** 2/7 Strategy (30%)
- **Stale:** Last active 3 days ago — no blocker, just paused
```

---

## Execution Steps

### Step 1: Load Registry

```
registry = load(~/.act/projects.yaml)
IF registry.projects is empty:
  Display: "No projects registered. Use /act:projects --register <path>"
  RETURN
```

### Step 2: Collect Project States

```
FOR each project in registry.projects:
  act_dir = project.path + "/.act/"

  IF exists(act_dir):
    state = parse(act_dir + "state.md")
    config = parse(act_dir + "config.yaml")
    plan = parse(act_dir + "plan.md")

    project.phase = state.current_phase
    project.phase_name = state.phase_name
    project.progress = state.progress
    project.last_active = max(mtime(state.md), mtime(progress.md))
    project.next_task = extract_next_unchecked(plan)
    project.blockers = extract_blockers(state)

    # Determine status
    IF project.blockers:
      project.status = "blocked"
    ELSE IF time_since(project.last_active) > 3 days:
      project.status = "paused"
    ELSE:
      project.status = "active"
  ELSE:
    project.status = "missing"
```

### Step 3: Generate Progress Bars

```
FUNCTION progress_bar(percentage, width=20):
  filled = round(percentage / 100 * width)
  empty = width - filled
  RETURN "█" * filled + "░" * empty
```

### Step 4: Render Dashboard

Sort projects: active first, then paused, then blocked. Highlight current project with `→` or `**bold**`.

---

## Status Definitions

| Status | Icon | Criteria |
|--------|------|----------|
| Active | 🔄 | Updated within 3 days, no blockers |
| Paused | ⏸️ | No updates for >3 days, no blockers |
| Blocked | ⚠️ | Has active blockers in state.md |
| Missing | ❌ | .act/ directory not found |

---

## Integration

### Auto-refresh
Dashboard reads live state from each project's `.act/` directory — always up-to-date.

### With /act:switch
Click/type project name to switch: `/act:switch <name>`

### With /act:status
Dashboard is the multi-project view. `/act:status` is the single-project detail view.

### With Alerts
Blockers and stale projects are surfaced automatically.

---

## Related Commands

| Command | Description |
|---------|-------------|
| `/act:projects` | Manage project registry |
| `/act:switch` | Switch to a project |
| `/act:status` | Single project status |

---

*Command version: 1.0*
*ACT version: 3.0*
