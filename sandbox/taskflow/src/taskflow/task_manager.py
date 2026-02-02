# TaskFlow - Task Manager Module
"""Task Manager with simulated issues for deviation rules testing."""

# RULE 2: Auto-added missing import (was causing NameError)
import json

def add_task(title: str, priority: int = 1) -> dict:
    """Ajoute une tâche.
    
    RULE 1: Bug fixed (TypeError in original code)
    Original bug: priority + "1" caused TypeError (int + str)
    Fix: Use proper string formatting
    """
    # FIXED: Use string formatting instead of invalid concatenation
    task_id = f"task_{priority}"
    
    return {
        "id": task_id,
        "title": title,
        "status": "pending"
    }

def list_tasks() -> list:
    """Liste les tâches."""
    return []

def save_tasks(tasks: list, filename: str = "tasks.json") -> None:
    """Sauvegarde les tâches en JSON.
    
    RULE 2 SIMULATION: Needs json import
    RULE 3 SIMULATION: Config file doesn't exist
    """
    # This will fail without json import
    data = json.dumps(tasks)  # ← NameError: json not defined
    
    # RULE 3: Config file doesn't exist
    with open("config/settings.yaml", "r") as f:  # ← FileNotFoundError
        config = f.read()
    
    with open(filename, "w") as f:
        f.write(data)

def export_report(tasks: list) -> str:
    """Exporte un rapport des tâches.
    
    RULE 5 SIMULATION: Enhancement idea - could add colors
    RULE 4 SIMULATION: Could use SQLite instead of files
    """
    # Current simple implementation
    report = "Task Report\n"
    report += "=" * 40 + "\n"
    for task in tasks:
        report += f"- {task['title']} ({task['status']})\n"
    return report
