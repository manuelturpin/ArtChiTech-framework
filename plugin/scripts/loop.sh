#!/bin/bash
# ACT Loop Script - Adapted from Ralph Wiggum
# Usage: ./loop.sh [--phase PHASE] [--max N] [--target DIR] [--force]
#
# Options:
#   --phase PHASE   Phase to run: discovery, strategy, design, dev, quality (default: dev)
#   --max N         Max iterations (default: 10)
#   --target DIR    Target directory to run in (default: current directory)
#   --force         Bypass protected branch check (DANGEROUS - use with caution)
#
# Safety Features:
#   - Protected branch detection (main, master, prod, staging, release)
#   - Build verification after each story
#   - TypeScript type checking (if applicable)
#
# Examples:
#   ./loop.sh --phase discovery --max 5
#   ./loop.sh --phase dev --target /path/to/project
#   ./loop.sh --phase dev --force  # Bypass branch protection (dangerous!)

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
            echo "Usage: ./loop.sh [--phase PHASE] [--max N] [--target DIR] [--force]"
            echo ""
            echo "Options:"
            echo "  --phase PHASE   Phase: discovery, strategy, design, dev, quality (default: dev)"
            echo "  --max N         Max iterations (default: 10)"
            echo "  --target DIR    Target directory (default: current)"
            echo "  --force         Bypass protected branch check (DANGEROUS)"
            echo ""
            echo "Safety Features:"
            echo "  - Protected branch detection (main, master, prod, staging)"
            echo "  - Build verification after each story"
            echo "  - TypeScript type checking (if applicable)"
            echo ""
            echo "Examples:"
            echo "  ./loop.sh --phase discovery --max 5"
            echo "  ./loop.sh --phase dev --target /path/to/project"
            echo "  ./loop.sh --phase dev --force  # Bypass branch protection"
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

# Protected branches that should never run loop directly
PROTECTED_BRANCHES=("main" "master" "prod" "production" "staging" "release")
FORCE_MODE=false

# ⚠️  SECURITY WARNING: --force bypasses protected branch detection.
# This allows autonomous execution on main/master/prod branches.
# Use ONLY when you explicitly need to run the loop on a protected branch.
# Recommended: Never use --force in CI/CD or unattended environments.

# Check if --force flag was passed
for arg in "$@"; do
    if [[ "$arg" == "--force" ]]; then
        FORCE_MODE=true
    fi
done

# Detect protected branch
detect_protected_branch() {
    cd "$PROJECT_DIR"
    CURRENT_BRANCH=$(git branch --show-current 2>/dev/null || echo "")

    if [ -z "$CURRENT_BRANCH" ]; then
        echo -e "${YELLOW}⚠️  Not a git repository or no branch detected${NC}"
        return 0
    fi

    for branch in "${PROTECTED_BRANCHES[@]}"; do
        if [[ "$CURRENT_BRANCH" == "$branch" ]]; then
            if [ "$FORCE_MODE" = true ]; then
                echo -e "${YELLOW}⚠️  WARNING: Running on protected branch '$CURRENT_BRANCH' with --force${NC}"
                echo -e "${YELLOW}   This is dangerous! Make sure you know what you're doing.${NC}"
                sleep 3
                return 0
            else
                echo -e "${RED}╭─────────────────────────────────────────────────────╮${NC}"
                echo -e "${RED}│  ❌ PROTECTED BRANCH DETECTED                       │${NC}"
                echo -e "${RED}╠─────────────────────────────────────────────────────╣${NC}"
                echo -e "${RED}│  Branch: ${CURRENT_BRANCH}${NC}"
                echo -e "${RED}│                                                     │${NC}"
                echo -e "${RED}│  Running loop on protected branches is dangerous.   │${NC}"
                echo -e "${RED}│  Create a feature branch first:                     │${NC}"
                echo -e "${RED}│                                                     │${NC}"
                echo -e "${RED}│  git checkout -b feature/your-feature               │${NC}"
                echo -e "${RED}│                                                     │${NC}"
                echo -e "${RED}│  Or use --force to bypass (NOT recommended)         │${NC}"
                echo -e "${RED}╰─────────────────────────────────────────────────────╯${NC}"
                exit 1
            fi
        fi
    done

    echo -e "${GREEN}✓ Branch '$CURRENT_BRANCH' is safe for loop execution${NC}"
}

# Verify build passes (for TypeScript/JavaScript projects)
verify_build() {
    cd "$PROJECT_DIR"

    # Detect package manager
    if [ -f "pnpm-lock.yaml" ]; then
        PM="pnpm"
    elif [ -f "yarn.lock" ]; then
        PM="yarn"
    elif [ -f "package-lock.json" ] || [ -f "package.json" ]; then
        PM="npm"
    else
        # Not a Node.js project, skip build verification
        return 0
    fi

    # Check if build script exists
    if [ -f "package.json" ]; then
        if ! grep -q '"build"' package.json 2>/dev/null; then
            return 0  # No build script, skip
        fi
    else
        return 0
    fi

    echo -e "${BLUE}🔨 Verifying build...${NC}"

    BUILD_OUTPUT=$($PM run build 2>&1)
    BUILD_STATUS=$?

    if [ $BUILD_STATUS -ne 0 ]; then
        echo -e "${RED}╭─────────────────────────────────────────────────────╮${NC}"
        echo -e "${RED}│  ❌ BUILD FAILED                                    │${NC}"
        echo -e "${RED}╠─────────────────────────────────────────────────────╣${NC}"
        echo -e "${RED}│  The build must pass before marking story complete. │${NC}"
        echo -e "${RED}│                                                     │${NC}"
        echo -e "${RED}│  Check .epct/loop/build-errors.log for details      │${NC}"
        echo -e "${RED}╰─────────────────────────────────────────────────────╯${NC}"

        # Save build errors for debugging
        mkdir -p "$PROJECT_DIR/.epct/loop"
        echo "$BUILD_OUTPUT" > "$PROJECT_DIR/.epct/loop/build-errors.log"

        return 1
    fi

    echo -e "${GREEN}✓ Build passed${NC}"
    return 0
}

