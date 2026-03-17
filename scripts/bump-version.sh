#!/bin/bash
# =============================================================================
# ACT Framework - Version Bump Script
#
# Updates ALL version references across the project from a single source.
#
# Usage:
#   ./scripts/bump-version.sh <new-version>
#   ./scripts/bump-version.sh 3.6.0-alpha
#   ./scripts/bump-version.sh --check   # Verify all files are in sync
#
# Files updated:
#   VERSION                          (source of truth)
#   package.json                     ("version": "X.Y.Z")
#   plugin/.claude-plugin/plugin.json ("version": "X.Y.Z")
#   scripts/install.sh               (VERSION="X.Y.Z")
#   scripts/cli.sh                   (banner line)
#   CLAUDE.md                        (**Version**: X.Y.Z)
#   README.md                        (badge)
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Files containing version references
VERSION_FILE="$PROJECT_DIR/VERSION"
PACKAGE_JSON="$PROJECT_DIR/package.json"
PLUGIN_JSON="$PROJECT_DIR/plugin/.claude-plugin/plugin.json"
INSTALL_SH="$PROJECT_DIR/scripts/install.sh"
CLI_SH="$PROJECT_DIR/scripts/cli.sh"
CLAUDE_MD="$PROJECT_DIR/CLAUDE.md"
README_MD="$PROJECT_DIR/README.md"

# Read current version from VERSION file
get_current_version() {
    if [ -f "$VERSION_FILE" ]; then
        tr -d '[:space:]' < "$VERSION_FILE"
    else
        echo "unknown"
    fi
}

