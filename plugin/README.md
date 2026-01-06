# ACT Framework

> Framework de suivi et realisation de projets en 7 phases pour Claude Code.

## Installation

### Prerequis

| Dependance | Version | Obligatoire |
|------------|---------|-------------|
| Claude Code | Latest | Oui |
| Plugin `superpowers` | 3.6.0+ | Oui |
| Python | 3.8+ | Oui |
| Git | Any | Oui |

### Installer les dependances

```bash
# 1. Installer le plugin superpowers
claude plugins:install superpowers-marketplace/superpowers

# 2. Verifier Python
python3 --version  # Doit etre >= 3.8
```

### Installer ACT

**Option A: Git clone (recommande pour developpement)**

```bash
git clone https://github.com/manuelturpin/ArtChiTech-framework.git ~/projects/act
cd ~/projects/act
./scripts/install.sh
```

**Option B: Installation locale**

```bash
./scripts/install.sh
```

### Verifier l'installation

Redemarrez Claude Code, puis tapez `/projet`.

## Utilisation

### Commandes

| Commande | Description |
|----------|-------------|
| `/projet` | Hub principal - point d'entree unique |
| `/onboard` | Auditer et initialiser un projet |
| `/status` | Voir l'etat complet du projet |
| `/next` | Passer a la phase suivante |
| `/fix` | Corriger les problemes |
| `/resume` | Reprendre une session |
| `/help` | Aide contextuelle |

### Les 7 Phases

1. **Discovery** - Valider le probleme et les besoins
2. **Strategie** - Definir roadmap et business model
3. **Conception** - Designer architecture et UX
4. **Developpement** - Implementer avec TDD
5. **Qualite** - Tester et valider
6. **Lancement** - Deployer et acquerir
7. **Croissance** - Iterer et optimiser

### Les 3 Modes

| Mode | Usage |
|------|-------|
| COMPLET | Nouveau projet from scratch |
| FEATURE | Nouvelle fonctionnalite |
| QUICK | Bugfix ou refactoring |

## Structure .epct/

ACT cree un dossier `.epct/` dans votre projet :

```
.epct/
├── state.json          # Etat courant
├── session/            # Donnees de session
└── history/
    └── checkpoints/    # Points de sauvegarde
```

Ajoutez `.epct/` a votre `.gitignore` si vous ne voulez pas versionner l'etat ACT.

## Integration Superpowers

ACT utilise les skills superpowers selon la phase :

| Phase | Skill |
|-------|-------|
| Discovery | `superpowers:brainstorming` |
| Strategie | `superpowers:brainstorming` |
| Conception | `superpowers:writing-plans` |
| Developpement | `superpowers:test-driven-development` |
| Qualite | `superpowers:code-reviewer` |

## Developpement

```bash
# Lancer les tests
bash plugin/tests/run_all_tests.sh

# Structure
plugin/
├── commands/      # Commandes slash
├── skills/        # Skills reutilisables
├── references/    # Documentation de reference
└── tests/         # Tests automatises
```

## Licence

MIT - Manuel Turpin
