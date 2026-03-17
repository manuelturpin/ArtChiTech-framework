# Skill: Context Engineering

**Type:** Flexible

> **Self-Announcement:** When using this skill, announce: "Using Context Engineering skill to maintain persistent project context across sessions."

> **"Context Window = RAM, Filesystem = Disk"**

## Purpose

Maintenir le contexte du projet de manière persistante à travers les sessions. Sans cette skill, l'agent "oublie" les décisions, l'avancement, et les découvertes.

---

## The 3-File Pattern

### Core Files

| Fichier | Rôle | Quand mettre à jour |
|---------|------|---------------------|
| `plan.md` | Phases, progression, décisions | À chaque transition de phase |
| `findings.md` | Recherches, découvertes | À chaque nouvelle découverte |
| `progress.md` | Log de session, résultats | Continu pendant l'exécution |

### Support Files

| Fichier | Rôle |
|---------|------|
| `config.yaml` | Configuration du projet |
| `state.md` | État courant (quick glance) |

---

## Directory Structure

```
project/
└── .act/
    ├── config.yaml      # Configuration ACT
    ├── state.md         # État courant rapide
    ├── plan.md          # Phases et progression
    ├── findings.md      # Recherches et découvertes
    └── progress.md      # Log de session
```

---

## Usage Patterns

### 1. Session Start (Recovery)

```markdown
## Checklist de reprise

1. Lire `.act/state.md` → Où en suis-je ?
2. Lire `.act/plan.md` → Que reste-t-il à faire ?
3. Lire `.act/findings.md` → Qu'ai-je appris ?
4. Scanner `.act/progress.md` → Dernières actions ?
5. Générer un "Catchup Report"
```

### 2. During Work

```markdown
## Pendant l'exécution

- [ ] Après chaque milestone → Mettre à jour `state.md`
- [ ] Après chaque découverte → Ajouter à `findings.md`
- [ ] Toutes les ~30min → Checkpoint dans `progress.md`
- [ ] Après changement de phase → Mettre à jour `plan.md`
```

### 3. Session End

```markdown
## Avant de terminer

1. Mettre à jour `state.md` avec l'état final
2. Ajouter summary à `progress.md`
3. Vérifier que le contexte est récupérable
```

---

## 5-Question Reboot Test

Pour vérifier que le contexte est récupérable, répondre à :

| Question | Source | Status |
|----------|--------|--------|
| Où suis-je ? | `state.md` → current phase | ✓ |
| Où vais-je ? | `plan.md` → remaining phases | ✓ |
| Quel est l'objectif ? | `plan.md` → goal | ✓ |
| Qu'ai-je appris ? | `findings.md` | ✓ |
| Qu'ai-je fait ? | `progress.md` | ✓ |

Si une question est sans réponse, le contexte n'est pas complet.

---

## Session Recovery Protocol

### Detection
```
IF .act/ exists AND state.md has content THEN
  → Session recovery needed
  → Generate catchup report
```

### Catchup Report Format

```markdown
## 🔄 Session Recovery

**Project:** [name]
**Last Session:** [date/time]

**Current State:**
- Phase: X/Y ([phase name])
- Task: [current task]
- Progress: XX%

**Recent Findings:**
- [key finding 1]
- [key finding 2]

**Next Steps:**
1. [immediate next action]
2. [following action]
```

---

## Context Handoff

Quand il faut passer le relais (context full, timeout, etc.) :

```xml
<handoff>
  <original_task>...</original_task>
  <work_completed>
    - ...
  </work_completed>
  <work_remaining>
    - ...
  </work_remaining>
  <attempted_approaches>
    - ...
  </attempted_approaches>
  <critical_context>
    - ...
  </critical_context>
  <current_state>
    - Phase: ...
    - Blocker: ...
  </current_state>
</handoff>
```

---

## Velocity & Time Estimation

### How Velocity is Calculated

ACT tracks work velocity to provide time estimates for remaining phases.

#### Data Collection

```
For each session in .act/history/:
  - start_time: extracted from filename or content
  - end_time: last update timestamp
  - phase_at_start: phase when session started
  - phase_at_end: phase when session ended
```

#### Metrics

| Metric | Formula |
|--------|---------|
| Sessions count | `count(.act/history/*.md)` |
| Total duration | `sum(session_end - session_start)` |
| Avg session duration | `total_duration / sessions_count` |
| Phases completed | `current_phase - 1` |
| Avg phase duration | `total_duration / phases_completed` |
| Estimated remaining | `(total_phases - current_phase + 1) × avg_phase_duration` |

#### Confidence Levels

| Data Points | Confidence | Note |
|-------------|------------|------|
| 1-2 sessions | Low | Rough estimate, high variance |
| 3-5 sessions | Medium | Reasonable estimate |
| 6+ sessions | High | Reliable, ±20% accuracy |

#### Example Calculation

```
Given:
- Total sessions: 4
- Total time invested: 10h
- Current phase: 3/5

Calculations:
- Avg session duration = 10h / 4 = 2.5h
- Phases completed = 2 (phases 1 and 2)
- Avg phase duration = 10h / 2 = 5h
- Remaining phases = 5 - 3 + 1 = 3
- Estimated remaining = 3 × 5h = 15h

Estimate: ~15h (6 sessions at 2.5h each)
```

