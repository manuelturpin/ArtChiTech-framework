#!/bin/bash
# =============================================================================
# ACT Framework - Script d'installation v2.7.0
#
# Modes d'installation :
#   --local  (défaut) : Installe dans le dossier courant (.claude/)
#   --global          : Installe globalement (~/.claude/plugins/act/)
#
# Structure d'installation :
#   Local:   ./.claude/commands/act/     <- Commandes ACT v2.7
#            ./.claude/commands/consider/ <- Thinking models
#   Global:  ~/.claude/plugins/act/      <- Plugin complet
#
# Usage:
#   ./install.sh              # Installation locale (défaut)
#   ./install.sh --local      # Installation locale explicite
#   ./install.sh --global     # Installation globale
#
#   curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/main/scripts/install.sh | bash
#   curl -fsSL ... | bash -s -- --global
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
VERSION="2.7.0"

# Variables globales
SOURCE_DIR=""
SOURCE_MODE=""  # "local" (from repo) or "remote" (download)
INSTALL_MODE="local"  # "local" (project) or "global" (~/.claude)
TEMP_DIR=""
CLEANUP_NEEDED=false
INSTALL_DIR=""

# =============================================================================
# Fonctions utilitaires
# =============================================================================

print_header() {
    echo ""
    echo -e "${CYAN}╭─────────────────────────────────────────────────────────────╮${NC}"
    echo -e "${CYAN}│${NC}  ${BOLD}ACT Framework - Installation v${VERSION}${NC}                      ${CYAN}│${NC}"
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
# Parsing des arguments
# =============================================================================

parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            --local)
                INSTALL_MODE="local"
                shift
                ;;
            --global)
                INSTALL_MODE="global"
                shift
                ;;
            --help|-h)
                show_help
                exit 0
                ;;
            *)
                print_error "Option inconnue: $1"
                show_help
                exit 1
                ;;
        esac
    done
}

show_help() {
    echo "Usage: ./install.sh [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --local   Installer dans le dossier courant (défaut)"
    echo "            → .claude/commands/act/"
    echo "            → .claude/commands/consider/"
    echo ""
    echo "  --global  Installer globalement"
    echo "            → ~/.claude/plugins/act/"
    echo ""
    echo "  --help    Afficher cette aide"
    echo ""
    echo "Exemples:"
    echo "  ./install.sh              # Local dans le projet courant"
    echo "  ./install.sh --global     # Global pour tous les projets"
    echo ""
}

# =============================================================================
# Vérification des prérequis
# =============================================================================

check_prerequisites() {
    print_info "Vérification des prérequis..."
    echo ""

    local failed=0

    # Git
    if command -v git &> /dev/null; then
        echo -e "  ${GREEN}✓${NC} Git $(git --version | cut -d' ' -f3)"
    else
        echo -e "  ${RED}✗${NC} Git requis"
        failed=1
    fi

    # Claude Code (optionnel mais recommandé)
    if command -v claude &> /dev/null; then
        echo -e "  ${GREEN}✓${NC} Claude Code installé"
    else
        echo -e "  ${YELLOW}⚠${NC} Claude Code non détecté (requis pour utiliser ACT)"
        echo "     → https://claude.ai/download"
    fi

    echo ""

    if [ $failed -eq 1 ]; then
        print_error "Prérequis manquants"
        exit 1
    fi

    print_success "Prérequis OK"
}

# =============================================================================
# Détection du mode source
# =============================================================================

detect_source() {
    # Récupérer le répertoire du script
    if [[ -n "$BASH_SOURCE" && -f "$BASH_SOURCE" ]]; then
        SCRIPT_DIR="$(cd "$(dirname "$BASH_SOURCE")" 2>/dev/null && pwd)"
    else
        SCRIPT_DIR=""
    fi

    # Si on est dans le repo ACT (mode dev)
    if [[ -n "$SCRIPT_DIR" && -f "$SCRIPT_DIR/../plugin/.claude-plugin/plugin.json" ]]; then
        SOURCE_MODE="local"
        SOURCE_DIR="$(cd "$SCRIPT_DIR/../plugin" && pwd)"
        echo -e "${YELLOW}📍 Mode développeur détecté${NC}"
        echo -e "   Source: ${BLUE}$SOURCE_DIR${NC}"
    else
        SOURCE_MODE="remote"
        echo -e "${BLUE}📍 Installation depuis GitHub${NC}"
    fi
    echo ""
}

