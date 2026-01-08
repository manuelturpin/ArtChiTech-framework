# ACT v2.0.0 - Refonte Installation

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Refondre le système d'installation ACT pour qu'il soit robuste, auto-découvrant, et avec des messages d'erreur clairs.

**Architecture:** Un module resolver central (`act_resolver.py`) gère la découverte des chemins. Les commandes l'utilisent au lieu de chemins hardcodés. Un hook SessionStart affiche l'état du projet au démarrage.

**Tech Stack:** Python 3.11+, Markdown, Bash, Claude Code Plugin API

---

## Phase 1 : Module Resolver

### Task 1: Créer le squelette du resolver

**Files:**
- Create: `plugin/scripts/act_resolver.py`
- Create: `plugin/scripts/__init__.py`
- Test: `plugin/tests/unit/test_act_resolver.py`

**Step 1: Write the failing test**

```python
# plugin/tests/unit/test_act_resolver.py
import pytest
import sys
import os

# Add scripts to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../scripts'))

from act_resolver import find_act_root, ACTNotFoundError

def test_find_act_root_returns_env_variable_when_set(monkeypatch, tmp_path):
    """CLAUDE_PLUGIN_ROOT should be used when defined"""
    fake_root = str(tmp_path / "fake-plugin")
    monkeypatch.setenv("CLAUDE_PLUGIN_ROOT", fake_root)

    result = find_act_root()

    assert result == fake_root
```

**Step 2: Run test to verify it fails**

Run: `cd plugin && python -m pytest tests/unit/test_act_resolver.py::test_find_act_root_returns_env_variable_when_set -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'act_resolver'"

**Step 3: Write minimal implementation**

```python
# plugin/scripts/__init__.py
# Empty file to make this a package
```

```python
# plugin/scripts/act_resolver.py
#!/usr/bin/env python3
"""
ACT Resolver - Point central pour la découverte des chemins ACT.
"""
import os
from pathlib import Path


class ACTNotFoundError(Exception):
    """Raised when ACT installation cannot be found"""
    pass


def find_act_root() -> str:
    """
    Trouve le dossier racine d'ACT.

    Ordre de priorité:
    1. $CLAUDE_PLUGIN_ROOT (défini par Claude Code)
    2. .claude/plugins/act/ (installation locale)
    3. ~/.claude/plugins/cache/manuelturpin/act/ (installation globale)

    Returns:
        str: Chemin vers le dossier racine ACT

    Raises:
        ACTNotFoundError: Si ACT n'est pas trouvé
    """
    # 1. Variable d'environnement (priorité maximale)
    env_root = os.environ.get("CLAUDE_PLUGIN_ROOT")
    if env_root:
        return env_root

    # 2. Installation locale
    local_path = Path.cwd() / ".claude" / "plugins" / "act"
    if _is_valid_act_installation(local_path):
        return str(local_path)

    # 3. Installation globale
    global_path = Path.home() / ".claude" / "plugins" / "cache" / "manuelturpin" / "act"
    if _is_valid_act_installation(global_path):
        return str(global_path)

    # 4. Non trouvé
    raise ACTNotFoundError(
        "❌ Plugin ACT non trouvé.\n\n"
        "💡 Solution :\n"
        "   curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash\n\n"
        "📍 Chemins cherchés :\n"
        f"   - {local_path}\n"
        f"   - {global_path}"
    )


def _is_valid_act_installation(path: Path) -> bool:
    """Vérifie si un chemin contient une installation ACT valide"""
    plugin_json = path / ".claude-plugin" / "plugin.json"
    return plugin_json.exists()
```

**Step 4: Run test to verify it passes**

Run: `cd plugin && python -m pytest tests/unit/test_act_resolver.py::test_find_act_root_returns_env_variable_when_set -v`
Expected: PASS

**Step 5: Commit**

```bash
git add plugin/scripts/act_resolver.py plugin/scripts/__init__.py plugin/tests/unit/test_act_resolver.py
git commit -m "feat(resolver): add act_resolver module with find_act_root"
```

---

### Task 2: Ajouter la détection locale

**Files:**
- Modify: `plugin/scripts/act_resolver.py`
- Modify: `plugin/tests/unit/test_act_resolver.py`

**Step 1: Write the failing test**

```python
# Ajouter à plugin/tests/unit/test_act_resolver.py

