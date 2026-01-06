# Phase 6 - Polishing - Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Validate ACT on real projects with integrated feedback/issue pipeline before v1.2.0 release.

**Architecture:** Add 3 new commands (/feedback, /triage, /fix-issue) that integrate with GitHub CLI. Enhance install.sh with prerequisite checks. Create validation test suite for Webapp/API/CLI projects.

**Tech Stack:** Markdown (commands), Bash (install.sh), Python (scripts), GitHub CLI (gh)

---

## Batch 1: Enhanced install.sh (Priority: HIGH)

### Task 1.1: Add prerequisite check functions

**Files:**
- Modify: `scripts/install.sh`

**Step 1: Read current install.sh**

```bash
cat scripts/install.sh
```

**Step 2: Add check functions at the top of the script**

```bash
#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check functions
check_python() {
    if command -v python3 &> /dev/null; then
        version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
        major=$(echo $version | cut -d. -f1)
        minor=$(echo $version | cut -d. -f2)
        if [ "$major" -ge 3 ] && [ "$minor" -ge 8 ]; then
            echo -e "${GREEN}✓${NC} Python $version"
            return 0
        fi
    fi
    echo -e "${RED}✗${NC} Python 3.8+ required (found: ${version:-none})"
    echo "  Install: https://www.python.org/downloads/"
    return 1
}

check_git() {
    if command -v git &> /dev/null; then
        echo -e "${GREEN}✓${NC} Git $(git --version | cut -d' ' -f3)"
        return 0
    fi
    echo -e "${RED}✗${NC} Git required"
    echo "  Install: https://git-scm.com/downloads"
    return 1
}

check_claude_code() {
    if command -v claude &> /dev/null; then
        echo -e "${GREEN}✓${NC} Claude Code installed"
        return 0
    fi
    echo -e "${RED}✗${NC} Claude Code required"
    echo "  Install: https://claude.ai/code"
    return 1
}

check_gh_cli() {
    if command -v gh &> /dev/null; then
        if gh auth status &> /dev/null; then
            echo -e "${GREEN}✓${NC} GitHub CLI authenticated"
            return 0
        else
            echo -e "${YELLOW}⚠${NC} GitHub CLI installed but not authenticated"
            echo "  Run: gh auth login"
            return 1
        fi
    fi
    echo -e "${YELLOW}⚠${NC} GitHub CLI not installed (optional, for /feedback)"
    echo "  Install: https://cli.github.com/"
    return 0  # Optional, don't fail
}

check_superpowers() {
    if [ -d "$HOME/.claude/plugins/cache/superpowers-marketplace" ]; then
        echo -e "${GREEN}✓${NC} Plugin superpowers installed"
        return 0
    fi
    echo -e "${RED}✗${NC} Plugin superpowers required"
    echo "  Install: claude plugins:install superpowers-marketplace/superpowers"
    return 1
}

check_permissions() {
    local plugin_dir="$HOME/.claude/plugins"
    if [ -w "$plugin_dir" ] || mkdir -p "$plugin_dir" 2>/dev/null; then
        echo -e "${GREEN}✓${NC} Permissions OK for $plugin_dir"
        return 0
    fi
    echo -e "${RED}✗${NC} Cannot write to $plugin_dir"
    return 1
}
```

**Step 3: Add main prerequisite check block**

```bash
# Main prerequisite check
check_prerequisites() {
    echo ""
    echo "🔍 Checking prerequisites..."
    echo "─────────────────────────────"

    local failed=0

    check_python || failed=1
    check_git || failed=1
    check_claude_code || failed=1
    check_superpowers || failed=1
    check_permissions || failed=1
    check_gh_cli  # Optional, don't fail

    echo "─────────────────────────────"

    if [ $failed -eq 1 ]; then
        echo ""
        echo -e "${RED}❌ Prerequisites check failed${NC}"
        echo "Please install missing dependencies and try again."
        exit 1
    fi

    echo -e "${GREEN}✅ All prerequisites OK${NC}"
    echo ""
}
```

**Step 4: Call check_prerequisites at the start of install**

Add after the check functions, before the actual installation:

```bash
# Run prerequisite check
check_prerequisites

# Continue with installation...
echo "📦 Installing ACT Framework..."
```