# Verify TypeScript types (if applicable)
verify_types() {
    cd "$PROJECT_DIR"

    # Check if TypeScript is used
    if [ ! -f "tsconfig.json" ]; then
        return 0  # Not a TypeScript project
    fi

    # Detect package manager
    if [ -f "pnpm-lock.yaml" ]; then
        PM="pnpm"
    elif [ -f "yarn.lock" ]; then
        PM="yarn"
    else
        PM="npm"
    fi

    echo -e "${BLUE}🔍 Checking TypeScript types...${NC}"

    # Try tsc --noEmit first, fallback to type-check script if exists
    if command -v npx &> /dev/null; then
        TYPE_OUTPUT=$(npx tsc --noEmit 2>&1)
        TYPE_STATUS=$?
    else
        TYPE_OUTPUT=$($PM run type-check 2>&1 || $PM run typecheck 2>&1)
        TYPE_STATUS=$?
    fi

    if [ $TYPE_STATUS -ne 0 ]; then
        echo -e "${RED}╭─────────────────────────────────────────────────────╮${NC}"
        echo -e "${RED}│  ❌ TYPE ERRORS DETECTED                            │${NC}"
        echo -e "${RED}╠─────────────────────────────────────────────────────╣${NC}"
        echo -e "${RED}│  TypeScript types must pass before continuing.      │${NC}"
        echo -e "${RED}│                                                     │${NC}"
        echo -e "${RED}│  Check .epct/loop/type-errors.log for details       │${NC}"
        echo -e "${RED}╰─────────────────────────────────────────────────────╯${NC}"

        # Save type errors for debugging
        mkdir -p "$PROJECT_DIR/.epct/loop"
        echo "$TYPE_OUTPUT" > "$PROJECT_DIR/.epct/loop/type-errors.log"

        return 1
    fi

    echo -e "${GREEN}✓ Types OK${NC}"
    return 0
}

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

    # Check protected branch
    detect_protected_branch
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

        # ╔══════════════════════════════════════════════════════════════════╗
        # ║  ⚠️  SECURITY NOTICE: AUTONOMOUS EXECUTION MODE                ║
        # ║                                                                  ║
        # ║  --dangerously-skip-permissions grants the agent unrestricted    ║
        # ║  filesystem, network, and code execution access.                 ║
        # ║                                                                  ║
        # ║  This is INTENTIONAL for autonomous loop execution.              ║
        # ║  The agent needs full permissions to implement, test, and        ║
        # ║  commit code without human approval at each step.                ║
        # ║                                                                  ║
        # ║  MITIGATIONS IN PLACE:                                          ║
        # ║  - Protected branch detection (main/master/prod blocked)         ║
        # ║  - Build verification after each iteration                      ║
        # ║  - Max iteration limit (default: 10)                            ║
        # ║  - Type checking verification                                   ║
        # ║                                                                  ║
        # ║  RECOMMENDED: Run only on feature branches in dev environments. ║
        # ╚══════════════════════════════════════════════════════════════════╝
        # Run Claude with the prompt
        OUTPUT=$(cat "$PROMPT_FILE" | claude --dangerously-skip-permissions 2>&1) || true

        local iter_end=$(date +%s)
        local iter_duration=$((iter_end - iter_start))

        # Check for completion signal
        if echo "$OUTPUT" | grep -q "<signal>COMPLETE</signal>"; then
            echo -e "${GREEN}✓ All stories complete!${NC}"

            # Verify build before accepting completion
            if ! verify_build; then
                echo -e "${RED}❌ Build failed - stories may have introduced errors${NC}"
                log_progress $i "COMPLETE BLOCKED - Build failed" $iter_duration
                create_log_file $i "BLOCKED" $iter_duration
                update_metrics $i $iter_duration "blocked"
                # Continue to next iteration to fix
                continue
            fi

            # Verify types for TypeScript projects
            if ! verify_types; then
                echo -e "${RED}❌ Type errors - stories may have introduced errors${NC}"
                log_progress $i "COMPLETE BLOCKED - Type errors" $iter_duration
                create_log_file $i "BLOCKED" $iter_duration
                update_metrics $i $iter_duration "blocked"
                # Continue to next iteration to fix
                continue
            fi

            log_progress $i "COMPLETE - All stories passed + build verified" $iter_duration
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
            echo -e "${GREEN}║${NC} Build: ✅ VERIFIED"
            echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
            exit 0
        fi

        # Verify build after each iteration (fail early)
        if ! verify_build; then
            echo -e "${YELLOW}⚠️  Build failed after iteration - will attempt fix in next iteration${NC}"
            log_progress $i "In progress - BUILD FAILED" $iter_duration
        elif ! verify_types; then
            echo -e "${YELLOW}⚠️  Type errors after iteration - will attempt fix in next iteration${NC}"
            log_progress $i "In progress - TYPE ERRORS" $iter_duration
        else
            # Log progress
            log_progress $i "In progress - Build OK" $iter_duration
        fi
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
