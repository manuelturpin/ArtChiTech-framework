# ACT Framework - Atelier de Développement

> **lab-13** = Atelier de développement du plugin ACT (ArtChiTech)

## Qu'est-ce que ACT ?

**ACT (ArtChiTech)** est un framework de gestion de projet pour Claude Code qui structure le développement en **7 phases** : Discovery → Stratégie → Conception → Développement → Qualité → Lancement → Croissance.

## Structure du Projet

```
lab-13/
├── plugin/              # 📦 Source du plugin ACT
│   ├── commands/        # Commandes : /onboard, /projet, /status...
│   ├── agents/          # Agents spécialisés
│   ├── references/      # Documentation phases, scoring, templates
│   └── scripts/         # Scripts utilitaires
├── test-apps/           # 🧪 Applications de test
│   └── bonsai-tracker/  # Test #1 : SaaS traçabilité bonsaïs
├── docs/                # 📚 Documentation développement
│   ├── plans/           # Plans d'implémentation
│   ├── handoffs/        # Handoffs de sessions
│   └── architecture/    # Documentation architecture
└── scripts/             # 🔧 Scripts de build/installation
```

## Commandes du Plugin

| Commande | Description |
|----------|-------------|
| `/onboard` | Auditer un projet existant |
| `/projet` | Hub principal interactif |
| `/status` | État et progression |
| `/resume` | Reprendre session |
| `/fix` | Corriger erreur prioritaire |
| `/next` | Étape suivante |
| `/help` | Aide contextuelle |

## Installation

```bash
# Installation locale du plugin
./scripts/install-local.sh
```

## Les 7 Phases

| Phase | Objectif |
|-------|----------|
| 1. Discovery | Valider le problème |
| 2. Stratégie | Définir roadmap |
| 3. Conception | Designer architecture |
| 4. Développement | Implémenter (TDD) |
| 5. Qualité | Tester et valider |
| 6. Lancement | Déployer |
| 7. Croissance | Itérer et optimiser |

## Développement

Voir [CLAUDE.md](CLAUDE.md) pour les conventions et le workflow de développement.

## Documentation

- [Plugin README](plugin/README.md) - Documentation utilisateur
- [FRAMEWORK-SYNTHESIS.md](FRAMEWORK-SYNTHESIS.md) - Synthèse complète
- [docs/](docs/) - Documentation développement

## Auteur

Manuel Turpin (Bonsai974)

## Licence

MIT
