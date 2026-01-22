#!/bin/bash
# Test du flux erreur → /act-fix → résolution
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS="$SCRIPT_DIR/../../skills"
TEMP_DIR=$(mktemp -d)

cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

echo "🧪 Test: Error → /act-fix → Resolution flow"

cd "$TEMP_DIR"
mkdir test-project && cd test-project

# 1. Init projet
python3 "$SKILLS/state-management/scripts/state_manager.py" init \
    --name "test-project" \
    --type "webapp" \
    --stack "react,typescript" > /dev/null
echo "  ✓ Projet initialisé"

# 2. Vérifier pas d'erreurs au départ
if [ -d ".epct/errors/active" ] && [ "$(ls -A .epct/errors/active 2>/dev/null)" ]; then
    echo "❌ FAIL: Erreurs actives devraient être vides au départ"
    exit 1
fi
echo "  ✓ Aucune erreur active au départ"

# 3. Créer structure erreurs
mkdir -p .epct/errors/active
mkdir -p .epct/errors/resolved
echo "  ✓ Structure erreurs créée"

# 4. Simuler une erreur critique (type_error)
ERROR_ID="001"
cat > .epct/errors/active/${ERROR_ID}.json << 'EOF'
{
  "id": "001",
  "type": "type_error",
  "severity": "critical",
  "blocking": true,
  "chunk": "UserService.create",
  "file": "src/services/UserService.ts",
  "line": 42,
  "message": "Property 'email' does not exist on type 'User'",
  "context": {
    "phase": 4,
    "attemptedFixes": 0
  },
  "created": "2026-01-22T10:00:00Z"
}
EOF
echo "  ✓ Erreur critique créée (001 - type_error)"

# 5. Mettre à jour state avec erreur
python3 "$SKILLS/state-management/scripts/state_manager.py" update \
    --updates '{"errors": {"active": 1, "blocking": true}}' > /dev/null
echo "  ✓ State mis à jour avec erreur"

# 6. Vérifier erreur est bloquante
STATE=$(python3 "$SKILLS/state-management/scripts/state_manager.py" read)
BLOCKING=$(echo "$STATE" | python3 -c "import sys,json; print(json.load(sys.stdin)['errors']['blocking'])")
if [ "$BLOCKING" != "True" ]; then
    echo "❌ FAIL: Erreur devrait être bloquante"
    exit 1
fi
echo "  ✓ Erreur bloquante détectée"

# 7. Simuler résolution de l'erreur
# Ajouter info de résolution
cat > .epct/errors/resolved/${ERROR_ID}.json << 'EOF'
{
  "id": "001",
  "type": "type_error",
  "severity": "critical",
  "blocking": true,
  "chunk": "UserService.create",
  "file": "src/services/UserService.ts",
  "line": 42,
  "message": "Property 'email' does not exist on type 'User'",
  "context": {
    "phase": 4,
    "attemptedFixes": 1
  },
  "created": "2026-01-22T10:00:00Z",
  "resolved": "2026-01-22T10:30:00Z",
  "resolution": "Added email property to User interface"
}
EOF

# Supprimer de active
rm .epct/errors/active/${ERROR_ID}.json

# Mettre à jour state
python3 "$SKILLS/state-management/scripts/state_manager.py" update \
    --updates '{"errors": {"active": 0, "blocking": false}}' > /dev/null
echo "  ✓ Erreur résolue et déplacée"

# 8. Vérifier plus d'erreurs actives
ACTIVE_COUNT=$(ls -A .epct/errors/active 2>/dev/null | wc -l | tr -d ' ')
if [ "$ACTIVE_COUNT" != "0" ]; then
    echo "❌ FAIL: Devrait y avoir 0 erreurs actives, got $ACTIVE_COUNT"
    exit 1
fi
echo "  ✓ 0 erreurs actives"

# 9. Vérifier erreur dans resolved
RESOLVED_COUNT=$(ls -A .epct/errors/resolved 2>/dev/null | wc -l | tr -d ' ')
if [ "$RESOLVED_COUNT" != "1" ]; then
    echo "❌ FAIL: Devrait y avoir 1 erreur résolue, got $RESOLVED_COUNT"
    exit 1
fi
echo "  ✓ 1 erreur dans resolved"

# 10. Vérifier state plus bloquant
STATE=$(python3 "$SKILLS/state-management/scripts/state_manager.py" read)
BLOCKING=$(echo "$STATE" | python3 -c "import sys,json; print(json.load(sys.stdin)['errors']['blocking'])")
if [ "$BLOCKING" != "False" ]; then
    echo "❌ FAIL: State ne devrait plus être bloquant"
    exit 1
fi
echo "  ✓ State n'est plus bloquant"

# 11. Test avec erreur multiple (simuler 2 erreurs, résoudre 1)
cat > .epct/errors/active/002.json << 'EOF'
{
  "id": "002",
  "type": "build_error",
  "severity": "critical",
  "blocking": true,
  "message": "Module not found: 'lodash'",
  "created": "2026-01-22T11:00:00Z"
}
EOF

cat > .epct/errors/active/003.json << 'EOF'
{
  "id": "003",
  "type": "lint_warning",
  "severity": "minor",
  "blocking": false,
  "message": "Unused variable 'temp'",
  "created": "2026-01-22T11:00:00Z"
}
EOF

python3 "$SKILLS/state-management/scripts/state_manager.py" update \
    --updates '{"errors": {"active": 2, "blocking": true}}' > /dev/null
echo "  ✓ 2 nouvelles erreurs créées (1 critique, 1 mineure)"

# 12. Résoudre seulement l'erreur critique
mv .epct/errors/active/002.json .epct/errors/resolved/
python3 "$SKILLS/state-management/scripts/state_manager.py" update \
    --updates '{"errors": {"active": 1, "blocking": false}}' > /dev/null
echo "  ✓ Erreur critique résolue, mineure reste"

# 13. Vérifier qu'on peut continuer (plus de blocage)
STATE=$(python3 "$SKILLS/state-management/scripts/state_manager.py" read)
BLOCKING=$(echo "$STATE" | python3 -c "import sys,json; print(json.load(sys.stdin)['errors']['blocking'])")
ACTIVE=$(echo "$STATE" | python3 -c "import sys,json; print(json.load(sys.stdin)['errors']['active'])")

if [ "$BLOCKING" != "False" ]; then
    echo "❌ FAIL: State ne devrait plus être bloquant après résolution critique"
    exit 1
fi
if [ "$ACTIVE" != "1" ]; then
    echo "❌ FAIL: Devrait rester 1 erreur active (mineure), got $ACTIVE"
    exit 1
fi
echo "  ✓ 1 erreur mineure reste, pas de blocage"

echo "✅ test_error_fix_flow PASSED"
