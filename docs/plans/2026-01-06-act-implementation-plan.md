# ACT Framework Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Implement a complete Claude Code plugin for project management with 7 phases, state management, and superpowers integration.

**Architecture:** Hybrid approach - ACT orchestrates project state and phases, superpowers handles workflows (brainstorming, TDD, reviews). Commands are lightweight entry points that delegate to skills for complex logic.

**Tech Stack:** Claude Code Plugin (Markdown), Python 3.8+ (scripts), JSON (state), Bash (tests)

**Dependencies:** `superpowers` plugin (3.6.0+)

---

## Phase 1: Fondations

### Task 1.1: Restructurer le plugin

**Files:**
- Create: `plugin/skills/state-management/SKILL.md`
- Create: `plugin/skills/project-detection/SKILL.md`
- Create: `plugin/skills/phase-scoring/SKILL.md`
- Move: `plugin/scripts/detect_stack.py` → `plugin/skills/project-detection/scripts/detect_stack.py`

**Step 1: Créer la structure des dossiers skills**

```bash
mkdir -p plugin/skills/state-management/scripts
mkdir -p plugin/skills/project-detection/scripts
mkdir -p plugin/skills/phase-scoring/references
```

**Step 2: Vérifier la structure créée**

Run: `tree plugin/skills/`
Expected:
```
plugin/skills/
├── state-management/
│   └── scripts/
├── project-detection/
│   └── scripts/
└── phase-scoring/
    └── references/
```

**Step 3: Déplacer detect_stack.py**

```bash
mv plugin/scripts/detect_stack.py plugin/skills/project-detection/scripts/
```

**Step 4: Vérifier le déplacement**

Run: `ls plugin/skills/project-detection/scripts/`
Expected: `detect_stack.py`

**Step 5: Commit**

```bash
git add -A
git commit -m "refactor: restructure plugin with skills directories"
```

---

### Task 1.2: Créer SKILL.md pour project-detection

**Files:**
- Create: `plugin/skills/project-detection/SKILL.md`

**Step 1: Écrire le SKILL.md**

```markdown
---
name: project-detection
description: This skill should be used when the user needs to "detect project stack", "analyze project structure", "identify technologies", or when /projet or /onboard need to understand the current project context.
version: 1.0.0
---

# Project Detection Skill

## Purpose

Detect and analyze the current project's technology stack, structure, and type.

## Usage

Execute the detection script and return structured results:

```bash
python3 ${SKILL_DIR}/scripts/detect_stack.py
```

## Output Format

The script outputs JSON with:
- `stack`: Array of detected technologies
- `type`: Project type (webapp, api, cli, library, research)
- `structure`: Directory analysis
- `confidence`: Detection confidence score

## When to Use

- At `/projet` startup to determine context
- During `/onboard` for full project audit
- When user asks about project technologies
```

**Step 2: Vérifier le fichier créé**

Run: `head -20 plugin/skills/project-detection/SKILL.md`
Expected: YAML frontmatter with name and description

**Step 3: Commit**

```bash
git add plugin/skills/project-detection/SKILL.md
git commit -m "feat: add project-detection skill definition"
```

---

### Task 1.3: Créer state_manager.py

**Files:**
- Create: `plugin/skills/state-management/scripts/state_manager.py`

**Step 1: Écrire le script state_manager.py**

```python
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
import shutil

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
            result = recover(args.checkpoint_file, args.path)
            print(json.dumps(result, indent=2))

        elif args.command == "exists":
            print("true" if exists(args.path) else "false")

    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)
```

**Step 2: Rendre le script exécutable**

```bash
chmod +x plugin/skills/state-management/scripts/state_manager.py
```

**Step 3: Vérifier la syntaxe Python**

Run: `python3 -m py_compile plugin/skills/state-management/scripts/state_manager.py`
Expected: No output (success)

**Step 4: Commit**

```bash
git add plugin/skills/state-management/scripts/state_manager.py
git commit -m "feat: add state_manager.py for .epct/ management"
```

---

### Task 1.4: Créer SKILL.md pour state-management

**Files:**
- Create: `plugin/skills/state-management/SKILL.md`

**Step 1: Écrire le SKILL.md**

```markdown
---
name: state-management
description: This skill should be used when the user needs to "create project state", "read project status", "update phase", "save checkpoint", or when any ACT command needs to persist or retrieve project state from .epct/.
version: 1.0.0
---

# State Management Skill

## Purpose

Manage the `.epct/` directory and `state.json` file that tracks project progress through ACT phases.

## Commands

### Initialize new project state

```bash
python3 ${SKILL_DIR}/scripts/state_manager.py init --name "project-name" --type "webapp" --stack "react,typescript,vite"
```

### Read current state

```bash
python3 ${SKILL_DIR}/scripts/state_manager.py read
```

### Update state

```bash
python3 ${SKILL_DIR}/scripts/state_manager.py update --updates '{"phase": {"current": 2, "name": "Stratégie"}}'
```

### Create checkpoint

```bash
python3 ${SKILL_DIR}/scripts/state_manager.py checkpoint
```

### Recover from checkpoint

```bash
python3 ${SKILL_DIR}/scripts/state_manager.py recover --checkpoint-file "2026-01-06T10-30-00.json"
```

### Check if .epct/ exists

```bash
python3 ${SKILL_DIR}/scripts/state_manager.py exists
```

## State Structure

The `state.json` file contains:
- `project`: name, type, stack, created_at
- `phase`: current (1-7), name, started_at
- `scores`: score per phase (0-100)
- `mode`: COMPLET, FEATURE, or QUICK
- `current_feature`: active feature details (if any)

## When to Use

- `/onboard`: init after audit
- `/projet`: read to determine context
- `/next`: update phase after transition
- `/status`: read for display
- `/resume`: recover from checkpoint
```

**Step 2: Commit**

```bash
git add plugin/skills/state-management/SKILL.md
git commit -m "feat: add state-management skill definition"
```

---

### Task 1.5: Créer les tests unitaires

**Files:**
- Create: `plugin/tests/unit/test_state_management.py`
- Create: `plugin/tests/unit/test_detection.py`

**Step 1: Créer la structure de tests**

```bash
mkdir -p plugin/tests/unit
mkdir -p plugin/tests/integration
mkdir -p plugin/tests/fixtures/fake-webapp
mkdir -p plugin/tests/fixtures/fake-empty
```

**Step 2: Écrire test_state_management.py**

```python
#!/usr/bin/env python3
"""Tests pour state_manager.py"""
import json
import os
import sys
import tempfile
import shutil

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
    test_init_creates_epct_folder()
    test_read_returns_state()
    test_read_returns_none_if_no_state()
    test_update_persists_changes()
    test_checkpoint_creates_snapshot()
    test_recover_restores_state()
    test_exists_returns_correct_value()
    print("\n🎉 All state management tests passed!")
```

**Step 3: Écrire test_detection.py**

