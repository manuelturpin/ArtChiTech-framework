#!/usr/bin/env python3
"""
ACT Resolver - Point central pour la découverte des chemins ACT.

Ce module est le coeur du système de résolution de chemins pour le framework ACT.
Il permet de trouver l'installation ACT de manière robuste, quel que soit
le mode d'installation (local, global, ou via CLAUDE_PLUGIN_ROOT).

Priorités de recherche:
1. $CLAUDE_PLUGIN_ROOT (défini par Claude Code lors de l'exécution d'un plugin)
2. .claude/plugins/act/ (installation locale dans le projet courant)
3. ~/.claude/plugins/cache/manuelturpin/act/ (installation globale)

Utilisation:
    from act_resolver import find_act_root, get_script, validate_installation

    # Trouver la racine ACT
    root = find_act_root()

    # Trouver un script spécifique
    script_path = get_script("state_manager")

    # Valider l'installation
    status = validate_installation()
"""
import os
from pathlib import Path


class ACTNotFoundError(Exception):
    """
    Exception levée lorsque l'installation ACT ne peut pas être trouvée.

    Cette erreur contient un message d'aide en français avec:
    - La cause probable de l'erreur
    - La solution recommandée (commande d'installation)
    - Les chemins qui ont été vérifiés
    """
    pass


def find_act_root() -> str:
    """
    Trouve le dossier racine d'ACT.

    Ordre de priorité:
    1. $CLAUDE_PLUGIN_ROOT (défini par Claude Code)
    2. .claude/plugins/act/ (installation locale)
    3. ~/.claude/plugins/cache/manuelturpin/act/ (installation globale)

    Returns:
        str: Chemin absolu vers le dossier racine ACT

    Raises:
        ACTNotFoundError: Si ACT n'est pas trouvé dans aucun des emplacements
                          attendus. Le message d'erreur contient les chemins
                          cherchés et la commande d'installation.

    Example:
        >>> root = find_act_root()
        >>> print(root)
        '/path/to/.claude/plugins/act'
    """
    # 1. Variable d'environnement (priorité maximale)
    # Claude Code définit CLAUDE_PLUGIN_ROOT quand il exécute un plugin
    env_root = os.environ.get("CLAUDE_PLUGIN_ROOT")
    if env_root:
        return env_root

    # 2. Installation locale (dans le projet courant)
    local_path = Path.cwd() / ".claude" / "plugins" / "act"
    if _is_valid_act_installation(local_path):
        return str(local_path)

    # 3. Installation globale (cache utilisateur)
    global_path = Path.home() / ".claude" / "plugins" / "cache" / "manuelturpin" / "act"
    if _is_valid_act_installation(global_path):
        return str(global_path)

    # 4. Non trouvé - lever une erreur avec message d'aide
    raise ACTNotFoundError(
        "❌ Plugin ACT non trouvé.\n\n"
        "Cause probable : ACT n'est pas installé dans ce projet.\n\n"
        "💡 Solution :\n"
        "   curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash\n\n"
        "📍 Chemins cherchés :\n"
        f"   - {local_path}\n"
        f"   - {global_path}"
    )


def _is_valid_act_installation(path: Path) -> bool:
    """
    Vérifie si un chemin contient une installation ACT valide.

    Une installation est considérée valide si elle contient
    le fichier .claude-plugin/plugin.json.

    Args:
        path: Chemin à vérifier

    Returns:
        bool: True si l'installation est valide, False sinon
    """
    plugin_json = path / ".claude-plugin" / "plugin.json"
    return plugin_json.exists()


class ScriptNotFoundError(Exception):
    """
    Exception levée lorsqu'un script requis ne peut pas être trouvé.

    Cette erreur contient un message d'aide en français avec:
    - Le nom du script recherché
    - La cause probable de l'erreur
    - La solution recommandée
    - Les chemins qui ont été vérifiés
    """
    pass


def get_script(name: str) -> str:
    """
    Trouve le chemin d'un script Python ACT.

    Cherche le script dans plusieurs emplacements:
    1. skills/*/scripts/ - Scripts spécifiques aux skills
    2. scripts/ - Scripts généraux

    Args:
        name: Nom du script sans extension .py (ex: "state_manager")

    Returns:
        str: Chemin absolu vers le script

    Raises:
        ACTNotFoundError: Si l'installation ACT n'est pas trouvée
        ScriptNotFoundError: Si le script n'est pas trouvé dans l'installation

    Example:
        >>> path = get_script("state_manager")
        >>> print(path)
        '/path/to/act/skills/state-management/scripts/state_manager.py'
    """
    act_root = Path(find_act_root())
    script_name = f"{name}.py"

    # 1. Chercher dans skills/*/scripts/
    skills_dir = act_root / "skills"
    if skills_dir.exists():
        for skill_dir in skills_dir.iterdir():
            if skill_dir.is_dir():
                script_path = skill_dir / "scripts" / script_name
                if script_path.exists():
                    return str(script_path)

    # 2. Chercher directement dans scripts/
    direct_path = act_root / "scripts" / script_name
    if direct_path.exists():
        return str(direct_path)

    # 3. Non trouvé - lever une erreur avec message d'aide
    raise ScriptNotFoundError(
        f"❌ Script '{script_name}' introuvable.\n\n"
        f"Cause probable : Le script n'existe pas ou ACT n'est pas installé correctement.\n\n"
        f"💡 Solution :\n"
        f"   curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash\n\n"
        f"📍 Chemins cherchés :\n"
        f"   - {act_root}/skills/*/scripts/{script_name}\n"
        f"   - {act_root}/scripts/{script_name}"
    )
