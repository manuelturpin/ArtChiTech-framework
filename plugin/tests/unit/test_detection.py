#!/usr/bin/env python3
"""Tests pour detect_stack.py"""
import json
import os
import subprocess
import tempfile

DETECT_SCRIPT = os.path.join(
    os.path.dirname(__file__),
    '../../skills/project-detection/scripts/detect_stack.py'
)


def test_detect_empty_project():
    """Vérifie la détection sur projet vide"""
    with tempfile.TemporaryDirectory() as tmpdir:
        result = subprocess.run(
            ['python3', DETECT_SCRIPT],
            cwd=tmpdir,
            capture_output=True,
            text=True
        )

        assert result.returncode == 0, f"Script failed: {result.stderr}"
        data = json.loads(result.stdout)
        assert 'type' in data or 'project_type' in data, "Missing 'type' in output"
        print("✅ test_detect_empty_project PASSED")


def test_detect_webapp_project():
    """Vérifie la détection d'un projet webapp"""
    with tempfile.TemporaryDirectory() as tmpdir:
        # Créer package.json React
        package_json = {
            "name": "test-app",
            "dependencies": {
                "react": "^18.0.0",
                "react-dom": "^18.0.0"
            }
        }
        with open(os.path.join(tmpdir, 'package.json'), 'w') as f:
            json.dump(package_json, f)

        result = subprocess.run(
            ['python3', DETECT_SCRIPT],
            cwd=tmpdir,
            capture_output=True,
            text=True
        )

        assert result.returncode == 0, f"Script failed: {result.stderr}"
        output = result.stdout.lower()
        # Le script doit détecter React d'une façon ou d'une autre
        assert 'react' in output or 'webapp' in output or 'frontend' in output, f"React not detected in: {output[:200]}"
        print("✅ test_detect_webapp_project PASSED")


def test_detect_python_project():
    """Vérifie la détection d'un projet Python"""
    with tempfile.TemporaryDirectory() as tmpdir:
        # Créer requirements.txt
        with open(os.path.join(tmpdir, 'requirements.txt'), 'w') as f:
            f.write("flask==2.0.0\npytest==7.0.0\n")

        result = subprocess.run(
            ['python3', DETECT_SCRIPT],
            cwd=tmpdir,
            capture_output=True,
            text=True
        )

        assert result.returncode == 0, f"Script failed: {result.stderr}"
        output = result.stdout.lower()
        assert 'python' in output or 'flask' in output or 'backend' in output, f"Python not detected in: {output[:200]}"
        print("✅ test_detect_python_project PASSED")


if __name__ == '__main__':
    print("🧪 Running detection tests...\n")
    test_detect_empty_project()
    test_detect_webapp_project()
    test_detect_python_project()
    print("\n🎉 All detection tests passed!")
