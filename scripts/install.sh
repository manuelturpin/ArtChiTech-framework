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

# Where the user is located (their project)
USER_PWD="$PWD"

# Temp directory for curl mode (will be set if needed)
TEMP_DIR=""
CLEANUP_NEEDED=false

# Colors for output (defined early for use in detect_source)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Detect execution mode: curl | bash OR from cloned repo
detect_source() {
    # Try to find the script directory
    if [[ -n "$BASH_SOURCE" && -f "$BASH_SOURCE" ]]; then
        SCRIPT_DIR="$(cd "$(dirname "$BASH_SOURCE")" && pwd)"
        if [[ -d "$SCRIPT_DIR/../plugin" ]]; then
            # Running from cloned repo
            SOURCE_DIR="$SCRIPT_DIR/../plugin"
            ACT_REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
            return
        fi
    fi

    # Running via curl | bash - need to clone the repo
    echo -e "${CYAN}Downloading ACT Framework...${NC}"
    TEMP_DIR=$(mktemp -d)
    CLEANUP_NEEDED=true

    # Clone with minimal depth for speed
    if ! git clone --depth 1 --quiet "$GITHUB_REPO" "$TEMP_DIR/act" 2>/dev/null; then
        echo -e "${RED}Error: Failed to clone ACT Framework from GitHub${NC}"
        echo "Please check your internet connection and try again."
        cleanup_temp
        exit 1
    fi

    SOURCE_DIR="$TEMP_DIR/act/plugin"
    ACT_REPO_DIR="$TEMP_DIR/act"
    echo -e "${GREEN}✓${NC} Downloaded successfully"
}

# Cleanup temporary directory
cleanup_temp() {
    if [[ "$CLEANUP_NEEDED" == true && -n "$TEMP_DIR" && -d "$TEMP_DIR" ]]; then
        rm -rf "$TEMP_DIR"
    fi
}

# Trap to ensure cleanup on exit
trap cleanup_temp EXIT

# Global: available for all projects
GLOBAL_PLUGIN_DIR="$HOME/.claude/plugins"
GLOBAL_ACT_DIR="$GLOBAL_PLUGIN_DIR/act"

# Project: will be set based on user's current directory
PROJECT_PLUGIN_DIR=""
PROJECT_ACT_DIR=""

# Installation mode: "global", "project", or "" (prompt)
INSTALL_MODE=""

# ============================================
# Detect source and download if needed
# ============================================

detect_source

# ============================================
# Helper Functions
# ============================================

is_inside_act_repo() {
    # Check if current directory is inside the ACT repo
    # Only relevant when running from cloned repo (not curl mode)
    [[ -n "$ACT_REPO_DIR" && "$USER_PWD" == "$ACT_REPO_DIR"* ]]
}

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
            # Check if next argument is a path (doesn't start with -)
            if [[ $# -gt 0 && ! "$1" =~ ^- ]]; then
                USER_PWD="$(cd "$1" 2>/dev/null && pwd)" || {
                    echo -e "${RED}Error: Directory '$1' does not exist${NC}"
                    exit 1
                }
                shift
            fi
            ;;
        --help|-h)
            echo "ACT Framework - Installation Script"
            echo ""
            echo "Usage: ./install.sh [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --global, -g         Install globally to ~/.claude/plugins/act/"
            echo "                       Available for ALL your projects"
            echo ""
            echo "  --project, -p [PATH] Install to [PATH]/.claude/plugins/act/"
            echo "                       If PATH is omitted, uses current directory"
            echo "                       Available only for THAT project"
            echo ""
            echo "  --help, -h           Show this help message"
            echo ""
            echo "Examples:"
            echo "  ./install.sh --global"
            echo "  ./install.sh --project ~/my-project"
            echo "  cd ~/my-project && /path/to/install.sh --project"
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
    if [ -d "$HOME/.claude/plugins/cache/superpowers-marketplace" ] || [ -d "$HOME/.claude/plugins/superpowers" ]; then
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
# Check if inside ACT repo (warning for --project)
# ============================================

check_act_repo_warning() {
    if is_inside_act_repo; then
        echo ""
        echo -e "${YELLOW}⚠ WARNING: You are inside the ACT repository${NC}"
        echo -e "   Current: $USER_PWD"
        echo -e "   ACT repo: $ACT_REPO_DIR"
        echo ""
        echo "   Installing here will put ACT inside the ACT repo itself."
        echo "   This is probably NOT what you want."
        echo ""
        read -p "   Continue anyway? [y/N] " confirm < /dev/tty
        if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
            echo ""
            echo "To install in your project, run:"
            echo -e "  ${CYAN}cd /path/to/your/project${NC}"
            echo -e "  ${CYAN}$SCRIPT_DIR/install.sh --project${NC}"
            echo ""
            echo "Or specify the path directly:"
            echo -e "  ${CYAN}$SCRIPT_DIR/install.sh --project /path/to/your/project${NC}"
            exit 0
        fi
    fi
}

# ============================================
# Installation Mode Selection
# ============================================

show_install_menu() {
    # Set project paths based on USER_PWD
    PROJECT_PLUGIN_DIR="$USER_PWD/.claude/plugins"
    PROJECT_ACT_DIR="$PROJECT_PLUGIN_DIR/act"

    echo ""
    echo -e "${CYAN}╭─────────────────────────────────────────────────────────────╮${NC}"
    echo -e "${CYAN}│${NC}  ${BOLD}Where do you want to install ACT?${NC}                          ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}                                                               ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}  ${GREEN}1.${NC} Global                                                  ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}     → ~/.claude/plugins/act/                                  ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}     Available for ALL your projects                           ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}                                                               ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}  ${BLUE}2.${NC} Project (current directory)                              ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}     → $USER_PWD/.claude/plugins/act/${NC}"
    echo -e "${CYAN}│${NC}     Available only for THIS project                           ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}                                                               ${CYAN}│${NC}"
    echo -e "${CYAN}╰─────────────────────────────────────────────────────────────╯${NC}"
    echo ""

    while true; do
        read -p "Select option [1/2]: " choice < /dev/tty
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
    # Check if user is inside ACT repo
    check_act_repo_warning

    # Set project paths based on USER_PWD
    PROJECT_PLUGIN_DIR="$USER_PWD/.claude/plugins"
    PROJECT_ACT_DIR="$PROJECT_PLUGIN_DIR/act"

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
    echo -e "Target: ${CYAN}$USER_PWD${NC}"
fi
echo ""

# Remove existing installation if present
if [ -L "$TARGET_DIR" ]; then
    rm "$TARGET_DIR"
    echo -e "${YELLOW}⚠${NC} Removed existing symlink"
elif [ -d "$TARGET_DIR" ]; then
    echo ""
    echo -e "${YELLOW}⚠${NC} Directory $TARGET_DIR already exists"
    read -p "   Remove and reinstall? [y/N] " confirm < /dev/tty
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