**Step 5: Add post-install verification**

At the end of the script:

```bash
# Post-install verification
echo ""
echo "─────────────────────────────"
echo -e "${GREEN}✅ ACT Framework installed successfully!${NC}"
echo ""
echo "To verify, restart Claude Code and run:"
echo "  /project"
echo ""
echo "Documentation: https://github.com/manuelturpin/ArtChiTech-framework"
echo "─────────────────────────────"
```

**Step 6: Test the enhanced install.sh**

```bash
bash scripts/install.sh
```

Expected: Shows all checks with ✓ or ✗, then proceeds or fails accordingly.

**Step 7: Commit**

```bash
git add scripts/install.sh
git commit -m "feat(install): add prerequisite checks and post-install verification"
```

---

## Batch 2: Command /feedback (Priority: HIGH)

### Task 2.1: Create /feedback command file

**Files:**
- Create: `plugin/commands/feedback.md`

**Step 1: Create the feedback command**

```markdown
---
name: feedback
description: Report a bug, suggestion, or question with automatic context capture and GitHub Issue creation
---

# /feedback - Report Feedback

You help the user report issues with ACT by capturing context and creating a GitHub Issue.

## Step 1: Check GitHub CLI

```bash
gh auth status
```

If not authenticated, display:
```
⚠️ GitHub CLI not authenticated.
To use /feedback, please run: gh auth login
```
And stop.

## Step 2: Ask Feedback Type

```
╭─────────────────────────────────────────────────────╮
│  📝 What type of feedback?                          │
│                                                     │
│  1. 🐛 Bug - Something doesn't work                 │
│  2. 💡 Suggestion - Idea for improvement            │
│  3. ❓ Question - Need clarification                │
│                                                     │
╰─────────────────────────────────────────────────────╯
```

Map selection to label:
- 1 → `bug`
- 2 → `enhancement`
- 3 → `question`

## Step 3: Ask Description

```
Describe the issue in a few words:
> _
```

## Step 4: Ask Priority (for bugs only)

If type is Bug:
```
╭─────────────────────────────────────────────────────╮
│  ⚡ How severe is this bug?                         │
│                                                     │
│  1. 🔴 Critical - Crash or blocking                 │
│  2. 🟠 High - Feature broken                        │
│  3. 🟡 Medium - Degraded experience                 │
│  4. 🔵 Low - Cosmetic issue                         │
│                                                     │
╰─────────────────────────────────────────────────────╯
```

Map to label:
- 1 → `priority:critical`
- 2 → `priority:high`
- 3 → `priority:medium`
- 4 → `priority:low`

## Step 5: Capture Context (Standard Level)

```bash
# Get ACT version
cat ${CLAUDE_PLUGIN_ROOT}/.claude-plugin/plugin.json | python3 -c "import sys,json; print(json.load(sys.stdin)['version'])"

# Get state if exists
python3 ${CLAUDE_PLUGIN_ROOT}/skills/state-management/scripts/state_manager.py read 2>/dev/null || echo "{}"
```

Extract from state:
- `phase.current` and `phase.name`
- `mode`
- `project.stack`

Build context block:
```
**ACT Context (auto-captured)**
- Version: v1.1.0
- Phase: 4 - Development
- Mode: COMPLET
- Stack: react, typescript, vite
- Last command: /next
```

## Step 6: Create GitHub Issue

Build issue body:
```markdown
## Description