```python
#!/usr/bin/env python3
"""Tests pour detect_stack.py"""
import json
import os
import sys
import tempfile
import subprocess

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
        assert 'type' in data, "Missing 'type' in output"
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
        data = json.loads(result.stdout)
        assert 'react' in str(data).lower(), "React not detected"
        print("✅ test_detect_webapp_project PASSED")

if __name__ == '__main__':
    test_detect_empty_project()
    test_detect_webapp_project()
    print("\n🎉 All detection tests passed!")
```

**Step 4: Rendre les tests exécutables**

```bash
chmod +x plugin/tests/unit/test_state_management.py
chmod +x plugin/tests/unit/test_detection.py
```

**Step 5: Exécuter les tests state_management**

Run: `python3 plugin/tests/unit/test_state_management.py`
Expected: All tests pass with 🎉

**Step 6: Exécuter les tests detection**

Run: `python3 plugin/tests/unit/test_detection.py`
Expected: All tests pass with 🎉

**Step 7: Commit**

```bash
git add plugin/tests/
git commit -m "test: add unit tests for state-management and detection"
```

---

### Task 1.6: Mettre à jour plugin.json

**Files:**
- Modify: `plugin/.claude-plugin/plugin.json`

**Step 1: Lire le fichier actuel**

Run: `cat plugin/.claude-plugin/plugin.json`

**Step 2: Mettre à jour avec manifest complet**

```json
{
  "name": "act",
  "version": "1.0.0",
  "description": "ACT (ArtChiTech) - Framework de suivi et réalisation de projets en 7 phases pour Claude Code. De Discovery à Croissance.",
  "author": {
    "name": "Manuel Turpin",
    "email": "contact@bonsai974.re",
    "url": "https://bonsai974.re"
  },
  "homepage": "https://github.com/bonsai974/act-framework",
  "repository": "https://github.com/bonsai974/act-framework",
  "license": "MIT",
  "keywords": [
    "framework",
    "project-management",
    "phases",
    "audit",
    "onboarding",
    "methodology",
    "tdd"
  ],
  "dependencies": {
    "plugins": ["superpowers"]
  }
}
```

**Step 3: Commit**

```bash
git add plugin/.claude-plugin/plugin.json
git commit -m "feat: update plugin.json with complete manifest"
```

---

### Task 1.7: Créer fixtures de test

**Files:**
- Create: `plugin/tests/fixtures/fake-webapp/package.json`
- Create: `plugin/tests/fixtures/fake-webapp/src/App.tsx`
- Create: `plugin/tests/fixtures/fake-empty/.gitkeep`

**Step 1: Créer fake-webapp**

```bash
mkdir -p plugin/tests/fixtures/fake-webapp/src
```

**Step 2: Créer package.json**

```json
{
  "name": "fake-webapp",
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "test": "vitest"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0"
  },
  "devDependencies": {
    "@types/react": "^18.2.0",
    "typescript": "^5.0.0",
    "vite": "^5.0.0",
    "vitest": "^1.0.0"
  }
}
```

**Step 3: Créer App.tsx minimal**

```tsx
export default function App() {
  return <div>Fake Webapp</div>
}
```

**Step 4: Créer fake-empty**

```bash
touch plugin/tests/fixtures/fake-empty/.gitkeep
```

**Step 5: Commit**

```bash
git add plugin/tests/fixtures/
git commit -m "test: add fixture projects for integration tests"
```

---

### Task 1.8: Créer run_all_tests.sh

**Files:**
- Create: `plugin/tests/run_all_tests.sh`

**Step 1: Écrire le script**

```bash
#!/bin/bash
# ACT Framework - Run All Tests
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "🚀 Running ACT Framework Tests"
echo "================================"

PASS=0
FAIL=0

# Tests unitaires
echo -e "\n📦 Unit Tests"
echo "---"

if python3 unit/test_state_management.py; then
    ((PASS++))
else
    ((FAIL++))
fi

if python3 unit/test_detection.py; then
    ((PASS++))
else
    ((FAIL++))
fi

# Tests intégration (si existent)
if [ -d "integration" ] && [ "$(ls -A integration/*.sh 2>/dev/null)" ]; then
    echo -e "\n🔗 Integration Tests"
    echo "---"
    for test_file in integration/*.sh; do
        if bash "$test_file"; then
            ((PASS++))
        else
            ((FAIL++))
        fi
    done
fi

# Résumé
echo -e "\n================================"
echo "Results: $PASS passed, $FAIL failed"
echo "================================"

if [ $FAIL -eq 0 ]; then
    echo "🎉 All tests passed!"
    exit 0
else
    echo "❌ Some tests failed"
    exit 1
fi
```

**Step 2: Rendre exécutable**

```bash
chmod +x plugin/tests/run_all_tests.sh
```

**Step 3: Exécuter tous les tests Phase 1**

Run: `bash plugin/tests/run_all_tests.sh`
Expected: 🎉 All tests passed!

**Step 4: Commit**

```bash
git add plugin/tests/run_all_tests.sh
git commit -m "test: add run_all_tests.sh script"
```

---

### Task 1.9: Tag Phase 1 Complete

**Step 1: Créer tag git**

```bash
git tag -a v0.1.0-phase1 -m "Phase 1: Fondations complete"
```

**Step 2: Vérifier**

Run: `git tag -l`
Expected: `v0.1.0-phase1`

---

## Phase 2: Entrée

### Task 2.1: Créer skill phase-scoring

**Files:**
- Create: `plugin/skills/phase-scoring/SKILL.md`
- Create: `plugin/skills/phase-scoring/references/scoring-rules.md`

**Step 1: Écrire SKILL.md**

```markdown
---
name: phase-scoring
description: This skill should be used when the user needs to "calculate project score", "determine current phase", "evaluate project progress", or when /onboard needs to assess project maturity.
version: 1.0.0
---

# Phase Scoring Skill

## Purpose

Evaluate a project's progress through ACT's 7 phases and calculate scores for each.

## Scoring Process

1. **Gather Evidence**: Check for presence of artifacts per phase
2. **Calculate Scores**: 0-100 per phase based on completeness
3. **Determine Current Phase**: First phase with score < 70%
4. **Generate Recommendations**: Top 3 actions to improve

## Phase Indicators

See `references/scoring-rules.md` for detailed scoring criteria per phase.

## Usage

After running project-detection, evaluate:

1. **Discovery (Phase 1)**
   - Problem statement documented?
   - Target users defined?
   - Validation interviews done?

2. **Stratégie (Phase 2)**
   - Roadmap exists?
   - Business model defined?
   - KPIs identified?

3. **Conception (Phase 3)**
   - Architecture documented?
   - Tech stack chosen?
   - UI/UX mockups?

4. **Développement (Phase 4)**
   - Code exists?
   - Tests written?
   - CI/CD configured?

5. **Qualité (Phase 5)**
   - Test coverage > 60%?
   - No critical bugs?
   - Performance validated?

6. **Lancement (Phase 6)**
   - Deployed to production?
   - Monitoring in place?
   - Launch checklist complete?

7. **Croissance (Phase 7)**
   - Analytics tracking?
   - Feedback loop?
   - Iteration cycle?

## Output Format

```json
{
  "scores": {
    "discovery": 85,
    "strategy": 70,
    "conception": 90,
    "development": 45,
    "quality": 0,
    "launch": 0,
    "growth": 0
  },
  "current_phase": 4,
  "current_phase_name": "Développement",
  "recommendations": [
    "Augmenter la couverture de tests (actuellement ~30%)",
    "Configurer CI/CD pour les tests automatiques",
    "Documenter les API endpoints"
  ]
}
```
```

