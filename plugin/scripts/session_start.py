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