[User's description]

## ACT Context (auto-captured)

| Field | Value |
|-------|-------|
| Version | v1.1.0 |
| Phase | 4 - Development |
| Mode | COMPLET |
| Stack | react, typescript, vite |
| Last command | /next |

## State Extract

```json
{
  "phase": { "current": 4, "name": "Development" },
  "mode": "COMPLET",
  "scores": { ... }
}
```

## Steps to Reproduce

1. ...

---
*Created via `/feedback` command*
```

Create issue:
```bash
gh issue create \
  --repo manuelturpin/ArtChiTech-framework \
  --title "[TYPE] Description" \
  --body "BODY" \
  --label "type_label" \
  --label "priority_label"
```

## Step 7: Display Confirmation

```
✅ Issue created successfully!

🔗 https://github.com/manuelturpin/ArtChiTech-framework/issues/XX

Thank you for your feedback!
```
```

**Step 2: Verify command syntax**

```bash
head -5 plugin/commands/feedback.md
```

Expected: Valid frontmatter with name and description.

**Step 3: Commit**

```bash
git add plugin/commands/feedback.md
git commit -m "feat(commands): add /feedback command for issue reporting"
```

---

## Batch 3: Command /triage (Priority: MEDIUM)

### Task 3.1: Create /triage command file

**Files:**
- Create: `plugin/commands/triage.md`

**Step 1: Create the triage command**

```markdown
---
name: triage
description: View and manage open GitHub Issues for ACT framework (maintainer tool)
---

# /triage - Issue Triage

You display open issues and help the maintainer manage them.

## Step 1: Check GitHub CLI

```bash
gh auth status
```

If not authenticated, display error and stop.

## Step 2: Fetch Open Issues

```bash
gh issue list \
  --repo manuelturpin/ArtChiTech-framework \
  --state open \
  --json number,title,labels,createdAt \
  --limit 20
```

## Step 3: Display Issues by Priority

Parse labels and sort by priority:
- `priority:critical` → 🔴
- `priority:high` → 🟠
- `priority:medium` → 🟡
- `priority:low` → 🔵
- `question` → ❓
- `enhancement` → 💡

```
╭─────────────────────────────────────────────────────────────╮
│  📋 Open Issues (5)                                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  🔴 #12 [critical] Crash on /next command                   │
│  🟠 #11 [high] Score not updated after phase change         │
│  🟡 #10 [medium] Typo in help message                       │
│  💡 #9  [enhancement] Add dark mode support                 │
│  ❓ #8  [question] How to reset project state?              │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│  Actions:                                                   │
│  • Enter issue number to view details                       │
│  • Type "fix N" to start /fix-issue N                       │
│  • Type "close N" to close issue                            │
│  • Type "q" to quit                                         │
╰─────────────────────────────────────────────────────────────╯
```

## Step 4: Handle User Action

**View details:**
```bash
gh issue view NUMBER --repo manuelturpin/ArtChiTech-framework
```

**Fix issue:**
→ Spawn `/fix-issue NUMBER`

**Close issue:**
```bash
gh issue close NUMBER --repo manuelturpin/ArtChiTech-framework --comment "Closed via /triage"
```

## Step 5: Loop or Exit

After action, return to issue list unless user types "q".
```

**Step 2: Commit**

```bash
git add plugin/commands/triage.md
git commit -m "feat(commands): add /triage command for issue management"
```

---

## Batch 4: Command /fix-issue (Priority: MEDIUM)

### Task 4.1: Create /fix-issue command file

**Files:**
- Create: `plugin/commands/fix-issue.md`

**Step 1: Create the fix-issue command**

```markdown
---
name: fix-issue
description: Read a GitHub Issue, analyze context, and implement a fix with TDD
argument-hint: <issue-number>
---

# /fix-issue - Guided Issue Resolution

You help fix a reported issue by reading its context and implementing a TDD fix.

## Step 1: Parse Argument

Extract issue number from argument. If missing:
```
Usage: /fix-issue <issue-number>
Example: /fix-issue 12
```

## Step 2: Fetch Issue Details

```bash
gh issue view NUMBER \
  --repo manuelturpin/ArtChiTech-framework \
  --json title,body,labels,number
```

## Step 3: Display Issue Summary

```
╭─────────────────────────────────────────────────────────────╮
│  🔧 Fixing Issue #NUMBER                                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Title: [issue title]                                       │
│  Type: [bug/enhancement/question]                           │
│  Priority: [critical/high/medium/low]                       │
│                                                             │
│  Description:                                               │
│  [issue description]                                        │
│                                                             │
│  ACT Context:                                               │
│  • Version: v1.1.0                                          │
│  • Phase: 4 - Development                                   │
│  • Stack: react, typescript                                 │
│                                                             │
╰─────────────────────────────────────────────────────────────╯
```

## Step 4: Analyze and Propose Diagnosis

Based on the issue context:
1. Identify the likely cause
2. Identify files to modify
3. Propose a fix approach

```
📋 Diagnosis

Likely cause: [analysis]

Files to modify:
• plugin/commands/next.md
• plugin/skills/phase-scoring/SKILL.md

Proposed fix: [approach]

Proceed with fix? (y/n)
```

## Step 5: Implement Fix with TDD

If user confirms, use TDD approach:

1. **Write failing test** (if applicable)
2. **Implement fix**
3. **Run tests**
4. **Commit with issue reference**

```bash
git commit -m "fix: [description]

Fixes #NUMBER"
```

## Step 6: Create PR (optional)

Ask user:
```
Create a Pull Request for this fix? (y/n)
```

If yes:
```bash
gh pr create \
  --title "Fix #NUMBER: [title]" \
  --body "Fixes #NUMBER\n\n## Changes\n- [changes]" \
  --base main
```

## Step 7: Auto-close Information

```
✅ Fix implemented!

When this PR is merged, issue #NUMBER will be automatically closed.

PR: https://github.com/manuelturpin/ArtChiTech-framework/pull/XX
```
```

**Step 2: Commit**

```bash
git add plugin/commands/fix-issue.md
git commit -m "feat(commands): add /fix-issue command for guided issue resolution"
```

---

## Batch 5: Validation Tests (Priority: HIGH)

### Task 5.1: Create test project generators

**Files:**
- Create: `plugin/tests/validation/generate_webapp.sh`
- Create: `plugin/tests/validation/generate_api.sh`
- Create: `plugin/tests/validation/generate_cli.sh`

**Step 1: Create webapp generator**

```bash
#!/bin/bash
# generate_webapp.sh - Generate a React/TypeScript webapp for ACT validation

set -e

PROJECT_NAME=${1:-"test-webapp"}
TARGET_DIR=${2:-"/tmp/act-validation"}

echo "📦 Generating Webapp: $PROJECT_NAME"

mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

# Create with Vite
npm create vite@latest "$PROJECT_NAME" -- --template react-ts

cd "$PROJECT_NAME"

# Add basic structure
mkdir -p src/components src/services tests

# Create a simple component
cat > src/components/Counter.tsx << 'EOF'
import { useState } from 'react'

export function Counter() {
  const [count, setCount] = useState(0)
  return (
    <button onClick={() => setCount(c => c + 1)}>
      Count: {count}
    </button>
  )
}
EOF

# Create a simple test
cat > tests/Counter.test.tsx << 'EOF'
import { describe, it, expect } from 'vitest'
import { render, screen } from '@testing-library/react'
import { Counter } from '../src/components/Counter'

describe('Counter', () => {
  it('renders with initial count', () => {
    render(<Counter />)
    expect(screen.getByText(/Count: 0/)).toBeDefined()
  })
})
EOF

# Install dependencies
npm install
npm install -D vitest @testing-library/react @testing-library/jest-dom jsdom

# Add test script to package.json
npm pkg set scripts.test="vitest run"

echo "✅ Webapp generated at: $TARGET_DIR/$PROJECT_NAME"
```

**Step 2: Create API generator**

```bash
#!/bin/bash
# generate_api.sh - Generate a Node/Express API for ACT validation

set -e

PROJECT_NAME=${1:-"test-api"}
TARGET_DIR=${2:-"/tmp/act-validation"}

echo "📦 Generating API: $PROJECT_NAME"

mkdir -p "$TARGET_DIR/$PROJECT_NAME"
cd "$TARGET_DIR/$PROJECT_NAME"

# Initialize npm
npm init -y

# Install dependencies
npm install express cors
npm install -D typescript @types/node @types/express vitest

# Create structure
mkdir -p src/routes src/services tests

# Create tsconfig
cat > tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "commonjs",
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true
  }
}
EOF

# Create main app
cat > src/index.ts << 'EOF'
import express from 'express'
import cors from 'cors'

const app = express()
app.use(cors())
app.use(express.json())

app.get('/health', (req, res) => {
  res.json({ status: 'ok' })
})

app.get('/api/items', (req, res) => {
  res.json([{ id: 1, name: 'Item 1' }])
})

const PORT = process.env.PORT || 3000
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`)
})