**Step 2: Écrire scoring-rules.md**

```markdown
# Scoring Rules Reference

## Phase 1: Discovery (0-100)

| Critère | Points | Comment vérifier |
|---------|--------|------------------|
| README avec problème | 30 | Grep "problem", "why", "objectif" |
| Personas/users définis | 25 | Fichier personas ou section users |
| Validation documentée | 25 | Interviews, surveys, data |
| Scope défini | 20 | MVP features listées |

## Phase 2: Stratégie (0-100)

| Critère | Points | Comment vérifier |
|---------|--------|------------------|
| Roadmap | 30 | ROADMAP.md ou docs/roadmap |
| Business model | 25 | Pricing, monetization doc |
| Competitors analysis | 25 | Benchmark doc |
| KPIs définis | 20 | Metrics doc |

## Phase 3: Conception (0-100)

| Critère | Points | Comment vérifier |
|---------|--------|------------------|
| Architecture doc | 30 | docs/architecture ou ARCHITECTURE.md |
| Tech stack documented | 25 | Stack in README |
| API specs | 25 | OpenAPI, GraphQL schema |
| UI mockups | 20 | Figma link, wireframes |

## Phase 4: Développement (0-100)

| Critère | Points | Comment vérifier |
|---------|--------|------------------|
| Code source | 25 | src/ ou lib/ non vide |
| Tests présents | 25 | tests/ ou *.test.* files |
| CI/CD configuré | 25 | .github/workflows ou .gitlab-ci |
| Documentation code | 25 | JSDoc, docstrings, comments |

## Phase 5: Qualité (0-100)

| Critère | Points | Comment vérifier |
|---------|--------|------------------|
| Coverage > 60% | 30 | Coverage report |
| Pas de bugs critiques | 30 | Issue tracker |
| Linting clean | 20 | ESLint/Prettier pass |
| Performance OK | 20 | Lighthouse, benchmarks |

## Phase 6: Lancement (0-100)

| Critère | Points | Comment vérifier |
|---------|--------|------------------|
| Déployé | 30 | URL production |
| Monitoring | 25 | Sentry, logs |
| Documentation user | 25 | User guide |
| Launch checklist | 20 | LAUNCH.md complete |

## Phase 7: Croissance (0-100)

| Critère | Points | Comment vérifier |
|---------|--------|------------------|
| Analytics | 30 | GA, Mixpanel, etc. |
| Feedback collecté | 25 | Reviews, NPS |
| Iterations faites | 25 | Changelog, releases |
| Growth metrics | 20 | Users, revenue tracked |
```

**Step 3: Commit**

```bash
git add plugin/skills/phase-scoring/
git commit -m "feat: add phase-scoring skill with scoring rules"
```

---

### Task 2.2: Réécrire /projet

**Files:**
- Modify: `plugin/commands/projet.md`

**Step 1: Lire la version actuelle**

Run: `cat plugin/commands/projet.md`

**Step 2: Réécrire en instructions Claude**

```markdown
---
name: projet
description: Hub principal ACT - Point d'entrée unique pour gérer les projets (nouveau, feature, refacto, status)
---

# /projet - Hub Principal ACT

Tu es le hub principal du framework ACT. Tu gères le point d'entrée pour tous les projets.

## Étape 1: Détection du Contexte

Exécute le script de détection :

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/project-detection/scripts/detect_stack.py
```

Puis vérifie si `.epct/` existe :

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py exists
```

## Étape 2: Déterminer le Contexte

Selon les résultats :

### Contexte A: Nouveau Projet (pas de code significatif)

Si la détection retourne `type: "research"` ou erreur, et pas de `.epct/` :

Affiche :
```
╭─────────────────────────────────────────────────────╮
│  🚀 ACT Framework - Nouveau Projet                  │
│                                                     │
│  Aucun projet actif détecté.                        │
│                                                     │
│  1. 🆕 Démarrer un nouveau projet                   │
│  2. 📖 En savoir plus sur le framework              │
│                                                     │
│  Tapez le numéro ou décrivez votre besoin...        │
╰─────────────────────────────────────────────────────╯
```

Si choix 1 → Demande nom du projet, puis utilise `superpowers:brainstorming` pour la phase Discovery.

### Contexte B: Projet Existant non-ACT (code sans .epct/)

Si code détecté mais `.epct/` n'existe pas :

Affiche :
```
📁 Projet existant détecté : [stack détectée]
🔍 Lancement de l'audit initial...
```

Puis exécute automatiquement `/onboard` (spawn la commande).

Après l'audit, reviens au menu normal (Contexte C).

### Contexte C: Projet ACT Connu (code + .epct/)

Si `.epct/state.json` existe, lis l'état :

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py read
```

Affiche le menu adapté à la phase :
```
╭─────────────────────────────────────────────────────────────╮
│  🚀 [nom-projet] | Phase: [phase-name] ([current]/7)        │
│                                                             │
│  Que voulez-vous faire ?                                    │
│                                                             │
│  1. ➕ Ajouter une feature                                  │
│  2. 🔧 Refactoring/Quick fix                                │
│  3. 📋 Voir checklist phase actuelle                        │
│  4. ⏭️  Passer à la phase suivante                          │
│  5. 📊 Voir status complet                                  │
│  6. 🔄 Ré-auditer le projet                                 │
│                                                             │
│  Tapez le numéro ou décrivez votre besoin...                │
╰─────────────────────────────────────────────────────────────╯
```

## Étape 3: Gérer le Choix

| Choix | Action |
|-------|--------|
| 1 | Demander nom feature → Update state mode=FEATURE → Spawn `superpowers:brainstorming` |
| 2 | Update state mode=QUICK → Demander description → Exécuter |
| 3 | Afficher checklist de la phase actuelle depuis `references/phases/` |
| 4 | Exécuter `/next` |
| 5 | Exécuter `/status` |
| 6 | Exécuter `/onboard` |

## Dépendances

Ce hub nécessite le plugin `superpowers` pour les workflows avancés.
```

**Step 3: Commit**

```bash
git add plugin/commands/projet.md
git commit -m "feat: rewrite /projet as Claude instructions"
```

---

### Task 2.3: Réécrire /onboard

**Files:**
- Modify: `plugin/commands/onboard.md`

**Step 1: Réécrire en instructions Claude**

```markdown
---
name: onboard
description: Auditer un projet existant et l'initialiser dans le framework ACT
---

