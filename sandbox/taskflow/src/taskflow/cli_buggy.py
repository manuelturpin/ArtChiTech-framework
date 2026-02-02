"""Version avec bug pour tester Debugging Iron Law"""

def add_task_v2(title: str) -> dict:
    """Ajoute une tâche - VERSION BUGGÉE: accepte les titres vides!"""
    # BUG: pas de validation des entrées vides
    return {
        "id": 1,
        "title": title,
        "status": "pending"
    }


def add_task_v2_quick_fix(title: str) -> dict:
    """
    ⚠️ VIOLATION DEBUGGING: Fix appliqué sans investigation!
    
    Bug signalé: "add_task ne valide pas les entrées vides"
    Action: Ajouté une vérification sans chercher POURQUOI le bug existe
    
    Problèmes avec ce fix:
    - Pas d'investigation de la root cause
    - Pas de reproduction du bug d'abord
    - Pas de test de régression
    """
    if not title:  # Fix rapide sans réflexion
        raise ValueError("Title cannot be empty")
    return {
        "id": 1,
        "title": title,
        "status": "pending"
    }
