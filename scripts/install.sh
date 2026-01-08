#!/bin/bash
# =============================================================================
# ACT Framework - Script d'installation v2.1.0
#
# Structure d'installation :
#   .claude/commands/     <- Commandes (Claude Code les lit ici)
#   .claude/act/          <- Ressources ACT (scripts, skills, etc.)
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash
# =============================================================================

set -e

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Configuration
REPO_URL="https://github.com/manuelturpin/ArtChiTech-framework"
VERSION="2.1.0"

# Chemins d'installation (structure correcte pour Claude Code)
COMMANDS_DIR=".claude/commands"
ACT_DIR=".claude/act"

# Variables globales
SOURCE_DIR=""
MODE=""
TEMP_DIR=""
CLEANUP_NEEDED=false

# =============================================================================
# Fonctions utilitaires
# =============================================================================

print_header() {
    echo ""
    echo -e "${CYAN}╭─────────────────────────────────────────────────────────────╮${NC}"
    echo -e "${CYAN}│${NC}  ${BOLD}ACT Framework - Installation v${VERSION}${NC}                     ${CYAN}│${NC}"
    echo -e "${CYAN}╰─────────────────────────────────────────────────────────────╯${NC}"
    echo ""
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}→${NC} $1"
}

cleanup_temp() {
    if [[ "$CLEANUP_NEEDED" == true && -n "$TEMP_DIR" && -d "$TEMP_DIR" ]]; then
        rm -rf "$TEMP_DIR"
    fi
}

trap cleanup_temp EXIT

# =============================================================================
# Vérification des prérequis
# =============================================================================

check_prerequisites() {
    print_info "Vérification des prérequis..."
    echo ""

    local failed=0

    # Python 3.8+
    if command -v python3 &> /dev/null; then
        local version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
        local major=$(echo $version | cut -d. -f1)
        local minor=$(echo $version | cut -d. -f2)
        if [ "$major" -gt 3 ] || ([ "$major" -eq 3 ] && [ "$minor" -ge 8 ]); then
            echo -e "  ${GREEN}✓${NC} Python $version"
        else
            echo -e "  ${RED}✗${NC} Python 3.8+ requis (trouvé: $version)"
            failed=1
        fi
    else
        echo -e "  ${RED}✗${NC} Python 3.8+ requis"
        failed=1
    fi

    # Git
    if command -v git &> /dev/null; then
        echo -e "  ${GREEN}✓${NC} Git $(git --version | cut -d' ' -f3)"
    else
        echo -e "  ${RED}✗${NC} Git requis"
        failed=1
    fi

    # Claude Code
    if command -v claude &> /dev/null; then
        echo -e "  ${GREEN}✓${NC} Claude Code installé"
    else
        echo -e "  ${RED}✗${NC} Claude Code requis"
        echo "     → https://claude.ai/download"
        failed=1
    fi

    echo ""

    if [ $failed -eq 1 ]; then
        print_error "Prérequis manquants"
        exit 1
    fi

    print_success "Tous les prérequis sont OK"
}

# =============================================================================
# Détection du mode d'installation
# =============================================================================

detect_mode() {
    # Récupérer le répertoire du script
    if [[ -n "$BASH_SOURCE" && -f "$BASH_SOURCE" ]]; then
        SCRIPT_DIR="$(cd "$(dirname "$BASH_SOURCE")" 2>/dev/null && pwd)"
    else
        SCRIPT_DIR=""
    fi

    # Si on est dans le repo ACT (mode dev)
    if [[ -n "$SCRIPT_DIR" && -f "$SCRIPT_DIR/../plugin/.claude-plugin/plugin.json" ]]; then
        MODE="local"
        SOURCE_DIR="$SCRIPT_DIR/../plugin"
        echo -e "${YELLOW}📍 Mode développeur détecté${NC}"
    else
        MODE="remote"
        echo -e "${BLUE}📍 Installation depuis GitHub${NC}"
    fi
    echo ""
}

# =============================================================================
# Création de la structure d'installation
# =============================================================================

create_structure() {
    print_info "Création de la structure..."

    # Commandes (là où Claude Code les cherche)
    mkdir -p "$COMMANDS_DIR"

    # Ressources ACT
    mkdir -p "$ACT_DIR/scripts"
    mkdir -p "$ACT_DIR/skills"
    mkdir -p "$ACT_DIR/agents"
    mkdir -p "$ACT_DIR/references"
    mkdir -p "$ACT_DIR/hooks"

    print_success "Structure créée"
}

# =============================================================================
# Copie des fichiers
# =============================================================================