# /onboard - Audit de Projet

Tu audites le projet courant et l'initialises dans ACT.

## Étape 1: DÉTECTION

Exécute le script de détection de stack :

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/project-detection/scripts/detect_stack.py
```

Capture et analyse le résultat JSON contenant :
- `stack` : Technologies détectées
- `type` : Type de projet (webapp, api, cli, library)
- `structure` : Analyse des dossiers

## Étape 2: SCORING

Utilise le skill `phase-scoring` pour évaluer le projet.

Pour chaque phase (1-7), vérifie les critères selon `references/scoring-rules.md` :

1. **Discovery** : README, problème défini, users
2. **Stratégie** : Roadmap, business model
3. **Conception** : Architecture, specs
4. **Développement** : Code, tests, CI
5. **Qualité** : Coverage, bugs
6. **Lancement** : Deploy, monitoring
7. **Croissance** : Analytics, feedback

Calcule un score 0-100 par phase.
La phase actuelle = première phase avec score < 70%.

## Étape 3: RAPPORT

Affiche le rapport visuel :

```
╭───────────────────────────────────────────────────────────────╮
│  📊 Audit ACT : [nom-projet]                                  │
│                                                               │
│  Stack détectée : [technologies]                              │
│  Type : [type]                                                │
│                                                               │
│  ═══════════════════════════════════════════════════════════  │
│                                                               │
│  Phases                              Score                    │
│  ───────────────────────────────────────────                  │
│  ✅ 1. Discovery                     [██████████] 85%         │
│  ✅ 2. Stratégie                     [███████░░░] 70%         │
│  ✅ 3. Conception                    [█████████░] 90%         │
│  🔄 4. Développement                 [████░░░░░░] 45%  ←      │
│  ⬚ 5. Qualité                       [░░░░░░░░░░] 0%          │
│  ⬚ 6. Lancement                     [░░░░░░░░░░] 0%          │
│  ⬚ 7. Croissance                    [░░░░░░░░░░] 0%          │
│                                                               │
│  Score global : 42%                                           │
│  Phase actuelle : Développement (4/7)                         │
╰───────────────────────────────────────────────────────────────╯
```

## Étape 4: RECOMMANDATIONS

Génère les 3 recommandations prioritaires :

```
📋 Actions Recommandées :

1. 🔴 [Haute] Augmenter la couverture de tests
   → Actuellement ~30%, objectif 60%

2. 🟡 [Moyenne] Configurer CI/CD
   → Ajouter GitHub Actions pour tests auto

3. 🟢 [Basse] Documenter les API
   → Ajouter OpenAPI specs
```

## Étape 5: INITIALISATION

Crée ou met à jour `.epct/state.json` :

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py init \
  --name "[nom-projet]" \
  --type "[type]" \
  --stack "[stack-comma-separated]"
```

Puis met à jour avec les scores :

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py update \
  --updates '{"phase": {"current": [phase], "name": "[phase-name]"}, "scores": {...}}'
```

## Étape 6: CONFIRMATION

Affiche :
```
✅ Projet initialisé dans ACT !

📁 État sauvegardé dans .epct/state.json
🎯 Phase actuelle : [phase-name]
💡 Prochaine action : [première recommandation]

Tapez /projet pour accéder au menu principal.
```
```

**Step 2: Commit**

```bash
git add plugin/commands/onboard.md
git commit -m "feat: rewrite /onboard as Claude instructions"
```

---

### Task 2.4: Créer tests d'intégration Phase 2

**Files:**
- Create: `plugin/tests/integration/test_onboard_flow.sh`
- Create: `plugin/tests/integration/test_projet_flow.sh`

**Step 1: Écrire test_onboard_flow.sh**

```bash
#!/bin/bash
# Test du flux /onboard
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
FIXTURES="$SCRIPT_DIR/../fixtures"
SKILLS="$SCRIPT_DIR/../../skills"
TEMP_DIR=$(mktemp -d)

cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

echo "🧪 Test: /onboard flow"

# Setup - copier fake-webapp
cp -r "$FIXTURES/fake-webapp" "$TEMP_DIR/test-project"
cd "$TEMP_DIR/test-project"

# 1. Vérifier pas de .epct/ au départ
if [ -d ".epct" ]; then
    echo "❌ FAIL: .epct/ existe déjà"
    exit 1
fi
echo "  ✓ Pas de .epct/ au départ"

# 2. Exécuter détection
DETECTION=$(python3 "$SKILLS/project-detection/scripts/detect_stack.py" 2>/dev/null || echo '{"type":"unknown"}')
if ! echo "$DETECTION" | grep -q "type"; then
    echo "❌ FAIL: Détection échouée"
    exit 1
fi
echo "  ✓ Détection réussie"

# 3. Simuler initialisation state
python3 "$SKILLS/state-management/scripts/state_manager.py" init \
    --name "test-project" \
    --type "webapp" \
    --stack "react,typescript" > /dev/null

# 4. Vérifier .epct/ créé
if [ ! -f ".epct/state.json" ]; then
    echo "❌ FAIL: state.json non créé"
    exit 1
fi
echo "  ✓ state.json créé"

# 5. Vérifier contenu state
STATE=$(python3 "$SKILLS/state-management/scripts/state_manager.py" read)
if ! echo "$STATE" | grep -q '"current": 1'; then
    echo "❌ FAIL: Phase initiale incorrecte"
    exit 1
fi
echo "  ✓ Phase initiale = 1"

echo "✅ test_onboard_flow PASSED"
```

**Step 2: Écrire test_projet_flow.sh**

```bash
#!/bin/bash
# Test du flux /projet
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
FIXTURES="$SCRIPT_DIR/../fixtures"
SKILLS="$SCRIPT_DIR/../../skills"
TEMP_DIR=$(mktemp -d)

cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

echo "🧪 Test: /projet flow"

# Test 1: Projet vide (nouveau)
echo "  Testing: empty project..."
cd "$TEMP_DIR"
mkdir empty-project && cd empty-project

EXISTS=$(python3 "$SKILLS/state-management/scripts/state_manager.py" exists)
if [ "$EXISTS" != "false" ]; then
    echo "❌ FAIL: Should detect no .epct/"
    exit 1
fi
echo "  ✓ Nouveau projet détecté (pas de .epct/)"

# Test 2: Projet avec .epct/
echo "  Testing: existing ACT project..."
cd "$TEMP_DIR"
cp -r "$FIXTURES/fake-webapp" act-project && cd act-project

python3 "$SKILLS/state-management/scripts/state_manager.py" init \
    --name "act-project" \
    --type "webapp" \
    --stack "react" > /dev/null

EXISTS=$(python3 "$SKILLS/state-management/scripts/state_manager.py" exists)
if [ "$EXISTS" != "true" ]; then
    echo "❌ FAIL: Should detect .epct/"
    exit 1
fi
echo "  ✓ Projet ACT détecté (.epct/ présent)"

# Test 3: Lecture state
STATE=$(python3 "$SKILLS/state-management/scripts/state_manager.py" read)
if ! echo "$STATE" | grep -q '"name": "act-project"'; then
    echo "❌ FAIL: State incorrect"
    exit 1
fi
echo "  ✓ State lisible"

echo "✅ test_projet_flow PASSED"
```

