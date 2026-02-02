#!/usr/bin/env python3
"""Simple test runner sans pytest"""
import sys
sys.path.insert(0, '/home/node/.openclaw/workspace/projects/lab/lab23/sandbox/taskflow/src')

def test_add_task():
    from taskflow.cli import add_task
    result = add_task("Test task")
    assert isinstance(result, dict), "Should return dict"
    assert result["title"] == "Test task", "Should have title"
    print("✓ test_add_task PASSED")

def test_list_tasks():
    """Ce test va échouer - list_tasks n'existe pas"""
    try:
        from taskflow.cli import list_tasks
        result = list_tasks()
        assert isinstance(result, list), "Should return list"
        print("✓ test_list_tasks PASSED")
    except ImportError:
        print("✗ test_list_tasks FAILED: list_tasks does not exist (ImportError)")
        return False
    return True

if __name__ == "__main__":
    print("=" * 50)
    print("TDD Test Run - Phase RED")
    print("=" * 50)
    
    test_add_task()
    success = test_list_tasks()
    
    if not success:
        print("\n🔴 RED: Tests échouent comme attendu!")
        print("   list_tasks() n'existe pas encore")
        sys.exit(1)
    else:
        print("\n🟢 GREEN: Tous les tests passent!")
        sys.exit(0)