def test_find_act_root_finds_local_installation(monkeypatch, tmp_path):
    """Should find .claude/plugins/act/ when it exists"""
    # Remove env variable
    monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

    # Create fake local installation
    local_act = tmp_path / ".claude" / "plugins" / "act" / ".claude-plugin"
    local_act.mkdir(parents=True)
    (local_act / "plugin.json").write_text('{"name": "act", "version": "2.0.0"}')

    # Change to tmp_path
    monkeypatch.chdir(tmp_path)

    result = find_act_root()

    assert result == str(tmp_path / ".claude" / "plugins" / "act")
```

**Step 2: Run test to verify it passes (already implemented)**

Run: `cd plugin && python -m pytest tests/unit/test_act_resolver.py::test_find_act_root_finds_local_installation -v`
Expected: PASS (déjà implémenté dans Task 1)

**Step 3: Commit**

```bash
git add plugin/tests/unit/test_act_resolver.py
git commit -m "test(resolver): add test for local installation detection"
```

---

### Task 3: Ajouter la fonction get_script

**Files:**
- Modify: `plugin/scripts/act_resolver.py`
- Modify: `plugin/tests/unit/test_act_resolver.py`

**Step 1: Write the failing test**

```python
# Ajouter à plugin/tests/unit/test_act_resolver.py

from act_resolver import get_script, ScriptNotFoundError

def test_get_script_finds_state_manager(monkeypatch, tmp_path):
    """Should find state_manager.py in skills directory"""
    # Setup fake ACT installation
    act_root = tmp_path / ".claude" / "plugins" / "act"
    (act_root / ".claude-plugin").mkdir(parents=True)
    (act_root / ".claude-plugin" / "plugin.json").write_text('{"name": "act"}')

    # Create state_manager.py
    script_dir = act_root / "skills" / "state-management" / "scripts"
    script_dir.mkdir(parents=True)
    (script_dir / "state_manager.py").write_text("# state manager")

    monkeypatch.chdir(tmp_path)
    monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

    result = get_script("state_manager")

    assert "state_manager.py" in result
    assert Path(result).exists()


def test_get_script_raises_when_not_found(monkeypatch, tmp_path):
    """Should raise ScriptNotFoundError with helpful message"""
    # Setup fake ACT installation without script
    act_root = tmp_path / ".claude" / "plugins" / "act"
    (act_root / ".claude-plugin").mkdir(parents=True)
    (act_root / ".claude-plugin" / "plugin.json").write_text('{"name": "act"}')

    monkeypatch.chdir(tmp_path)
    monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

    with pytest.raises(ScriptNotFoundError) as exc_info:
        get_script("nonexistent_script")

    assert "nonexistent_script" in str(exc_info.value)
    assert "Solution" in str(exc_info.value)
```

**Step 2: Run test to verify it fails**

Run: `cd plugin && python -m pytest tests/unit/test_act_resolver.py::test_get_script_finds_state_manager -v`
Expected: FAIL with "cannot import name 'get_script'"

**Step 3: Write implementation**

```python
# Ajouter à plugin/scripts/act_resolver.py

class ScriptNotFoundError(Exception):
    """Raised when a required script cannot be found"""
    pass


def get_script(name: str) -> str:
    """
    Trouve le chemin d'un script Python ACT.

    Cherche dans skills/*/scripts/ pour le script demandé.

    Args:
        name: Nom du script sans extension (ex: "state_manager")

    Returns:
        str: Chemin complet vers le script

    Raises:
        ScriptNotFoundError: Si le script n'est pas trouvé
    """
    act_root = Path(find_act_root())
    script_name = f"{name}.py"

    # Chercher dans skills/*/scripts/
    skills_dir = act_root / "skills"
    if skills_dir.exists():
        for skill_dir in skills_dir.iterdir():
            if skill_dir.is_dir():
                script_path = skill_dir / "scripts" / script_name
                if script_path.exists():
                    return str(script_path)

    # Chercher directement dans scripts/
    direct_path = act_root / "scripts" / script_name
    if direct_path.exists():
        return str(direct_path)

    raise ScriptNotFoundError(
        f"❌ Script '{script_name}' introuvable.\n\n"
        f"Cause probable : ACT n'est pas installé correctement.\n\n"
        f"💡 Solution :\n"
        f"   curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash\n\n"
        f"📍 Chemins cherchés :\n"
        f"   - {act_root}/skills/*/scripts/{script_name}\n"
        f"   - {act_root}/scripts/{script_name}"
    )