copy_files() {
    print_info "Installation des fichiers..."

    # 1. Commandes -> .claude/commands/
    if [ -d "$SOURCE_DIR/commands" ]; then
        cp "$SOURCE_DIR/commands/"*.md "$COMMANDS_DIR/" 2>/dev/null || true
        local cmd_count=$(ls -1 "$COMMANDS_DIR/"*.md 2>/dev/null | wc -l | tr -d ' ')
        echo -e "  ${GREEN}✓${NC} $cmd_count commandes installées"
    fi

    # 2. Scripts Python -> .claude/act/scripts/
    if [ -d "$SOURCE_DIR/scripts" ]; then
        cp "$SOURCE_DIR/scripts/"*.py "$ACT_DIR/scripts/" 2>/dev/null || true
        echo -e "  ${GREEN}✓${NC} Scripts Python copiés"
    fi

    # 3. Skills -> .claude/act/skills/
    if [ -d "$SOURCE_DIR/skills" ]; then
        cp -r "$SOURCE_DIR/skills/"* "$ACT_DIR/skills/" 2>/dev/null || true
        echo -e "  ${GREEN}✓${NC} Skills copiés"
    fi

    # 4. Agents -> .claude/act/agents/
    if [ -d "$SOURCE_DIR/agents" ]; then
        cp "$SOURCE_DIR/agents/"*.md "$ACT_DIR/agents/" 2>/dev/null || true
        echo -e "  ${GREEN}✓${NC} Agents copiés"
    fi

    # 5. References -> .claude/act/references/
    if [ -d "$SOURCE_DIR/references" ]; then
        cp -r "$SOURCE_DIR/references/"* "$ACT_DIR/references/" 2>/dev/null || true
        echo -e "  ${GREEN}✓${NC} Références copiées"
    fi

    # 6. Hooks -> .claude/act/hooks/
    if [ -d "$SOURCE_DIR/hooks" ]; then
        cp "$SOURCE_DIR/hooks/"* "$ACT_DIR/hooks/" 2>/dev/null || true
        echo -e "  ${GREEN}✓${NC} Hooks copiés"
    fi

    # 7. Version marker
    echo "$VERSION" > "$ACT_DIR/version.txt"

    print_success "Fichiers installés"
}

# =============================================================================
# Téléchargement des fichiers (mode remote)
# =============================================================================

download_remote() {
    print_info "Téléchargement depuis GitHub..."

    if ! command -v git &> /dev/null; then
        print_error "Git est requis pour l'installation"
        exit 1
    fi

    TEMP_DIR=$(mktemp -d)
    CLEANUP_NEEDED=true

    # Clone minimal avec sparse checkout
    if ! git clone --depth 1 --filter=blob:none --sparse "$REPO_URL" "$TEMP_DIR/act" 2>/dev/null; then
        print_error "Échec du téléchargement du repo"
        exit 1
    fi

    cd "$TEMP_DIR/act"
    git sparse-checkout set plugin 2>/dev/null
    cd - > /dev/null

    SOURCE_DIR="$TEMP_DIR/act/plugin"

    print_success "Téléchargement terminé"
}

# =============================================================================
# Validation de l'installation
# =============================================================================

validate_install() {
    print_info "Validation de l'installation..."

    local errors=0

    # Vérifier les commandes
    if [ -f "$COMMANDS_DIR/act-project.md" ]; then
        echo -e "  ${GREEN}✓${NC} Commande /act-project"
    else
        echo -e "  ${RED}✗${NC} Commande /act-project manquante"
        errors=$((errors + 1))
    fi

    if [ -f "$COMMANDS_DIR/act-onboard.md" ]; then
        echo -e "  ${GREEN}✓${NC} Commande /act-onboard"
    else
        echo -e "  ${RED}✗${NC} Commande /act-onboard manquante"
        errors=$((errors + 1))
    fi

    # Vérifier les scripts critiques
    if [ -f "$ACT_DIR/skills/state-management/scripts/state_manager.py" ]; then
        echo -e "  ${GREEN}✓${NC} State manager"
    else
        echo -e "  ${RED}✗${NC} State manager manquant"
        errors=$((errors + 1))
    fi

    if [ -f "$ACT_DIR/skills/project-detection/scripts/detect_stack.py" ]; then
        echo -e "  ${GREEN}✓${NC} Detect stack"
    else
        echo -e "  ${RED}✗${NC} Detect stack manquant"
        errors=$((errors + 1))
    fi

    if [ $errors -gt 0 ]; then
        print_error "Installation incomplète ($errors erreurs)"
        exit 1
    fi

    print_success "Installation validée"
}

# =============================================================================
# Affichage du résumé
# =============================================================================

print_summary() {
    echo ""
    echo -e "${GREEN}╭─────────────────────────────────────────────────────────────╮${NC}"
    echo -e "${GREEN}│${NC}  ${BOLD}ACT Framework installé avec succès !${NC}                       ${GREEN}│${NC}"
    echo -e "${GREEN}╰─────────────────────────────────────────────────────────────╯${NC}"
    echo ""
    echo "Structure installée :"
    echo -e "  ${BLUE}.claude/commands/${NC}  ← Commandes Claude Code"
    echo -e "  ${BLUE}.claude/act/${NC}       ← Ressources ACT"
    echo ""
    echo "Commandes disponibles :"
    echo -e "  ${YELLOW}/act-project${NC}  → Hub principal"
    echo -e "  ${YELLOW}/act-onboard${NC}  → Auditer ce projet"
    echo -e "  ${YELLOW}/act-status${NC}   → Voir l'état"
    echo -e "  ${YELLOW}/act-next${NC}     → Phase suivante"
    echo ""
    echo -e "${BOLD}Redémarre Claude Code et tape /act-project pour commencer !${NC}"
    echo ""
}

# =============================================================================
# Main
# =============================================================================

main() {
    print_header
    detect_mode
    check_prerequisites
    create_structure

    if [ "$MODE" = "local" ]; then
        copy_files
    else
        download_remote
        copy_files
    fi

    validate_install
    print_summary
}

main "$@"
