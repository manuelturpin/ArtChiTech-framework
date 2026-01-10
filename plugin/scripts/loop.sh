#!/bin/bash
# ACT Loop Script - Adapted from Ralph Wiggum
# Usage: ./loop.sh [max_iterations]

set -e

# Configuration
MAX_ITERATIONS=${1:-10}
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(pwd)"

# Files
PRD_FILE="$PROJECT_DIR/.epct/session/prd.json"
PROGRESS_FILE="$PROJECT_DIR/.epct/loop/progress.md"
PROMPT_FILE="$SCRIPT_DIR/loop-prompt.md"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check prerequisites
check_prerequisites() {
    if ! command -v claude &> /dev/null; then
        echo -e "${RED}Error: claude CLI not found${NC}"
        echo "Install: https://docs.anthropic.com/claude-code"
        exit 1
    fi

    if [ ! -f "$PRD_FILE" ]; then
        echo -e "${RED}Error: PRD file not found at $PRD_FILE${NC}"
        echo "Run /stories-generate first"
        exit 1
    fi

    if [ ! -f "$PROMPT_FILE" ]; then
        echo -e "${RED}Error: Prompt file not found at $PROMPT_FILE${NC}"
        exit 1
    fi
}

# Initialize progress file
init_progress() {
    mkdir -p "$(dirname "$PROGRESS_FILE")"

    if [ ! -f "$PROGRESS_FILE" ]; then
        echo "# Loop Progress" > "$PROGRESS_FILE"
        echo "" >> "$PROGRESS_FILE"
        echo "Started: $(date '+%Y-%m-%d %H:%M:%S')" >> "$PROGRESS_FILE"
        echo "" >> "$PROGRESS_FILE"
        echo "---" >> "$PROGRESS_FILE"
        echo "" >> "$PROGRESS_FILE"
    fi
}

# Log to progress file
log_progress() {
    echo "" >> "$PROGRESS_FILE"
    echo "## Iteration $1 - $(date '+%H:%M:%S')" >> "$PROGRESS_FILE"
    echo "" >> "$PROGRESS_FILE"
    echo "$2" >> "$PROGRESS_FILE"
}

# Main loop
main() {
    check_prerequisites
    init_progress

    echo -e "${GREEN}ACT Loop Starting${NC}"
    echo "Max iterations: $MAX_ITERATIONS"
    echo "PRD: $PRD_FILE"
    echo ""

    for i in $(seq 1 $MAX_ITERATIONS); do
        echo -e "${YELLOW}=== Iteration $i/$MAX_ITERATIONS ===${NC}"

        # Run Claude with the prompt
        OUTPUT=$(cat "$PROMPT_FILE" | claude --dangerously-skip-permissions 2>&1) || true

        # Check for completion signal
        if echo "$OUTPUT" | grep -q "<signal>COMPLETE</signal>"; then
            echo -e "${GREEN}All stories complete!${NC}"
            log_progress $i "COMPLETE - All stories passed"
            exit 0
        fi

        # Log progress
        log_progress $i "In progress..."

        # Brief pause between iterations
        if [ $i -lt $MAX_ITERATIONS ]; then
            echo "Waiting 2s before next iteration..."
            sleep 2
        fi
    done

    # Max iterations reached
    echo -e "${RED}Max iterations reached without completion${NC}"
    echo "Check progress: $PROGRESS_FILE"
    exit 1
}

main
