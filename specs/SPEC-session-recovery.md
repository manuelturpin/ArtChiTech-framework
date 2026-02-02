# SPEC: Session Recovery

**Version:** 1.0.0
**Status:** Draft
**Phase:** 3.6

---

## Overview

Session Recovery permet à ACT de détecter une session précédente et de générer un rapport de rattrapage pour reprendre le travail efficacement après un reset de contexte.

## Motivation

Les sessions Claude ont un contexte limité (context window). Quand le contexte se remplit ou après un reset, l'agent perd toute connaissance du travail en cours. Session Recovery résout ce problème en :

1. Détectant les sessions précédentes via `.act/`
2. Analysant l'état et la progression
3. Générant un rapport de rattrapage concis

## Source

- **Planning Files** : Pattern "Session Recovery" (analyse phase 2b)
- **SYNTHESIS.md** : Tier 1, Pattern #7

## Design

### Détection

La détection se fait en vérifiant l'existence et le contenu du dossier `.act/` :

```
.act/
├── config.yaml    # Configuration du projet
├── state.md       # État courant (phase, progression)
├── plan.md        # Plan d'implémentation
├── findings.md    # Découvertes et décisions
└── progress.md    # Log des sessions précédentes
```

### Fichiers Clés

| Fichier | Information | Usage |
|---------|-------------|-------|
| `state.md` | Phase actuelle, progression %, blockers | Statut rapide |
| `progress.md` | Log des sessions, commits | Historique détaillé |
| `plan.md` | Phases et tâches | Prochaines étapes |

### Catchup Report Format

```markdown
## 🔄 Session Recovery

**Projet :** [project name from config.yaml]
**Dernière session :** [last update from state.md]
**Phase actuelle :** [current phase from state.md]
**Progression :** [progress % from state.md]

### Dernières actions
- [action 1 from progress.md]
- [action 2 from progress.md]
- [action 3 from progress.md]

### Prochaines étapes
- [next step 1 from plan.md]
- [next step 2 from plan.md]

### Contexte critique
[Any blockers or important findings from state.md and findings.md]
```

## Workflow

```
Session Start
     │
     ▼
┌─────────────┐
│ .act/ exist?│
└──────┬──────┘
       │
   Yes │ No
       │  └──► Normal flow (no recovery needed)
       ▼
┌─────────────┐
│ Read files  │
│ state.md    │
│ progress.md │
│ plan.md     │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│ Generate    │
│ Catchup     │
│ Report      │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│ Display to  │
│ User        │
└──────┬──────┘
       │
       ▼
   Continue Work
```

## 5-Question Reboot Test

Session Recovery répond aux 5 questions essentielles (from Planning Files) :

| Question | Answer Source |
|----------|---------------|
| **Where am I?** | Current phase in state.md |
| **Where am I going?** | Remaining phases in plan.md |
| **What's the goal?** | Goal statement in config.yaml |
| **What have I learned?** | findings.md |
| **What have I done?** | progress.md |

## Commands

### `/act:resume`

Trigger session recovery manually.

**Usage:**
```
/act:resume
```

**Behavior:**
1. Detect existing session
2. Generate catchup report
3. Display to user
4. Ready to continue

## Integration Points

### With Hooks

- **Stop Hook** should ensure `.act/` files are up-to-date before session ends
- **PostToolUse Hook** keeps progress.md current

### With Context Engineering

Session Recovery depends on the 3-File Pattern:
- state.md = quick status
- progress.md = detailed history
- plan.md = roadmap

### With Scale-Adaptive

Recovery works in both modes:
- **Quick Mode**: Simplified report (phase + immediate next)
- **Full Mode**: Complete report with all sections

## Implementation

### Detection Logic

```python
def detect_session():
    """Check if a previous session exists."""
    if not exists('.act/'):
        return None
    
    state = read('.act/state.md')
    progress = read('.act/progress.md')
    plan = read('.act/plan.md')
    config = read('.act/config.yaml')
    
    return {
        'project': config.project_name,
        'phase': state.current_phase,
        'progress': state.progress_percent,
        'last_update': state.last_update,
        'recent_actions': progress.last_n_entries(5),
        'next_steps': plan.next_incomplete_tasks(3),
        'blockers': state.blockers
    }
```

### Report Generation

```python
def generate_catchup_report(session_data):
    """Generate a catchup report from session data."""
    report = f"""## 🔄 Session Recovery

**Projet :** {session_data.project}
**Dernière session :** {session_data.last_update}
**Phase actuelle :** {session_data.phase}
**Progression :** {session_data.progress}%

### Dernières actions
{format_list(session_data.recent_actions)}

### Prochaines étapes
{format_list(session_data.next_steps)}
"""
    
    if session_data.blockers:
        report += f"""
### ⚠️ Blockers
{format_list(session_data.blockers)}
"""
    
    return report
```

## Success Metrics

| Metric | Target |
|--------|--------|
| Recovery time | < 30 seconds |
| Report accuracy | 100% (matches .act/ files) |
| User understanding | Can resume work immediately |

## Risks & Mitigations

| Risk | Mitigation |
|------|------------|
| Stale .act/ files | PostToolUse hook keeps files current |
| Missing files | Graceful degradation (report what's available) |
| Conflicting state | Show warning, defer to state.md |

## Related Specs

- SPEC-context-engineering.md (3.1)
- SPEC-hooks-system.md (3.2)

---

## Acceptance Criteria
- [x] Skill session-recovery créé
- [x] Command /act:resume documentée
- [x] Catchup report format défini
- [x] 5-Question Reboot Test intégré
- [x] Section dans CLAUDE.md

---

*Specification for ACT v2.5 Session Recovery*
