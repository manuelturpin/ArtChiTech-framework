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
if [ -d "integration" ] && ls integration/*.sh 1> /dev/null 2>&1; then
    echo -e "\n🔗 Integration Tests"
    echo "---"
    for test_file in integration/*.sh; do
        echo "Running: $test_file"
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
