#!/usr/bin/env bash
# ACT PreToolUse Hook
# Triggered before Write, Edit, or Bash tool execution.
# Verifies alignment with the current plan and logs tool usage.
#
# Exit codes:
#   0 = OK, proceed with tool use
#   Non-zero = Warning (logged but does not block)

set -euo pipefail

ACT_DIR=".act"
PLAN_FILE="${ACT_DIR}/plan.md"
STATE_FILE="${ACT_DIR}/state.md"

# Skip if no .act/ directory (not an ACT project)
if [ ! -d "$ACT_DIR" ]; then
  exit 0
fi

# --- 1. Refresh current phase ---
CURRENT_PHASE=""
if [ -f "$STATE_FILE" ]; then
  CURRENT_PHASE=$(grep -i "phase:" "$STATE_FILE" | head -1 | sed 's/.*Phase://' | xargs 2>/dev/null || echo "unknown")
fi

# --- 2. Check plan exists ---
if [ ! -f "$PLAN_FILE" ]; then
  echo "⚠️  ACT: No plan.md found. Consider running /act:init or /act:start."
  exit 0
fi

# --- 3. Log tool usage ---
TOOL_NAME="${TOOL_NAME:-unknown}"
TOOL_INPUT="${TOOL_INPUT:-}"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Create logs directory if needed
mkdir -p "${ACT_DIR}/logs"

echo "${TIMESTAMP} | PreToolUse | tool=${TOOL_NAME} | phase=${CURRENT_PHASE}" >> "${ACT_DIR}/logs/hook-activity.log"

# --- 4. Check .worktrees in .gitignore ---
if [ -d ".worktrees" ]; then
  if [ -f ".gitignore" ]; then
    if ! grep -q "\.worktrees" .gitignore 2>/dev/null; then
      echo "⚠️  ACT: .worktrees/ directory exists but not in .gitignore"
    fi
  fi
fi

exit 0
