# ArtChiTech Framework (ACT)

**ACT** est un plugin Claude Code pour la gestion de projets, de la découverte à la croissance.

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
| `/next` | Passer à l'étape suivante |
| `/fix` | Corriger l'erreur prioritaire |
| `/resume` | Reprendre une session précédente |
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

| Mode | Quand l'utiliser | Description |
|------|------------------|-------------|
| **COMPLET** | Nouveau projet | Parcourt les 7 phases |
| **FEATURE** | Nouvelle fonctionnalité | Adapté selon la feature (peut nécessiter toutes les phases) |
| **QUICK** | Petite modification | Rapide mais vérifie l'impact global |

### Mode FEATURE

Selon l'importance de la feature, peut nécessiter :
- Toutes les phases (1-7) pour une feature majeure
- Intégration au projet global en phase 7

### Mode QUICK

- Exécution rapide des étapes nécessaires
- **Toujours vérifier l'intégralité du projet** après modification

## Structure du Plugin

```
plugin/
├── .claude-plugin/
│   └── plugin.json       # Configuration
├── commands/             # 7 commandes slash
├── agents/               # 6 agents spécialisés
├── references/           # Documentation
│   ├── phases/           # 7 phases détaillées
│   ├── scoring/          # Critères de scoring
│   ├── recommendations/  # Recommandations
│   └── templates/        # Templates de rapports
└── scripts/
    └── detect_stack.py   # Détection de stack
```

## Licence

MIT
