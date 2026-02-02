# SPEC: Context Engineering (3-File Pattern)

**Version:** 1.0
**Status:** Draft
**Date:** 2026-02-01

---

## 1. Résumé

Le Context Engineering est la fondation d'ACT v2.5. Il résout le problème fondamental :

> **Context Window = RAM** (volatile, limitée)
> **Filesystem = Disk** (persistant, illimité)

Sans persistance du contexte, l'agent perd sa compréhension du projet à chaque session.

---

## 2. Problème

### 2.1 Symptômes
- L'agent "oublie" les décisions prises
- Répétition des mêmes erreurs
- Confusion sur l'état du projet
- Impossibilité de reprendre après interruption

### 2.2 Cause Racine
Le contexte (objectifs, avancement, découvertes) n'existe que dans la conversation. Quand la conversation se termine ou le context window se remplit, tout est perdu.

---

## 3. Solution

### 3.1 Le 3-File Pattern

Trois fichiers markdown persistants qui maintiennent le contexte :

| Fichier | Rôle | Mise à jour |
|---------|------|-------------|
| `plan.md` | Phases, progression, décisions | À chaque transition de phase |
| `findings.md` | Recherches, découvertes | À chaque nouvelle découverte |
| `progress.md` | Log de session, résultats tests | Continu pendant l'exécution |

### 3.2 Fichiers Additionnels

| Fichier | Rôle |
|---------|------|
| `config.yaml` | Configuration du projet ACT |
| `state.md` | État courant rapide (phase, blocages) |

### 3.3 Structure Complète

```
project/
└── .act/
    ├── config.yaml      # Configuration ACT
    ├── state.md         # État courant (quick glance)
    ├── plan.md          # Phases et progression
    ├── findings.md      # Recherches et découvertes
    └── progress.md      # Log de session
```

---

## 4. Spécifications Détaillées

### 4.1 config.yaml

```yaml
# ACT Project Configuration
version: "2.5"
project:
  name: "project-name"
  type: "feature|product|refactor|bugfix"
  scale: "quick|full"

settings:
  auto_commit: true
  verification_required: true
  tdd_mode: "strict|relaxed|off"

context:
  refresh_on_tool_use: true
  session_recovery: true
```

### 4.2 state.md

Format minimaliste pour un "quick glance" :

```markdown
# ACT State

## Current
- **Phase:** 3/7 (Implementation)
- **Task:** Implementing user auth module
- **Blocker:** None

## Quick Stats
- Started: 2026-02-01 09:00
- Last Update: 2026-02-01 14:30
- Progress: 40%
```

### 4.3 plan.md

Inspiré de task_plan.md (Planning Files) :

```markdown
# Project Plan

## Goal
[Clear statement of what we're building]

## Phases

### Phase 1: Context [DONE]
- [x] Understand requirements
- [x] Review existing code

### Phase 2: Design [DONE]
- [x] Architecture decisions
- [x] API design

### Phase 3: Implementation [IN PROGRESS]
- [x] Task 3.1: Setup
- [ ] Task 3.2: Core logic ← CURRENT
- [ ] Task 3.3: Integration

### Phase 4: Verification [TODO]
- [ ] Tests pass
- [ ] Manual verification

## Decisions Log
| Date | Decision | Rationale |
|------|----------|-----------|
| 02-01 | Use PostgreSQL | Better for complex queries |
```

### 4.4 findings.md

Pour capturer les découvertes et la recherche :

```markdown
# Findings

## Research

### 2026-02-01: Authentication Patterns
- JWT preferred over sessions for API
- Found existing auth module in `lib/auth`
- Security considerations: [link]

## Discoveries

### Unexpected: Legacy Code Issues
- `old_auth.py` has SQL injection vulnerability
- Must refactor before proceeding

## References
- [Auth Best Practices](url)
- [Internal Wiki](url)
```

### 4.5 progress.md

Log chronologique de la session :