```

**Step 4: Run tests to verify they pass**

Run: `cd plugin && python -m pytest tests/unit/test_act_resolver.py -v`
Expected: All tests PASS

**Step 5: Commit**

```bash
git add plugin/scripts/act_resolver.py plugin/tests/unit/test_act_resolver.py
git commit -m "feat(resolver): add get_script function for script discovery"
```

---

### Task 4: Ajouter validate_installation

**Files:**
- Modify: `plugin/scripts/act_resolver.py`
- Modify: `plugin/tests/unit/test_act_resolver.py`

**Step 1: Write the failing test**

```python
# Ajouter à plugin/tests/unit/test_act_resolver.py

from act_resolver import validate_installation

def test_validate_installation_returns_status(monkeypatch, tmp_path):
    """Should return dict with installation status"""
    # Setup complete ACT installation
    act_root = tmp_path / ".claude" / "plugins" / "act"
    (act_root / ".claude-plugin").mkdir(parents=True)
    (act_root / ".claude-plugin" / "plugin.json").write_text('{"name": "act", "version": "2.0.0"}')
    (act_root / "commands").mkdir()
    (act_root / "skills" / "state-management" / "scripts").mkdir(parents=True)
    (act_root / "skills" / "state-management" / "scripts" / "state_manager.py").write_text("")

    monkeypatch.chdir(tmp_path)
    monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

    result = validate_installation()

    assert result["valid"] == True
    assert result["version"] == "2.0.0"
    assert "state_manager" in result["scripts"]
```

**Step 2: Run test to verify it fails**

Run: `cd plugin && python -m pytest tests/unit/test_act_resolver.py::test_validate_installation_returns_status -v`
Expected: FAIL with "cannot import name 'validate_installation'"

**Step 3: Write implementation**

```python
# Ajouter à plugin/scripts/act_resolver.py
import json

def validate_installation() -> dict:
    """
    Valide l'installation ACT et retourne un rapport.

    Returns:
        dict: {
            "valid": bool,
            "root": str,
            "version": str,
            "scripts": list[str],
            "errors": list[str]
        }
    """
    result = {
        "valid": False,
        "root": None,
        "version": None,
        "scripts": [],
        "errors": []
    }

    try:
        act_root = Path(find_act_root())
        result["root"] = str(act_root)
    except ACTNotFoundError as e:
        result["errors"].append(str(e))
        return result

    # Lire la version
    plugin_json = act_root / ".claude-plugin" / "plugin.json"
    if plugin_json.exists():
        try:
            with open(plugin_json) as f:
                data = json.load(f)
                result["version"] = data.get("version", "unknown")
        except json.JSONDecodeError:
            result["errors"].append("plugin.json invalide")

    # Lister les scripts disponibles
    scripts_to_check = ["state_manager", "detect_stack", "generate_claudemd"]
    for script_name in scripts_to_check:
        try:
            get_script(script_name)
            result["scripts"].append(script_name)
        except ScriptNotFoundError:
            pass

    # Valide si au moins state_manager est présent
    result["valid"] = "state_manager" in result["scripts"]

    return result
```

**Step 4: Run tests to verify they pass**

Run: `cd plugin && python -m pytest tests/unit/test_act_resolver.py -v`
Expected: All tests PASS

**Step 5: Commit**

```bash
git add plugin/scripts/act_resolver.py plugin/tests/unit/test_act_resolver.py
git commit -m "feat(resolver): add validate_installation function"
```

---

## Phase 2 : Nouvelle Structure d'Installation

### Task 5: Créer le nouveau script d'installation

**Files:**
- Modify: `scripts/install.sh`

**Step 1: Backup old script**

```bash
cp scripts/install.sh scripts/install.sh.bak
```

**Step 2: Write new install.sh**

```bash
#!/bin/bash
# =============================================================================
# ACT Framework - Script d'installation unifié
# Version: 2.0.0
# =============================================================================

