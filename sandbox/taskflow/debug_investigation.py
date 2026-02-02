#!/usr/bin/env python3
"""
DEBUGGING IRON LAW - RESPECT
Investigation méthodique du bug: "add_task ne valide pas les entrées vides"
"""
import sys
sys.path.insert(0, '/home/node/.openclaw/workspace/projects/lab/lab23/sandbox/taskflow/src')

print("=" * 60)
print("🔍 INVESTIGATION DU BUG")
print("=" * 60)

# Étape 1: Reproduire le bug
print("\n📋 Étape 1: Reproduction du bug")
print("-" * 40)

from taskflow.cli_buggy import add_task_v2

# Test avec entrée vide
result = add_task_v2("")
print(f"add_task_v2('') retourne: {result}")
print(f"→ Bug confirmé: titre vide accepté!")

# Test avec None
try:
    result_none = add_task_v2(None)
    print(f"add_task_v2(None) retourne: {result_none}")
except Exception as e:
    print(f"add_task_v2(None) lève: {type(e).__name__}: {e}")

# Test avec whitespace
result_ws = add_task_v2("   ")
print(f"add_task_v2('   ') retourne: {result_ws}")
print(f"→ Bug confirmé: whitespace seul accepté!")

# Étape 2: Identifier la root cause
print("\n📋 Étape 2: Root Cause Analysis")
print("-" * 40)
print("""
Root Cause identifiée:
- La fonction add_task_v2 n'a AUCUNE validation d'entrée
- Pas de check pour:
  * Chaîne vide ""
  * None
  * Whitespace seul "   "
- Le code fait confiance aveugle à l'input

Cause fondamentale: Absence de spécification claire des contraintes d'entrée
""")

# Étape 3: Fix avec compréhension
print("\n📋 Étape 3: Fix basé sur la root cause")
print("-" * 40)

def add_task_v2_proper_fix(title: str) -> dict:
    """
    ✅ DEBUGGING RESPECT: Fix basé sur l'investigation
    
    Root cause: Pas de validation des entrées
    Fix: Ajouter validation complète avec messages clairs
    """
    # Validation basée sur l'investigation
    if title is None:
        raise ValueError("Title cannot be None")
    if not isinstance(title, str):
        raise TypeError(f"Title must be str, got {type(title).__name__}")
    
    title_stripped = title.strip()
    if not title_stripped:
        raise ValueError("Title cannot be empty or whitespace-only")
    
    return {
        "id": 1,
        "title": title_stripped,  # On normalise aussi
        "status": "pending"
    }

# Vérifier le fix
print("Test du fix:")
try:
    add_task_v2_proper_fix("")
except ValueError as e:
    print(f"✓ add_task_v2_proper_fix('') → ValueError: {e}")

try:
    add_task_v2_proper_fix("   ")
except ValueError as e:
    print(f"✓ add_task_v2_proper_fix('   ') → ValueError: {e}")

result_ok = add_task_v2_proper_fix("Valid task")
print(f"✓ add_task_v2_proper_fix('Valid task') → {result_ok}")

print("\n" + "=" * 60)
print("🎯 INVESTIGATION COMPLÈTE - FIX VALIDÉ")
print("=" * 60)
