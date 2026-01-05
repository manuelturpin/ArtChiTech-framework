# Framework Projet Claude Code

Framework de gestion de projet pour Claude Code qui transforme 167K mots de recherche en 6 commandes simples.

## Caractéristiques

- **6 commandes** : `/projet`, `/resume`, `/status`, `/fix`, `/next`, `/help`
- **Persistance** : Contexte préservé entre sessions (`.epct/`)
- **7 phases** : Discovery → Stratégie → Conception → Développement → Qualité → Lancement → Croissance
- **TDD automatique** : Pattern chunk-test-fix
- **Intégration Superpowers** : Skills activés selon phase

## Installation Rapide

```bash
# Copier dans votre projet
cp -r src .claude/framework/
cp -r .epct .epct/

# Lancer
/projet
```

Voir [docs/installation.md](docs/installation.md) pour le guide complet.

## Commandes

| Commande | Description |
|----------|-------------|
| `/projet` | Hub principal interactif |
| `/resume` | Reprendre session précédente |
| `/status` | État et progression |
| `/fix` | Corriger erreur prioritaire |
| `/next` | Passer à l'étape suivante |
| `/help` | Aide contextuelle |

## Les 7 Phases

1. **Discovery** - Valider le problème
2. **Stratégie** - Définir roadmap et business model
3. **Conception** - Designer architecture et UX
4. **Développement** - Implémenter avec TDD
5. **Qualité** - Tester et valider
6. **Lancement** - Déployer et acquérir
7. **Croissance** - Itérer et optimiser

## Architecture

```
src/
├── skills/           # Skills du framework
│   ├── context-manager.md
│   ├── chunk-manager.md
│   ├── error-tracker.md
│   ├── phase-controller.md
│   ├── projet-orchestrator.md
│   └── tips-engine.md
├── cli/              # Commandes utilisateur
│   ├── projet.md
│   ├── resume.md
│   ├── status.md
│   ├── fix.md
│   ├── next.md
│   └── help.md
└── reference/        # Documentation phases
    └── phases/
        ├── 1-discovery.md
        └── ...
```

## Workflow TDD

```
Pour chaque feature :
1. Découper en chunks (~50 lignes)
2. Pour chaque chunk :
   🔴 RED   : Écrire test qui échoue
   🟢 GREEN : Implémenter minimum
   🔧 REFACTOR : Nettoyer
3. Commit après chaque chunk vert
```

## Persistance

L'état est sauvegardé dans `.epct/` :
- `state.json` : État projet actuel
- `checkpoints/` : Points de sauvegarde
- `errors/` : Tracking erreurs
- `session/` : Info session courante

## Documentation

- [Installation](docs/installation.md)
- [Phases détaillées](src/reference/phases/)

## Développement

Ce framework s'auto-utilise pour son développement.

```bash
cd lab-13-framework-dev  # Worktree
git branch               # framework/implementation
/projet                  # Utiliser le framework
```

## Licence

MIT
