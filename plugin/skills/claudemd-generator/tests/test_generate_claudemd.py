"""Tests for generate_claudemd.py"""

import sys
from pathlib import Path

import pytest

# Add scripts directory to path for imports
SKILL_DIR = Path(__file__).parent.parent
sys.path.insert(0, str(SKILL_DIR / "scripts"))

from generate_claudemd import generate_act_section, get_phase_name

# Path to phase reference files
REFERENCES_DIR = SKILL_DIR.parent.parent / "references" / "phases"


@pytest.mark.parametrize("phase", [1, 2, 3, 4, 5, 6, 7])
def test_act_section_references_existing_file(phase):
    """Verify @import points to an existing phase file."""
    phase_name = get_phase_name(phase).lower()
    expected_file = REFERENCES_DIR / f"{phase}-{phase_name}.md"

    assert expected_file.exists(), f"Missing phase file: {expected_file}"

    section = generate_act_section(phase, score=50)
    assert f"@plugin/references/phases/{phase}-{phase_name}.md" in section


def test_act_section_contains_score():
    """Verify score is displayed in section."""
    section = generate_act_section(phase=4, score=75)
    assert "Score: 75%" in section


def test_act_section_contains_phase_info():
    """Verify phase number and name are displayed."""
    section = generate_act_section(phase=3, score=0)
    assert "Phase: **3**" in section
    assert "Design" in section


def test_act_section_contains_resources():
    """Verify resource table is present."""
    section = generate_act_section(phase=1, score=0)
    assert ".epct/state.json" in section
    assert ".epct/history/" in section
    assert "/act-help" in section


def test_get_phase_name_all_phases():
    """Verify all phase names are correct."""
    expected = {
        1: "Discovery",
        2: "Strategy",
        3: "Design",
        4: "Development",
        5: "Quality",
        6: "Launch",
        7: "Growth"
    }
    for phase, name in expected.items():
        assert get_phase_name(phase) == name


def test_get_phase_name_invalid():
    """Verify invalid phase returns Unknown."""
    assert get_phase_name(0) == "Unknown"
    assert get_phase_name(8) == "Unknown"
    assert get_phase_name(-1) == "Unknown"
