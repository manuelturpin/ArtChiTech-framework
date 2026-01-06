#!/usr/bin/env python3
"""
ACT Framework State Manager
Gère la création, lecture et mise à jour de .epct/state.json
"""
import json
import os
import sys
from datetime import datetime
from pathlib import Path

EPCT_DIR = ".epct"
STATE_FILE = "state.json"
HISTORY_DIR = "history/checkpoints"
SESSION_DIR = "session"


def get_epct_path(base_path: str = ".") -> Path:
    """Retourne le chemin vers .epct/"""
    return Path(base_path) / EPCT_DIR


def init_state(project_name: str, project_type: str, stack: list, base_path: str = ".") -> dict:
    """Initialise .epct/ avec un state.json par défaut"""
    epct_path = get_epct_path(base_path)

    # Créer les dossiers
    epct_path.mkdir(exist_ok=True)
    (epct_path / HISTORY_DIR).mkdir(parents=True, exist_ok=True)
    (epct_path / SESSION_DIR).mkdir(exist_ok=True)

    # État initial
    state = {
        "version": "1.0.0",
        "project": {
            "name": project_name,
            "type": project_type,
            "stack": stack,
            "created_at": datetime.now().isoformat()
        },
        "phase": {
            "current": 1,
            "name": "Discovery",
            "started_at": datetime.now().isoformat()
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
        "current_feature": None
    }

    # Écrire le fichier
    state_path = epct_path / STATE_FILE
    with open(state_path, 'w', encoding='utf-8') as f:
        json.dump(state, f, indent=2, ensure_ascii=False)

    return state


def read_state(base_path: str = ".") -> dict | None:
    """Lit l'état courant depuis .epct/state.json"""
    state_path = get_epct_path(base_path) / STATE_FILE

    if not state_path.exists():
        return None

    with open(state_path, 'r', encoding='utf-8') as f:
        return json.load(f)


def update_state(updates: dict, base_path: str = ".") -> dict:
    """Met à jour l'état avec les nouvelles valeurs"""
    state = read_state(base_path)
    if state is None:
        raise FileNotFoundError("No .epct/state.json found. Run init first.")

    # Merge récursif
    def deep_merge(base: dict, updates: dict) -> dict:
        for key, value in updates.items():
            if key in base and isinstance(base[key], dict) and isinstance(value, dict):
                deep_merge(base[key], value)
            else:
                base[key] = value
        return base

    state = deep_merge(state, updates)

    # Écrire
    state_path = get_epct_path(base_path) / STATE_FILE
    with open(state_path, 'w', encoding='utf-8') as f:
        json.dump(state, f, indent=2, ensure_ascii=False)

    return state


def checkpoint(base_path: str = ".") -> str:
    """Crée un snapshot de l'état actuel"""
    state = read_state(base_path)
    if state is None:
        raise FileNotFoundError("No state to checkpoint")

    timestamp = datetime.now().strftime("%Y-%m-%dT%H-%M-%S")
    checkpoint_path = get_epct_path(base_path) / HISTORY_DIR / f"{timestamp}.json"

    with open(checkpoint_path, 'w', encoding='utf-8') as f:
        json.dump(state, f, indent=2, ensure_ascii=False)

    return str(checkpoint_path)


def recover(checkpoint_file: str, base_path: str = ".") -> dict:
    """Restaure l'état depuis un checkpoint"""
    checkpoint_path = Path(checkpoint_file)

    if not checkpoint_path.exists():
        # Chercher dans history/checkpoints
        checkpoint_path = get_epct_path(base_path) / HISTORY_DIR / checkpoint_file

    if not checkpoint_path.exists():
        raise FileNotFoundError(f"Checkpoint not found: {checkpoint_file}")

    with open(checkpoint_path, 'r', encoding='utf-8') as f:
        state = json.load(f)

    # Écrire comme état courant
    state_path = get_epct_path(base_path) / STATE_FILE
    with open(state_path, 'w', encoding='utf-8') as f:
        json.dump(state, f, indent=2, ensure_ascii=False)

    return state


def exists(base_path: str = ".") -> bool:
    """Vérifie si .epct/ existe"""
    return (get_epct_path(base_path) / STATE_FILE).exists()


# CLI interface
if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="ACT State Manager")
    parser.add_argument("command", choices=["init", "read", "update", "checkpoint", "recover", "exists"])
    parser.add_argument("--name", help="Project name (for init)")
    parser.add_argument("--type", help="Project type (for init)")
    parser.add_argument("--stack", help="Comma-separated stack (for init)")
    parser.add_argument("--updates", help="JSON updates (for update)")
    parser.add_argument("--checkpoint-file", help="Checkpoint file (for recover)")
    parser.add_argument("--path", default=".", help="Base path")

    args = parser.parse_args()

    try:
        if args.command == "init":
            stack = args.stack.split(",") if args.stack else []
            result = init_state(args.name or "unnamed", args.type or "unknown", stack, args.path)
            print(json.dumps(result, indent=2))

        elif args.command == "read":
            result = read_state(args.path)
            if result:
                print(json.dumps(result, indent=2))
            else:
                print("null")
                sys.exit(1)

        elif args.command == "update":
            updates = json.loads(args.updates) if args.updates else {}
            result = update_state(updates, args.path)
            print(json.dumps(result, indent=2))

        elif args.command == "checkpoint":
            result = checkpoint(args.path)
            print(result)

        elif args.command == "recover":
            if not args.checkpoint_file:
                print("Error: --checkpoint-file required", file=sys.stderr)
                sys.exit(1)
            result = recover(args.checkpoint_file, args.path)
            print(json.dumps(result, indent=2))

        elif args.command == "exists":
            print("true" if exists(args.path) else "false")

    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)
