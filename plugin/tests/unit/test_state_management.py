#!/usr/bin/env python3
"""Tests pour state_manager.py"""
import json
import os
import sys
import tempfile

# Add scripts to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../skills/state-management/scripts'))
from state_manager import init_state, read_state, update_state, checkpoint, recover, exists


def test_init_creates_epct_folder():
    """Vérifie que init crée .epct/ avec state.json"""
    with tempfile.TemporaryDirectory() as tmpdir:
        result = init_state("test-project", "webapp", ["react", "typescript"], tmpdir)

        assert os.path.exists(os.path.join(tmpdir, '.epct')), ".epct/ not created"
        assert os.path.exists(os.path.join(tmpdir, '.epct', 'state.json')), "state.json not created"
        assert result['project']['name'] == "test-project"
        assert result['phase']['current'] == 1
        print("✅ test_init_creates_epct_folder PASSED")


def test_read_returns_state():
    """Vérifie que read retourne l'état"""
    with tempfile.TemporaryDirectory() as tmpdir:
        init_state("test-project", "webapp", ["react"], tmpdir)
        result = read_state(tmpdir)

        assert result is not None, "read_state returned None"
        assert result['project']['name'] == "test-project"
        print("✅ test_read_returns_state PASSED")


def test_read_returns_none_if_no_state():
    """Vérifie que read retourne None si pas de state"""
    with tempfile.TemporaryDirectory() as tmpdir:
        result = read_state(tmpdir)
        assert result is None, "Should return None for missing state"
        print("✅ test_read_returns_none_if_no_state PASSED")


def test_update_persists_changes():
    """Vérifie que update modifie et persiste"""
    with tempfile.TemporaryDirectory() as tmpdir:
        init_state("test-project", "webapp", ["react"], tmpdir)
        update_state({"phase": {"current": 2, "name": "Stratégie"}}, tmpdir)

        result = read_state(tmpdir)
        assert result['phase']['current'] == 2, "Phase not updated"
        assert result['phase']['name'] == "Stratégie", "Phase name not updated"
        print("✅ test_update_persists_changes PASSED")


def test_checkpoint_creates_snapshot():
    """Vérifie que checkpoint sauvegarde dans history/"""
    with tempfile.TemporaryDirectory() as tmpdir:
        init_state("test-project", "webapp", ["react"], tmpdir)
        checkpoint_path = checkpoint(tmpdir)

        assert os.path.exists(checkpoint_path), f"Checkpoint not created at {checkpoint_path}"
        print("✅ test_checkpoint_creates_snapshot PASSED")


def test_recover_restores_state():
    """Vérifie que recover restaure depuis checkpoint"""
    with tempfile.TemporaryDirectory() as tmpdir:
        init_state("test-project", "webapp", ["react"], tmpdir)
        checkpoint_path = checkpoint(tmpdir)

        # Modifier l'état
        update_state({"phase": {"current": 5}}, tmpdir)
        assert read_state(tmpdir)['phase']['current'] == 5

        # Restaurer
        recover(checkpoint_path, tmpdir)
        assert read_state(tmpdir)['phase']['current'] == 1, "State not restored"
        print("✅ test_recover_restores_state PASSED")


def test_exists_returns_correct_value():
    """Vérifie que exists retourne le bon booléen"""
    with tempfile.TemporaryDirectory() as tmpdir:
        assert exists(tmpdir) == False, "Should be False before init"
        init_state("test", "webapp", [], tmpdir)
        assert exists(tmpdir) == True, "Should be True after init"
        print("✅ test_exists_returns_correct_value PASSED")


if __name__ == '__main__':
    print("🧪 Running state_management tests...\n")
    test_init_creates_epct_folder()
    test_read_returns_state()
    test_read_returns_none_if_no_state()
    test_update_persists_changes()
    test_checkpoint_creates_snapshot()
    test_recover_restores_state()
    test_exists_returns_correct_value()
    print("\n🎉 All state management tests passed!")
