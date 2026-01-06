# Phase 5 - Internationalization EN - Design

> Design valide le 2026-01-06

## Objectif

Traduire le framework ACT du francais vers l'anglais pour le marche international.

## Decisions

| Decision | Choix |
|----------|-------|
| Langue cible | Anglais (Full English) |
| Noms de commandes | Anglicises (`/project`, `/help`, etc.) |
| Strategie | Par couche (commands → skills → agents → references) |

## Scope

### Batch 1: Commands + Config (Priorite HAUTE)
- `plugin/commands/*.md` (7 fichiers)
- `plugin/.claude-plugin/plugin.json`
- `plugin/README.md`

### Batch 2: Skills (Priorite HAUTE)
- `plugin/skills/project-detection/`
- `plugin/skills/state-management/`
- `plugin/skills/phase-scoring/`

### Batch 3: Agents (Priorite MOYENNE)
- `plugin/agents/*.md` (6 fichiers)

### Batch 4: References (Priorite MOYENNE)
- `plugin/references/phases/` (7 fichiers)
- `plugin/references/scoring/`
- `plugin/references/recommendations/`
- `plugin/references/templates/`

## Regles de Traduction

### Noms de phases
| Francais | Anglais |
|----------|---------|
| Decouverte | Discovery |
| Strategie | Strategy |
| Conception | Design |
| Developpement | Development |
| Qualite | Quality |
| Lancement | Launch |
| Croissance | Growth |

### Commandes
| Ancien | Nouveau |
|--------|---------|
| `/projet` | `/project` |
| `/aide` | `/help` (deja OK) |
| `/suivant` | `/next` (deja OK) |
| `/status` | `/status` (deja OK) |
| `/fix` | `/fix` (deja OK) |
| `/resume` | `/resume` (deja OK) |
| `/onboard` | `/onboard` (deja OK) |

### Conventions
- Messages utilisateur en anglais
- Commentaires code en anglais
- Emojis conserves (universels)
- Structure fichiers inchangee

## Verification

Apres chaque batch:
1. Reinstaller le plugin localement
2. Tester les commandes traduites
3. Verifier que les tests passent
4. Commit du batch

## Livrables

- Tag `v1.1.0` apres completion Phase 5
- README.md en anglais
- Tous les fichiers du plugin en anglais