**Step 3: Rendre exécutables**

```bash
chmod +x plugin/tests/integration/test_onboard_flow.sh
chmod +x plugin/tests/integration/test_projet_flow.sh
```

**Step 4: Exécuter les tests**

Run: `bash plugin/tests/integration/test_onboard_flow.sh`
Expected: ✅ PASSED

Run: `bash plugin/tests/integration/test_projet_flow.sh`
Expected: ✅ PASSED

**Step 5: Commit**

```bash
git add plugin/tests/integration/
git commit -m "test: add integration tests for /onboard and /projet flows"
```

---

### Task 2.5: Tag Phase 2 Complete

**Step 1: Exécuter tous les tests**

Run: `bash plugin/tests/run_all_tests.sh`
Expected: 🎉 All tests passed!

**Step 2: Créer tag**

```bash
git tag -a v0.2.0-phase2 -m "Phase 2: Entrée (/projet, /onboard) complete"
```

---

## Phase 3: Navigation

### Task 3.1: Réécrire /status

**Files:**
- Modify: `plugin/commands/status.md`

**Step 1: Réécrire en instructions Claude**

```markdown
---
name: status
description: Afficher l'état complet du projet ACT (phase, scores, progression)
---

# /status - État du Projet

Tu affiches l'état complet du projet ACT courant.

## Étape 1: Vérifier .epct/

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py exists
```

Si `false`, affiche :
```
❌ Aucun projet ACT initialisé.
💡 Utilisez /projet pour commencer.
```

## Étape 2: Lire l'État

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py read
```

## Étape 3: Afficher le Status

```
╭─────────────────────────────────────────────────────────────╮
│  📊 [project.name] | Phase [phase.current]/7                │
│                                                             │
│  Mode: [mode]                                               │
│  Démarré: [project.created_at]                              │
│                                                             │
│  ═══════════════════════════════════════════════════════    │
│                                                             │
│  Progress Global: [calcul moyenne scores]%                  │
│  [████████░░░░░░░░░░░░] XX%                                 │
│                                                             │
│  Phases:                                                    │
│  ✅ Discovery      [██████████] [scores.discovery]%         │
│  ✅ Stratégie      [███████░░░] [scores.strategy]%          │
│  ✅ Conception     [█████████░] [scores.conception]%        │
│  🔄 Développement  [████░░░░░░] [scores.development]%  ←    │
│  ⬚ Qualité        [░░░░░░░░░░] [scores.quality]%           │
│  ⬚ Lancement      [░░░░░░░░░░] [scores.launch]%            │
│  ⬚ Croissance     [░░░░░░░░░░] [scores.growth]%            │
│                                                             │
╰─────────────────────────────────────────────────────────────╯
```

Si `current_feature` existe, ajouter :
```
│  Feature en cours: [current_feature.name]                   │
│  Chunks: [chunks_completed]/[chunks_total]                  │
```

## Indicateurs Visuels

- `✅` : Phase complète (score >= 70)
- `🔄` : Phase en cours
- `⬚` : Phase non commencée
- `←` : Indique la phase actuelle
```

**Step 2: Commit**

```bash
git add plugin/commands/status.md
git commit -m "feat: rewrite /status as Claude instructions"
```

---

### Task 3.2: Réécrire /next

**Files:**
- Modify: `plugin/commands/next.md`

**Step 1: Réécrire en instructions Claude**

```markdown
---
name: next
description: Vérifier les critères Go/No-Go et passer à la phase suivante
---

# /next - Phase Suivante

Tu gères la transition vers la phase suivante du projet ACT.

## Étape 1: Lire l'État

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py read
```

Si phase actuelle = 7, affiche :
```
🎉 Félicitations ! Vous êtes en phase Croissance (7/7).
C'est la dernière phase - continuez à itérer !
```

## Étape 2: Vérifier Go/No-Go

Le score de la phase actuelle doit être >= 70% pour passer.

Consulte les critères dans `references/phases/[phase-name].md`.

## Étape 3a: Si Critères OK (score >= 70)

Affiche :
```
╭─────────────────────────────────────────────────────────────╮
│  ✅ Phase [current] : [name] terminée !                     │
│                                                             │
│  Score: [score]%                                            │
│  Critères validés:                                          │
│  ✓ [critère 1]                                              │
│  ✓ [critère 2]                                              │
│  ✓ [critère 3]                                              │
│                                                             │
│  Passer à la phase [next] : [next-name] ?                   │
│  [o/n]                                                      │
╰─────────────────────────────────────────────────────────────╯
```

Si oui :
1. Crée un checkpoint
2. Met à jour la phase

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py checkpoint
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py update \
  --updates '{"phase": {"current": [next], "name": "[next-name]", "started_at": "[now]"}}'
```

Affiche :
```
🎯 Phase [next-name] activée !
💡 Utilisez /projet pour voir les actions disponibles.
```

## Étape 3b: Si Critères NON OK (score < 70)

Affiche :
```
╭─────────────────────────────────────────────────────────────╮
│  ❌ Impossible de passer à la phase suivante                │
│                                                             │
│  Phase actuelle: [name] ([current]/7)                       │
│  Score: [score]% (minimum requis: 70%)                      │
│                                                             │
│  Critères manquants:                                        │
│  ✗ [critère manquant 1]                                     │
│  ✗ [critère manquant 2]                                     │
│                                                             │
│  💡 Actions recommandées:                                   │
│  1. [action pour critère 1]                                 │
│  2. [action pour critère 2]                                 │
│                                                             │
│  Utilisez /fix pour corriger les problèmes.                 │
╰─────────────────────────────────────────────────────────────╯
```
```

**Step 2: Commit**

```bash
git add plugin/commands/next.md
git commit -m "feat: rewrite /next with Go/No-Go logic"
```

---

### Task 3.3: Réécrire /fix

**Files:**
- Modify: `plugin/commands/fix.md`

**Step 1: Réécrire en instructions Claude**

