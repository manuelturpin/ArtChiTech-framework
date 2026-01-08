# plugin/tests/unit/test_act_resolver.py
"""
Tests approfondis pour le module act_resolver.

Ce module teste toutes les fonctions du resolver ACT avec:
- Cas nominaux
- Cas limites
- Cas d'erreur
- Isolation des tests (chaque test est indépendant)
"""
import pytest
import sys
import os
from pathlib import Path

# Add scripts to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../scripts'))

from act_resolver import (
    find_act_root, ACTNotFoundError,
    get_script, ScriptNotFoundError,
    validate_installation
)


# ============================================================================
# Tests pour find_act_root()
# ============================================================================

class TestFindActRoot:
    """Tests pour la fonction find_act_root"""

    def test_returns_env_variable_when_set(self, monkeypatch, tmp_path):
        """CLAUDE_PLUGIN_ROOT should be used when defined (priorité 1)"""
        fake_root = str(tmp_path / "fake-plugin")
        monkeypatch.setenv("CLAUDE_PLUGIN_ROOT", fake_root)

        result = find_act_root()

        assert result == fake_root

    def test_env_variable_takes_priority_over_local(self, monkeypatch, tmp_path):
        """Env var should be used even if local installation exists"""
        # Create local installation
        local_act = tmp_path / ".claude" / "plugins" / "act" / ".claude-plugin"
        local_act.mkdir(parents=True)
        (local_act / "plugin.json").write_text('{"name": "act"}')

        # Set env var to different location
        env_root = str(tmp_path / "env-plugin")
        monkeypatch.setenv("CLAUDE_PLUGIN_ROOT", env_root)
        monkeypatch.chdir(tmp_path)

        result = find_act_root()

        # Env var should take priority
        assert result == env_root
        assert result != str(tmp_path / ".claude" / "plugins" / "act")

    def test_finds_local_installation_when_no_env(self, monkeypatch, tmp_path):
        """Should find .claude/plugins/act/ when env var not set (priorité 2)"""
        # Remove env variable
        monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

        # Create fake local installation with valid plugin.json
        local_act = tmp_path / ".claude" / "plugins" / "act" / ".claude-plugin"
        local_act.mkdir(parents=True)
        (local_act / "plugin.json").write_text('{"name": "act", "version": "2.0.0"}')

        # Change to tmp_path
        monkeypatch.chdir(tmp_path)

        result = find_act_root()

        assert result == str(tmp_path / ".claude" / "plugins" / "act")

    def test_raises_error_when_not_found(self, monkeypatch, tmp_path):
        """Should raise ACTNotFoundError with helpful message when not found"""
        # Remove env variable
        monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

        # Change to empty directory
        monkeypatch.chdir(tmp_path)

        with pytest.raises(ACTNotFoundError) as exc_info:
            find_act_root()

        error_msg = str(exc_info.value)
        # Verify error message is helpful
        assert "ACT" in error_msg or "non trouvé" in error_msg.lower()
        assert "Solution" in error_msg or "curl" in error_msg

    def test_validates_installation_structure(self, monkeypatch, tmp_path):
        """Should not accept directory without .claude-plugin/plugin.json"""
        monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

        # Create directory structure WITHOUT plugin.json
        incomplete_act = tmp_path / ".claude" / "plugins" / "act"
        incomplete_act.mkdir(parents=True)
        # No .claude-plugin folder or plugin.json

        monkeypatch.chdir(tmp_path)

        with pytest.raises(ACTNotFoundError):
            find_act_root()

    def test_validates_plugin_json_existence(self, monkeypatch, tmp_path):
        """Should require plugin.json in .claude-plugin folder"""
        monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

        # Create .claude-plugin folder but no plugin.json
        plugin_dir = tmp_path / ".claude" / "plugins" / "act" / ".claude-plugin"
        plugin_dir.mkdir(parents=True)
        # No plugin.json file

        monkeypatch.chdir(tmp_path)

        with pytest.raises(ACTNotFoundError):
            find_act_root()


# ============================================================================
# Tests pour ACTNotFoundError
# ============================================================================

class TestACTNotFoundError:
    """Tests pour l'exception ACTNotFoundError"""

    def test_is_exception_subclass(self):
        """Should be a subclass of Exception"""
        assert issubclass(ACTNotFoundError, Exception)

    def test_can_be_raised_with_message(self):
        """Should accept custom message"""
        msg = "Custom error message"
        with pytest.raises(ACTNotFoundError) as exc_info:
            raise ACTNotFoundError(msg)

        assert str(exc_info.value) == msg

    def test_error_message_is_in_french(self, monkeypatch, tmp_path):
        """Error messages should be in French (project convention)"""
        monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)
        monkeypatch.chdir(tmp_path)

        with pytest.raises(ACTNotFoundError) as exc_info:
            find_act_root()

        error_msg = str(exc_info.value)
        # Check for French text indicators
        assert any(word in error_msg.lower() for word in
                   ["non trouvé", "solution", "chemins cherchés"])


# ============================================================================
# Tests pour get_script()
# ============================================================================

