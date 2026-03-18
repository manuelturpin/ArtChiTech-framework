#!/usr/bin/env python3
"""
ACT Session Start Hook
Affiche l'état du projet ACT au démarrage de session.
"""
import re
import sys
from pathlib import Path

# Add scripts to path
script_dir = Path(__file__).parent
sys.path.insert(0, str(script_dir))

def main():
    # Vérifier si c'est un projet ACT
    act_state = Path.cwd() / ".act" / "state.md"

    if not act_state.exists():
        # Pas un projet ACT, sortir silencieusement
        return

    try:
        content = act_state.read_text(encoding='utf-8')

        # Parser les champs depuis le format Markdown de state.md
        project_name = "Projet"
        phase_current = "?"
        phase_name = ""
        progress = "0"

        for line in content.splitlines():
            line = line.strip()
            # Match "**Phase:** 3/7 (Implementation)" or "- **Phase:** 3/5"
            phase_match = re.search(r'\*\*Phase[:\s]*\*\*\s*(\d+)\s*/\s*\d+\s*(?:\(([^)]+)\))?', line)
            if phase_match:
                phase_current = phase_match.group(1)
                phase_name = phase_match.group(2) or ""

            # Match "**Progress:** 60%"
            progress_match = re.search(r'\*\*Progress[:\s]*\*\*\s*(\d+)', line)
            if progress_match:
                progress = progress_match.group(1)

            # Match "**Project:** name" or project name in header
            project_match = re.search(r'\*\*Proje[ct]t?[:\s]*\*\*\s*(.+)', line)
            if project_match:
                project_name = project_match.group(1).strip()

        phase_label = f"{phase_current} - {phase_name}" if phase_name else str(phase_current)
        padding = max(0, 20 - len(phase_label) - len(progress))

        # Afficher le résumé
        print()
        print("╭─────────────────────────────────────────────────────╮")
        print(f"│  🎯 Projet ACT : {project_name:<35} │")
        print("│                                                     │")
        print(f"│  Phase    : {phase_label:<40} │")
        print(f"│  Progress : {progress}%{' ' * (39 - len(progress))} │")
        print("│                                                     │")
        print("│  💡 Tape /act:resume pour continuer                 │")
        print("╰─────────────────────────────────────────────────────╯")
        print()

    except Exception:
        # Fichier corrompu ou illisible, ignorer
        pass

if __name__ == "__main__":
    main()
