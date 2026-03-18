# ACT Scripts

Scripts utilitaires pour le framework ACT.

## Scripts Disponibles

| Script | Description |
|--------|-------------|
| `act_resolver.py` | Résolution des chemins ACT |
| `session_start.py` | Hook de démarrage de session |

---

## act_resolver.py

**Rôle** : Point central pour trouver l'installation ACT, quelle que soit la méthode d'installation.

### Usage

```python
from act_resolver import find_act_root, get_script, validate_installation

# Trouver la racine ACT
root = find_act_root()
print(root)  # /path/to/.claude/plugins/act

# Trouver un script spécifique
script_path = get_script("state_manager")
print(script_path)  # /path/to/act/skills/state-management/scripts/state_manager.py

# Valider l'installation
status = validate_installation()
print(status)
# {
#   "valid": True,
#   "root": "/path/to/act",
#   "version": "2.1.1",
#   "scripts": ["state_manager", "detect_stack"],
#   "errors": []
# }
```

### Priorité de Recherche

1. `$CLAUDE_PLUGIN_ROOT` (défini par Claude Code lors de l'exécution)
2. `.claude/plugins/act/` (installation locale dans le projet)
3. `~/.claude/plugins/cache/manuelturpin/act/` (installation globale)

### Exceptions

- `ACTNotFoundError` : ACT n'est pas installé
- `ScriptNotFoundError` : Script spécifique non trouvé

---

## session_start.py

**Rôle** : Affiche l'état du projet ACT au démarrage d'une session Claude Code.

### Usage

```bash
# Exécuté automatiquement via le hook session start
python3 session_start.py
```

### Output

```
╭─────────────────────────────────────────────────────╮
│  🎯 Projet ACT : my-project                         │
│                                                     │
│  Phase : 4 - Development (score: 60%)               │
│  Mode  : COMPLET                                    │
│                                                     │
│  💡 Tape /act-project pour continuer                │
╰─────────────────────────────────────────────────────╯
```

### Comportement

- Si `.act/state.md` existe : Affiche le résumé du projet
- Si pas de projet ACT : Sort silencieusement (pas d'erreur)
- Si fichier corrompu : Ignoré silencieusement

---

## Développement

### Structure

```
scripts/
├── __init__.py           # Package Python
├── act_resolver.py       # Résolution des chemins
├── session_start.py      # Hook démarrage
├── loop.sh              # Script de loop principal
├── loop-prompt.md       # Prompt pour le loop
└── prompts/             # Prompts par phase
    ├── loop-prompt-discovery.md
    ├── loop-prompt-strategy.md
    └── ...
```

### Tests

```bash
cd plugin
python -m pytest tests/unit/test_act_resolver.py -v
```