```markdown
---
name: fix
description: Lister et corriger les erreurs prioritaires du projet
argument-hint: [error-id]
---

# /fix - Correction d'Erreurs

Tu aides à corriger les problèmes bloquant la progression du projet.

## Sans Argument: Lister les Problèmes

Analyse le projet et liste les problèmes par priorité :

```
╭─────────────────────────────────────────────────────────────╮
│  🔧 Problèmes Détectés                                      │
│                                                             │
│  Phase: [phase-name] - Score: [score]%                      │
│                                                             │
│  🔴 Critiques (bloquent /next):                             │
│  [1] Tests manquants - coverage < 60%                       │
│  [2] CI/CD non configuré                                    │
│                                                             │
│  🟡 Importants:                                             │
│  [3] Documentation API incomplète                           │
│  [4] Pas de gestion d'erreurs                               │
│                                                             │
│  🟢 Suggestions:                                            │
│  [5] Ajouter TypeScript strict mode                         │
│                                                             │
│  Tapez /fix [numéro] pour corriger un problème.             │
╰─────────────────────────────────────────────────────────────╯
```

## Avec Argument: Corriger le Problème

`/fix 1` → Focus sur le problème #1

Selon le type de problème :

### Problème de Code
Utilise `superpowers:systematic-debugging` pour analyser et corriger.

### Problème de Tests
Utilise `superpowers:test-driven-development` pour ajouter les tests.

### Problème de Documentation
Guide l'utilisateur pour créer la documentation manquante.

### Problème de Configuration
Guide l'utilisateur étape par étape (CI/CD, linting, etc.).

## Après Correction

Recalcule le score de la phase et affiche :
```
✅ Problème corrigé !
📊 Nouveau score phase [name]: [new-score]%
[Si score >= 70] 💡 Vous pouvez maintenant utiliser /next
```
```

**Step 2: Commit**

```bash
git add plugin/commands/fix.md
git commit -m "feat: rewrite /fix for error correction"
```

---

### Task 3.4: Réécrire /resume

**Files:**
- Modify: `plugin/commands/resume.md`

**Step 1: Réécrire en instructions Claude**

```markdown
---
name: resume
description: Reprendre une session de travail précédente
---

# /resume - Reprise de Session

Tu aides à reprendre le travail là où il s'était arrêté.

## Étape 1: Vérifier l'État

```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py read
```

Si pas de `.epct/`, affiche :
```
❌ Aucun projet ACT à reprendre.
💡 Utilisez /projet pour commencer.
```

## Étape 2: Analyser le Contexte

Affiche le résumé :
```
╭─────────────────────────────────────────────────────────────╮
│  🔄 Reprise de Session                                      │
│                                                             │
│  Projet: [project.name]                                     │
│  Phase: [phase.name] ([phase.current]/7)                    │
│  Mode: [mode]                                               │
│                                                             │
```

Si `current_feature` existe :
```
│  Feature en cours: [current_feature.name]                   │
│  Progress: [chunks_completed]/[chunks_total] chunks         │
│                                                             │
│  Dernière action: [description]                             │
│                                                             │
│  Continuer cette feature ? [o/n]                            │
```

Sinon :
```
│  Aucune tâche en cours.                                     │
│                                                             │
│  Options:                                                   │
│  1. Voir le status complet (/status)                        │
│  2. Continuer la phase actuelle (/projet)                   │
│  3. Restaurer un checkpoint précédent                       │
```

## Étape 3: Restaurer un Checkpoint (si demandé)

Liste les checkpoints disponibles :
```bash
ls -la .epct/history/checkpoints/
```

```
Checkpoints disponibles:
[1] 2026-01-06T10-30-00.json - Phase 3, Score 85%
[2] 2026-01-05T15-45-00.json - Phase 3, Score 70%
[3] 2026-01-04T09-00-00.json - Phase 2, Score 65%

Restaurer lequel ? [numéro]
```

Si choix fait :
```bash
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py recover \
  --checkpoint-file "[filename]"
```
```

**Step 2: Commit**

```bash
git add plugin/commands/resume.md
git commit -m "feat: rewrite /resume for session recovery"
```

---

### Task 3.5: Réécrire /help

**Files:**
- Modify: `plugin/commands/help.md`

**Step 1: Réécrire en instructions Claude**

```markdown
---
name: help
description: Aide contextuelle sur le framework ACT et ses commandes
argument-hint: [sujet]
---

# /help - Aide ACT

Tu fournis de l'aide contextuelle sur le framework ACT.

## Sans Argument: Aide Générale

```
╭─────────────────────────────────────────────────────────────╮
│  📖 ACT Framework - Aide                                    │
│                                                             │
│  ACT (ArtChiTech) est un framework de gestion de projet     │
│  en 7 phases : Discovery → Croissance.                      │
│                                                             │
│  ═══════════════════════════════════════════════════════    │
│                                                             │
│  Commandes Principales:                                     │
│  /projet    Hub principal - point d'entrée                  │
│  /onboard   Auditer et initialiser un projet                │
│  /status    Voir l'état complet du projet                   │
│  /next      Passer à la phase suivante                      │
│  /fix       Corriger les problèmes                          │
│  /resume    Reprendre une session                           │
│  /help      Cette aide                                      │
│                                                             │
│  ═══════════════════════════════════════════════════════    │
│                                                             │
│  Pour plus d'aide: /help [sujet]                            │
│  Sujets: phases, modes, commandes, phase-[1-7]              │
╰─────────────────────────────────────────────────────────────╯
```

## /help phases

```
Les 7 Phases ACT:

1. Discovery    - Valider le problème et les besoins
2. Stratégie    - Définir roadmap et business model
3. Conception   - Designer architecture et UX
4. Développement - Implémenter avec TDD
5. Qualité      - Tester et valider
6. Lancement    - Déployer et acquérir
7. Croissance   - Itérer et optimiser

Chaque phase requiert un score >= 70% pour passer à la suivante.
```

## /help modes

```
Les 3 Modes ACT:

COMPLET  - Nouveau projet, toutes les phases
FEATURE  - Nouvelle fonctionnalité sur projet existant
QUICK    - Bugfix ou refactoring rapide

Le mode est automatiquement défini selon le contexte.
```

## /help phase-[N]

Affiche le contenu de `references/phases/phase-[N]-[name].md`

## /help [commande]

Affiche l'aide spécifique de la commande demandée.
```

**Step 2: Commit**

```bash
git add plugin/commands/help.md
git commit -m "feat: rewrite /help with contextual documentation"
```

---

### Task 3.6: Test de transition de phase

**Files:**
- Create: `plugin/tests/integration/test_phase_transition.sh`

**Step 1: Écrire le test**

