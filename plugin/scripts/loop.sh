#!/bin/bash
# ACT Loop Script - Adapted from Ralph Wiggum
# Usage: ./loop.sh [--phase PHASE] [--max N] [--target DIR]
#
# Options:
#   --phase PHASE   Phase to run: discovery, strategy, design, dev, quality (default: dev)
#   --max N         Max iterations (default: 10)
#   --target DIR    Target directory to run in (default: current directory)
#
# Examples:
#   ./loop.sh --phase discovery --max 5
#   ./loop.sh --phase dev --target /path/to/project

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default configuration
PHASE="dev"
MAX_ITERATIONS=10
TARGET_DIR=""
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --phase)
            PHASE="$2"
            shift 2
            ;;
        --max)
            MAX_ITERATIONS="$2"
            shift 2
            ;;
        --target)
            TARGET_DIR="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: ./loop.sh [--phase PHASE] [--max N] [--target DIR]"
            echo ""
            echo "Options:"
            echo "  --phase PHASE   Phase: discovery, strategy, design, dev, quality (default: dev)"
            echo "  --max N         Max iterations (default: 10)"
            echo "  --target DIR    Target directory (default: current)"
            echo ""
            echo "Examples:"
            echo "  ./loop.sh --phase discovery --max 5"
            echo "  ./loop.sh --phase dev --target /path/to/project"
            exit 0
            ;;
        *)
            # Legacy: first positional arg is max_iterations
            if [[ "$1" =~ ^[0-9]+$ ]]; then
                MAX_ITERATIONS="$1"
            fi
            shift
            ;;
    esac
done

# Set project directory
if [ -n "$TARGET_DIR" ]; then
    PROJECT_DIR="$TARGET_DIR"
else
    PROJECT_DIR="$(pwd)"
fi

# Select prompt file based on phase
if [ "$PHASE" == "dev" ]; then
    PROMPT_FILE="$SCRIPT_DIR/loop-prompt.md"
else
    PROMPT_FILE="$SCRIPT_DIR/prompts/loop-prompt-${PHASE}.md"
fi

# Files
PRD_FILE="$PROJECT_DIR/.epct/session/prd.json"
PROGRESS_FILE="$PROJECT_DIR/.epct/loop/progress.md"
METRICS_FILE="$PROJECT_DIR/.epct/loop/metrics.json"
LOG_DIR="$PROJECT_DIR/.epct/loop/logs"
START_TIME=$(date +%s)

# Validate phase
valid_phases=("discovery" "strategy" "design" "dev" "quality")
if [[ ! " ${valid_phases[@]} " =~ " ${PHASE} " ]]; then
    echo -e "${RED}Error: Invalid phase '$PHASE'${NC}"
    echo "Valid phases: ${valid_phases[*]}"
    exit 1
fi

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
    mkdir -p "$LOG_DIR"

    if [ ! -f "$PROGRESS_FILE" ]; then
        echo "# Loop Progress" > "$PROGRESS_FILE"
        echo "" >> "$PROGRESS_FILE"
        echo "Started: $(date '+%Y-%m-%d %H:%M:%S')" >> "$PROGRESS_FILE"
        echo "" >> "$PROGRESS_FILE"
        echo "---" >> "$PROGRESS_FILE"
        echo "" >> "$PROGRESS_FILE"
    fi

    # Add phase header
    echo "" >> "$PROGRESS_FILE"
    echo "## Phase: $PHASE - Started $(date '+%Y-%m-%d %H:%M:%S')" >> "$PROGRESS_FILE"
    echo "" >> "$PROGRESS_FILE"
}

# Log to progress file
log_progress() {
    local iteration=$1
    local status=$2
    local duration=$3

    echo "" >> "$PROGRESS_FILE"
    echo "### Iteration $iteration - $(date '+%H:%M:%S') - ${duration}s" >> "$PROGRESS_FILE"
    echo "" >> "$PROGRESS_FILE"
    echo "$status" >> "$PROGRESS_FILE"
}

# Create detailed log file for each iteration
create_log_file() {
    local iteration=$1
    local status=$2
    local duration=$3
    local log_file="$LOG_DIR/$(date '+%Y-%m-%d-%H-%M')-phase-${PHASE}-iter-${iteration}.md"

    cat > "$log_file" << EOF
# Loop Log - Phase ${PHASE} - Iteration ${iteration}

## Metadata
- **Date** : $(date '+%Y-%m-%d %H:%M')
- **Phase** : ${PHASE}
- **Iteration** : ${iteration}/${MAX_ITERATIONS}
- **Duration** : ${duration}s

## Input
- PRD utilisé : ${PRD_FILE}
- Prompt utilisé : ${PROMPT_FILE}

## Output
- **Status** : ${status}

## Debug Info
- **Project Dir** : ${PROJECT_DIR}
- **Script Dir** : ${SCRIPT_DIR}
EOF

    echo "$log_file"
}