export default app
EOF

# Create test
cat > tests/api.test.ts << 'EOF'
import { describe, it, expect } from 'vitest'

describe('API', () => {
  it('should have health endpoint', () => {
    expect(true).toBe(true) // Placeholder
  })
})
EOF

# Add scripts
npm pkg set scripts.build="tsc"
npm pkg set scripts.start="node dist/index.js"
npm pkg set scripts.test="vitest run"

echo "✅ API generated at: $TARGET_DIR/$PROJECT_NAME"
```

**Step 3: Create CLI generator**

```bash
#!/bin/bash
# generate_cli.sh - Generate a Python CLI for ACT validation

set -e

PROJECT_NAME=${1:-"test-cli"}
TARGET_DIR=${2:-"/tmp/act-validation"}

echo "📦 Generating CLI: $PROJECT_NAME"

mkdir -p "$TARGET_DIR/$PROJECT_NAME"
cd "$TARGET_DIR/$PROJECT_NAME"

# Create structure
mkdir -p src tests

# Create main CLI
cat > src/cli.py << 'EOF'
#!/usr/bin/env python3
"""Simple CLI for ACT validation testing."""

import argparse
import sys

def main():
    parser = argparse.ArgumentParser(description='Test CLI')
    parser.add_argument('command', choices=['hello', 'version'])
    parser.add_argument('--name', default='World')

    args = parser.parse_args()

    if args.command == 'hello':
        print(f"Hello, {args.name}!")
    elif args.command == 'version':
        print("v0.1.0")

    return 0

