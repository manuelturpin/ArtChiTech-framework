# ArtChiTech Framework (ACT)

> Plugin Claude Code pour la gestion de projets en 7 phases.

## Identité

- **Nom** : ArtChiTech Framework
- **Raccourci** : ACT
- **Type** : Plugin Claude Code

## Règles de Conduite

@.claude/rules/0-behavior.md

## Documentation

| Sujet | Fichier |
|-------|---------|
| Framework & Phases | @.claude/rules/1-framework-overview.md |
| Architecture | @.claude/rules/2-architecture.md |
| Commandes | @.claude/rules/3-command-development.md |
| Conventions | @.claude/rules/4-conventions.md |
| Tests | @.claude/rules/5-testing.md |
| Dépannage | @.claude/rules/6-troubleshooting.md |

## Quick Start

```bash
# Modifier le plugin
plugin/

# Tester
cd test-apps/[app-name] && /onboard

# Commit
git commit -m "feat: description"
```

## Commandes Principales

| Commande | Description |
|----------|-------------|
| `/onboard` | Auditer un projet |
| `/projet` | Hub interactif |
| `/status` | État du projet |
| `/next` | Étape suivante |
