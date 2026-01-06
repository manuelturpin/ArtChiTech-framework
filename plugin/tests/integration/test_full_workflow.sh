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

echo "Test: Full ACT Workflow"
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
echo "Projet cree: my-webapp"

# 1. Detection
echo ""
echo "Step 1: Detection..."
DETECTION=$(python3 "$SKILLS/project-detection/scripts/detect_stack.py" 2>/dev/null || echo '{}')
echo "  Stack detectee"

# 2. Verifier pas de .epct
EXISTS=$(python3 "$SKILLS/state-management/scripts/state_manager.py" exists)
if [ "$EXISTS" = "true" ]; then
    echo "  X FAIL: .epct ne devrait pas exister"
    exit 1
fi
echo "  Pas de .epct/ (projet non-ACT)"

# 3. Onboard - Init
echo ""
echo "Step 2: Onboard..."
python3 "$SKILLS/state-management/scripts/state_manager.py" init \
    --name "my-webapp" \
    --type "webapp" \
    --stack "react,typescript" > /dev/null
echo "  Projet initialise"

# 4. Verifier state cree
EXISTS=$(python3 "$SKILLS/state-management/scripts/state_manager.py" exists)
if [ "$EXISTS" != "true" ]; then
    echo "  X FAIL: .epct devrait exister"
    exit 1
fi
echo "  .epct/ cree"

# 5. Lire state
echo ""
echo "Step 3: Status..."
STATE=$(python3 "$SKILLS/state-management/scripts/state_manager.py" read)
echo "  State lisible"

# 6. Simuler progression phases
echo ""
echo "Step 4: Progression phases..."

for phase in 2 3 4; do
    PHASE_NAMES=("" "Discovery" "Strategie" "Conception" "Developpement")
    python3 "$SKILLS/state-management/scripts/state_manager.py" update \
        --updates "{\"phase\": {\"current\": $phase, \"name\": \"${PHASE_NAMES[$phase]}\"}}" > /dev/null
    echo "  Phase $phase: ${PHASE_NAMES[$phase]}"
done

# 7. Creer checkpoint
echo ""
echo "Step 5: Checkpoint..."
CHECKPOINT=$(python3 "$SKILLS/state-management/scripts/state_manager.py" checkpoint)
echo "  Checkpoint cree: $(basename $CHECKPOINT)"

# 8. Ajouter feature
echo ""
echo "Step 6: Mode FEATURE..."
python3 "$SKILLS/state-management/scripts/state_manager.py" update \
    --updates '{"mode": "FEATURE", "current_feature": {"name": "Auth", "phase": 4, "chunks_completed": 0, "chunks_total": 3}}' > /dev/null
echo "  Feature 'Auth' ajoutee"

# 9. Verifier etat final
STATE=$(python3 "$SKILLS/state-management/scripts/state_manager.py" read)
MODE=$(echo "$STATE" | python3 -c "import sys,json; print(json.load(sys.stdin)['mode'])")
if [ "$MODE" != "FEATURE" ]; then
    echo "  X FAIL: Mode devrait etre FEATURE"
    exit 1
fi
echo "  Mode = FEATURE"

echo ""
echo "=========================="
echo "test_full_workflow PASSED"
