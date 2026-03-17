#!/usr/bin/env bash
# ACT SessionStart Hook
# Triggered on session start, clear, or compact.
# Auto-detects previous sessions and displays recovery info.
#
# Exit codes:
#   0 = OK

set -euo pipefail

ACT_DIR=".act"

# --- 1. Check for ACT project ---
if [ ! -d "$ACT_DIR" ]; then
  # Not an ACT project — silent exit
  exit 0
fi

echo "🔄 ACT Project Detected"
echo "========================"

# --- 2. Display current state ---
if [ -f "${ACT_DIR}/state.md" ]; then
  # Extract key info
  PROJECT=$(grep -i "project\|name:" "${ACT_DIR}/config.yaml" 2>/dev/null | head -1 | sed 's/.*name://' | xargs 2>/dev/null || echo "unknown")
  PHASE=$(grep -i "phase:" "${ACT_DIR}/state.md" | head -1 | sed 's/.*Phase://' | xargs 2>/dev/null || echo "unknown")
  PROGRESS=$(grep -i "progress:" "${ACT_DIR}/state.md" | head -1 | sed 's/.*Progress://' | xargs 2>/dev/null || echo "unknown")
  LAST_UPDATE=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M" "${ACT_DIR}/state.md" 2>/dev/null || stat -c "%y" "${ACT_DIR}/state.md" 2>/dev/null | cut -d'.' -f1 || echo "unknown")

  echo "  Project:     ${PROJECT}"
  echo "  Phase:       ${PHASE}"
  echo "  Progress:    ${PROGRESS}"
  echo "  Last Update: ${LAST_UPDATE}"
  echo ""
fi

# --- 3. Check for blockers ---
if [ -f "${ACT_DIR}/state.md" ]; then
  BLOCKERS=$(grep -i "blocker" "${ACT_DIR}/state.md" 2>/dev/null | grep -iv "none\|no blocker" || true)
  if [ -n "$BLOCKERS" ]; then
    echo "⚠️  Blockers detected:"
    echo "$BLOCKERS"
    echo ""
  fi
fi

# --- 4. Check for recent handoff ---
if [ -f "${ACT_DIR}/handoffs/latest.xml" ]; then
  HANDOFF_AGE=$(( $(date +%s) - $(stat -f "%m" "${ACT_DIR}/handoffs/latest.xml" 2>/dev/null || stat -c "%Y" "${ACT_DIR}/handoffs/latest.xml" 2>/dev/null || echo "0") ))
  if [ "$HANDOFF_AGE" -lt 86400 ]; then
    echo "📋 Recent handoff found (< 24h). Use /act:resume for full context."
    echo ""
  fi
fi

# --- 5. Suggest next action ---
echo "💡 Run /act:resume for full session recovery"
echo "   Run /act:status for current state"
echo "   Run /act:where-am-i for 5-question context check"

exit 0
