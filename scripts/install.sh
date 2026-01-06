#!/bin/bash
# ACT Framework - Installation Script

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PLUGIN_DIR="$HOME/.claude/plugins"
ACT_DIR="$PLUGIN_DIR/act"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ============================================
# Prerequisite Check Functions
# ============================================

check_python() {
    if command -v python3 &> /dev/null; then
        local version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
        local major=$(echo $version | cut -d. -f1)
        local minor=$(echo $version | cut -d. -f2)
        if [ "$major" -ge 3 ] && [ "$minor" -ge 8 ]; then
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
    if [ -w "$PLUGIN_DIR" ] || mkdir -p "$PLUGIN_DIR" 2>/dev/null; then
        echo -e "${GREEN}✓${NC} Permissions OK for $PLUGIN_DIR"
        return 0
    fi
    echo -e "${RED}✗${NC} Cannot write to $PLUGIN_DIR"
    return 1
}

# ============================================
# Main Prerequisite Check
# ============================================

check_prerequisites() {
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
    check_permissions || failed=1
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
# Run Prerequisite Check
# ============================================

check_prerequisites

# ============================================
# Installation
# ============================================

echo "Installing ACT Framework..."
echo ""

# Supprimer ancien lien si existe
if [ -L "$ACT_DIR" ]; then
    rm "$ACT_DIR"
    echo -e "${YELLOW}⚠${NC} Ancien lien supprime"
elif [ -d "$ACT_DIR" ]; then
    echo ""
    echo -e "${YELLOW}⚠${NC} Dossier $ACT_DIR existe deja"
    read -p "   Supprimer et reinstaller ? [o/N] " confirm
    if [ "$confirm" = "o" ] || [ "$confirm" = "O" ]; then
        rm -rf "$ACT_DIR"
    else
        echo "Installation annulee"
        exit 0
    fi
fi

# Creer lien symbolique
ln -sf "$SCRIPT_DIR/../plugin" "$ACT_DIR"
echo -e "${GREEN}✓${NC} Plugin installe dans $ACT_DIR"

# ============================================
# Post-Install Verification
# ============================================

echo ""
echo "=============================================="
echo -e "${GREEN}  ACT Framework installed successfully!${NC}"
echo "=============================================="
echo ""
echo "To verify, restart Claude Code and run:"
echo "  /projet"
echo ""
echo "Documentation: https://github.com/manuelturpin/ArtChiTech-framework"
echo "=============================================="