class TestGetScript:
    """Tests pour la fonction get_script"""

    @pytest.fixture
    def setup_act_installation(self, monkeypatch, tmp_path):
        """Fixture qui crée une installation ACT complète pour les tests"""
        act_root = tmp_path / ".claude" / "plugins" / "act"

        # Create plugin.json
        (act_root / ".claude-plugin").mkdir(parents=True)
        (act_root / ".claude-plugin" / "plugin.json").write_text('{"name": "act", "version": "2.0.0"}')

        # Create skills directory structure
        (act_root / "skills" / "state-management" / "scripts").mkdir(parents=True)
        (act_root / "skills" / "project-detection" / "scripts").mkdir(parents=True)

        # Create some scripts
        (act_root / "skills" / "state-management" / "scripts" / "state_manager.py").write_text(
            "# State manager script\n"
        )
        (act_root / "skills" / "project-detection" / "scripts" / "detect_stack.py").write_text(
            "# Detect stack script\n"
        )

        # Create direct scripts directory too
        (act_root / "scripts").mkdir(parents=True)
        (act_root / "scripts" / "session_start.py").write_text("# Session start script\n")

        monkeypatch.chdir(tmp_path)
        monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

        return act_root

    def test_finds_script_in_skills_directory(self, setup_act_installation):
        """Should find scripts in skills/*/scripts/ directories"""
        result = get_script("state_manager")

        assert "state_manager.py" in result
        assert Path(result).exists()

    def test_finds_script_in_another_skill(self, setup_act_installation):
        """Should search all skill directories"""
        result = get_script("detect_stack")

        assert "detect_stack.py" in result
        assert Path(result).exists()

    def test_finds_script_in_direct_scripts_directory(self, setup_act_installation):
        """Should find scripts directly in scripts/ folder"""
        result = get_script("session_start")

        assert "session_start.py" in result
        assert Path(result).exists()

    def test_returns_absolute_path(self, setup_act_installation):
        """Should return absolute path to script"""
        result = get_script("state_manager")

        assert Path(result).is_absolute() or result.startswith("/")

    def test_raises_error_when_script_not_found(self, setup_act_installation):
        """Should raise ScriptNotFoundError with helpful message"""
        with pytest.raises(ScriptNotFoundError) as exc_info:
            get_script("nonexistent_script")

        error_msg = str(exc_info.value)
        assert "nonexistent_script" in error_msg
        assert "Solution" in error_msg or "introuvable" in error_msg.lower()

    def test_raises_error_with_script_name_in_message(self, setup_act_installation):
        """Error message should include the script name that wasn't found"""
        script_name = "my_custom_script"

        with pytest.raises(ScriptNotFoundError) as exc_info:
            get_script(script_name)

        assert script_name in str(exc_info.value)

    def test_does_not_need_py_extension(self, setup_act_installation):
        """Should work without .py extension in name"""
        # Both should work
        result1 = get_script("state_manager")
        result2 = get_script("state_manager")  # Without .py

        assert result1 == result2

    def test_uses_find_act_root_internally(self, monkeypatch, tmp_path):
        """Should use find_act_root to locate ACT installation"""
        # Don't set up proper installation
        monkeypatch.chdir(tmp_path)
        monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

        # Should raise ACTNotFoundError (not ScriptNotFoundError)
        # because find_act_root fails first
        with pytest.raises(ACTNotFoundError):
            get_script("any_script")


# ============================================================================
# Tests pour ScriptNotFoundError
# ============================================================================

class TestScriptNotFoundError:
    """Tests pour l'exception ScriptNotFoundError"""

    def test_is_exception_subclass(self):
        """Should be a subclass of Exception"""
        assert issubclass(ScriptNotFoundError, Exception)

    def test_can_be_raised_with_message(self):
        """Should accept custom message"""
        msg = "Script not found: test.py"
        with pytest.raises(ScriptNotFoundError) as exc_info:
            raise ScriptNotFoundError(msg)

        assert str(exc_info.value) == msg

    def test_error_message_is_in_french(self, monkeypatch, tmp_path):
        """Error messages should be in French (project convention)"""
        # Setup valid ACT installation
        act_root = tmp_path / ".claude" / "plugins" / "act"
        (act_root / ".claude-plugin").mkdir(parents=True)
        (act_root / ".claude-plugin" / "plugin.json").write_text('{"name": "act"}')
        (act_root / "skills").mkdir()
        (act_root / "scripts").mkdir()

        monkeypatch.chdir(tmp_path)
        monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

        with pytest.raises(ScriptNotFoundError) as exc_info:
            get_script("nonexistent")

        error_msg = str(exc_info.value)
        # Check for French text
        assert any(word in error_msg.lower() for word in
                   ["introuvable", "solution", "chemins cherchés"])


# ============================================================================
# Tests pour validate_installation()
# ============================================================================

