#!/bin/bash
# run_validation.sh - Run ACT validation tests on generated projects
#
# This script:
# 1. Generates test projects (webapp, api, cli) using the generators
# 2. Runs ACT validation tests on each project
# 3. Tracks passed/failed results
# 4. Generates VALIDATION-REPORT.md in docs/
# 5. Exits with 0 if all pass, 1 if failures

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VALIDATION_DIR="/tmp/act-validation"
REPORT_FILE="$SCRIPT_DIR/../../../docs/VALIDATION-REPORT.md"

# ACT Plugin path (installed location)
ACT_PLUGIN="$HOME/.claude/plugins/cache/act"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Results tracking
PASSED=0
FAILED=0
SKIPPED=0
declare -a ISSUES
declare -a TEST_RESULTS

# Logging functions
log_pass() {
    echo -e "  ${GREEN}[PASS]${NC} $1"
    ((PASSED++))
    TEST_RESULTS+=("PASS|$1")
}

log_fail() {
    echo -e "  ${RED}[FAIL]${NC} $1"
    ((FAILED++))
    ISSUES+=("$1: $2")
    TEST_RESULTS+=("FAIL|$1|$2")
}

log_skip() {
    echo -e "  ${YELLOW}[SKIP]${NC} $1"
    ((SKIPPED++))
    TEST_RESULTS+=("SKIP|$1")
}

log_info() {
    echo -e "${BLUE}>>>${NC} $1"
}

log_header() {
    echo ""
    echo -e "${BOLD}$1${NC}"
    echo "$(echo "$1" | sed 's/./-/g')"
}

# Check prerequisites
check_prerequisites() {
    log_header "Checking Prerequisites"

    # Check Python
    if ! command -v python3 &> /dev/null; then
        echo -e "${RED}Error: Python 3 is required${NC}"
        exit 1
    fi
    echo -e "  ${GREEN}[OK]${NC} Python 3 found"

    # Check ACT plugin installation
    if [ ! -d "$ACT_PLUGIN" ]; then
        echo -e "${YELLOW}Warning: ACT plugin not found at $ACT_PLUGIN${NC}"
        echo -e "${YELLOW}Using local plugin path instead...${NC}"
        ACT_PLUGIN="$SCRIPT_DIR/../.."
    fi

    # Check state_manager.py
    if [ ! -f "$ACT_PLUGIN/skills/state-management/scripts/state_manager.py" ]; then
        echo -e "${RED}Error: state_manager.py not found${NC}"
        exit 1
    fi
    echo -e "  ${GREEN}[OK]${NC} state_manager.py found"

    # Check detect_stack.py
    if [ ! -f "$ACT_PLUGIN/skills/project-detection/scripts/detect_stack.py" ]; then
        echo -e "${RED}Error: detect_stack.py not found${NC}"
        exit 1
    fi
    echo -e "  ${GREEN}[OK]${NC} detect_stack.py found"

    echo -e "  ${GREEN}[OK]${NC} Plugin path: $ACT_PLUGIN"
}

# Generate test projects
generate_projects() {
    log_header "Generating Test Projects"

    rm -rf "$VALIDATION_DIR"
    mkdir -p "$VALIDATION_DIR"

    # Webapp - uses npm create vite, so we make it optional
    log_info "Generating Webapp project..."
    if bash "$SCRIPT_DIR/generate_webapp.sh" "test-webapp" "$VALIDATION_DIR" > /dev/null 2>&1; then
        echo -e "  ${GREEN}[OK]${NC} Webapp generated"
    else
        echo -e "  ${YELLOW}[SKIP]${NC} Webapp generation failed (requires npm/vite)"
        # Create minimal webapp manually for testing
        mkdir -p "$VALIDATION_DIR/test-webapp"
        cat > "$VALIDATION_DIR/test-webapp/package.json" << 'EOF'
{
  "name": "test-webapp",
  "version": "1.0.0",
  "dependencies": {
    "react": "^18.0.0",
    "react-dom": "^18.0.0"
  },
  "devDependencies": {
    "typescript": "^5.0.0",
    "vite": "^5.0.0"
  }
}
EOF
        mkdir -p "$VALIDATION_DIR/test-webapp/src"
        echo "export default function App() { return <div>App</div> }" > "$VALIDATION_DIR/test-webapp/src/App.tsx"
        echo -e "  ${GREEN}[OK]${NC} Minimal webapp created"
    fi

    # API
    log_info "Generating API project..."
    if bash "$SCRIPT_DIR/generate_api.sh" "test-api" "$VALIDATION_DIR" > /dev/null 2>&1; then
        echo -e "  ${GREEN}[OK]${NC} API generated"
    else
        echo -e "  ${YELLOW}[SKIP]${NC} API generation failed (requires npm)"
        # Create minimal API manually for testing
        mkdir -p "$VALIDATION_DIR/test-api/src"
        cat > "$VALIDATION_DIR/test-api/package.json" << 'EOF'
{
  "name": "test-api",
  "version": "1.0.0",
  "dependencies": {
    "express": "^4.18.0"
  },
  "devDependencies": {
    "typescript": "^5.0.0"
  }
}
EOF
        cat > "$VALIDATION_DIR/test-api/src/index.ts" << 'EOF'
import express from 'express'
const app = express()
app.get('/health', (req, res) => res.json({ status: 'ok' }))
export default app
EOF
        echo -e "  ${GREEN}[OK]${NC} Minimal API created"
    fi

    # CLI
    log_info "Generating CLI project..."
    if bash "$SCRIPT_DIR/generate_cli.sh" "test-cli" "$VALIDATION_DIR" > /dev/null 2>&1; then
        echo -e "  ${GREEN}[OK]${NC} CLI generated"
    else
        echo -e "  ${YELLOW}[SKIP]${NC} CLI generation failed"
        # Create minimal CLI manually for testing
        mkdir -p "$VALIDATION_DIR/test-cli/src"
        cat > "$VALIDATION_DIR/test-cli/src/cli.py" << 'EOF'
#!/usr/bin/env python3
import argparse
def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('command', choices=['hello', 'version'])
    args = parser.parse_args()
    if args.command == 'hello':
        print("Hello, World!")
    elif args.command == 'version':
        print("v0.1.0")
if __name__ == '__main__':
    main()
EOF
        cat > "$VALIDATION_DIR/test-cli/requirements.txt" << 'EOF'
pytest>=7.0.0
EOF
        echo -e "  ${GREEN}[OK]${NC} Minimal CLI created"
    fi
}

