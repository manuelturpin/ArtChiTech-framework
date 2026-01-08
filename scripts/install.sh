#!/bin/bash
# =============================================================================
# ACT Framework - Script d'installation unifié
# Version: 2.0.0
#
# Usage:
#   One-liner (depuis GitHub):
#     curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash
#
#   Depuis le repo cloné (mode dev):
#     ./scripts/install.sh
# =============================================================================

set -e

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Configuration
REPO_URL="https://github.com/manuelturpin/ArtChiTech-framework"
INSTALL_DIR=".claude/plugins/act"
VERSION="2.0.0"

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
    echo -e "${CYAN}│${NC}  ${BOLD}ACT Framework - Installation v${VERSION}${NC}                       ${CYAN}│${NC}"
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

    mkdir -p "$INSTALL_DIR/.claude-plugin"
    mkdir -p "$INSTALL_DIR/commands"
    mkdir -p "$INSTALL_DIR/skills"
    mkdir -p "$INSTALL_DIR/scripts"
    mkdir -p "$INSTALL_DIR/agents"
    mkdir -p "$INSTALL_DIR/references"
    mkdir -p "$INSTALL_DIR/hooks"

    print_success "Structure créée: $INSTALL_DIR"
}

# =============================================================================
# Copie des fichiers (mode local/dev)
# =============================================================================

copy_local() {
    print_info "Copie des fichiers depuis le repo local..."

    # Plugin configuration
    cp -r "$SOURCE_DIR/.claude-plugin/"* "$INSTALL_DIR/.claude-plugin/"

    # Commands
    if [ -d "$SOURCE_DIR/commands" ]; then
        cp -r "$SOURCE_DIR/commands/"* "$INSTALL_DIR/commands/" 2>/dev/null || true
    fi

    # Skills (contient les scripts Python)
    if [ -d "$SOURCE_DIR/skills" ]; then
        cp -r "$SOURCE_DIR/skills/"* "$INSTALL_DIR/skills/" 2>/dev/null || true
    fi

    # Agents
    if [ -d "$SOURCE_DIR/agents" ]; then
        cp -r "$SOURCE_DIR/agents/"* "$INSTALL_DIR/agents/" 2>/dev/null || true
    fi

    # References
    if [ -d "$SOURCE_DIR/references" ]; then
        cp -r "$SOURCE_DIR/references/"* "$INSTALL_DIR/references/" 2>/dev/null || true
    fi

    # Copier le resolver (nouveau dans v2.0.0)
    if [ -f "$SOURCE_DIR/scripts/act_resolver.py" ]; then
        cp "$SOURCE_DIR/scripts/act_resolver.py" "$INSTALL_DIR/scripts/"
        cp "$SOURCE_DIR/scripts/__init__.py" "$INSTALL_DIR/scripts/" 2>/dev/null || true
        echo -e "  ${GREEN}✓${NC} Resolver copié"
    fi

    # Hooks (si présents)
    if [ -d "$SOURCE_DIR/hooks" ]; then
        cp -r "$SOURCE_DIR/hooks/"* "$INSTALL_DIR/hooks/" 2>/dev/null || true
    fi

    print_success "Fichiers copiés"
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

    # Utiliser la même fonction de copie
    copy_local
}

# =============================================================================
# Validation de l'installation
# =============================================================================

validate_install() {
    print_info "Validation de l'installation..."

    local valid=true

    # Vérifier les fichiers critiques
    if [ ! -f "$INSTALL_DIR/.claude-plugin/plugin.json" ]; then
        print_error "plugin.json manquant"
        valid=false
    fi

    if [ ! -d "$INSTALL_DIR/commands" ] || [ -z "$(ls -A "$INSTALL_DIR/commands" 2>/dev/null)" ]; then
        print_error "Dossier commands vide"
        valid=false
    fi

    # Vérifier le resolver (critique pour v2.0.0)
    if [ -f "$INSTALL_DIR/scripts/act_resolver.py" ]; then
        echo -e "  ${GREEN}✓${NC} Resolver installé"
    else
        print_warning "Resolver non installé (fonctionnalités limitées)"
    fi

    # Vérifier state_manager (script critique)
    if [ -f "$INSTALL_DIR/skills/state-management/scripts/state_manager.py" ]; then
        echo -e "  ${GREEN}✓${NC} State manager installé"
    else
        print_warning "State manager manquant"
    fi

    if [ "$valid" = true ]; then
        print_success "Installation validée"
    else
        print_error "Installation incomplète"
        exit 1
    fi
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
    echo -e "📍 Emplacement : ${BLUE}$INSTALL_DIR${NC}"
    echo -e "📦 Version     : ${BLUE}$VERSION${NC}"
    echo ""
    echo "Commandes disponibles :"
    echo -e "  ${YELLOW}/act-project${NC}  → Hub principal"
    echo -e "  ${YELLOW}/act-onboard${NC}  → Auditer ce projet"
    echo -e "  ${YELLOW}/act-status${NC}   → Voir l'état"
    echo -e "  ${YELLOW}/act-next${NC}     → Phase suivante"
    echo -e "  ${YELLOW}/act-fix${NC}      → Corriger les erreurs"
    echo ""
    echo -e "${BOLD}Démarre Claude Code et tape /act-project pour commencer !${NC}"
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
        copy_local
    else
        download_remote
    fi

    validate_install
    print_summary
}

main "$@"
