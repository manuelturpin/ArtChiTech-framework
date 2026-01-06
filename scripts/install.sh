#!/bin/bash
# ACT Framework - Installation Script

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/../plugin"

# Global: available for all projects
GLOBAL_PLUGIN_DIR="$HOME/.claude/plugins"
GLOBAL_ACT_DIR="$GLOBAL_PLUGIN_DIR/act"

# Project: available only for current project
PROJECT_PLUGIN_DIR=".claude/plugins"
PROJECT_ACT_DIR="$PROJECT_PLUGIN_DIR/act"

# Installation mode: "global", "project", or "" (prompt)
INSTALL_MODE=""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# ============================================
# Parse Command Line Arguments
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
            ;;
        --help|-h)
            echo "ACT Framework - Installation Script"
            echo ""
            echo "Usage: ./install.sh [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --global, -g     Install globally to ~/.claude/plugins/act/"
            echo "                   Available for ALL your projects"
            echo ""
            echo "  --project, -p    Install to ./.claude/plugins/act/"
            echo "                   Available only for THIS project"
            echo ""
            echo "  --help, -h       Show this help message"
            echo ""
            echo "If no option is provided, you will be prompted to choose."
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            echo "Use --help for usage information."
            exit 1
            ;;
    esac
done

# ============================================
# Prerequisite Check Functions
# ============================================

check_python() {
    if command -v python3 &> /dev/null; then
        local version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
        local major=$(echo $version | cut -d. -f1)
        local minor=$(echo $version | cut -d. -f2)
        # Python 3.8+ or Python 4.0+ required
        if [ "$major" -gt 3 ] || ([ "$major" -eq 3 ] && [ "$minor" -ge 8 ]); then
            echo -e "${GREEN}✓${NC} Python $version"
            return 0
        fi
        echo -e "${RED}✗${NC} Python 3.8+ required (found: $version)"
        echo "  Install: https://www.python.org/downloads/"
        return 1
    fi
    echo -e "${RED}✗${NC} Python 3.8+ required (not found)"
    echo "  Install: https://www.python.org/downloads/"
    return 1
}

check_git() {
    if command -v git &> /dev/null; then
        local version=$(git --version | cut -d' ' -f3)
        echo -e "${GREEN}✓${NC} Git $version"
        return 0
    fi
    echo -e "${RED}✗${NC} Git required"
    echo "  Install: https://git-scm.com/downloads"
    return 1
}

check_claude_code() {
    if command -v claude &> /dev/null; then
        echo -e "${GREEN}✓${NC} Claude Code installed"
        return 0
    fi
    echo -e "${RED}✗${NC} Claude Code required"
    echo "  Install: https://claude.ai/code"
    return 1
}

check_gh_cli() {
    if command -v gh &> /dev/null; then
        if gh auth status &> /dev/null; then
            echo -e "${GREEN}✓${NC} GitHub CLI authenticated"
            return 0
        else
            echo -e "${YELLOW}⚠${NC} GitHub CLI installed but not authenticated"
            echo "  Run: gh auth login"
            return 0  # Optional, don't fail
        fi
    fi
    echo -e "${YELLOW}⚠${NC} GitHub CLI not installed (optional, for /feedback)"
    echo "  Install: https://cli.github.com/"
    return 0  # Optional, don't fail
}

check_superpowers() {
    if [ -d "$HOME/.claude/plugins/cache/superpowers-marketplace" ] || [ -d "$PLUGIN_DIR/superpowers" ]; then
        echo -e "${GREEN}✓${NC} Plugin superpowers installed"
        return 0
    fi
    echo -e "${RED}✗${NC} Plugin superpowers required"
    echo "  Install: claude plugins:install superpowers-marketplace/superpowers"
    return 1
}

check_permissions() {
    local target_dir="$1"
    if [ -w "$target_dir" ] || mkdir -p "$target_dir" 2>/dev/null; then
        echo -e "${GREEN}✓${NC} Permissions OK for $target_dir"
        return 0
    fi
    echo -e "${RED}✗${NC} Cannot write to $target_dir"
    return 1
}

# ============================================
# Main Prerequisite Check
# ============================================