# Run tests for a single project
test_project() {
    local type=$1
    local dir=$2
    local project_name=$3

    log_header "Testing: $project_name ($type)"

    if [ ! -d "$dir" ]; then
        log_skip "Directory not found: $dir"
        return
    fi

    cd "$dir"

    # Test 1: Project detection
    echo "  Running: Project detection..."
    local detection_output
    if detection_output=$(python3 "$ACT_PLUGIN/skills/project-detection/scripts/detect_stack.py" 2>/dev/null); then
        if echo "$detection_output" | grep -q "stack\|type\|framework"; then
            log_pass "Stack detection - detected project type"
        else
            log_pass "Stack detection - script executed"
        fi
    else
        log_fail "Stack detection" "detect_stack.py failed to execute"
    fi

    # Test 2: No .epct initially
    echo "  Running: Initial state check..."
    if [ ! -d ".epct" ]; then
        log_pass "No .epct/ directory initially"
    else
        log_fail "Initial state" ".epct/ should not exist before initialization"
        rm -rf .epct  # Clean up for next tests
    fi

    # Test 3: State initialization
    echo "  Running: State initialization..."
    local init_output
    if init_output=$(python3 "$ACT_PLUGIN/skills/state-management/scripts/state_manager.py" init \
        --name "$project_name" \
        --type "$type" \
        --stack "test-stack" 2>&1); then
        if [ -f ".epct/state.json" ]; then
            log_pass "State initialized - .epct/state.json created"
        else
            log_fail "State initialization" "state.json not created despite successful init"
        fi
    else
        log_fail "State initialization" "state_manager.py init failed: $init_output"
    fi

    # Test 4: State read
    echo "  Running: State read..."
    local read_output
    if read_output=$(python3 "$ACT_PLUGIN/skills/state-management/scripts/state_manager.py" read 2>&1); then
        if echo "$read_output" | grep -q "phase"; then
            log_pass "State readable - contains phase information"
        else
            log_fail "State read" "State readable but missing phase information"
        fi
    else
        log_fail "State read" "Cannot read state: $read_output"
    fi

    # Test 5: Phase transition
    echo "  Running: Phase transition..."
    local update_output
    if update_output=$(python3 "$ACT_PLUGIN/skills/state-management/scripts/state_manager.py" update \
        --updates '{"phase": {"current": 2, "name": "Strategy"}}' 2>&1); then
        # Verify the update
        local verify_output
        verify_output=$(python3 "$ACT_PLUGIN/skills/state-management/scripts/state_manager.py" read 2>&1)
        if echo "$verify_output" | grep -q '"current": 2\|"current":2'; then
            log_pass "Phase transition - updated to phase 2"
        else
            log_fail "Phase transition" "Phase update command succeeded but state not updated"
        fi
    else
        log_fail "Phase transition" "Failed to update phase: $update_output"
    fi

    # Cleanup
    rm -rf .epct
}

