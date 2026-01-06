#!/bin/bash
# ACT Framework - Installation Script
#
# Usage:
#   One-liner (recommended):
#     curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash
#
#   With arguments:
#     curl -fsSL .../install.sh | bash -s -- --global
#     curl -fsSL .../install.sh | bash -s -- --project
#
#   From cloned repo:
#     ./scripts/install.sh [--global|--project]

set -e

# GitHub repo URL
GITHUB_REPO="https://github.com/manuelturpin/ArtChiTech-framework.git"

# Plugin identifiers
PLUGIN_ORG="manuelturpin"
PLUGIN_NAME="act"

# Where the user is located (their project)
USER_PWD="$PWD"

# Temp directory for curl mode
TEMP_DIR=""
CLEANUP_NEEDED=false

# Installation mode
INSTALL_MODE=""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Paths
CLAUDE_SETTINGS="$HOME/.claude/settings.json"
GLOBAL_CACHE_DIR="$HOME/.claude/plugins/cache/$PLUGIN_ORG"
GLOBAL_PLUGIN_DIR="$GLOBAL_CACHE_DIR/$PLUGIN_NAME"

# ============================================
# Source Detection (curl vs local)
# ============================================

detect_source() {
    if [[ -n "$BASH_SOURCE" && -f "$BASH_SOURCE" ]]; then
        SCRIPT_DIR="$(cd "$(dirname "$BASH_SOURCE")" && pwd)"
        if [[ -d "$SCRIPT_DIR/../plugin" ]]; then
            SOURCE_DIR="$SCRIPT_DIR/../plugin"
            return
        fi
    fi

    # Running via curl | bash
    echo -e "${CYAN}Downloading ACT Framework...${NC}"
    TEMP_DIR=$(mktemp -d)
    CLEANUP_NEEDED=true

    if ! git clone --depth 1 --quiet "$GITHUB_REPO" "$TEMP_DIR/act" 2>/dev/null; then
        echo -e "${RED}Error: Failed to clone ACT Framework${NC}"
        cleanup_temp
        exit 1
    fi

    SOURCE_DIR="$TEMP_DIR/act/plugin"
    echo -e "${GREEN}✓${NC} Downloaded successfully"
}

cleanup_temp() {
    if [[ "$CLEANUP_NEEDED" == true && -n "$TEMP_DIR" && -d "$TEMP_DIR" ]]; then
        rm -rf "$TEMP_DIR"
    fi
}

trap cleanup_temp EXIT

# ============================================
# Parse Arguments
# ============================================

while [[ $# -gt 0 ]]; do
    case $1 in
        --global|-g)
            INSTALL_MODE="global"
            shift
            ;;
        --project|-p)
            INSTALL_MODE="project"
            shift
            if [[ $# -gt 0 && ! "$1" =~ ^- ]]; then
                USER_PWD="$(cd "$1" 2>/dev/null && pwd)" || {
                    echo -e "${RED}Error: Directory '$1' does not exist${NC}"
                    exit 1
                }
                shift
            fi
            ;;
        --help|-h)
            cat << 'EOF'
ACT Framework - Installation Script

Usage: install.sh [OPTIONS]

Options:
  --global, -g         Install globally (all projects)
                       Location: ~/.claude/plugins/cache/manuelturpin/act/

  --project, -p [PATH] Install to project only
                       Location: [project]/.claude/commands/, .claude/agents/

  --help, -h           Show this help

Examples:
  curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash
  curl ... | bash -s -- --global
  curl ... | bash -s -- --project
EOF
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            exit 1
            ;;
    esac
done

# ============================================
# Prerequisite Checks
# ============================================

check_prerequisites() {
    echo ""
    echo "=============================================="
    echo "  ACT Framework - Checking Prerequisites"
    echo "=============================================="
    echo ""

    local failed=0

    # Python 3.8+
    if command -v python3 &> /dev/null; then
        local version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
        local major=$(echo $version | cut -d. -f1)
        local minor=$(echo $version | cut -d. -f2)
        if [ "$major" -gt 3 ] || ([ "$major" -eq 3 ] && [ "$minor" -ge 8 ]); then
            echo -e "${GREEN}✓${NC} Python $version"
        else
            echo -e "${RED}✗${NC} Python 3.8+ required (found: $version)"
            failed=1
        fi
    else
        echo -e "${RED}✗${NC} Python 3.8+ required"
        failed=1
    fi

    # Git
    if command -v git &> /dev/null; then
        echo -e "${GREEN}✓${NC} Git $(git --version | cut -d' ' -f3)"
    else
        echo -e "${RED}✗${NC} Git required"
        failed=1
    fi

    # Claude Code
    if command -v claude &> /dev/null; then
        echo -e "${GREEN}✓${NC} Claude Code installed"
    else
        echo -e "${RED}✗${NC} Claude Code required"
        failed=1
    fi

    # Superpowers plugin
    if [ -d "$HOME/.claude/plugins/cache/superpowers-marketplace" ]; then
        echo -e "${GREEN}✓${NC} Superpowers plugin installed"
    else
        echo -e "${RED}✗${NC} Superpowers plugin required"
        echo "  Install: claude plugins:install superpowers-marketplace/superpowers"
        failed=1
    fi

    echo ""

    if [ $failed -eq 1 ]; then
        echo -e "${RED}Prerequisites check FAILED${NC}"
        exit 1
    fi

    echo -e "${GREEN}All prerequisites OK${NC}"
    echo ""
}

# ============================================
# Installation Menu
# ============================================

show_menu() {
    echo ""
    echo -e "${CYAN}╭─────────────────────────────────────────────────────────────╮${NC}"
    echo -e "${CYAN}│${NC}  ${BOLD}Where do you want to install ACT?${NC}                          ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}                                                               ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}  ${GREEN}1.${NC} Global (all projects)                                   ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}     → ~/.claude/plugins/cache/manuelturpin/act/              ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}     Commands: /act-project, /act-status, etc.                ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}                                                               ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}  ${BLUE}2.${NC} Project only (current directory)                        ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}     → $USER_PWD/.claude/commands/"
    echo -e "${CYAN}│${NC}     Available only for THIS project                           ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}                                                               ${CYAN}│${NC}"
    echo -e "${CYAN}╰─────────────────────────────────────────────────────────────╯${NC}"
    echo ""

    while true; do
        read -p "Select option [1/2]: " choice < /dev/tty
        case $choice in
            1) INSTALL_MODE="global"; break ;;
            2) INSTALL_MODE="project"; break ;;
            *) echo -e "${YELLOW}Please enter 1 or 2${NC}" ;;
        esac
    done
}