if __name__ == '__main__':
    sys.exit(main())
EOF

# Create test
cat > tests/test_cli.py << 'EOF'
"""Tests for CLI."""

import subprocess
import sys

def test_hello():
    result = subprocess.run(
        [sys.executable, 'src/cli.py', 'hello'],
        capture_output=True,
        text=True
    )
    assert 'Hello, World!' in result.stdout

def test_version():
    result = subprocess.run(
        [sys.executable, 'src/cli.py', 'version'],
        capture_output=True,
        text=True
    )
    assert 'v0.1.0' in result.stdout
EOF

# Create requirements
cat > requirements.txt << 'EOF'
pytest>=7.0.0
EOF

# Create setup.py
cat > setup.py << 'EOF'
from setuptools import setup, find_packages

setup(
    name='test-cli',
    version='0.1.0',
    packages=find_packages(),
    entry_points={
        'console_scripts': [
            'test-cli=src.cli:main',
        ],
    },
)
EOF

echo "✅ CLI generated at: $TARGET_DIR/$PROJECT_NAME"
```

**Step 4: Make scripts executable**

```bash
chmod +x plugin/tests/validation/generate_webapp.sh
chmod +x plugin/tests/validation/generate_api.sh
chmod +x plugin/tests/validation/generate_cli.sh
```

**Step 5: Commit**

```bash
git add plugin/tests/validation/
git commit -m "feat(tests): add validation project generators for webapp, api, cli"
```

---

### Task 5.2: Create validation test runner

**Files:**
- Create: `plugin/tests/validation/run_validation.sh`

**Step 1: Create the validation runner**

```bash
#!/bin/bash
# run_validation.sh - Run ACT validation tests on generated projects

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VALIDATION_DIR="/tmp/act-validation"
REPORT_FILE="$SCRIPT_DIR/../../../docs/VALIDATION-REPORT.md"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Results tracking
PASSED=0
FAILED=0
ISSUES=()

log_pass() {
    echo -e "${GREEN}✓${NC} $1"
    ((PASSED++))
}

log_fail() {
    echo -e "${RED}✗${NC} $1"
    ((FAILED++))
    ISSUES+=("$1: $2")
}

