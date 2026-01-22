# State Manager Script

Gère la création, lecture et mise à jour de `.epct/state.json`.

## Usage CLI

```bash
# Initialiser un nouveau projet
python state_manager.py init --name "my-project" --type webapp --stack "react,typescript,prisma"

# Lire l'état actuel
python state_manager.py read

# Mettre à jour l'état
python state_manager.py update --updates '{"phase": {"current": 2, "name": "Strategy"}}'

# Créer un checkpoint
python state_manager.py checkpoint

# Restaurer depuis un checkpoint
python state_manager.py recover --checkpoint-file "2026-01-10T14-30-00.json"

# Vérifier si un projet ACT existe
python state_manager.py exists
```

## Arguments

| Argument | Description | Requis |
|----------|-------------|--------|
| `command` | Action à exécuter | Oui |
| `--name` | Nom du projet (pour init) | Non |
| `--type` | Type de projet (pour init) | Non |
| `--stack` | Stack (comma-separated, pour init) | Non |
| `--updates` | JSON des mises à jour | Non |
| `--checkpoint-file` | Fichier checkpoint | Non |
| `--path` | Chemin de base (défaut: `.`) | Non |

## Commandes

### init

Crée la structure `.epct/` avec un état initial.

**Structure créée** :
```
.epct/
├── state.json          # État principal
├── session/            # Données de session
└── history/
    └── checkpoints/    # Checkpoints automatiques
```

**Output** : JSON de l'état initial

### read

Lit l'état courant depuis `.epct/state.json`.

**Output** : JSON de l'état ou `null` si non trouvé (exit code 1)

### update

Met à jour l'état avec un merge récursif.

**Input** : JSON via `--updates`
**Output** : JSON de l'état mis à jour

### checkpoint

Crée un snapshot horodaté dans `.epct/history/checkpoints/`.

**Output** : Chemin du fichier checkpoint créé

### recover

Restaure l'état depuis un checkpoint.

**Input** : Nom ou chemin du fichier checkpoint
**Output** : JSON de l'état restauré

### exists

Vérifie si un projet ACT existe.

**Output** : `true` ou `false`

## Usage Python

```python
from state_manager import init_state, read_state, update_state, checkpoint, recover, exists

# Initialiser
state = init_state("my-project", "webapp", ["react", "typescript"])

# Lire
state = read_state()
if state:
    print(f"Phase: {state['phase']['current']}")

# Mettre à jour
state = update_state({
    "phase": {"current": 2, "name": "Strategy"},
    "scores": {"discovery": 80}
})

# Checkpoint
path = checkpoint()
print(f"Checkpoint saved: {path}")

# Vérifier existence
if exists():
    print("Projet ACT trouvé")
```

## Structure de l'État

```json
{
  "version": "1.0.0",
  "project": {
    "name": "my-project",
    "type": "webapp",
    "stack": ["react", "typescript"],
    "created_at": "2026-01-10T10:00:00"
  },
  "phase": {
    "current": 1,
    "name": "Discovery",
    "started_at": "2026-01-10T10:00:00"
  },
  "scores": {
    "discovery": 0,
    "strategy": 0,
    "conception": 0,
    "development": 0,
    "quality": 0,
    "launch": 0,
    "growth": 0
  },
  "mode": "COMPLET",
  "current_feature": null
}
```

## Erreurs

| Erreur | Cause | Solution |
|--------|-------|----------|
| `FileNotFoundError` | `.epct/state.json` non trouvé | Exécuter `init` d'abord |
| `json.JSONDecodeError` | Fichier JSON invalide | Restaurer depuis checkpoint |

## Tests

```bash
cd plugin
python -m pytest tests/unit/test_state_management.py -v
```