#### Display in state.md

```markdown
## Velocity
- Sessions completed: 4
- Average session duration: 2.5h
- Phases completed: 2/5
- Estimated remaining: ~15h
```

### Best Practices for Accurate Estimation

1. **End sessions cleanly** — Use Stop hook to save session data
2. **Work in focused sessions** — Short, focused sessions give better data
3. **Don't inflate sessions** — Break if stepping away for >30min
4. **Update progress regularly** — More data points = better estimates

---

## Best Practices

### DO ✅
- Mettre à jour les fichiers en temps réel
- Être spécifique dans les descriptions
- Logger les décisions ET leur rationale
- Faire des checkpoints réguliers
- **Toujours inclure un timestamp**

### DON'T ❌
- Attendre la fin pour tout écrire (risque de perte)
- Écrire des logs vagues ("worked on stuff")
- Oublier de mettre à jour state.md
- Ignorer les discoveries (findings.md)
- **Omettre les timestamps dans progress.md**

---

## ⏰ Timestamp Format (OBLIGATOIRE)

**Tous les logs dans progress.md DOIVENT inclure un timestamp.**

### Format Standard
```
[YYYY-MM-DD HH:mm] Action description
```

### Exemples
```markdown
### [2026-02-01 14:30] Created User model
- **File(s):** src/models/user.py
- **Change:** Added User class with fields

### [2026-02-01 15:15] Fixed validation bug
- **File(s):** src/validators/user.py
- **Change:** Email format validation added

### [2026-02-01 16:00] Phase 2 complete
- **Progress:** 40%
- **Next:** Start API implementation
```

### Pourquoi les timestamps ?
1. **Chronologie** - Savoir l'ordre des actions
2. **Durée** - Estimer le temps passé par tâche
3. **Debug** - Corréler avec des logs système si besoin
4. **Handoff** - Contexte temporel pour le prochain agent

---

## Integration with Hooks

Cette skill est renforcée par les hooks :

| Hook | Action |
|------|--------|
| PreToolUse | Relire `state.md` pour refresh goals |
| PostToolUse | Rappeler de mettre à jour `progress.md` |
| Stop | Vérifier que l'état est récupérable |

---

## Local Hooks

### Why Local Hooks?

Certains projets ont des besoins spécifiques que les hooks framework ne couvrent pas :
- Fichiers de contexte additionnels à lire
- Hooks personnalisés pour des workflows spécifiques
- Désactivation temporaire de certains hooks

### When to Use Local Hooks

| Situation | Solution |
|-----------|----------|
| Fichier de contexte supplémentaire | Override `PreToolUse.config.additionalFiles` |
| Workflow de déploiement custom | Créer un hook `PreDeploy` |
| Itérations rapides (prototype) | Désactiver `PostToolUse` temporairement |
| Documentation API obligatoire | Hook custom `PostAPIChange` |

### Setup

```bash
/act:init --with-hooks
```

Ou créer manuellement `.act/hooks.json` :

```json
{
  "extends": "framework",
  "hooks": {},
  "overrides": {}
}
```

### Examples

#### Ajouter un fichier de contexte

```json
{
  "extends": "framework",
  "overrides": {
    "PreToolUse": {
      "config": {
        "additionalFiles": ["docs/API.md", ".act/domain-context.md"]
      }
    }
  }
}
```

#### Hook de validation pre-commit

```json
{
  "extends": "framework",
  "hooks": {
    "PreCommit": {
      "enabled": true,
      "triggers": ["commit", "push"],
      "action": "validate_changes",
      "config": {
        "requireTests": true,
        "requireDocs": false
      }
    }
  }
}
```

#### Mode prototype (hooks allégés)

```json
{
  "extends": "framework",
  "overrides": {
    "PostToolUse": { "enabled": false },
    "Stop": { 
      "config": { "requireEvidence": false }
    }
  }
}
```

### Best Practices

- **Toujours utiliser `extends: "framework"`** pour garder les protections de base
- **Documenter les raisons** des overrides dans le JSON (`description` field)
- **Réactiver les hooks** une fois le prototype validé
- **Ne jamais désactiver Stop** en production sans bonne raison

---

## Commands

| Command | Description |
|---------|-------------|
| `/act:init` | Initialiser .act/ dans un projet |
| `/act:status` | Afficher l'état courant |
| `/act:resume` | Forcer une session recovery |
| `/act:handoff` | Générer un handoff complet |

---

## Examples

### Example: Update state.md after completing a task

```markdown
# ACT State

## Current
- **Phase:** 3/5 (Implementation)
- **Task:** ~~3.2 - Core logic~~ DONE → 3.3 - Integration
- **Blocker:** None

## Quick Stats
- **Started:** 2026-02-01
- **Last Update:** 2026-02-01 14:30
- **Progress:** 60%

## Next Action
Integrate auth module with user service.
```

### Example: Log a finding

```markdown
## Discoveries

### Unexpected: API Rate Limiting
- External API has undocumented rate limit of 100/min
- Must implement backoff strategy
- Added to findings: 2026-02-01 11:45
```

---

*Skill version: 1.0*
*Compatible with: ACT v2.5+*
