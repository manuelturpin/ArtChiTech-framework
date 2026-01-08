# Handoff - ACT v2.0.0 Installation Refonte

> **Date**: 2026-01-08
> **Status**: Batch 1-2 complétés, Batch 3-4 à faire

## Résumé

Refonte du système d'installation ACT v2.0.0 avec un resolver central et une structure unifiée.

## Ce qui est FAIT ✅

### Batch 1 (Tasks 1-3) - Commit `becc9bb`
- ✅ `plugin/scripts/act_resolver.py` - Module resolver central
- ✅ `plugin/scripts/__init__.py` - Package init
- ✅ `plugin/tests/unit/test_act_resolver.py` - 20 tests
- ✅ Fonctions: `find_act_root()`, `get_script()`, `ACTNotFoundError`, `ScriptNotFoundError`

### Batch 2 (Tasks 4-6) - Commit `f9c54e5`
- ✅ `validate_installation()` ajouté au resolver - 10 tests supplémentaires
- ✅ `scripts/install.sh` réécrit pour v2.0.0
- ✅ `scripts/install-local.sh` supprimé (fusionné)
- ✅ **Total: 30 tests passent**

## Ce qui RESTE À FAIRE 🔧

### Batch 3 (Tasks 7-9)

#### Task 7: Hook SessionStart
**Fichiers à créer:**
- `plugin/scripts/session_start.py`
- `plugin/hooks/hooks.json`

**Contenu session_start.py:**
```python
#!/usr/bin/env python3
"""ACT Session Start Hook - Affiche l'état du projet au démarrage."""
import json
from pathlib import Path

def main():
    epct_state = Path.cwd() / ".epct" / "state.json"
    if not epct_state.exists():
        return  # Pas un projet ACT

    try:
        with open(epct_state) as f:
            state = json.load(f)

        project_name = state.get("project", {}).get("name", "Projet")
        phase_current = state.get("phase", {}).get("current", 1)
        phase_name = state.get("phase", {}).get("name", "Discovery")
        mode = state.get("mode", "COMPLET")

        print()
        print("╭─────────────────────────────────────────────────────╮")
        print(f"│  🎯 Projet ACT : {project_name:<35} │")
        print(f"│  Phase : {phase_current} - {phase_name:<40} │")
        print(f"│  Mode  : {mode:<42} │")
        print("│  💡 Tape /act-project pour continuer                │")
        print("╰─────────────────────────────────────────────────────╯")
        print()
    except (json.JSONDecodeError, KeyError):
        pass

if __name__ == "__main__":
    main()
```

**Contenu hooks.json:**
```json
{
  "hooks": [
    {
      "event": "SessionStart",
      "command": "python3 ${CLAUDE_PLUGIN_ROOT}/scripts/session_start.py"
    }
  ]
}
```

#### Task 8: Mettre à jour act-project.md
**Fichier:** `plugin/commands/act-project.md`

**Remplacer** le bloc de résolution ACT_ROOT par:
```markdown
## Step 0b: Resolve ACT Path

```bash
ACT_ROOT=$(python3 -c "
import sys
sys.path.insert(0, '${CLAUDE_PLUGIN_ROOT:-$(pwd)/.claude/plugins/act}/scripts')
from act_resolver import find_act_root
print(find_act_root())
" 2>/dev/null)

if [ -z "$ACT_ROOT" ]; then
    echo '❌ Plugin ACT non trouvé.'
    echo '💡 Solution : curl -fsSL .../install.sh | bash'
    exit 1
fi
```

#### Task 9: Mettre à jour les autres commandes
**Fichiers:** Appliquer le même pattern à:
- `plugin/commands/act-onboard.md`
- `plugin/commands/act-next.md`
- `plugin/commands/act-status.md`
- `plugin/commands/act-resume.md`
- `plugin/commands/act-feedback.md`

### Batch 4 (Tasks 10-12)

#### Task 10: Mettre à jour plugin.json
**Fichier:** `plugin/.claude-plugin/plugin.json`
- Changer version à "2.0.0"

#### Task 11: Test d'intégration complet
1. Créer dossier test vierge
2. Exécuter `../../scripts/install.sh`
3. Vérifier structure
4. Tester le resolver avec Python

#### Task 12: Tag et release
```bash
git tag -a v2.0.0 -m "ACT Framework v2.0.0 - Installation refonte"
git push origin main --tags
```

## Fichiers de référence

- **Plan complet**: `docs/plans/2026-01-08-act-v2-installation-refonte.md`
- **Resolver**: `plugin/scripts/act_resolver.py`
- **Tests**: `plugin/tests/unit/test_act_resolver.py`

## Commandes utiles

```bash
# Lancer les tests
cd plugin && python3 -m pytest tests/unit/test_act_resolver.py -v

# Tester l'installation
mkdir -p test-apps/test-v2 && cd test-apps/test-v2 && ../../scripts/install.sh

# Vérifier le resolver
python3 -c "
import sys
sys.path.insert(0, '.claude/plugins/act/scripts')
from act_resolver import validate_installation
import json
print(json.dumps(validate_installation(), indent=2))
"
```

## Notes importantes

1. **Messages en français** - Tous les messages d'erreur doivent être en français
2. **TDD** - Chaque fonction doit avoir des tests avant implémentation
3. **30 tests passent** - Ne pas casser les tests existants
4. **Backup** - `scripts/install.sh.bak` contient l'ancien script si besoin