# Update metrics
update_metrics() {
    local iteration=$1
    local duration=$2
    local status=$3

    # Update metrics if jq is available
    if command -v jq &> /dev/null && [ -f "$METRICS_FILE" ]; then
        local phase_index
        case $PHASE in
            discovery) phase_index=1 ;;
            strategy) phase_index=2 ;;
            design) phase_index=3 ;;
            dev) phase_index=4 ;;
            quality) phase_index=5 ;;
            *) phase_index=0 ;;
        esac

        # Update phase metrics
        jq --argjson idx "$phase_index" \
           --argjson iter "$iteration" \
           --argjson dur "$duration" \
           '.phases[$idx].iterations = $iter | .phases[$idx].duration_minutes = ($dur / 60) | .phases[$idx].status = "in_progress"' \
           "$METRICS_FILE" > "${METRICS_FILE}.tmp" && mv "${METRICS_FILE}.tmp" "$METRICS_FILE"
    fi
}

# Main loop
main() {
    check_prerequisites
    init_progress

    echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║       ACT Loop - Phase: ${BLUE}${PHASE}${GREEN}${NC}"
    echo -e "${GREEN}╠════════════════════════════════════════╣${NC}"
    echo -e "${GREEN}║${NC} Max iterations: ${YELLOW}${MAX_ITERATIONS}${NC}"
    echo -e "${GREEN}║${NC} Project: ${PROJECT_DIR}"
    echo -e "${GREEN}║${NC} PRD: ${PRD_FILE}"
    echo -e "${GREEN}║${NC} Prompt: ${PROMPT_FILE}"
    echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
    echo ""

    for i in $(seq 1 $MAX_ITERATIONS); do
        local iter_start=$(date +%s)
        echo -e "${YELLOW}═══ Iteration $i/$MAX_ITERATIONS ═══${NC}"

        # Change to project directory for execution
        cd "$PROJECT_DIR"

        # Run Claude with the prompt
        OUTPUT=$(cat "$PROMPT_FILE" | claude --dangerously-skip-permissions 2>&1) || true

        local iter_end=$(date +%s)
        local iter_duration=$((iter_end - iter_start))

        # Check for completion signal
        if echo "$OUTPUT" | grep -q "<signal>COMPLETE</signal>"; then
            echo -e "${GREEN}✓ All stories complete!${NC}"
            log_progress $i "COMPLETE - All stories passed" $iter_duration
            create_log_file $i "COMPLETE" $iter_duration
            update_metrics $i $iter_duration "complete"

            # Calculate total duration
            local total_duration=$((iter_end - START_TIME))
            echo ""
            echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
            echo -e "${GREEN}║          Phase ${PHASE} Complete!          ${NC}"
            echo -e "${GREEN}╠════════════════════════════════════════╣${NC}"
            echo -e "${GREEN}║${NC} Iterations: ${i}"
            echo -e "${GREEN}║${NC} Total time: ${total_duration}s"
            echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
            exit 0
        fi

        # Log progress
        log_progress $i "In progress..." $iter_duration
        local log_file=$(create_log_file $i "in_progress" $iter_duration)
        update_metrics $i $iter_duration "in_progress"

        echo -e "${BLUE}Log: ${log_file}${NC}"

        # Brief pause between iterations
        if [ $i -lt $MAX_ITERATIONS ]; then
            echo "Waiting 2s before next iteration..."
            sleep 2
        fi
    done

    # Max iterations reached
    local total_duration=$(($(date +%s) - START_TIME))
    echo ""
    echo -e "${RED}╔════════════════════════════════════════╗${NC}"
    echo -e "${RED}║     Max iterations reached!            ${NC}"
    echo -e "${RED}╠════════════════════════════════════════╣${NC}"
    echo -e "${RED}║${NC} Iterations: ${MAX_ITERATIONS}"
    echo -e "${RED}║${NC} Total time: ${total_duration}s"
    echo -e "${RED}║${NC} Check: ${PROGRESS_FILE}"
    echo -e "${RED}╚════════════════════════════════════════╝${NC}"
    exit 1
}

main
