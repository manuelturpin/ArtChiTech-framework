#!/bin/bash
# ACT Framework CLI
# Usage: npx act-framework <command>
# Commands: init, install --global

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
FRAMEWORK_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
ACT_GLOBAL_DIR="$HOME/.act"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_banner() {
    echo ""
    echo -e "${BLUE}╔══════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║     ACT Framework v3.0 — Init            ║${NC}"
    echo -e "${BLUE}║     7-phase project management           ║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════╝${NC}"
    echo ""
}

# Detect project stack
detect_stack() {
    local dir="$1"
    local stack=""

    if [ -f "$dir/package.json" ]; then
        if grep -q '"next"' "$dir/package.json" 2>/dev/null; then
            stack="next.js"
        elif grep -q '"react"' "$dir/package.json" 2>/dev/null; then
            stack="react"
        elif grep -q '"vue"' "$dir/package.json" 2>/dev/null; then
            stack="vue"
        else
            stack="node.js"
        fi

        if [ -f "$dir/tsconfig.json" ]; then
            stack="$stack+typescript"
        fi
    elif [ -f "$dir/requirements.txt" ] || [ -f "$dir/pyproject.toml" ]; then
        stack="python"
    elif [ -f "$dir/Cargo.toml" ]; then
        stack="rust"
    elif [ -f "$dir/go.mod" ]; then
        stack="go"
    elif [ -f "$dir/Gemfile" ]; then
        stack="ruby"
    else
        stack="unknown"
    fi

    echo "$stack"
}

# Initialize ACT in current project
cmd_init() {
    local project_dir="${1:-.}"
    project_dir="$(cd "$project_dir" && pwd)"

    print_banner

    # Check if already initialized
    if [ -d "$project_dir/.act" ]; then
        echo -e "${YELLOW}⚠️  ACT already initialized in this project.${NC}"
        echo "   Use /act:resume to continue, or delete .act/ to start fresh."
        return 1
    fi

    # Detect project info
    local project_name=$(basename "$project_dir")
    local stack=$(detect_stack "$project_dir")

    echo -e "${GREEN}Initializing ACT in:${NC} $project_dir"
    echo -e "${GREEN}Detected stack:${NC} $stack"
    echo -e "${GREEN}Project name:${NC} $project_name"
    echo ""

    # Create .act/ directory structure
    echo "Creating .act/ directory structure..."
    mkdir -p "$project_dir/.act"
    mkdir -p "$project_dir/.act/history"
    mkdir -p "$project_dir/.act/handoffs"
    mkdir -p "$project_dir/.act/architecture"
    mkdir -p "$project_dir/.act/stories"
    mkdir -p "$project_dir/.act/logs"

    # Copy templates
    local templates_dir="$FRAMEWORK_DIR/templates/act"

    if [ -d "$templates_dir" ]; then
        # config.yaml
        sed "s/{{PROJECT_NAME}}/$project_name/g; s/{{PROJECT_DESCRIPTION}}/Project managed by ACT Framework/g; s/{{PROJECT_TYPE}}/product/g; s/{{SCALE}}/full/g" \
            "$templates_dir/config.yaml.template" > "$project_dir/.act/config.yaml"

        # state.md
        if [ -f "$templates_dir/state.md.template" ]; then
            cp "$templates_dir/state.md.template" "$project_dir/.act/state.md"
        fi

        # plan.md
        if [ -f "$templates_dir/plan.md.template" ]; then
            cp "$templates_dir/plan.md.template" "$project_dir/.act/plan.md"
        fi

        # progress.md
        if [ -f "$templates_dir/progress.md.template" ]; then
            cp "$templates_dir/progress.md.template" "$project_dir/.act/progress.md"
        fi

        # findings.md
        if [ -f "$templates_dir/findings.md.template" ]; then
            cp "$templates_dir/findings.md.template" "$project_dir/.act/findings.md"
        fi

        # prd.md (NEW v3.0)
        if [ -f "$templates_dir/prd.md.template" ]; then
            local today=$(date +%Y-%m-%d)
            sed "s/{{PROJECT_NAME}}/$project_name/g; s/{{DATE}}/$today/g" \
                "$templates_dir/prd.md.template" > "$project_dir/.act/prd.md"
        fi

        # observations.jsonl (empty)
        touch "$project_dir/.act/observations.jsonl"

        # .gitignore for .act/
        if [ -f "$templates_dir/gitignore.template" ]; then
            cp "$templates_dir/gitignore.template" "$project_dir/.act/.gitignore"
        fi

        echo -e "${GREEN}✅ .act/ directory created with templates${NC}"
    else
        echo -e "${YELLOW}⚠️  Templates not found at $templates_dir${NC}"
        echo "   Creating minimal structure..."
        touch "$project_dir/.act/config.yaml"
        touch "$project_dir/.act/state.md"
        touch "$project_dir/.act/plan.md"
        touch "$project_dir/.act/progress.md"
        touch "$project_dir/.act/findings.md"
        touch "$project_dir/.act/observations.jsonl"
    fi

    # Install plugin if Claude Code is available
    if [ -d "$HOME/.claude" ]; then
        echo ""
        echo "Installing ACT plugin for Claude Code..."
        local plugin_cache="$HOME/.claude/plugins/cache/act"
        mkdir -p "$plugin_cache"
        cp -r "$FRAMEWORK_DIR/plugin/"* "$plugin_cache/" 2>/dev/null || true
        cp -r "$FRAMEWORK_DIR/plugin/.claude-plugin" "$plugin_cache/" 2>/dev/null || true
        echo -e "${GREEN}✅ ACT plugin installed${NC}"
    fi

    # Register in global registry if it exists
    if [ -f "$ACT_GLOBAL_DIR/projects.yaml" ]; then
        echo ""
        echo "Registering project in global registry..."
        # Simple append — proper YAML handling would need a YAML parser
        echo "  - name: $project_name" >> "$ACT_GLOBAL_DIR/projects.yaml"
        echo "    path: $project_dir" >> "$ACT_GLOBAL_DIR/projects.yaml"
        echo "    registered: $(date +%Y-%m-%d)" >> "$ACT_GLOBAL_DIR/projects.yaml"
        echo -e "${GREEN}✅ Project registered in ~/.act/projects.yaml${NC}"
    fi

    echo ""
    echo -e "${GREEN}╔══════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  ACT Framework initialized successfully! ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════╝${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Open Claude Code in this directory"
    echo "  2. Run /act:full to start a full project"
    echo "  3. Or /act:quick for a quick task"
    echo ""
    echo -e "${BLUE}💡 Register globally: npx act-framework install --global${NC}"
}