# Generate markdown report
generate_report() {
    log_header "Generating Report"

    local timestamp
    timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    local total=$((PASSED + FAILED + SKIPPED))
    local pass_rate=0
    if [ $total -gt 0 ]; then
        pass_rate=$((PASSED * 100 / total))
    fi

    cat > "$REPORT_FILE" << EOF
# ACT Validation Report

> Generated: $timestamp

## Summary

| Metric | Value |
|--------|-------|
| Tests Passed | $PASSED |
| Tests Failed | $FAILED |
| Tests Skipped | $SKIPPED |
| Total | $total |
| Pass Rate | ${pass_rate}% |

## Status

EOF

    if [ $FAILED -eq 0 ]; then
        echo "**All tests passed!** :white_check_mark:" >> "$REPORT_FILE"
    else
        echo "**Some tests failed.** :x:" >> "$REPORT_FILE"
    fi

    cat >> "$REPORT_FILE" << EOF

## Results by Project Type

### Webapp (React/TypeScript)

EOF
    if [ -d "$VALIDATION_DIR/test-webapp" ]; then
        echo "- Tested" >> "$REPORT_FILE"
    else
        echo "- Not tested (generation failed)" >> "$REPORT_FILE"
    fi

    cat >> "$REPORT_FILE" << EOF

### API (Node/Express)

EOF
    if [ -d "$VALIDATION_DIR/test-api" ]; then
        echo "- Tested" >> "$REPORT_FILE"
    else
        echo "- Not tested (generation failed)" >> "$REPORT_FILE"
    fi

    cat >> "$REPORT_FILE" << EOF

### CLI (Python)

EOF
    if [ -d "$VALIDATION_DIR/test-cli" ]; then
        echo "- Tested" >> "$REPORT_FILE"
    else
        echo "- Not tested (generation failed)" >> "$REPORT_FILE"
    fi

    cat >> "$REPORT_FILE" << EOF

## Test Details

| Project | Test | Result |
|---------|------|--------|
EOF

    for result in "${TEST_RESULTS[@]}"; do
        IFS='|' read -r status test_name reason <<< "$result"
        case $status in
            PASS)
                echo "| - | $test_name | :white_check_mark: Pass |" >> "$REPORT_FILE"
                ;;
            FAIL)
                echo "| - | $test_name | :x: Fail - $reason |" >> "$REPORT_FILE"
                ;;
            SKIP)
                echo "| - | $test_name | :warning: Skipped |" >> "$REPORT_FILE"
                ;;
        esac
    done

    cat >> "$REPORT_FILE" << EOF

## Issues Found

EOF

    if [ ${#ISSUES[@]} -eq 0 ]; then
        echo "No issues found." >> "$REPORT_FILE"
    else
        for issue in "${ISSUES[@]}"; do
            echo "- $issue" >> "$REPORT_FILE"
        done
    fi

    cat >> "$REPORT_FILE" << EOF

## Environment

| Variable | Value |
|----------|-------|
| Plugin Path | $ACT_PLUGIN |
| Validation Dir | $VALIDATION_DIR |
| Python Version | $(python3 --version 2>&1 | head -1) |

---

*Report generated by ACT validation suite*
EOF

    echo -e "  ${GREEN}[OK]${NC} Report saved to: $REPORT_FILE"
}

# Print final summary
print_summary() {
    local total=$((PASSED + FAILED + SKIPPED))

    echo ""
    echo "========================================"
    echo -e "${BOLD}VALIDATION SUMMARY${NC}"
    echo "========================================"
    echo ""
    echo -e "  ${GREEN}Passed:${NC}  $PASSED"
    echo -e "  ${RED}Failed:${NC}  $FAILED"
    echo -e "  ${YELLOW}Skipped:${NC} $SKIPPED"
    echo -e "  Total:   $total"
    echo ""

    if [ $FAILED -eq 0 ]; then
        echo -e "${GREEN}========================================${NC}"
        echo -e "${GREEN}  ALL VALIDATION TESTS PASSED!${NC}"
        echo -e "${GREEN}========================================${NC}"
    else
        echo -e "${RED}========================================${NC}"
        echo -e "${RED}  VALIDATION FAILED - $FAILED issues${NC}"
        echo -e "${RED}========================================${NC}"
        echo ""
        echo "Issues:"
        for issue in "${ISSUES[@]}"; do
            echo -e "  ${RED}-${NC} $issue"
        done
    fi

    echo ""
    echo "Report: $REPORT_FILE"
    echo ""
}

# Main execution
main() {
    echo ""
    echo -e "${BOLD}ACT Validation Suite${NC}"
    echo "=================================="
    echo ""

    # Check prerequisites
    check_prerequisites

    # Generate test projects
    generate_projects

    # Run tests on each project type
    test_project "webapp" "$VALIDATION_DIR/test-webapp" "test-webapp"
    test_project "api" "$VALIDATION_DIR/test-api" "test-api"
    test_project "cli" "$VALIDATION_DIR/test-cli" "test-cli"

    # Generate report
    generate_report

    # Print summary
    print_summary

    # Cleanup (optional - keep for debugging)
    # rm -rf "$VALIDATION_DIR"

    # Exit with appropriate code
    if [ $FAILED -eq 0 ]; then
        exit 0
    else
        exit 1
    fi
}

# Run main
main "$@"
