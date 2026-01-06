# ArtChiTech Framework (ACT)

> **lab-13** = Atelier de développement du plugin ACT

## Qu'est-ce que ACT ?

**ArtChiTech Framework (ACT)** est un plugin Claude Code pour la gestion de projets, structurant le développement en **7 phases** : Discovery → Stratégie → Conception → Développement → Qualité → Lancement → Croissance.

## Quick Start

```bash
# Dans n'importe quel projet
/projet
```

C'est tout ! Le framework détecte automatiquement votre contexte :
- **Nouveau projet** → Guide de création
- **Projet existant** → Audit automatique puis menu
- **Projet ACT** → Menu de gestion

## Structure du Projet

```
lab-13/
├── CLAUDE.md                # Instructions pour Claude
├── .claude/rules/           # Source of truth (documentation modulaire)
├── plugin/                  # 📦 Source du plugin ACT
│   ├── commands/            # Commandes slash
│   ├── agents/              # Agents spécialisés
│   ├── references/          # Documentation des phases
│   └── scripts/             # Scripts utilitaires
├── test-apps/               # 🧪 Applications de test (dev interne)
├── docs/                    # 📚 Documentation développement
│   ├── sources/             # Fichiers sources originaux
│   ├── plans/               # Plans d'implémentation
│   └── handoffs/            # Handoffs de sessions
└── scripts/                 # 🔧 Scripts d'installation
```

## Commandes

| Commande | Description |
|----------|-------------|
| `/onboard` | Auditer un projet existant |
| `/projet` | Hub principal interactif |
| `/status` | État et progression |
| `/next` | Étape suivante |
| `/fix` | Corriger erreur prioritaire |
| `/resume` | Reprendre session |
| `/help` | Aide contextuelle |

## Les 7 Phases

| Phase | Objectif |
|-------|----------|
| 1. Discovery | Valider le problème et les besoins |
| 2. Stratégie | Définir roadmap et business model |
| 3. Conception | Designer architecture et UX |
| 4. Développement | Implémenter avec TDD |
| 5. Qualité | Tester et valider |
| 6. Lancement | Déployer |
| 7. Croissance | Itérer et optimiser |

## Installation

```bash
./scripts/install-local.sh
```

## Documentation

- [CLAUDE.md](CLAUDE.md) - Quick reference + liens vers `.claude/rules/`
- [plugin/README.md](plugin/README.md) - Documentation utilisateur
- [docs/sources/](docs/sources/) - Recherches et extractions originales

## Licence

MIT