# Check mode: verify all files are in sync
check_versions() {
    local source_version
    source_version=$(get_current_version)
    echo -e "${BLUE}Source version (VERSION file):${NC} $source_version"
    echo ""

    local mismatches=0

    # package.json
    if [ -f "$PACKAGE_JSON" ]; then
        local pkg_version
        pkg_version=$(grep '"version"' "$PACKAGE_JSON" | head -1 | sed 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/')
        if [ "$pkg_version" = "$source_version" ]; then
            echo -e "  ${GREEN}✓${NC} package.json: $pkg_version"
        else
            echo -e "  ${RED}✗${NC} package.json: $pkg_version (expected $source_version)"
            mismatches=$((mismatches + 1))
        fi
    fi

    # plugin.json
    if [ -f "$PLUGIN_JSON" ]; then
        local plugin_version
        plugin_version=$(grep '"version"' "$PLUGIN_JSON" | head -1 | sed 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/')
        if [ "$plugin_version" = "$source_version" ]; then
            echo -e "  ${GREEN}✓${NC} plugin.json: $plugin_version"
        else
            echo -e "  ${RED}✗${NC} plugin.json: $plugin_version (expected $source_version)"
            mismatches=$((mismatches + 1))
        fi
    fi

    # install.sh
    if [ -f "$INSTALL_SH" ]; then
        local install_version
        install_version=$(grep '^VERSION=' "$INSTALL_SH" | head -1 | sed 's/VERSION="\([^"]*\)"/\1/')
        if [ "$install_version" = "$source_version" ]; then
            echo -e "  ${GREEN}✓${NC} install.sh: $install_version"
        else
            echo -e "  ${RED}✗${NC} install.sh: $install_version (expected $source_version)"
            mismatches=$((mismatches + 1))
        fi
    fi

    # cli.sh (checks the fallback version string)
    if [ -f "$CLI_SH" ]; then
        local cli_version
        cli_version=$(grep 'ACT_VERSION=' "$CLI_SH" | grep -v 'tr\|cat\|VERSION file' | head -1 | sed 's/.*ACT_VERSION="\([^"]*\)"/\1/')
        if [ "$cli_version" = "$source_version" ]; then
            echo -e "  ${GREEN}✓${NC} cli.sh: $cli_version"
        else
            echo -e "  ${RED}✗${NC} cli.sh: $cli_version (expected $source_version)"
            mismatches=$((mismatches + 1))
        fi
    fi

    # CLAUDE.md
    if [ -f "$CLAUDE_MD" ]; then
        local claude_version
        claude_version=$(grep -E '^\- \*\*Version\*\*' "$CLAUDE_MD" | head -1 | sed 's/.*: *//')
        if [ "$claude_version" = "$source_version" ]; then
            echo -e "  ${GREEN}✓${NC} CLAUDE.md: $claude_version"
        else
            echo -e "  ${RED}✗${NC} CLAUDE.md: $claude_version (expected $source_version)"
            mismatches=$((mismatches + 1))
        fi
    fi

    # README.md badge
    if [ -f "$README_MD" ]; then
        local readme_version
        # Badge format: version-3.5.0--alpha-blue (shields.io uses -- for literal -)
        readme_version=$(grep 'img.shields.io/badge/version-' "$README_MD" | head -1 | sed 's/.*version-//; s/-blue.*//' | sed 's/--/-/g')
        if [ "$readme_version" = "$source_version" ]; then
            echo -e "  ${GREEN}✓${NC} README.md badge: $readme_version"
        else
            echo -e "  ${RED}✗${NC} README.md badge: $readme_version (expected $source_version)"
            mismatches=$((mismatches + 1))
        fi
    fi

    echo ""
    if [ $mismatches -eq 0 ]; then
        echo -e "${GREEN}All versions are in sync.${NC}"
        return 0
    else
        echo -e "${RED}$mismatches file(s) out of sync.${NC}"
        echo -e "Run: ${YELLOW}./scripts/bump-version.sh $source_version${NC} to fix."
        return 1
    fi
}

# Bump version in all files
bump_version() {
    local new_version="$1"

    echo -e "${BLUE}Bumping version to:${NC} $new_version"
    echo ""

    # 1. VERSION file
    echo "$new_version" > "$VERSION_FILE"
    echo -e "  ${GREEN}✓${NC} VERSION"

    # 2. package.json
    if [ -f "$PACKAGE_JSON" ]; then
        sed -i.bak "s/\"version\":[[:space:]]*\"[^\"]*\"/\"version\": \"$new_version\"/" "$PACKAGE_JSON"
        rm -f "$PACKAGE_JSON.bak"
        echo -e "  ${GREEN}✓${NC} package.json"
    fi

    # 3. plugin.json
    if [ -f "$PLUGIN_JSON" ]; then
        sed -i.bak "s/\"version\":[[:space:]]*\"[^\"]*\"/\"version\": \"$new_version\"/" "$PLUGIN_JSON"
        rm -f "$PLUGIN_JSON.bak"
        echo -e "  ${GREEN}✓${NC} plugin/.claude-plugin/plugin.json"
    fi

    # 4. install.sh
    if [ -f "$INSTALL_SH" ]; then
        sed -i.bak "s/^VERSION=\"[^\"]*\"/VERSION=\"$new_version\"/" "$INSTALL_SH"
        rm -f "$INSTALL_SH.bak"
        echo -e "  ${GREEN}✓${NC} scripts/install.sh"
    fi

    # 5. cli.sh (update the fallback version)
    if [ -f "$CLI_SH" ]; then
        sed -i.bak "s/ACT_VERSION=\"[^\"]*\"/ACT_VERSION=\"$new_version\"/" "$CLI_SH"
        rm -f "$CLI_SH.bak"
        echo -e "  ${GREEN}✓${NC} scripts/cli.sh"
    fi

    # 6. CLAUDE.md
    if [ -f "$CLAUDE_MD" ]; then
        sed -i.bak "s/- \*\*Version\*\*: .*/- \*\*Version\*\*: $new_version/" "$CLAUDE_MD"
        rm -f "$CLAUDE_MD.bak"
        echo -e "  ${GREEN}✓${NC} CLAUDE.md"
    fi

    # 7. README.md badge
    # shields.io uses -- to represent a literal hyphen in badge text
    if [ -f "$README_MD" ]; then
        local badge_version
        badge_version=$(echo "$new_version" | sed 's/-/--/g')
        # Replace the full badge URL version segment (between version- and -blue)
        sed -i.bak "s|version-[^)]*-blue|version-${badge_version}-blue|" "$README_MD"
        rm -f "$README_MD.bak"
        echo -e "  ${GREEN}✓${NC} README.md (badge)"
    fi

    echo ""
    echo -e "${GREEN}Version bumped to $new_version in all files.${NC}"
    echo ""

    # Verify
    echo "Verifying..."
    check_versions
}

# Main
case "${1:-}" in
    --check)
        check_versions
        ;;
    --help|-h)
        echo "Usage: ./scripts/bump-version.sh <new-version>"
        echo "       ./scripts/bump-version.sh --check"
        echo ""
        echo "Updates version in all project files from VERSION as source of truth."
        echo ""
        echo "Examples:"
        echo "  ./scripts/bump-version.sh 3.6.0-alpha"
        echo "  ./scripts/bump-version.sh --check"
        ;;
    "")
        echo "Usage: ./scripts/bump-version.sh <new-version>"
        echo "       ./scripts/bump-version.sh --check"
        exit 1
        ;;
    *)
        bump_version "$1"
        ;;
esac
