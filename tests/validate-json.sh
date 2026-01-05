#!/bin/bash
# Validate all JSON files in .epct/

set -e
ERRORS=0

echo "=== Validating JSON files ==="

# Find all JSON files
for file in $(find .epct -name "*.json" 2>/dev/null); do
  if jq . "$file" > /dev/null 2>&1; then
    echo "✅ $file"
  else
    echo "❌ $file - Invalid JSON"
    ERRORS=$((ERRORS + 1))
  fi
done

# Validate specific schema for state.json
echo ""
echo "=== Validating state.json schema ==="

if [ -f ".epct/state.json" ]; then
  # Check required fields
  REQUIRED_FIELDS=("project" "currentPhase" "phaseName" "progress" "errors" "session")

  for field in "${REQUIRED_FIELDS[@]}"; do
    if jq -e ".$field" .epct/state.json > /dev/null 2>&1; then
      echo "✅ state.json has '$field'"
    else
      echo "❌ state.json missing '$field'"
      ERRORS=$((ERRORS + 1))
    fi
  done
fi

# Validate session files
echo ""
echo "=== Validating session files ==="

if [ -f ".epct/session/current.json" ]; then
  for field in "sessionId" "startedAt" "tokensUsed" "active"; do
    if jq -e ".$field" .epct/session/current.json > /dev/null 2>&1 || jq -e ".$field == null" .epct/session/current.json > /dev/null 2>&1; then
      echo "✅ current.json has '$field'"
    else
      echo "❌ current.json missing '$field'"
      ERRORS=$((ERRORS + 1))
    fi
  done
fi

echo ""
if [ $ERRORS -eq 0 ]; then
  echo "✅ All JSON validations passed!"
  exit 0
else
  echo "❌ $ERRORS error(s) found"
  exit 1
fi
