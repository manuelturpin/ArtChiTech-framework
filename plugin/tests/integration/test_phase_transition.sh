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

# 8. Vérifier que le score discovery a été préservé
SCORE=$(echo "$STATE" | python3 -c "import sys,json; print(json.load(sys.stdin)['scores']['discovery'])")
if [ "$SCORE" != "85" ]; then
    echo "❌ FAIL: Score discovery devrait être 85, got $SCORE"
    exit 1
fi
echo "  ✓ Score discovery préservé (85)"

echo "✅ test_phase_transition PASSED"
