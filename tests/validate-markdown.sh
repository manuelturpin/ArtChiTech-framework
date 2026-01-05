#!/bin/bash
# Validate Markdown files structure and frontmatter

set -e
ERRORS=0
WARNINGS=0

echo "=== Validating Skills (src/skills/*.md) ==="

for file in src/skills/*.md; do
  if [ -f "$file" ]; then
    # Check frontmatter exists
    if head -1 "$file" | grep -q "^---$"; then
      echo "✅ $file has frontmatter"

      # Check required frontmatter fields
      if grep -q "^name:" "$file"; then
        echo "   ✅ has 'name'"
      else
        echo "   ❌ missing 'name'"
        ERRORS=$((ERRORS + 1))
      fi

      if grep -q "^description:" "$file"; then
        echo "   ✅ has 'description'"
      else
        echo "   ❌ missing 'description'"
        ERRORS=$((ERRORS + 1))
      fi
    else
      echo "❌ $file missing frontmatter"
      ERRORS=$((ERRORS + 1))
    fi
  fi
done

echo ""
echo "=== Validating CLI Commands (src/cli/*.md) ==="

for file in src/cli/*.md; do
  if [ -f "$file" ]; then
    # Check frontmatter exists
    if head -1 "$file" | grep -q "^---$"; then
      echo "✅ $file has frontmatter"

      # Check required frontmatter fields for CLI
      if grep -q "^name:" "$file"; then
        echo "   ✅ has 'name'"
      else
        echo "   ❌ missing 'name'"
        ERRORS=$((ERRORS + 1))
      fi

      if grep -q "^command:" "$file"; then
        echo "   ✅ has 'command'"
      else
        echo "   ❌ missing 'command'"
        ERRORS=$((ERRORS + 1))
      fi

      if grep -q "^description:" "$file"; then
        echo "   ✅ has 'description'"
      else
        echo "   ❌ missing 'description'"
        ERRORS=$((ERRORS + 1))
      fi
    else
      echo "❌ $file missing frontmatter"
      ERRORS=$((ERRORS + 1))
    fi
  fi
done

echo ""
echo "=== Validating Phase Docs (src/reference/phases/*.md) ==="

EXPECTED_PHASES=("1-discovery" "2-strategie" "3-conception" "4-developpement" "5-qualite" "6-lancement" "7-croissance")

for phase in "${EXPECTED_PHASES[@]}"; do
  file="src/reference/phases/${phase}.md"
  if [ -f "$file" ]; then
    echo "✅ $file exists"

    # Check has H1 title
    if grep -q "^# Phase" "$file"; then
      echo "   ✅ has Phase title"
    else
      echo "   ⚠️  missing Phase title"
      WARNINGS=$((WARNINGS + 1))
    fi

    # Check has Checklist section
    if grep -q "## Checklist" "$file"; then
      echo "   ✅ has Checklist"
    else
      echo "   ⚠️  missing Checklist section"
      WARNINGS=$((WARNINGS + 1))
    fi

    # Check has Anti-Patterns section
    if grep -q "## Anti-Patterns" "$file"; then
      echo "   ✅ has Anti-Patterns"
    else
      echo "   ⚠️  missing Anti-Patterns section"
      WARNINGS=$((WARNINGS + 1))
    fi
  else
    echo "❌ $file missing"
    ERRORS=$((ERRORS + 1))
  fi
done

echo ""
echo "=== Validating cross-references ==="

# Check that skills referenced in CLI exist
echo "Checking skill references..."
for skill in "context-manager" "chunk-manager" "error-tracker" "phase-controller" "projet-orchestrator" "tips-engine"; do
  if [ -f "src/skills/${skill}.md" ]; then
    echo "✅ $skill exists"
  else
    echo "❌ $skill missing"
    ERRORS=$((ERRORS + 1))
  fi
done

echo ""
echo "=== Summary ==="
if [ $ERRORS -eq 0 ]; then
  if [ $WARNINGS -eq 0 ]; then
    echo "✅ All Markdown validations passed!"
  else
    echo "✅ Passed with $WARNINGS warning(s)"
  fi
  exit 0
else
  echo "❌ $ERRORS error(s), $WARNINGS warning(s)"
  exit 1
fi