```bash
#!/bin/bash
# Test des transitions de phase
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS="$SCRIPT_DIR/../../skills"
TEMP_DIR=$(mktemp -d)

cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

echo "🧪 Test: Phase transitions"

cd "$TEMP_DIR"
mkdir test-project && cd test-project

# 1. Init projet en phase 1
python3 "$SKILLS/state-management/scripts/state_manager.py" init \
    --name "test-project" \
    --type "webapp" \
    --stack "react" > /dev/null
echo "  ✓ Projet initialisé en phase 1"

# 2. Vérifier phase initiale
STATE=$(python3 "$SKILLS/state-management/scripts/state_manager.py" read)
PHASE=$(echo "$STATE" | python3 -c "import sys,json; print(json.load(sys.stdin)['phase']['current'])")
if [ "$PHASE" != "1" ]; then
    echo "❌ FAIL: Phase initiale devrait être 1, got $PHASE"
    exit 1
fi
echo "  ✓ Phase initiale = 1"

# 3. Simuler progression vers phase 2
python3 "$SKILLS/state-management/scripts/state_manager.py" update \
    --updates '{"phase": {"current": 2, "name": "Stratégie"}, "scores": {"discovery": 85}}' > /dev/null
echo "  ✓ Transition vers phase 2"

# 4. Vérifier nouvelle phase
STATE=$(python3 "$SKILLS/state-management/scripts/state_manager.py" read)
PHASE=$(echo "$STATE" | python3 -c "import sys,json; print(json.load(sys.stdin)['phase']['current'])")
if [ "$PHASE" != "2" ]; then
    echo "❌ FAIL: Phase devrait être 2, got $PHASE"
    exit 1
fi
echo "  ✓ Phase = 2"

# 5. Créer checkpoint
CHECKPOINT=$(python3 "$SKILLS/state-management/scripts/state_manager.py" checkpoint)
if [ ! -f "$CHECKPOINT" ]; then
    echo "❌ FAIL: Checkpoint non créé"
    exit 1
fi
echo "  ✓ Checkpoint créé"

# 6. Avancer à phase 4
python3 "$SKILLS/state-management/scripts/state_manager.py" update \
    --updates '{"phase": {"current": 4, "name": "Développement"}}' > /dev/null

# 7. Recover depuis checkpoint (phase 2)
python3 "$SKILLS/state-management/scripts/state_manager.py" recover \
    --checkpoint-file "$CHECKPOINT" > /dev/null

STATE=$(python3 "$SKILLS/state-management/scripts/state_manager.py" read)
PHASE=$(echo "$STATE" | python3 -c "import sys,json; print(json.load(sys.stdin)['phase']['current'])")
if [ "$PHASE" != "2" ]; then
    echo "❌ FAIL: Recover échoué, phase devrait être 2, got $PHASE"
    exit 1
fi
echo "  ✓ Recover réussi (retour phase 2)"

echo "✅ test_phase_transition PASSED"
```

**Step 2: Rendre exécutable et tester**

```bash
chmod +x plugin/tests/integration/test_phase_transition.sh
bash plugin/tests/integration/test_phase_transition.sh
```

Expected: ✅ PASSED

**Step 3: Commit**

```bash
git add plugin/tests/integration/test_phase_transition.sh
git commit -m "test: add phase transition integration test"
```

---

### Task 3.7: Tag Phase 3 Complete

**Step 1: Exécuter tous les tests**

Run: `bash plugin/tests/run_all_tests.sh`
Expected: 🎉 All tests passed!

**Step 2: Créer tag**

```bash
git tag -a v0.3.0-phase3 -m "Phase 3: Navigation commands complete"
```

---

## Phase 4: Orchestration

### Task 4.1: Mettre à jour README.md avec dépendances

**Files:**
- Modify: `plugin/README.md`

**Step 1: Écrire le README complet**

```markdown
# ACT Framework

> Framework de suivi et réalisation de projets en 7 phases pour Claude Code.

## Installation

### Prérequis

| Dépendance | Version | Obligatoire |
|------------|---------|-------------|
| Claude Code | Latest | ✅ |
| Plugin `superpowers` | 3.6.0+ | ✅ |
| Python | 3.8+ | ✅ |
| Git | Any | ✅ |

### Installer les dépendances

```bash
# 1. Installer le plugin superpowers
claude plugins:install superpowers-marketplace/superpowers

# 2. Vérifier Python
python3 --version  # Doit être >= 3.8
```

### Installer ACT

**Option A: Git clone (recommandé pour développement)**

```bash
git clone https://github.com/bonsai974/act-framework.git ~/projects/act
ln -s ~/projects/act/plugin ~/.claude/plugins/act
```

**Option B: Installation directe**

```bash
# À venir: claude plugins:install bonsai974/act
```

### Vérifier l'installation

Redémarrez Claude Code, puis tapez `/projet`.

## Utilisation

### Commandes

| Commande | Description |
|----------|-------------|
| `/projet` | Hub principal - point d'entrée unique |
| `/onboard` | Auditer et initialiser un projet |
| `/status` | Voir l'état complet du projet |
| `/next` | Passer à la phase suivante |
| `/fix` | Corriger les problèmes |
| `/resume` | Reprendre une session |
| `/help` | Aide contextuelle |

### Les 7 Phases

1. **Discovery** - Valider le problème et les besoins
2. **Stratégie** - Définir roadmap et business model
3. **Conception** - Designer architecture et UX
4. **Développement** - Implémenter avec TDD
5. **Qualité** - Tester et valider
6. **Lancement** - Déployer et acquérir
7. **Croissance** - Itérer et optimiser

### Les 3 Modes

| Mode | Usage |
|------|-------|
| COMPLET | Nouveau projet from scratch |
| FEATURE | Nouvelle fonctionnalité |
| QUICK | Bugfix ou refactoring |

## Structure .epct/

ACT crée un dossier `.epct/` dans votre projet :

```
.epct/
├── state.json          # État courant
├── session/            # Données de session
└── history/
    └── checkpoints/    # Points de sauvegarde
```

Ajoutez `.epct/` à votre `.gitignore` si vous ne voulez pas versionner l'état ACT.

## Intégration Superpowers

ACT utilise les skills superpowers selon la phase :

| Phase | Skill |
|-------|-------|
| Discovery | `superpowers:brainstorming` |
| Stratégie | `superpowers:brainstorming` |
| Conception | `superpowers:writing-plans` |
| Développement | `superpowers:test-driven-development` |
| Qualité | `superpowers:code-reviewer` |

## Développement

```bash
# Lancer les tests
bash plugin/tests/run_all_tests.sh

# Structure
plugin/
├── commands/      # Commandes slash
├── skills/        # Skills réutilisables
├── references/    # Documentation de référence
└── tests/         # Tests automatisés
```

## Licence

MIT - Manuel Turpin / Bonsai974
```

**Step 2: Commit**

```bash
git add plugin/README.md
git commit -m "docs: complete README with dependencies and usage"
```

---

### Task 4.2: Créer script d'installation

**Files:**
- Create: `scripts/install.sh`

**Step 1: Écrire le script**