# Install global orchestrator
cmd_install_global() {
    print_banner

    echo "Installing global ACT orchestrator..."

    # Create ~/.act/
    mkdir -p "$ACT_GLOBAL_DIR"

    # Copy global template
    local global_template="$FRAMEWORK_DIR/templates/global-act/projects.yaml"
    if [ -f "$global_template" ] && [ ! -f "$ACT_GLOBAL_DIR/projects.yaml" ]; then
        cp "$global_template" "$ACT_GLOBAL_DIR/projects.yaml"
        echo -e "${GREEN}✅ Created ~/.act/projects.yaml${NC}"
    elif [ -f "$ACT_GLOBAL_DIR/projects.yaml" ]; then
        echo -e "${YELLOW}ℹ️  ~/.act/projects.yaml already exists, keeping it${NC}"
    fi

    echo ""
    echo -e "${GREEN}✅ Global orchestrator installed at ~/.act/${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Register projects: /act:projects --register /path/to/project"
    echo "  2. Or scan: /act:projects --scan ~/projects"
    echo "  3. View dashboard: /act:dashboard"
}

# Main
case "${1:-}" in
    init)
        cmd_init "${2:-.}"
        ;;
    install)
        if [ "${2:-}" = "--global" ]; then
            cmd_install_global
        else
            echo "Usage: act-framework install --global"
            exit 1
        fi
        ;;
    --help|-h|help)
        print_banner
        echo "Usage: npx act-framework <command>"
        echo ""
        echo "Commands:"
        echo "  init [path]        Initialize ACT in a project (default: current dir)"
        echo "  install --global   Install global multi-project orchestrator"
        echo "  help               Show this help"
        echo ""
        ;;
    "")
        print_banner
        echo "Usage: npx act-framework <command>"
        echo ""
        echo "Run 'npx act-framework help' for available commands."
        ;;
    *)
        echo -e "${RED}Unknown command: $1${NC}"
        echo "Run 'npx act-framework help' for available commands."
        exit 1
        ;;
esac
