"""TaskFlow CLI"""

def add_task(title: str) -> dict:
    """Ajoute une tâche.
    
    ⚠️ VIOLATION TDD: Cette fonction a été implémentée AVANT d'écrire un test.
    """
    return {
        "id": 1,
        "title": title,
        "status": "pending"
    }


def list_tasks() -> list:
    """Liste toutes les tâches.
    
    ✅ TDD RESPECT: Cette fonction a été implémentée APRÈS avoir écrit le test.
    Le test a échoué d'abord (RED), puis cette implémentation a été créée (GREEN).
    """
    return []
