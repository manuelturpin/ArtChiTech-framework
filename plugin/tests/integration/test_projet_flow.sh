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
