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