```markdown
# Session Progress

## 2026-02-01

### 09:00 - Session Start
- Loaded project context
- Current phase: Implementation

### 09:15 - Task 3.1
- Created auth module structure
- Tests: 5 passing

### 10:30 - Blocker Found
- Issue: Database schema mismatch
- Resolution: Updated migration

### 14:00 - Checkpoint
- Progress: 40%
- Next: Implement login endpoint
```

---

## 5. Session Recovery

### 5.1 Détection
Quand une nouvelle session démarre :
1. Vérifier si `.act/` existe
2. Si oui, lire `state.md` pour l'état courant
3. Afficher un "catchup report"

### 5.2 Catchup Report Format

```markdown
## 🔄 Session Recovery

**Project:** project-name
**Last Session:** 2026-02-01 14:30

**Current State:**
- Phase: 3/7 (Implementation)
- Task: Implementing login endpoint
- Progress: 40%

**Recent Findings:**
- Discovered legacy auth issues
- JWT pattern confirmed

**Next Steps:**
1. Complete login endpoint
2. Add tests
3. Move to verification
```

### 5.3 5-Question Reboot Test

L'agent doit pouvoir répondre à ces 5 questions après recovery :

| Question | Source |
|----------|--------|
| Où suis-je ? | `state.md` → current phase |
| Où vais-je ? | `plan.md` → remaining phases |
| Quel est l'objectif ? | `plan.md` → goal |
| Qu'ai-je appris ? | `findings.md` |
| Qu'ai-je fait ? | `progress.md` |

---

## 6. Context Handoff

### 6.1 Format /whats-next

Quand l'agent doit passer le relais :

```xml
<handoff>
  <original_task>Build user authentication</original_task>
  <work_completed>
    - Auth module structure created
    - JWT implementation done
    - 5/8 tests passing
  </work_completed>
  <work_remaining>
    - Login endpoint
    - Password reset
    - Session management
  </work_remaining>
  <attempted_approaches>
    - Tried session-based (abandoned: scaling issues)
    - JWT with refresh tokens (current)
  </attempted_approaches>
  <critical_context>
    - Must use existing User model
    - Legacy auth.py has vulnerabilities
  </critical_context>
  <current_state>
    - Phase: Implementation (3/7)
    - Blocker: None
    - Ready to continue
  </current_state>
</handoff>
```

---

## 7. Intégration avec Hooks

### 7.1 PreToolUse Hook
Avant chaque Write/Edit/Bash :
- Relire `state.md` pour refresh goals
- Vérifier cohérence avec plan

### 7.2 PostToolUse Hook  
Après chaque Write/Edit :
- Rappeler de mettre à jour `progress.md`
- Vérifier si changement de phase nécessaire

### 7.3 Stop Hook
Avant d'arrêter :
- Mettre à jour `state.md`
- Écrire summary dans `progress.md`
- Vérifier que l'état est récupérable

---

## 8. Commandes

### 8.1 /act:init
Initialise la structure `.act/` dans un projet.

### 8.2 /act:status
Affiche l'état courant (lit `state.md`).

### 8.3 /act:resume
Force une session recovery avec catchup report.

### 8.4 /act:handoff
Génère le format handoff pour passer le relais.

---

## 9. Migration depuis ACT v2

Les projets ACT v2 existants n'ont pas de `.act/`. La migration est automatique :
1. Détecter projet ACT sans `.act/`
2. Créer structure `.act/`
3. Remplir `plan.md` à partir du contexte
4. Initialiser les autres fichiers

---

## 10. Validation

### 10.1 Critères de Succès
- [x] Session recovery fonctionne après interruption
- [x] 5-Question Test réussi après reboot
- [x] Context handoff permet reprise par autre agent
- [x] Hooks maintiennent la cohérence

### 10.2 Tests
1. ✅ Démarrer projet → interrompre → reprendre
2. ✅ Vérifier que l'état est correct après recovery
3. ✅ Simuler handoff entre agents
4. ✅ Remplir context window → vérifier pas de perte

---

## Annexe A: Références

- Planning Files Framework
- GSD (Get Shit Done)
- Everything CC (Continuous Context)

---

*SPEC créée le 2026-02-01*