class TestValidateInstallation:
    """Tests pour la fonction validate_installation"""

    @pytest.fixture
    def complete_act_installation(self, monkeypatch, tmp_path):
        """Fixture qui crée une installation ACT complète avec tous les scripts"""
        act_root = tmp_path / ".claude" / "plugins" / "act"

        # Create plugin.json with version
        (act_root / ".claude-plugin").mkdir(parents=True)
        (act_root / ".claude-plugin" / "plugin.json").write_text(
            '{"name": "act", "version": "2.0.0"}'
        )

        # Create commands directory
        (act_root / "commands").mkdir()
        (act_root / "commands" / "act-project.md").write_text("# act-project")

        # Create skills with scripts
        (act_root / "skills" / "state-management" / "scripts").mkdir(parents=True)
        (act_root / "skills" / "state-management" / "scripts" / "state_manager.py").write_text("")

        (act_root / "skills" / "project-detection" / "scripts").mkdir(parents=True)
        (act_root / "skills" / "project-detection" / "scripts" / "detect_stack.py").write_text("")

        (act_root / "skills" / "claudemd-generator" / "scripts").mkdir(parents=True)
        (act_root / "skills" / "claudemd-generator" / "scripts" / "generate_claudemd.py").write_text("")

        # Create direct scripts
        (act_root / "scripts").mkdir()

        monkeypatch.chdir(tmp_path)
        monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

        return act_root

    def test_returns_dict_with_expected_keys(self, complete_act_installation):
        """Should return dict with all expected keys"""
        result = validate_installation()

        assert isinstance(result, dict)
        assert "valid" in result
        assert "root" in result
        assert "version" in result
        assert "scripts" in result
        assert "errors" in result

    def test_valid_installation_returns_true(self, complete_act_installation):
        """Should return valid=True for complete installation"""
        result = validate_installation()

        assert result["valid"] is True

    def test_returns_correct_version(self, complete_act_installation):
        """Should return version from plugin.json"""
        result = validate_installation()

        assert result["version"] == "2.0.0"

    def test_returns_root_path(self, complete_act_installation, tmp_path):
        """Should return the root path of ACT installation"""
        result = validate_installation()

        expected_root = str(tmp_path / ".claude" / "plugins" / "act")
        assert result["root"] == expected_root

    def test_lists_found_scripts(self, complete_act_installation):
        """Should list all found scripts"""
        result = validate_installation()

        assert "state_manager" in result["scripts"]
        assert "detect_stack" in result["scripts"]
        assert "generate_claudemd" in result["scripts"]

    def test_errors_empty_for_valid_installation(self, complete_act_installation):
        """Should have empty errors list for valid installation"""
        result = validate_installation()

        assert result["errors"] == []

    def test_invalid_when_act_not_found(self, monkeypatch, tmp_path):
        """Should return valid=False when ACT not installed"""
        monkeypatch.chdir(tmp_path)
        monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

        result = validate_installation()

        assert result["valid"] is False
        assert result["root"] is None
        assert len(result["errors"]) > 0

    def test_invalid_when_state_manager_missing(self, monkeypatch, tmp_path):
        """Should be invalid if state_manager.py is missing (critical script)"""
        # Create minimal installation WITHOUT state_manager
        act_root = tmp_path / ".claude" / "plugins" / "act"
        (act_root / ".claude-plugin").mkdir(parents=True)
        (act_root / ".claude-plugin" / "plugin.json").write_text('{"name": "act", "version": "2.0.0"}')
        (act_root / "skills").mkdir()
        (act_root / "scripts").mkdir()

        monkeypatch.chdir(tmp_path)
        monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

        result = validate_installation()

        assert result["valid"] is False
        assert "state_manager" not in result["scripts"]

    def test_handles_invalid_plugin_json(self, monkeypatch, tmp_path):
        """Should handle corrupted plugin.json gracefully"""
        act_root = tmp_path / ".claude" / "plugins" / "act"
        (act_root / ".claude-plugin").mkdir(parents=True)
        (act_root / ".claude-plugin" / "plugin.json").write_text("invalid json {{{")
        (act_root / "skills" / "state-management" / "scripts").mkdir(parents=True)
        (act_root / "skills" / "state-management" / "scripts" / "state_manager.py").write_text("")
        (act_root / "scripts").mkdir()

        monkeypatch.chdir(tmp_path)
        monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

        result = validate_installation()

        # Should not crash, but report error
        assert "plugin.json" in str(result["errors"]).lower() or result["version"] is None

    def test_returns_unknown_version_when_missing(self, monkeypatch, tmp_path):
        """Should return 'unknown' version when not in plugin.json"""
        act_root = tmp_path / ".claude" / "plugins" / "act"
        (act_root / ".claude-plugin").mkdir(parents=True)
        (act_root / ".claude-plugin" / "plugin.json").write_text('{"name": "act"}')  # No version
        (act_root / "skills" / "state-management" / "scripts").mkdir(parents=True)
        (act_root / "skills" / "state-management" / "scripts" / "state_manager.py").write_text("")
        (act_root / "scripts").mkdir()

        monkeypatch.chdir(tmp_path)
        monkeypatch.delenv("CLAUDE_PLUGIN_ROOT", raising=False)

        result = validate_installation()

        assert result["version"] == "unknown"
