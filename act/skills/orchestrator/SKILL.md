---
name: orchestrator
description: Multi-project orchestration and cross-project coordination for complex initiatives
---

# Skill: Multi-Project Orchestrator

**Version:** 1.0.0
**Category:** Project Management
**New in:** ACT v3.0
**Type:** Flexible

> **Self-Announcement:** When using this skill, announce: "Using Orchestrator skill to manage multi-project context and switching."

---

## Purpose

Gérer simultanément 4-6 projets depuis un registre centralisé. Fournit le context switching, la vue d'ensemble multi-projets, et les alertes cross-projets.

## Problem Solved

Manuel gère 4-6 projets simultanément et se perd entre les contextes. Chaque outil est mono-projet. L'orchestrateur ajoute une couche multi-projets au-dessus du framework ACT par-projet.

## Architecture

```
~/.act/                          ← Global (multi-projets)
├── projects.yaml                ← Registre des projets
├── global-state.md              ← Vue d'ensemble
└── projects/                    ← Cache d'état par projet
    ├── project-a.cache.yaml
    ├── project-b.cache.yaml
    └── project-c.cache.yaml

/path/to/project-a/.act/        ← Local (mono-projet, source de vérité)
├── config.yaml
├── state.md
├── plan.md
└── ...
```

### Source of Truth

La source de vérité est **toujours** le `.act/` local de chaque projet. Le registre global `~/.act/` est un index/cache qui pointe vers les projets et cache leur dernier état connu.

## When to Use

- **Au démarrage d'une session** : `/act:dashboard` pour voir l'état de tous les projets
- **Pour changer de projet** : `/act:switch <name>`
- **Pour trouver un projet** : `/act:projects` pour lister ou chercher
- **Pour détecter des blockers** : `/act:dashboard --alerts-only`

## Commands

| Command | Description |
|---------|-------------|
| `/act:projects` | Lister, enregistrer, retirer des projets |
| `/act:switch <name>` | Changer de contexte projet |
| `/act:dashboard` | Vue d'ensemble de tous les projets |

## Workflow Typique

### 1. Début de journée

```bash
/act:dashboard
# Voir l'état de tous les projets
# Identifier les priorités et blockers
```

### 2. Choisir un projet

```bash
/act:switch pocket-watch-ai
# Charge le contexte, fait le 5-question check
# Prêt à travailler
```

### 3. Travailler sur le projet

```bash
/act:status              # Voir l'état du projet courant
/act:resume              # Si besoin de récupérer le contexte
# ... travailler normalement avec ACT ...
```

### 4. Changer de projet

```bash
/act:switch archi-bot --save-handoff
# Sauvegarde le contexte courant
# Charge le nouveau projet
```

### 5. Fin de journée

```bash
/act:dashboard --compact
# Vue rapide de la progression de la journée
```

## Auto-Discovery

L'orchestrateur peut scanner des répertoires pour découvrir automatiquement les projets ACT :

```bash
/act:projects --scan ~/projects
```

Détecte les `.act/config.yaml` jusqu'à 3 niveaux de profondeur et propose l'enregistrement.

## Status Determination

| Critère | Status |
|---------|--------|
| Mis à jour < 3 jours, pas de blocker | 🔄 Active |
| Pas de mise à jour > 3 jours | ⏸️ Paused |
| Blocker actif dans state.md | ⚠️ Blocked |
| `.act/` introuvable au chemin enregistré | ❌ Missing |

## Integration

### With Session Recovery
Le switch de projet déclenche automatiquement un mini-reboot test (5 questions) pour s'assurer que le contexte est complet.

### With Context Handoff
`/act:switch --save-handoff` génère un handoff complet avant de changer de contexte.

### With Continuous Learning
Les patterns de switching (quels projets sont travaillés ensemble, fréquence) sont observés et peuvent générer des insights.

### With Hooks
- **PostToolUse** : Après modification de state.md, mettre à jour le cache global
- **Stop** : Rappeler de vérifier les autres projets avant de terminer la session

## Configuration

### Global (`~/.act/projects.yaml`)

```yaml
version: "3.0"
default_project: act-framework
scan_paths:
  - ~/projects
  - ~/Desktop/bonsai974/claude/lab

projects:
  - name: act-framework
    path: /Users/.../lab-13
    registered: 2026-02-25
    tags: [framework, open-source]
```

### Per-Project (`.act/config.yaml`)

```yaml
# Existing fields, plus:
orchestrator:
  priority: high      # high | medium | low
  category: framework  # Custom category
  team: solo           # solo | team
```

## Limitations

- L'orchestrateur ne synchronise pas l'état entre projets en temps réel
- Le cache global peut être stale si un projet est modifié sans ACT
- Maximum recommandé : 10 projets simultanés

## Related

- [/act:projects](../../commands/act/projects.md) — Gestion du registre
- [/act:switch](../../commands/act/switch.md) — Context switching
- [/act:dashboard](../../commands/act/dashboard.md) — Vue d'ensemble
- [Session Recovery](../session-recovery/SKILL.md) — Récupération de contexte

---

*Skill version: 1.0*
*Compatible with: ACT v3.0+*