check_prerequisites() {
    local target_dir="$1"

    echo ""
    echo "=============================================="
    echo "  ACT Framework - Checking Prerequisites"
    echo "=============================================="
    echo ""

    local failed=0

    check_python || failed=1
    check_git || failed=1
    check_claude_code || failed=1
    check_superpowers || failed=1
    check_permissions "$target_dir" || failed=1
    check_gh_cli  # Optional, don't fail

    echo ""

    if [ $failed -eq 1 ]; then
        echo -e "${RED}=============================================="
        echo -e "  Prerequisites check FAILED"
        echo -e "==============================================${NC}"
        echo ""
        echo "Please install missing dependencies and try again."
        exit 1
    fi

    echo -e "${GREEN}=============================================="
    echo -e "  All prerequisites OK"
    echo -e "==============================================${NC}"
    echo ""
}

# ============================================
# Installation Mode Selection
# ============================================

show_install_menu() {
    echo ""
    echo -e "${CYAN}╭─────────────────────────────────────────────────────╮${NC}"
    echo -e "${CYAN}│${NC}  ${BOLD}Where do you want to install ACT?${NC}                  ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}                                                     ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}  ${GREEN}1.${NC} Global                                          ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}     → ~/.claude/plugins/act/                        ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}     Available for ALL your projects                 ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}                                                     ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}  ${BLUE}2.${NC} Project                                          ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}     → ./.claude/plugins/act/                        ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}     Available only for THIS project                 ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}                                                     ${CYAN}│${NC}"
    echo -e "${CYAN}╰─────────────────────────────────────────────────────╯${NC}"
    echo ""

    while true; do
        read -p "Select option [1/2]: " choice
        case $choice in
            1)
                INSTALL_MODE="global"
                break
                ;;
            2)
                INSTALL_MODE="project"
                break
                ;;
            *)
                echo -e "${YELLOW}Please enter 1 or 2${NC}"
                ;;
        esac
    done
}

# ============================================
# Show Menu if No Mode Selected
# ============================================

if [ -z "$INSTALL_MODE" ]; then
    show_install_menu
fi

# ============================================
# Determine Target Directory
# ============================================

if [ "$INSTALL_MODE" = "global" ]; then
    TARGET_DIR="$GLOBAL_ACT_DIR"
    PARENT_DIR="$GLOBAL_PLUGIN_DIR"
else
    TARGET_DIR="$PROJECT_ACT_DIR"
    PARENT_DIR="$PROJECT_PLUGIN_DIR"
fi

# ============================================
# Run Prerequisite Check
# ============================================

check_prerequisites "$PARENT_DIR"

# ============================================
# Installation
# ============================================

echo ""
if [ "$INSTALL_MODE" = "global" ]; then
    echo -e "Installing ACT Framework ${BOLD}globally${NC}..."
else
    echo -e "Installing ACT Framework for ${BOLD}this project${NC}..."
fi
echo ""

# Remove existing installation if present
if [ -L "$TARGET_DIR" ]; then
    rm "$TARGET_DIR"
    echo -e "${YELLOW}⚠${NC} Removed existing symlink"
elif [ -d "$TARGET_DIR" ]; then
    echo ""
    echo -e "${YELLOW}⚠${NC} Directory $TARGET_DIR already exists"
    read -p "   Remove and reinstall? [y/N] " confirm
    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
        rm -rf "$TARGET_DIR"
    else
        echo "Installation cancelled"
        exit 0
    fi
fi

# Ensure parent directory exists
mkdir -p "$PARENT_DIR"

# Copy plugin files
echo -e "${BLUE}→${NC} Copying plugin files..."
cp -r "$SOURCE_DIR" "$TARGET_DIR"
echo -e "${GREEN}✓${NC} Plugin installed to $TARGET_DIR"

# ============================================
# Post-Install Verification
# ============================================

echo ""
echo "=============================================="
echo -e "${GREEN}  ACT Framework installed successfully!${NC}"
echo "=============================================="
echo ""
echo "Scope: $INSTALL_MODE"
echo "Location: $TARGET_DIR"
echo ""
if [ "$INSTALL_MODE" = "global" ]; then
    echo "ACT is now available for ALL your projects."
else
    echo "ACT is now available for THIS project only."
    echo -e "${YELLOW}Tip:${NC} Add .claude/plugins/ to .gitignore if not shared."
fi
echo ""
echo "To verify, restart Claude Code and run:"
echo "  /projet"
echo ""
echo "Documentation: https://github.com/manuelturpin/ArtChiTech-framework"
echo "=============================================="
