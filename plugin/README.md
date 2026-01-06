# ACT - Framework de Projet pour Claude Code

**ACT (ArtChiTech)** est un plugin Claude Code pour la gestion de projets, de la découverte à la croissance.

## Installation

```bash
# Via le script d'installation
./scripts/install-local.sh

# Ou manuellement
cp -r plugin/ ~/.claude/plugins/cache/local/act/
```

## Commandes

| Commande | Description |
|----------|-------------|
| `/onboard` | Auditer un projet existant et générer un diagnostic |
| `/projet` | Hub principal interactif |
| `/status` | État et progression du projet |
| `/resume` | Reprendre une session précédente |
| `/fix` | Corriger l'erreur prioritaire |
| `/next` | Passer à l'étape suivante |
| `/help` | Aide contextuelle |

## Les 7 Phases

1. **Discovery** - Valider le problème et les besoins
2. **Stratégie** - Définir roadmap et business model
3. **Conception** - Designer architecture et UX
4. **Développement** - Implémenter avec TDD
5. **Qualité** - Tester et valider
6. **Lancement** - Déployer et acquérir
7. **Croissance** - Itérer et optimiser

## Modes d'Utilisation

| Mode | Quand l'utiliser | Durée |
|------|------------------|-------|
| **COMPLET** | Nouveau projet/SaaS | Semaines/mois |
| **FEATURE** | Nouvelle fonctionnalité | Jours |
| **QUICK** | Petite modification | Heures |

## Structure du Plugin

```
plugin/
├── .claude-plugin/
│   └── plugin.json       # Configuration
├── commands/             # Commandes slash
│   ├── onboard.md
│   ├── projet.md
│   ├── status.md
│   ├── resume.md
│   ├── fix.md
│   ├── next.md
│   └── help.md
├── agents/               # Agents spécialisés
│   ├── context-manager.md
│   ├── chunk-manager.md
│   ├── error-tracker.md
│   ├── phase-controller.md
│   ├── projet-orchestrator.md
│   └── tips-engine.md
├── references/           # Documentation
│   ├── phases/           # 7 phases détaillées
│   ├── scoring/          # Critères de scoring
│   ├── recommendations/  # Recommandations par type
│   └── templates/        # Templates de rapports
└── scripts/
    └── detect_stack.py   # Détection automatique de stack
```

## Auteur

Manuel Turpin (Bonsai974) - contact@bonsai974.re

## Licence

MIT
