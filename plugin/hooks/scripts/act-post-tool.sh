#!/usr/bin/env bash
# ACT PostToolUse Hook
# Triggered after Write or Edit tool execution.
# Tracks progression and maps modifications to phases.
#
# Exit codes:
#   0 = OK

set -euo pipefail

ACT_DIR=".act"
PROGRESS_FILE="${ACT_DIR}/progress.md"
STATE_FILE="${ACT_DIR}/state.md"

# Skip if no .act/ directory
if [ ! -d "$ACT_DIR" ]; then
  exit 0
fi

# --- 1. Log the modification ---
TOOL_NAME="${TOOL_NAME:-unknown}"
FILE_PATH="${FILE_PATH:-unknown}"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

mkdir -p "${ACT_DIR}/logs"
echo "${TIMESTAMP} | PostToolUse | tool=${TOOL_NAME} | file=${FILE_PATH}" >> "${ACT_DIR}/logs/hook-activity.log"

# --- 2. Remind about progress update ---
# Count modifications since last progress.md update
if [ -f "$PROGRESS_FILE" ]; then
  LAST_PROGRESS_UPDATE=$(stat -f "%m" "$PROGRESS_FILE" 2>/dev/null || stat -c "%Y" "$PROGRESS_FILE" 2>/dev/null || echo "0")
  NOW=$(date +%s)
  DIFF=$((NOW - LAST_PROGRESS_UPDATE))

  # If more than 10 minutes since last progress update, remind
  if [ "$DIFF" -gt 600 ]; then
    echo "📝 ACT: Consider updating progress.md (last update > 10 min ago)"
  fi
fi

# --- 3. Check for phase completion indicators ---
if [ -f "$STATE_FILE" ]; then
  # Count completed tasks in plan
  if [ -f "${ACT_DIR}/plan.md" ]; then
    TOTAL_TASKS=$(grep -c "^\s*- \[" "${ACT_DIR}/plan.md" 2>/dev/null || echo "0")
    DONE_TASKS=$(grep -c "^\s*- \[x\]" "${ACT_DIR}/plan.md" 2>/dev/null || echo "0")

    if [ "$TOTAL_TASKS" -gt 0 ]; then
      PROGRESS=$((DONE_TASKS * 100 / TOTAL_TASKS))
      echo "📊 ACT: Progress ${DONE_TASKS}/${TOTAL_TASKS} tasks (${PROGRESS}%)"
    fi
  fi
fi

exit 0