# ============================================
# Global Installation
# ============================================

install_global() {
    echo -e "${BLUE}→${NC} Installing globally..."

    # Create directory
    mkdir -p "$GLOBAL_CACHE_DIR"

    # Remove existing
    if [ -d "$GLOBAL_PLUGIN_DIR" ]; then
        rm -rf "$GLOBAL_PLUGIN_DIR"
    fi

    # Copy plugin
    cp -r "$SOURCE_DIR" "$GLOBAL_PLUGIN_DIR"
    echo -e "${GREEN}✓${NC} Plugin installed to $GLOBAL_PLUGIN_DIR"

    # Enable in settings
    echo -e "${BLUE}→${NC} Enabling plugin in Claude settings..."

    PLUGIN_KEY="${PLUGIN_NAME}@${PLUGIN_ORG}"

    if [ -f "$CLAUDE_SETTINGS" ]; then
        python3 << PYEOF
import json

settings_file = "$CLAUDE_SETTINGS"
plugin_key = "$PLUGIN_KEY"

with open(settings_file, 'r') as f:
    settings = json.load(f)

if 'enabledPlugins' not in settings:
    settings['enabledPlugins'] = {}

settings['enabledPlugins'][plugin_key] = True

with open(settings_file, 'w') as f:
    json.dump(settings, f, indent=2)
PYEOF
        echo -e "${GREEN}✓${NC} Plugin enabled ($PLUGIN_KEY)"
    else
        echo -e "${YELLOW}⚠${NC} Settings not found. Enable manually:"
        echo "   Add \"$PLUGIN_KEY\": true to enabledPlugins in ~/.claude/settings.json"
    fi
}

# ============================================
# Project Installation
# ============================================

install_project() {
    echo -e "${BLUE}→${NC} Installing to project: $USER_PWD"

    local PROJECT_CLAUDE="$USER_PWD/.claude"

    # Create directories
    mkdir -p "$PROJECT_CLAUDE/commands"
    mkdir -p "$PROJECT_CLAUDE/agents"

    # Copy commands
    if [ -d "$SOURCE_DIR/commands" ]; then
        cp -r "$SOURCE_DIR/commands/"* "$PROJECT_CLAUDE/commands/" 2>/dev/null || true
        echo -e "${GREEN}✓${NC} Commands copied to .claude/commands/"
    fi

    # Copy agents
    if [ -d "$SOURCE_DIR/agents" ]; then
        cp -r "$SOURCE_DIR/agents/"* "$PROJECT_CLAUDE/agents/" 2>/dev/null || true
        echo -e "${GREEN}✓${NC} Agents copied to .claude/agents/"
    fi

    # Copy skills if exist
    if [ -d "$SOURCE_DIR/skills" ]; then
        mkdir -p "$PROJECT_CLAUDE/skills"
        cp -r "$SOURCE_DIR/skills/"* "$PROJECT_CLAUDE/skills/" 2>/dev/null || true
        echo -e "${GREEN}✓${NC} Skills copied to .claude/skills/"
    fi

    # Copy references if exist
    if [ -d "$SOURCE_DIR/references" ]; then
        mkdir -p "$PROJECT_CLAUDE/references"
        cp -r "$SOURCE_DIR/references/"* "$PROJECT_CLAUDE/references/" 2>/dev/null || true
        echo -e "${GREEN}✓${NC} References copied to .claude/references/"
    fi
}

# ============================================
# Main
# ============================================

detect_source
check_prerequisites

if [ -z "$INSTALL_MODE" ]; then
    show_menu
fi

if [ "$INSTALL_MODE" = "global" ]; then
    install_global
else
    install_project
fi

# ============================================
# Success Message
# ============================================

echo ""
echo "=============================================="
echo -e "${GREEN}  ACT Framework installed successfully!${NC}"
echo "=============================================="
echo ""
echo "Mode: $INSTALL_MODE"

if [ "$INSTALL_MODE" = "global" ]; then
    echo "Location: $GLOBAL_PLUGIN_DIR"
    echo ""
    echo "ACT is now available for ALL your projects."
else
    echo "Location: $USER_PWD/.claude/"
    echo ""
    echo "ACT is available for THIS project only."
    echo -e "${YELLOW}Tip:${NC} Add .claude/ to .gitignore if needed."
fi

echo ""
echo "Restart Claude Code, then run:"
echo "  /act-project"
echo ""
echo "Available commands:"
echo "  /act-project   - Main hub"
echo "  /act-status    - Project status"
echo "  /act-onboard   - Audit project"
echo "  /act-next      - Next phase"
echo "  /act-fix       - Fix issues"
echo "  /act-help      - Help"
echo ""
echo "Documentation: https://github.com/manuelturpin/ArtChiTech-framework"
echo "=============================================="