test_project() {
    local type=$1
    local dir=$2

    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Testing: $type"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    cd "$dir"

    # Test 1: Project detection
    echo "Test: Project detection..."
    if python3 ~/.claude/plugins/cache/act/skills/project-detection/scripts/detect_stack.py 2>/dev/null | grep -q "stack"; then
        log_pass "Stack detected"
    else
        log_fail "Stack detection" "Failed to detect project stack"
    fi

    # Test 2: No .epct initially
    echo "Test: No .epct initially..."
    if [ ! -d ".epct" ]; then
        log_pass "No .epct/ at start"
    else
        log_fail "Initial state" ".epct/ should not exist"
    fi

    # Test 3: State init
    echo "Test: State initialization..."
    python3 ~/.claude/plugins/cache/act/skills/state-management/scripts/state_manager.py init \
        --name "$type-test" --type "$type" --stack "test" 2>/dev/null
    if [ -f ".epct/state.json" ]; then
        log_pass "State initialized"
    else
        log_fail "State init" "state.json not created"
    fi

    # Test 4: State read
    echo "Test: State read..."
    if python3 ~/.claude/plugins/cache/act/skills/state-management/scripts/state_manager.py read 2>/dev/null | grep -q "phase"; then
        log_pass "State readable"
    else
        log_fail "State read" "Cannot read state"
    fi

    # Test 5: Phase transition
    echo "Test: Phase transition..."
    python3 ~/.claude/plugins/cache/act/skills/state-management/scripts/state_manager.py update \
        --updates '{"phase": {"current": 2, "name": "Strategy"}}' 2>/dev/null
    if python3 ~/.claude/plugins/cache/act/skills/state-management/scripts/state_manager.py read 2>/dev/null | grep -q '"current": 2'; then
        log_pass "Phase transition works"
    else
        log_fail "Phase transition" "Failed to update phase"
    fi

    # Cleanup
    rm -rf .epct
}

