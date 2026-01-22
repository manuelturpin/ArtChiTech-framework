# CLAUDE.md Generator

Génère des fichiers CLAUDE.md optimisés basés sur l'analyse du stack du projet.

## Usage CLI

```bash
# Générer avec stack JSON inline
python generate_claudemd.py \
  --name "My Project" \
  --description "A web application" \
  --stack '{"language": "typescript", "framework": "next.js", "database": "prisma"}' \
  --phase 4 \
  --score 60

# Générer avec fichier stack.json
python generate_claudemd.py \
  --name "My Project" \
  --description "A web application" \
  --stack ./stack.json \
  --output CLAUDE.md

# Dry run (afficher sans écrire)
python generate_claudemd.py \
  --name "My Project" \
  --stack '{"language": "typescript"}' \
  --dry-run
```

## Arguments

| Argument | Description | Défaut |
|----------|-------------|--------|
| `--name` | Nom du projet | "My Project" |
| `--description` | Description du projet | "Project description" |
| `--stack` | JSON ou chemin vers stack.json | `{}` |
| `--output` | Fichier de sortie | `CLAUDE.md` |
| `--phase` | Phase ACT actuelle (1-7) | 1 |
| `--score` | Score ACT actuel (0-100) | 0 |
| `--dry-run` | Afficher sans écrire | false |

## Stratégies de Génération

Le script sélectionne automatiquement une stratégie :

| Stratégie | Condition | Action |
|-----------|-----------|--------|
| `SINGLE` | Complexité < 5, pas de fichier existant | Génère un fichier complet |
| `MODULAR` | Complexité >= 5, pas de fichier existant | Génère avec @imports |
| `ENHANCE` | CLAUDE.md existe déjà | Ajoute les sections manquantes |

### Calcul de Complexité

- Langage détecté : +1
- Framework détecté : +2
- Database détectée : +2
- Tests présents : +1
- CI/CD configuré : +1
- Docker configuré : +1
- Technologies supplémentaires : +1 par tech (max +2)

## Sections Générées

### Pour tous les projets

- Header (nom + description)
- Tech Stack (table)
- Section ACT Framework
- Code Conventions

### Selon le runtime

- **Node.js/TypeScript** : Commandes npm
- **Python** : Commandes pytest/black/mypy
- **Go** : Commandes go
- **Rust** : Commandes cargo

### Selon le type de projet

- **webapp** : Performance, Accessibility
- **api** : API Conventions, Validation
- **cli** : CLI Conventions, Output
- **library** : Exports, Versioning

### Optionnel

- Testing section (si tests détectés)
- TypeScript-specific rules
- Python-specific rules

## Exemple de Sortie

```markdown
# My Project

> A web application

## Tech Stack

| Component | Technology |
|-----------|------------|
| Language | Typescript |
| Framework | next.js |
| Database | Prisma |
| Testing | Yes |

## ACT Framework

Phase: **4** (Development) | Score: 60%

@plugin/references/phases/4-development.md

| Ressource | Accès |
|-----------|-------|
| État projet | `.epct/state.json` |
| Historique | `.epct/history/` |
| Aide | `/act-help` |

## Commands

```bash
npm run dev       # Start development server
npm run build     # Build for production
npm run test      # Run tests
npm run lint      # Lint code
```

## Code Conventions
...
```

## Usage Python

```python
from generate_claudemd import (
    analyze_complexity,
    select_strategy,
    assemble_claudemd,
    generate_enhancement
)

stack_info = {
    "language": "typescript",
    "framework": "next.js",
    "database": "prisma",
    "has_tests": True
}

# Analyser la complexité
complexity = analyze_complexity(stack_info)
print(f"Complexity: {complexity}/10")

# Sélectionner la stratégie
strategy = select_strategy(complexity, has_existing=False)
print(f"Strategy: {strategy}")

# Générer le contenu
content = assemble_claudemd(
    project_name="My Project",
    description="A web application",
    stack_info=stack_info,
    phase=4,
    score=60
)

print(content)
```

## Templates

Le script utilise des templates dans `plugin/skills/claudemd-generator/templates/` :

```
templates/
├── base.md.tmpl      # Template de base
├── act.md.tmpl       # Section ACT
└── conventions.md.tmpl
```

## Tests

```bash
cd plugin
python -m pytest skills/claudemd-generator/tests/ -v
```
