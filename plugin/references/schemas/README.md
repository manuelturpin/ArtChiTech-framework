# ACT JSON Schemas

Ce dossier contient les schemas JSON pour valider les fichiers de données ACT.

## Schemas Disponibles

| Schema | Fichier | Description |
|--------|---------|-------------|
| `state.schema.json` | `.epct/state.json` | État du projet ACT |
| `prd.schema.json` | `.epct/session/prd.json` | PRD pour le loop |

## Validation

### Avec ajv-cli

```bash
# Installer ajv-cli
npm install -g ajv-cli

# Valider state.json
ajv validate -s plugin/references/schemas/state.schema.json -d .epct/state.json

# Valider prd.json
ajv validate -s plugin/references/schemas/prd.schema.json -d .epct/session/prd.json
```

### Avec Python jsonschema

```python
import json
from jsonschema import validate, ValidationError

# Charger le schema
with open('plugin/references/schemas/state.schema.json') as f:
    schema = json.load(f)

# Charger les données
with open('.epct/state.json') as f:
    data = json.load(f)

# Valider
try:
    validate(instance=data, schema=schema)
    print("✅ Validation OK")
except ValidationError as e:
    print(f"❌ Validation failed: {e.message}")
```

## Structure .epct/

```
.epct/
├── state.json              # État du projet (validé par state.schema.json)
├── session/
│   ├── prd.json           # PRD actuel (validé par prd.schema.json)
│   ├── current.json       # Session courante
│   └── recovery.json      # Info de récupération
├── checkpoints/           # Checkpoints automatiques
│   └── *.json
├── errors/
│   ├── active/            # Erreurs actives
│   └── resolved/          # Erreurs résolues
└── loop/
    ├── progress.md        # Log de progression
    ├── patterns.md        # Patterns découverts
    ├── metrics.json       # Métriques du loop
    ├── build-errors.log   # Erreurs de build
    ├── type-errors.log    # Erreurs TypeScript
    └── logs/              # Logs détaillés par itération
```

## Champs Obligatoires

### state.json

- `project.name` - Nom du projet
- `project.type` - Type (webapp, mobile, api, etc.)
- `currentPhase` - Numéro de phase (1-7)
- `phaseName` - Nom de la phase

### prd.json

- `project` - Nom du projet
- `phase` - Phase courante (lowercase)
- `userStories` - Liste des stories
  - `id` - Identifiant unique
  - `title` - Titre
  - `description` - Description user story
  - `acceptanceCriteria` - Critères d'acceptation
  - `priority` - Priorité (1 = haute)
  - `passes` - Statut de complétion

## Valeurs Possibles

### Types de Projet

- `webapp` - Application web
- `mobile` - Application mobile
- `api` - API/Backend
- `library` - Bibliothèque
- `cli` - Outil CLI
- `feature` - Nouvelle fonctionnalité
- `refactor` - Refactoring

### Phases

| # | Nom | Clé |
|---|-----|-----|
| 1 | Discovery | `discovery` |
| 2 | Strategy | `strategy` |
| 3 | Design | `design` |
| 4 | Development | `dev` |
| 5 | Quality | `quality` |
| 6 | Launch | `launch` |
| 7 | Growth | `growth` |

### Modes

- `COMPLET` - Toutes les phases
- `FEATURE` - Phases adaptées pour feature
- `QUICK` - Mode rapide

## Exemple Minimal

### state.json

```json
{
  "project": {
    "name": "mon-projet",
    "type": "webapp"
  },
  "currentPhase": 1,
  "phaseName": "Discovery",
  "mode": "COMPLET"
}
```

### prd.json

```json
{
  "project": "Mon Projet",
  "phase": "dev",
  "userStories": [
    {
      "id": "US-001",
      "title": "Feature A",
      "description": "As a user, I want feature A",
      "acceptanceCriteria": ["Criterion 1", "Criterion 2"],
      "priority": 1,
      "passes": false
    }
  ]
}
```