set -e

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
REPO_URL="https://github.com/manuelturpin/ArtChiTech-framework"
REPO_RAW="https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main"
INSTALL_DIR=".claude/plugins/act"
VERSION="2.0.0"

# Fonctions utilitaires
print_header() {
    echo -e "\n${BLUE}╭─────────────────────────────────────────────────────────────╮${NC}"
    echo -e "${BLUE}│${NC}  🚀 ACT Framework - Installation v${VERSION}                    ${BLUE}│${NC}"
    echo -e "${BLUE}╰─────────────────────────────────────────────────────────────╯${NC}\n"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Détecter le mode d'installation
detect_mode() {
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)"

    # Si on est dans le repo ACT (dev mode)
    if [ -f "$SCRIPT_DIR/../plugin/.claude-plugin/plugin.json" ]; then
        MODE="local"
        SOURCE_DIR="$SCRIPT_DIR/../plugin"
        echo -e "${YELLOW}📍 Mode développeur détecté${NC}"
    else
        MODE="remote"
        SOURCE_DIR=""
        echo -e "${BLUE}📍 Installation depuis GitHub${NC}"
    fi
}

# Créer la structure d'installation
create_structure() {
    echo -e "\n📁 Création de la structure..."

    mkdir -p "$INSTALL_DIR/.claude-plugin"
    mkdir -p "$INSTALL_DIR/commands"
    mkdir -p "$INSTALL_DIR/skills"
    mkdir -p "$INSTALL_DIR/scripts"
    mkdir -p "$INSTALL_DIR/agents"
    mkdir -p "$INSTALL_DIR/references"
    mkdir -p "$INSTALL_DIR/hooks"

    print_success "Structure créée: $INSTALL_DIR"
}

# Copier les fichiers (mode local)
copy_local() {
    echo -e "\n📦 Copie des fichiers..."

    cp -r "$SOURCE_DIR/.claude-plugin/"* "$INSTALL_DIR/.claude-plugin/"
    cp -r "$SOURCE_DIR/commands/"* "$INSTALL_DIR/commands/"
    cp -r "$SOURCE_DIR/skills/"* "$INSTALL_DIR/skills/"
    cp -r "$SOURCE_DIR/agents/"* "$INSTALL_DIR/agents/"
    cp -r "$SOURCE_DIR/references/"* "$INSTALL_DIR/references/"

    # Copier le resolver
    cp "$SOURCE_DIR/scripts/act_resolver.py" "$INSTALL_DIR/scripts/"
    cp "$SOURCE_DIR/scripts/__init__.py" "$INSTALL_DIR/scripts/" 2>/dev/null || true

    # Copier les hooks si présents
    if [ -d "$SOURCE_DIR/hooks" ]; then
        cp -r "$SOURCE_DIR/hooks/"* "$INSTALL_DIR/hooks/"
    fi

    print_success "Fichiers copiés"
}

# Télécharger les fichiers (mode remote)
download_remote() {
    echo -e "\n📥 Téléchargement depuis GitHub..."

    # TODO: Implémenter le téléchargement via curl/wget
    # Pour l'instant, utiliser git clone sparse

    if command -v git &> /dev/null; then
        TMP_DIR=$(mktemp -d)
        git clone --depth 1 --filter=blob:none --sparse "$REPO_URL" "$TMP_DIR" 2>/dev/null
        cd "$TMP_DIR"
        git sparse-checkout set plugin
        cd - > /dev/null

        cp -r "$TMP_DIR/plugin/"* "$INSTALL_DIR/"
        rm -rf "$TMP_DIR"

        print_success "Téléchargement terminé"
    else
        print_error "Git requis pour l'installation remote"
        exit 1
    fi
}

