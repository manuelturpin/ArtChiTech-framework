#!/bin/bash
# Verify ACT Framework dependencies
# Usage: ./verify_dependencies.sh [--quiet]

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
QUIET=false

# Parse arguments
if [ "$1" = "--quiet" ]; then
    QUIET=true
fi

log() {
    if [ "$QUIET" = false ]; then
        echo -e "$1"
    fi
}

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

MISSING=0
WARNINGS=0

log "🔍 Verifying ACT Framework dependencies..."
log ""

# 1. Check Python 3
log "Checking Python 3..."
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version 2>&1 | cut -d' ' -f2)
    log "  ${GREEN}✓${NC} Python 3 found (v$PYTHON_VERSION)"
else
    log "  ${RED}✗${NC} Python 3 not found"
    ((MISSING++))
fi

# 2. Check Claude CLI
log "Checking Claude CLI..."
if command -v claude &> /dev/null; then
    log "  ${GREEN}✓${NC} Claude CLI found"
else
    log "  ${YELLOW}⚠${NC} Claude CLI not found (optional for testing)"
    ((WARNINGS++))
fi

# 3. Check ACT scripts
log "Checking ACT scripts..."
SCRIPTS_OK=true

REQUIRED_SCRIPTS=(
    "$SCRIPT_DIR/../skills/state-management/scripts/state_manager.py"
    "$SCRIPT_DIR/../skills/project-detection/scripts/detect_stack.py"
    "$SCRIPT_DIR/../skills/claudemd-generator/scripts/generate_claudemd.py"
)

for script in "${REQUIRED_SCRIPTS[@]}"; do
    if [ -f "$script" ]; then
        log "  ${GREEN}✓${NC} $(basename $script)"
    else
        log "  ${RED}✗${NC} $(basename $script) not found"
        SCRIPTS_OK=false
        ((MISSING++))
    fi
done

# 4. Check JSON schemas (optional but recommended)
log "Checking JSON schemas..."
SCHEMAS_DIR="$SCRIPT_DIR/../references/schemas"
if [ -d "$SCHEMAS_DIR" ]; then
    SCHEMA_COUNT=$(ls "$SCHEMAS_DIR"/*.json 2>/dev/null | wc -l | tr -d ' ')
    if [ "$SCHEMA_COUNT" -gt 0 ]; then
        log "  ${GREEN}✓${NC} $SCHEMA_COUNT schema(s) found"
    else
        log "  ${YELLOW}⚠${NC} No schemas found"
        ((WARNINGS++))
    fi
else
    log "  ${YELLOW}⚠${NC} Schemas directory not found"
    ((WARNINGS++))
fi

# Summary
log ""
log "================================"
if [ $MISSING -gt 0 ]; then
    log "${RED}❌ $MISSING critical dependency(ies) missing${NC}"
    log "   ACT cannot run properly. Please install missing dependencies."
    exit 1
elif [ $WARNINGS -gt 0 ]; then
    log "${YELLOW}⚠️  $WARNINGS warning(s)${NC}"
    log "   ACT will work but some features may be limited."
    exit 0
else
    log "${GREEN}✅ All dependencies verified${NC}"
    exit 0
fi