# =============================================================================
# Configuration des chemins d'installation
# =============================================================================

setup_install_paths() {
    if [ "$INSTALL_MODE" = "global" ]; then
        INSTALL_DIR="$HOME/.claude/plugins/act"
        echo -e "${CYAN}🌐 Installation GLOBALE${NC}"
        echo -e "   Destination: ${BLUE}$INSTALL_DIR${NC}"
    else
        INSTALL_DIR="$(pwd)/.claude"
        echo -e "${CYAN}📁 Installation LOCALE${NC}"
        echo -e "   Destination: ${BLUE}$INSTALL_DIR${NC}"
    fi
    echo ""
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
# Installation locale (dans le projet)
# =============================================================================

install_local() {
    print_info "Installation des commandes..."

    # Créer la structure
    mkdir -p "$INSTALL_DIR/commands/act"
    mkdir -p "$INSTALL_DIR/commands/consider"

    # 1. Commandes ACT v2.7
    if [ -d "$SOURCE_DIR/commands/act" ]; then
        cp "$SOURCE_DIR/commands/act/"*.md "$INSTALL_DIR/commands/act/" 2>/dev/null || true
        local act_count=$(ls -1 "$INSTALL_DIR/commands/act/"*.md 2>/dev/null | wc -l | tr -d ' ')
        echo -e "  ${GREEN}✓${NC} $act_count commandes ACT (/act:*)"
    fi

    # 2. Commandes Consider (thinking models)
    if [ -d "$SOURCE_DIR/commands/consider" ]; then
        cp "$SOURCE_DIR/commands/consider/"*.md "$INSTALL_DIR/commands/consider/" 2>/dev/null || true
        local consider_count=$(ls -1 "$INSTALL_DIR/commands/consider/"*.md 2>/dev/null | wc -l | tr -d ' ')
        echo -e "  ${GREEN}✓${NC} $consider_count modèles de pensée (/consider:*)"
    fi

    # 3. Commandes legacy migrées (optionnel)
    local legacy_files=(
        "act-onboard.md"
        "act-feedback.md"
        "act-triage.md"
        "act-fix.md"
        "act-fix-issue.md"
        "loop.md"
        "loop-status.md"
        "loop-complete.md"
        "stories-generate.md"
    )

    local legacy_count=0
    for file in "${legacy_files[@]}"; do
        if [ -f "$SOURCE_DIR/commands/$file" ]; then
            cp "$SOURCE_DIR/commands/$file" "$INSTALL_DIR/commands/" 2>/dev/null || true
            legacy_count=$((legacy_count + 1))
        fi
    done

    if [ $legacy_count -gt 0 ]; then
        echo -e "  ${GREEN}✓${NC} $legacy_count commandes legacy"
    fi

    # 4. Version marker
    echo "$VERSION" > "$INSTALL_DIR/act-version.txt"

    print_success "Commandes installées"
}

# =============================================================================
# Installation globale (plugin complet)
# =============================================================================

install_global() {
    print_info "Installation du plugin..."

    # Backup si existe
    if [ -d "$INSTALL_DIR" ]; then
        local backup_dir="${INSTALL_DIR}.backup.$(date +%Y%m%d%H%M%S)"
        mv "$INSTALL_DIR" "$backup_dir"
        print_warning "Backup créé: $backup_dir"
    fi

    # Créer la structure
    mkdir -p "$INSTALL_DIR"

    # Copier tout le plugin (inclut les fichiers cachés)
    cp -r "$SOURCE_DIR/"* "$INSTALL_DIR/"
    cp -r "$SOURCE_DIR/".* "$INSTALL_DIR/" 2>/dev/null || true

    # Compter les fichiers
    local cmd_count=$(find "$INSTALL_DIR/commands" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    echo -e "  ${GREEN}✓${NC} $cmd_count commandes total"

    if [ -d "$INSTALL_DIR/agents" ]; then
        local agent_count=$(ls -1 "$INSTALL_DIR/agents/"*.md 2>/dev/null | wc -l | tr -d ' ')
        echo -e "  ${GREEN}✓${NC} $agent_count agents"
    fi

    if [ -d "$INSTALL_DIR/references" ]; then
        echo -e "  ${GREEN}✓${NC} Références et templates"
    fi

    print_success "Plugin installé"
}

# =============================================================================
# Validation de l'installation
# =============================================================================

validate_install() {
    print_info "Validation..."

    local errors=0

    if [ "$INSTALL_MODE" = "local" ]; then
        # Vérifier commandes locales
        if [ -d "$INSTALL_DIR/commands/act" ]; then
            local count=$(ls -1 "$INSTALL_DIR/commands/act/"*.md 2>/dev/null | wc -l | tr -d ' ')
            if [ "$count" -gt 0 ]; then
                echo -e "  ${GREEN}✓${NC} Commandes ACT présentes ($count)"
            else
                echo -e "  ${RED}✗${NC} Aucune commande ACT trouvée"
                errors=$((errors + 1))
            fi
        else
            echo -e "  ${RED}✗${NC} Dossier commands/act manquant"
            errors=$((errors + 1))
        fi
    else
        # Vérifier plugin global
        if [ -f "$INSTALL_DIR/.claude-plugin/plugin.json" ]; then
            echo -e "  ${GREEN}✓${NC} Plugin manifest présent"
        else
            echo -e "  ${RED}✗${NC} Plugin manifest manquant"
            errors=$((errors + 1))
        fi
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
    echo -e "${GREEN}│${NC}  ${BOLD}ACT Framework v${VERSION} installé avec succès !${NC}              ${GREEN}│${NC}"
    echo -e "${GREEN}╰─────────────────────────────────────────────────────────────╯${NC}"
    echo ""

    if [ "$INSTALL_MODE" = "local" ]; then
        echo "Structure installée :"
        echo -e "  ${BLUE}.claude/commands/act/${NC}      ← Commandes ACT v2.7"
        echo -e "  ${BLUE}.claude/commands/consider/${NC} ← Thinking models"
        echo ""
        echo "Commandes disponibles :"
        echo -e "  ${YELLOW}/act:init${NC}       → Initialiser ACT dans ce projet"
        echo -e "  ${YELLOW}/act:status${NC}     → Voir l'état du projet"
        echo -e "  ${YELLOW}/act:resume${NC}     → Reprendre une session"
        echo -e "  ${YELLOW}/act:agent${NC}      → Charger un agent spécialisé"
        echo -e "  ${YELLOW}/consider:*${NC}     → Modèles de pensée"
        echo ""
        echo -e "${BOLD}Redémarre Claude Code et tape /act:init pour commencer !${NC}"
    else
        echo "Plugin installé :"
        echo -e "  ${BLUE}~/.claude/plugins/act/${NC}"
        echo ""
        echo "Commandes disponibles globalement :"
        echo -e "  ${YELLOW}/act:init${NC}       → Initialiser un projet"
        echo -e "  ${YELLOW}/act:status${NC}     → État du projet"
        echo -e "  ${YELLOW}/act:agent${NC}      → Charger un agent"
        echo ""
        echo -e "${BOLD}Redémarre Claude Code pour activer le plugin !${NC}"
    fi
    echo ""
}

# =============================================================================
# Main
# =============================================================================

main() {
    parse_args "$@"
    print_header
    detect_source
    setup_install_paths
    check_prerequisites

    # Télécharger si source remote
    if [ "$SOURCE_MODE" = "remote" ]; then
        download_remote
    fi

    # Installer selon le mode
    if [ "$INSTALL_MODE" = "local" ]; then
        install_local
    else
        install_global
    fi

    validate_install
    print_summary
}

main "$@"