# Afficher le résumé
print_summary() {
    echo -e "\n${GREEN}╭─────────────────────────────────────────────────────────────╮${NC}"
    echo -e "${GREEN}│${NC}  ✅ ACT Framework installé avec succès !                    ${GREEN}│${NC}"
    echo -e "${GREEN}╰─────────────────────────────────────────────────────────────╯${NC}"
    echo ""
    echo -e "📍 Emplacement : ${BLUE}$INSTALL_DIR${NC}"
    echo -e "📦 Version     : ${BLUE}$VERSION${NC}"
    echo ""
    echo -e "Commandes disponibles :"
    echo -e "  ${YELLOW}/act-project${NC}  → Hub principal"
    echo -e "  ${YELLOW}/act-onboard${NC}  → Auditer ce projet"
    echo -e "  ${YELLOW}/act-status${NC}   → Voir l'état"
    echo ""
    echo -e "🚀 Lance ${YELLOW}/act-project${NC} pour commencer !"
    echo ""
}

# Main
main() {
    print_header
    detect_mode
    create_structure

    if [ "$MODE" = "local" ]; then
        copy_local
    else
        download_remote
    fi

    print_summary
}

main "$@"
```

**Step 3: Make executable and test**

Run: `chmod +x scripts/install.sh && ./scripts/install.sh`
Expected: Installation réussie avec message de succès

**Step 4: Commit**

```bash
git add scripts/install.sh
git commit -m "feat(install): rewrite install.sh for v2.0.0 structure"
```

---

### Task 6: Supprimer install-local.sh

**Files:**
- Delete: `scripts/install-local.sh`

**Step 1: Remove file**

```bash
rm scripts/install-local.sh
```

**Step 2: Commit**

```bash
git add -A
git commit -m "chore: remove install-local.sh (merged into install.sh)"
```

---

## Phase 3 : Hook SessionStart

### Task 7: Créer le script de session start

**Files:**
- Create: `plugin/scripts/session_start.py`
- Create: `plugin/hooks/hooks.json`

**Step 1: Write session_start.py**

```python
#!/usr/bin/env python3
"""
ACT Session Start Hook
Affiche l'état du projet ACT au démarrage de session.
"""
import json
import sys
from pathlib import Path

# Add scripts to path
script_dir = Path(__file__).parent
sys.path.insert(0, str(script_dir))

def main():
    # Vérifier si c'est un projet ACT
    epct_state = Path.cwd() / ".epct" / "state.json"

    if not epct_state.exists():
        # Pas un projet ACT, sortir silencieusement
        return

    try:
        with open(epct_state) as f:
            state = json.load(f)

        project_name = state.get("project", {}).get("name", "Projet")
        phase_current = state.get("phase", {}).get("current", 1)
        phase_name = state.get("phase", {}).get("name", "Discovery")
        mode = state.get("mode", "COMPLET")

        # Calculer le score de la phase actuelle
        phase_key = phase_name.lower()
        scores = state.get("scores", {})
        current_score = scores.get(phase_key, 0)

        # Afficher le résumé
        print()
        print("╭─────────────────────────────────────────────────────╮")
        print(f"│  🎯 Projet ACT : {project_name:<35} │")
        print("│                                                     │")
        print(f"│  Phase : {phase_current} - {phase_name} (score: {current_score}%){' ' * (20 - len(phase_name) - len(str(current_score)))}│")
        print(f"│  Mode  : {mode:<42} │")
        print("│                                                     │")
        print("│  💡 Tape /act-project pour continuer                │")
        print("╰─────────────────────────────────────────────────────╯")
        print()

    except (json.JSONDecodeError, KeyError) as e:
        # Fichier corrompu, ignorer
        pass

if __name__ == "__main__":
    main()
```

**Step 2: Write hooks.json**

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

**Step 3: Test manually**

Run: `cd test-apps/bonsai-tracker && python3 ../../plugin/scripts/session_start.py`
Expected: Affiche le résumé du projet

**Step 4: Commit**

```bash
git add plugin/scripts/session_start.py plugin/hooks/hooks.json
git commit -m "feat(hooks): add SessionStart hook for project status"
```

---

## Phase 4 : Mise à jour des Commandes

### Task 8: Mettre à jour act-project.md

**Files:**
- Modify: `plugin/commands/act-project.md`

**Step 1: Update ACT_ROOT resolution**

Remplacer dans `plugin/commands/act-project.md` :

```markdown
## Step 0b: Resolve ACT Path

ACT_ROOT="${CLAUDE_PLUGIN_ROOT:-.claude/plugins/act}"
```

Par :

```markdown
## Step 0b: Resolve ACT Path