```bash
#!/bin/bash
# ACT Framework - Installation Script

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PLUGIN_DIR="$HOME/.claude/plugins"
ACT_DIR="$PLUGIN_DIR/act"

echo "🚀 Installation ACT Framework"
echo "=============================="

# Vérifier Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 requis mais non trouvé"
    echo "   Installez Python 3.8+ et réessayez"
    exit 1
fi

PYTHON_VERSION=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
echo "✓ Python $PYTHON_VERSION détecté"

# Vérifier Git
if ! command -v git &> /dev/null; then
    echo "❌ Git requis mais non trouvé"
    exit 1
fi
echo "✓ Git détecté"

# Créer dossier plugins si nécessaire
mkdir -p "$PLUGIN_DIR"

# Supprimer ancien lien si existe
if [ -L "$ACT_DIR" ]; then
    rm "$ACT_DIR"
    echo "✓ Ancien lien supprimé"
elif [ -d "$ACT_DIR" ]; then
    echo "⚠️  Dossier $ACT_DIR existe déjà"
    read -p "   Supprimer et réinstaller ? [o/N] " confirm
    if [ "$confirm" = "o" ] || [ "$confirm" = "O" ]; then
        rm -rf "$ACT_DIR"
    else
        echo "Installation annulée"
        exit 0
    fi
fi

# Créer lien symbolique
ln -sf "$SCRIPT_DIR/../plugin" "$ACT_DIR"
echo "✓ Plugin installé dans $ACT_DIR"

# Vérifier superpowers
echo ""
echo "📦 Vérification des dépendances..."
if [ -d "$PLUGIN_DIR/superpowers" ] || [ -d "$HOME/.claude/plugins/cache/superpowers-marketplace" ]; then
    echo "✓ Plugin superpowers détecté"
else
    echo "⚠️  Plugin superpowers non détecté"
    echo "   Installez-le avec: claude plugins:install superpowers-marketplace/superpowers"
fi

echo ""
echo "=============================="
echo "✅ ACT Framework installé !"
echo ""
echo "🔄 Redémarrez Claude Code"
echo "🚀 Tapez /projet pour commencer"
```

**Step 2: Rendre exécutable**

```bash
chmod +x scripts/install.sh
```

**Step 3: Commit**

```bash
git add scripts/install.sh
git commit -m "feat: add installation script"
```

---

### Task 4.3: Test workflow complet

**Files:**
- Create: `plugin/tests/integration/test_full_workflow.sh`

**Step 1: Écrire le test**

```bash
#!/bin/bash
# Test workflow complet ACT
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS="$SCRIPT_DIR/../../skills"
TEMP_DIR=$(mktemp -d)

cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

echo "🧪 Test: Full ACT Workflow"
echo "=========================="

cd "$TEMP_DIR"
mkdir my-webapp && cd my-webapp

# Simuler un projet webapp
cat > package.json << 'EOF'
{
  "name": "my-webapp",
  "dependencies": {"react": "^18.0.0"}
}
EOF
mkdir -p src
echo "export default function App() { return <div>App</div> }" > src/App.tsx

echo ""
echo "📁 Projet créé: my-webapp"

# 1. Détection
echo ""
echo "Step 1: Détection..."
DETECTION=$(python3 "$SKILLS/project-detection/scripts/detect_stack.py" 2>/dev/null || echo '{}')
echo "  ✓ Stack détectée"

# 2. Vérifier pas de .epct
EXISTS=$(python3 "$SKILLS/state-management/scripts/state_manager.py" exists)
if [ "$EXISTS" = "true" ]; then
    echo "  ❌ FAIL: .epct ne devrait pas exister"
    exit 1
fi
echo "  ✓ Pas de .epct/ (projet non-ACT)"

# 3. Onboard - Init
echo ""
echo "Step 2: Onboard..."
python3 "$SKILLS/state-management/scripts/state_manager.py" init \
    --name "my-webapp" \
    --type "webapp" \
    --stack "react,typescript" > /dev/null
echo "  ✓ Projet initialisé"

# 4. Vérifier state créé
EXISTS=$(python3 "$SKILLS/state-management/scripts/state_manager.py" exists)
if [ "$EXISTS" != "true" ]; then
    echo "  ❌ FAIL: .epct devrait exister"
    exit 1
fi
echo "  ✓ .epct/ créé"

# 5. Lire state
echo ""
echo "Step 3: Status..."
STATE=$(python3 "$SKILLS/state-management/scripts/state_manager.py" read)
echo "  ✓ State lisible"

# 6. Simuler progression phases
echo ""
echo "Step 4: Progression phases..."

for phase in 2 3 4; do
    PHASE_NAMES=("" "Discovery" "Stratégie" "Conception" "Développement")
    python3 "$SKILLS/state-management/scripts/state_manager.py" update \
        --updates "{\"phase\": {\"current\": $phase, \"name\": \"${PHASE_NAMES[$phase]}\"}}" > /dev/null
    echo "  ✓ Phase $phase: ${PHASE_NAMES[$phase]}"
done

# 7. Créer checkpoint
echo ""
echo "Step 5: Checkpoint..."
CHECKPOINT=$(python3 "$SKILLS/state-management/scripts/state_manager.py" checkpoint)
echo "  ✓ Checkpoint créé: $(basename $CHECKPOINT)"

# 8. Ajouter feature
echo ""
echo "Step 6: Mode FEATURE..."
python3 "$SKILLS/state-management/scripts/state_manager.py" update \
    --updates '{"mode": "FEATURE", "current_feature": {"name": "Auth", "phase": 4, "chunks_completed": 0, "chunks_total": 3}}' > /dev/null
echo "  ✓ Feature 'Auth' ajoutée"

# 9. Vérifier état final
STATE=$(python3 "$SKILLS/state-management/scripts/state_manager.py" read)
MODE=$(echo "$STATE" | python3 -c "import sys,json; print(json.load(sys.stdin)['mode'])")
if [ "$MODE" != "FEATURE" ]; then
    echo "  ❌ FAIL: Mode devrait être FEATURE"
    exit 1
fi
echo "  ✓ Mode = FEATURE"

echo ""
echo "=========================="
echo "✅ Full workflow test PASSED"
```

**Step 2: Rendre exécutable et tester**

```bash
chmod +x plugin/tests/integration/test_full_workflow.sh
bash plugin/tests/integration/test_full_workflow.sh
```

**Step 3: Commit**

```bash
git add plugin/tests/integration/test_full_workflow.sh
git commit -m "test: add full workflow integration test"
```

---

### Task 4.4: Final - Run All Tests

**Step 1: Exécuter tous les tests**

Run: `bash plugin/tests/run_all_tests.sh`
Expected: 🎉 All tests passed!

**Step 2: Tag version finale**

```bash
git tag -a v1.0.0 -m "ACT Framework v1.0.0 - Initial release"
```

**Step 3: Résumé final**

```
✅ ACT Framework v1.0.0 Complete!

Livrables:
- 7 commandes slash fonctionnelles
- 3 skills (state-management, project-detection, phase-scoring)
- Tests unitaires et intégration
- Script d'installation
- Documentation complète

Installation:
  ./scripts/install.sh

Utilisation:
  /projet
```

---

## Plan Execution Checklist

- [ ] Phase 1: Fondations (Tasks 1.1 - 1.9)
- [ ] Phase 2: Entrée (Tasks 2.1 - 2.5)
- [ ] Phase 3: Navigation (Tasks 3.1 - 3.7)
- [ ] Phase 4: Orchestration (Tasks 4.1 - 4.4)
