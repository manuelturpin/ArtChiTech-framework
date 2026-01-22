# ACT Framework Tests

> Test suite for the ArtChiTech Framework

## Structure

```
tests/
├── README.md              # This file
├── run_all_tests.sh       # Main test runner
├── fixtures/              # Test data and mock projects
│   └── fake-webapp/       # Sample webapp for testing
├── unit/                  # Unit tests (Python)
│   ├── test_state_management.py
│   └── test_detection.py
├── integration/           # Integration tests (Bash)
│   ├── test_onboard_flow.sh
│   ├── test_phase_transition.sh
│   ├── test_error_fix_flow.sh
│   └── test_full_workflow.sh
└── validation/            # Project generation validation
    ├── generate_api.sh
    ├── generate_cli.sh
    ├── generate_webapp.sh
    └── run_validation.sh
```

---

## Running Tests

### All Tests

```bash
cd plugin/tests
./run_all_tests.sh
```

### Unit Tests Only

```bash
cd plugin/tests
python3 unit/test_state_management.py
python3 unit/test_detection.py
```

### Integration Tests Only

```bash
cd plugin/tests/integration
./test_onboard_flow.sh
./test_phase_transition.sh
./test_error_fix_flow.sh
./test_full_workflow.sh
```

### Validation Tests

```bash
cd plugin/tests/validation
./run_validation.sh
```

---

## Test Scenarios

### 1. Onboard Flow (`test_onboard_flow.sh`)

Tests the `/act-onboard` command flow for new projects:

| Step | Action | Verification |
|------|--------|--------------|
| 1 | Start with clean project | No `.epct/` directory |
| 2 | Run stack detection | Detection returns valid JSON |
| 3 | Initialize state | `state.json` created |
| 4 | Check initial phase | Phase = 1 (Discovery) |

### 2. Phase Transition (`test_phase_transition.sh`)

Tests the `/act-next` command flow for phase transitions:

| Step | Action | Verification |
|------|--------|--------------|
| 1 | Initialize project | Phase = 1 |
| 2 | Update to phase 2 | Score preserved |
| 3 | Create checkpoint | File exists |
| 4 | Advance to phase 4 | Phase = 4 |
| 5 | Recover from checkpoint | Phase = 2, scores intact |

### 3. Error Fix Flow (`test_error_fix_flow.sh`)

Tests the `/act-fix` command flow for error tracking:

| Step | Action | Verification |
|------|--------|--------------|
| 1 | Initialize project | No active errors |
| 2 | Create critical error | Error in `.epct/errors/active/` |
| 3 | Update state | `blocking: true` |
| 4 | Resolve error | Error moved to `resolved/` |
| 5 | Verify state | `blocking: false` |
| 6 | Test multiple errors | Critical blocks, minor doesn't |

### 4. Full Workflow (`test_full_workflow.sh`)

Tests a complete ACT workflow end-to-end:

| Step | Action | Verification |
|------|--------|--------------|
| 1 | Create fake webapp | `package.json` with React |
| 2 | Detect stack | Detection works |
| 3 | Verify no `.epct` | Project is not ACT |
| 4 | Run onboard | `.epct/` created |
| 5 | Progress phases | Phase 1 → 2 → 3 → 4 |
| 6 | Create checkpoint | Checkpoint file exists |
| 7 | Add feature | Mode = FEATURE |

---

## Error Types Tested

| Error Type | Severity | Blocking |
|------------|----------|----------|
| `type_error` | critical | Yes |
| `build_error` | critical | Yes |
| `lint_warning` | minor | No |

---

## Prerequisites

- Python 3.x
- Bash 4.x+
- Access to `plugin/skills/` scripts

---

## Adding New Tests

### Unit Test Template

```python
#!/usr/bin/env python3
"""Test [component name]"""

import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../skills/[skill]/scripts'))

from [module] import [function]

def test_[scenario]():
    """Test [description]"""
    result = [function](input)
    assert result == expected, f"Expected {expected}, got {result}"
    print("  ✓ [scenario]")

if __name__ == "__main__":
    print("🧪 Test: [Component]")
    test_[scenario]()
    print("✅ All tests passed")
```

### Integration Test Template

```bash
#!/bin/bash
# Test [description]
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS="$SCRIPT_DIR/../../skills"
TEMP_DIR=$(mktemp -d)

cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

echo "🧪 Test: [Description]"

cd "$TEMP_DIR"
mkdir test-project && cd test-project

# Test steps...

echo "✅ test_[name] PASSED"
```

---

## Continuous Integration

Tests are designed to run in CI environments:

```yaml
# Example GitHub Actions
- name: Run ACT Tests
  run: |
    cd plugin/tests
    ./run_all_tests.sh
```

---

## Troubleshooting

### Tests fail with "python3 not found"

Ensure Python 3 is installed and in PATH:
```bash
which python3
```

### Tests fail with "Permission denied"

Make scripts executable:
```bash
chmod +x plugin/tests/**/*.sh
```

### Tests fail with "No module named..."

Check that skills scripts exist:
```bash
ls plugin/skills/*/scripts/*.py
```