generate_report() {
    echo ""
    echo "Generating report..."

    cat > "$REPORT_FILE" << EOF
# ACT Validation Report

> Generated: $(date -u +"%Y-%m-%dT%H:%M:%SZ")

## Summary

| Metric | Value |
|--------|-------|
| Tests Passed | $PASSED |
| Tests Failed | $FAILED |
| Total | $((PASSED + FAILED)) |

## Results by Project Type

### Webapp (React/TypeScript)
$([ -d "$VALIDATION_DIR/test-webapp" ] && echo "✅ Tested" || echo "⚠️ Not tested")

### API (Node/Express)
$([ -d "$VALIDATION_DIR/test-api" ] && echo "✅ Tested" || echo "⚠️ Not tested")

### CLI (Python)
$([ -d "$VALIDATION_DIR/test-cli" ] && echo "✅ Tested" || echo "⚠️ Not tested")

## Issues Found

EOF

    if [ ${#ISSUES[@]} -eq 0 ]; then
        echo "No issues found! 🎉" >> "$REPORT_FILE"
    else
        for issue in "${ISSUES[@]}"; do
            echo "- ❌ $issue" >> "$REPORT_FILE"
        done
    fi

    echo "" >> "$REPORT_FILE"
    echo "---" >> "$REPORT_FILE"
    echo "*Report generated by ACT validation suite*" >> "$REPORT_FILE"
}

# Main
echo "🧪 ACT Validation Suite"
echo "========================"

# Clean previous
rm -rf "$VALIDATION_DIR"
mkdir -p "$VALIDATION_DIR"

# Generate projects
echo ""
echo "Generating test projects..."
bash "$SCRIPT_DIR/generate_webapp.sh" "test-webapp" "$VALIDATION_DIR" > /dev/null 2>&1 || true
bash "$SCRIPT_DIR/generate_api.sh" "test-api" "$VALIDATION_DIR" > /dev/null 2>&1 || true
bash "$SCRIPT_DIR/generate_cli.sh" "test-cli" "$VALIDATION_DIR" > /dev/null 2>&1 || true

# Run tests
test_project "webapp" "$VALIDATION_DIR/test-webapp"
test_project "api" "$VALIDATION_DIR/test-api"
test_project "cli" "$VALIDATION_DIR/test-cli"

# Generate report
generate_report

# Summary
echo ""
echo "========================"
echo -e "Results: ${GREEN}$PASSED passed${NC}, ${RED}$FAILED failed${NC}"
echo "Report: $REPORT_FILE"
echo "========================"

# Exit code
[ $FAILED -eq 0 ] && exit 0 || exit 1
```

**Step 2: Make executable and commit**

```bash
chmod +x plugin/tests/validation/run_validation.sh
git add plugin/tests/validation/run_validation.sh
git commit -m "feat(tests): add validation test runner with report generation"
```

---

## Batch 6: Starter Project for User Testing (Priority: MEDIUM)

### Task 6.1: Create user starter project

**Files:**
- Create: `docs/starter-project/README.md`
- Create: `docs/starter-project/setup.sh`

**Step 1: Create starter README**

```markdown
# ACT Starter Project

This is a simple webapp project for testing ACT Framework.

## Quick Start

1. **Run setup**
   ```bash
   bash setup.sh
   ```

2. **Install ACT** (if not done)
   ```bash
   git clone https://github.com/manuelturpin/ArtChiTech-framework.git
   cd ArtChiTech-framework
   bash scripts/install.sh
   ```

3. **Test ACT**
   ```bash
   cd starter-webapp
   # In Claude Code:
   /project
   ```

4. **Report issues**
   ```bash
   # In Claude Code:
   /feedback
   ```

## What to Test

1. `/project` - Should detect new project, offer to start
2. `/onboard` - Should audit and initialize .epct/
3. `/status` - Should show phase 1, scores at 0
4. `/next` - Should guide through phase transition
5. `/feedback` - Should capture context and create issue

## Expected Flow

```
/project
  → "No ACT project detected"
  → Choose "Start new project"
  → Enter project name
  → Phase 1: Discovery begins

/status
  → Shows Phase 1/7
  → All scores at 0%

/next
  → Shows Go/No-Go criteria
  → Guides to Phase 2 when ready
```
```

**Step 2: Create setup script**

```bash
#!/bin/bash
# setup.sh - Setup starter project for ACT testing

set -e

echo "🚀 Setting up ACT Starter Project"
echo "=================================="

# Create project
mkdir -p starter-webapp
cd starter-webapp

# Initialize npm
npm init -y

# Create minimal structure
mkdir -p src tests

# Create index.html
cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>ACT Starter</title>
</head>
<body>
    <h1>ACT Starter Project</h1>
    <p>Use this project to test ACT Framework.</p>
    <script src="src/main.js"></script>
</body>
</html>
EOF

# Create main.js
cat > src/main.js << 'EOF'
console.log('ACT Starter Project loaded');
EOF

# Create test
cat > tests/main.test.js << 'EOF'
test('placeholder', () => {
    expect(true).toBe(true);
});
EOF

echo ""
echo "✅ Starter project created in: starter-webapp/"
echo ""
echo "Next steps:"
echo "1. cd starter-webapp"
echo "2. Open Claude Code"
echo "3. Run /project"
```

**Step 3: Commit**

```bash
git add docs/starter-project/
git commit -m "feat(docs): add starter project for user testing"
```

---

## Batch 7: Final Integration & Commit (Priority: HIGH)

### Task 7.1: Run all tests

```bash
bash plugin/tests/run_all_tests.sh
```

Expected: All existing tests pass.

### Task 7.2: Run validation suite

```bash
bash plugin/tests/validation/run_validation.sh
```

Expected: Validation report generated, no critical failures.

### Task 7.3: Update plugin version

**Files:**
- Modify: `plugin/.claude-plugin/plugin.json`

Change version to `1.2.0`.

### Task 7.4: Final commit and tag

```bash
git add -A
git commit -m "feat: complete Phase 6 polishing

- Enhanced install.sh with prerequisite checks
- New /feedback command for issue reporting
- New /triage command for issue management
- New /fix-issue command for guided resolution
- Validation test suite (webapp, api, cli)
- Starter project for user testing

🤖 Generated with [Claude Code](https://claude.com/claude-code)"

git tag -a v1.2.0 -m "v1.2.0 - Phase 6 Polishing complete"
```

---

## Summary

| Batch | Tasks | Priority |
|-------|-------|----------|
| 1: install.sh | 1.1 | HIGH |
| 2: /feedback | 2.1 | HIGH |
| 3: /triage | 3.1 | MEDIUM |
| 4: /fix-issue | 4.1 | MEDIUM |
| 5: Validation | 5.1, 5.2 | HIGH |
| 6: Starter | 6.1 | MEDIUM |
| 7: Integration | 7.1-7.4 | HIGH |

**Total: 10 tasks across 7 batches**