```bash
# Utiliser le resolver Python pour trouver ACT
ACT_ROOT=$(python3 -c "
import sys
sys.path.insert(0, '${CLAUDE_PLUGIN_ROOT:-$(pwd)/.claude/plugins/act}/scripts')
from act_resolver import find_act_root
print(find_act_root())
" 2>/dev/null)

if [ -z "$ACT_ROOT" ]; then
    echo '❌ Plugin ACT non trouvé.'
    echo ''
    echo '💡 Solution :'
    echo '   curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash'
    exit 1
fi

echo "✅ ACT trouvé: $ACT_ROOT"
```
```

**Step 2: Commit**

```bash
git add plugin/commands/act-project.md
git commit -m "refactor(commands): use resolver in act-project"
```

---

### Task 9: Mettre à jour les autres commandes

**Files:**
- Modify: `plugin/commands/act-onboard.md`
- Modify: `plugin/commands/act-next.md`
- Modify: `plugin/commands/act-status.md`
- Modify: `plugin/commands/act-resume.md`
- Modify: `plugin/commands/act-feedback.md`

**Step 1: Apply same pattern to all commands**

Pour chaque fichier, remplacer le bloc `ACT_ROOT="${CLAUDE_PLUGIN_ROOT:-.claude/plugins/act}"` par le nouveau bloc avec le resolver (voir Task 8).

**Step 2: Commit**

```bash
git add plugin/commands/
git commit -m "refactor(commands): use resolver in all commands"
```

---

## Phase 5 : Mise à jour Version

### Task 10: Mettre à jour plugin.json

**Files:**
- Modify: `plugin/.claude-plugin/plugin.json`

**Step 1: Update version**

```json
{
  "name": "act",
  "version": "2.0.0",
  "description": "ACT (ArtChiTech) - 7-phase project management framework for Claude Code. From Discovery to Growth.",
  "author": {
    "name": "Manuel Turpin",
    "email": "manuel.turpin@gmail.com",
    "url": "https://github.com/manuelturpin"
  },
  "homepage": "https://github.com/manuelturpin/ArtChiTech-framework",
  "repository": "https://github.com/manuelturpin/ArtChiTech-framework",
  "license": "MIT",
  "keywords": [
    "framework",
    "project-management",
    "phases",
    "audit",
    "onboarding",
    "methodology",
    "tdd"
  ],
  "dependencies": {
    "plugins": ["superpowers"]
  }
}
```

**Step 2: Commit**

```bash
git add plugin/.claude-plugin/plugin.json
git commit -m "chore: bump version to 2.0.0"
```

---

## Phase 6 : Tests d'Intégration

### Task 11: Tester l'installation complète

**Step 1: Créer un dossier de test vierge**

```bash
mkdir -p test-apps/test-v2
cd test-apps/test-v2
```

**Step 2: Installer ACT**

```bash
../../scripts/install.sh
```

Expected: Installation réussie avec message de succès

**Step 3: Vérifier la structure**

```bash
ls -la .claude/plugins/act/
```

Expected: Dossiers commands/, skills/, scripts/, hooks/

**Step 4: Tester le resolver**

```bash
python3 -c "
import sys
sys.path.insert(0, '.claude/plugins/act/scripts')
from act_resolver import validate_installation
import json
print(json.dumps(validate_installation(), indent=2))
"
```

Expected: `{"valid": true, "version": "2.0.0", ...}`

**Step 5: Commit test results**

```bash
cd ../..
git add -A
git commit -m "test: verify v2.0.0 installation works"
```

---

### Task 12: Tag et release

**Step 1: Create tag**

```bash
git tag -a v2.0.0 -m "ACT Framework v2.0.0 - Installation refonte"
```

**Step 2: Push**

```bash
git push origin main --tags
```

---

## Checklist finale

- [ ] Module `act_resolver.py` créé et testé
- [ ] Nouveau `install.sh` unifié
- [ ] Hook SessionStart fonctionnel
- [ ] Toutes les commandes utilisent le resolver
- [ ] Version 2.0.0 dans plugin.json
- [ ] Tests d'intégration passent
- [ ] Tag v2.0.0 créé et pushé
