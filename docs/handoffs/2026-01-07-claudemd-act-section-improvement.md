# Session Handoff - Amelioration Section ACT dans CLAUDE.md

> Date: 2026-01-07

## Probleme

La section ACT generee dans le CLAUDE.md est trop basique. Elle liste les commandes mais ne guide pas l'utilisateur sur **comment utiliser ACT efficacement**.

### Actuel (insuffisant)

```markdown
## ACT Framework

Current phase: **1** (Discovery)

| Command | Description |
|---------|-------------|
| `/act-project` | Main hub |
| `/act-status` | View progress |
...
```

### Attendu (state of the art)

```markdown
## ACT Framework

> Ce projet utilise ACT pour le suivi de phase et la methodologie TDD.

### Debut de Session

1. **Toujours commencer par** `/act-project` pour voir l'etat du projet
2. Consulter les erreurs bloquantes avec `/act-fix`
3. Reprendre le travail en cours

### Suivi de Phase

| Phase actuelle | 4 - Development |
|----------------|-----------------|
| Score | 45% |
| Objectif | Tests + Implementation |

- Etat complet : `.epct/state.json`
- Historique : `.epct/history/checkpoints/`

### Workflow Recommande

```
/act-project → voir etat
    ↓
/act-status → details phase
    ↓
Travailler sur les criteres
    ↓
/act-next → valider et avancer
```

### Skills par Phase

| Phase | Skill Recommande |
|-------|------------------|
| 1-2 Discovery/Strategy | `superpowers:brainstorming` |
| 3 Design | `superpowers:writing-plans` |
| 4 Development | `superpowers:test-driven-development` |
| 5 Quality | `superpowers:code-reviewer` |

### En cas de probleme

- Erreur bloquante → `/act-fix`
- Besoin d'aide → `/act-help`
- Reprendre session → `/act-resume`
```

## TODO Prochaine Session

### 1. Recherche

- Analyser les meilleurs CLAUDE.md de la communaute
- Identifier ce qui rend une section "workflow" efficace
- Etudier comment guider un utilisateur dans un framework

### 2. Redesign de la section ACT

Questions a repondre :
- Que doit savoir un dev qui ouvre le projet pour la premiere fois ?
- Comment guider vers les bonnes commandes au bon moment ?
- Comment integrer les skills superpowers de maniere contextuelle ?

### 3. Implementation

- Modifier `generate_claudemd.py` fonction `generate_act_section()`
- Ajouter les informations de phase dynamiques
- Ajouter le workflow visuel
- Ajouter la table skills/phase

### 4. Test sur 2 scenarios

1. **Projet vierge** : Le CLAUDE.md genere doit etre un guide complet
2. **Projet existant** : La section ACT ajoutee doit s'integrer proprement

## Fichiers a Modifier

- `plugin/skills/claudemd-generator/scripts/generate_claudemd.py`
  - Fonction `generate_act_section()` (ligne ~300)

## Prompt de Relance

```
Ameliore la section ACT du generateur CLAUDE.md.

Contexte:
- docs/handoffs/2026-01-07-claudemd-act-section-improvement.md
- Le generateur existe mais la section ACT est trop basique
- Elle doit guider l'utilisateur sur le workflow ACT

Objectif:
Transformer la section ACT d'une simple liste de commandes en un **guide de demarrage** qui explique:
1. Par ou commencer (debut de session)
2. Comment suivre les phases
3. Quels skills utiliser selon la phase
4. Ou trouver l'etat du projet

Etapes:
1. Recherche les meilleures pratiques de sections "Getting Started"
2. Redesign la section ACT avec workflow visuel
3. Implemente dans generate_act_section()
4. Teste sur projet vierge et projet existant
5. Commit

Le CLAUDE.md doit etre "state of the art" - le point d'orgue du framework.
```

## Notes

Le CLAUDE.md est la premiere chose que Claude lit en ouvrant un projet. Si la section ACT est bien faite, l'utilisateur comprend immediatement comment utiliser le framework sans avoir a chercher.

C'est l'equivalent d'un "Quick Start" dans une bonne documentation.
