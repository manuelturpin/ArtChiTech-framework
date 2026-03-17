#!/bin/bash
# =============================================================================
# ACT Framework - Installation Script v3.5
#
# Modes d'installation :
#   --local  (défaut) : Installe dans le dossier courant (.claude/)
#   --global          : Installe globalement (~/.claude/plugins/act/)
#
# Structure d'installation locale :
#   ./.claude/commands/act/       ← ACT commands
#   ./.claude/commands/consider/  ← Thinking models
#   ./.claude/skills/             ← 14 skills
#   ./.claude/workflows/          ← BMAD workflows
#   ./.claude/agents/prompts/     ← Dispatch templates
#   ./.claude/hooks/scripts/      ← Hook scripts
#   ./.claude/rules/              ← Iron Laws, Deviation Rules
#   ./.claude/templates/          ← Project templates
#   ./.claude/references/         ← Phase definitions, scoring
#
# Structure d'installation globale :
#   ~/.claude/plugins/act/        ← Full plugin with all components
#
# Usage:
#   ./install.sh              # Installation locale (défaut)
#   ./install.sh --local      # Installation locale explicite
#   ./install.sh --global     # Installation globale
#
#   curl -fsSL https://raw.githubusercontent.com/manuelturpin/ArtChiTech-framework/v3.5-alpha/scripts/install.sh | bash
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
BRANCH="v3.5-alpha"
VERSION="3.5.0-alpha"

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
    echo -e "${CYAN}│${NC}  ${BOLD}ACT Framework - Installation v${VERSION}${NC}                  ${CYAN}│${NC}"
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
    echo "            Installe: commands, skills, workflows, agents,"
    echo "            hooks, rules, templates, references"
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
        SOURCE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
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
    print_info "Téléchargement depuis GitHub (branche $BRANCH)..."

    if ! command -v git &> /dev/null; then
        print_error "Git est requis pour l'installation"
        exit 1
    fi

    TEMP_DIR=$(mktemp -d)
    CLEANUP_NEEDED=true

    # Clone minimal avec sparse checkout — tous les composants nécessaires
    if ! git clone --depth 1 --branch "$BRANCH" --filter=blob:none --sparse "$REPO_URL" "$TEMP_DIR/act" 2>/dev/null; then
        print_error "Échec du téléchargement du repo (branche: $BRANCH)"
        echo "  Vérifiez que la branche '$BRANCH' existe sur $REPO_URL"
        exit 1
    fi

    cd "$TEMP_DIR/act"
    git sparse-checkout set plugin skills hooks rules templates agents 2>/dev/null
    cd - > /dev/null

    SOURCE_DIR="$TEMP_DIR/act"

    print_success "Téléchargement terminé"
}

# =============================================================================
# Copie helper
# =============================================================================

copy_dir_contents() {
    local src="$1"
    local dst="$2"
    local label="$3"

    if [ -d "$src" ]; then
        mkdir -p "$dst"
        cp -r "$src/"* "$dst/" 2>/dev/null || true
        local count
        count=$(find "$dst" -type f 2>/dev/null | wc -l | tr -d ' ')
        echo -e "  ${GREEN}✓${NC} $count $label"
    fi
}

# =============================================================================
# Installation locale (dans le projet)
# =============================================================================

install_local() {
    print_info "Installation des composants ACT..."

    local src_plugin="$SOURCE_DIR/plugin"
    local src_root="$SOURCE_DIR"

    # 1. Commandes ACT
    if [ -d "$src_plugin/commands/act" ]; then
        mkdir -p "$INSTALL_DIR/commands/act"
        cp "$src_plugin/commands/act/"*.md "$INSTALL_DIR/commands/act/" 2>/dev/null || true
        local act_count
        act_count=$(ls -1 "$INSTALL_DIR/commands/act/"*.md 2>/dev/null | wc -l | tr -d ' ')
        echo -e "  ${GREEN}✓${NC} $act_count commandes ACT (/act:*)"
    fi

    # 2. Commandes Consider (thinking models)
    if [ -d "$src_plugin/commands/consider" ]; then
        mkdir -p "$INSTALL_DIR/commands/consider"
        cp "$src_plugin/commands/consider/"*.md "$INSTALL_DIR/commands/consider/" 2>/dev/null || true
        local consider_count
        consider_count=$(ls -1 "$INSTALL_DIR/commands/consider/"*.md 2>/dev/null | wc -l | tr -d ' ')
        echo -e "  ${GREEN}✓${NC} $consider_count modèles de pensée (/consider:*)"
    fi

    # 3. Skills (all 14 — source of truth is skills/ at root)
    if [ -d "$src_root/skills" ]; then
        copy_dir_contents "$src_root/skills" "$INSTALL_DIR/skills" "fichiers skills"
    fi

    # 4. Workflows (BMAD)
    if [ -d "$src_plugin/workflows" ]; then
        copy_dir_contents "$src_plugin/workflows" "$INSTALL_DIR/workflows" "fichiers workflows"
    fi

    # 5. Agent dispatch templates
    if [ -d "$src_plugin/agents/prompts" ]; then
        copy_dir_contents "$src_plugin/agents/prompts" "$INSTALL_DIR/agents/prompts" "dispatch templates"
    fi

    # 6. Hook scripts
    if [ -d "$src_plugin/hooks/scripts" ]; then
        copy_dir_contents "$src_plugin/hooks/scripts" "$INSTALL_DIR/hooks/scripts" "hook scripts"
    fi

    # 7. Rules (Iron Laws, Deviation Rules)
    if [ -d "$src_root/rules" ]; then
        copy_dir_contents "$src_root/rules" "$INSTALL_DIR/rules" "fichiers rules"
    fi

    # 8. Templates
    if [ -d "$src_root/templates" ]; then
        copy_dir_contents "$src_root/templates" "$INSTALL_DIR/templates" "fichiers templates"
    fi

    # 9. References (phases, scoring, superpowers)
    if [ -d "$src_plugin/references" ]; then
        copy_dir_contents "$src_plugin/references" "$INSTALL_DIR/references" "fichiers references"
    fi

    # 10. Legacy commands (optionnel)
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
        if [ -f "$src_plugin/commands/$file" ]; then
            cp "$src_plugin/commands/$file" "$INSTALL_DIR/commands/" 2>/dev/null || true
            legacy_count=$((legacy_count + 1))
        fi
    done

    if [ $legacy_count -gt 0 ]; then
        echo -e "  ${GREEN}✓${NC} $legacy_count commandes legacy"
    fi

    # Version marker
    echo "$VERSION" > "$INSTALL_DIR/act-version.txt"

    print_success "Composants installés"
}

# =============================================================================
# Installation globale (plugin complet)
# =============================================================================

install_global() {
    print_info "Installation du plugin..."

    local src_plugin="$SOURCE_DIR/plugin"
    local src_root="$SOURCE_DIR"

    # Backup si existe
    if [ -d "$INSTALL_DIR" ]; then
        local backup_dir="${INSTALL_DIR}.backup.$(date +%Y%m%d%H%M%S)"
        mv "$INSTALL_DIR" "$backup_dir"
        print_warning "Backup créé: $backup_dir"
    fi

    # Créer la structure
    mkdir -p "$INSTALL_DIR"

    # Copier le plugin (base)
    if [ -d "$src_plugin" ]; then
        cp -r "$src_plugin/"* "$INSTALL_DIR/" 2>/dev/null || true
        cp -r "$src_plugin/".* "$INSTALL_DIR/" 2>/dev/null || true
    fi

    # Fusionner les composants qui vivent hors de plugin/
    # Skills (source of truth: skills/ at root, merge with plugin/skills/)
    if [ -d "$src_root/skills" ]; then
        cp -r "$src_root/skills/"* "$INSTALL_DIR/skills/" 2>/dev/null || true
    fi

    # Rules
    if [ -d "$src_root/rules" ]; then
        mkdir -p "$INSTALL_DIR/rules"
        cp -r "$src_root/rules/"* "$INSTALL_DIR/rules/" 2>/dev/null || true
    fi

    # Templates
    if [ -d "$src_root/templates" ]; then
        mkdir -p "$INSTALL_DIR/templates"
        cp -r "$src_root/templates/"* "$INSTALL_DIR/templates/" 2>/dev/null || true
    fi

    # Agents (root-level agent definitions)
    if [ -d "$src_root/agents" ]; then
        mkdir -p "$INSTALL_DIR/agents"
        cp -r "$src_root/agents/"* "$INSTALL_DIR/agents/" 2>/dev/null || true
    fi

    # Hooks (root-level hooks)
    if [ -d "$src_root/hooks" ]; then
        mkdir -p "$INSTALL_DIR/hooks"
        cp -r "$src_root/hooks/"* "$INSTALL_DIR/hooks/" 2>/dev/null || true
    fi

    # Compter les fichiers installés
    local cmd_count
    cmd_count=$(find "$INSTALL_DIR/commands" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    echo -e "  ${GREEN}✓${NC} $cmd_count commandes"

    local skill_count
    skill_count=$(find "$INSTALL_DIR/skills" -name "SKILL.md" 2>/dev/null | wc -l | tr -d ' ')
    echo -e "  ${GREEN}✓${NC} $skill_count skills"

    if [ -d "$INSTALL_DIR/workflows" ]; then
        local wf_count
        wf_count=$(find "$INSTALL_DIR/workflows" -name "workflow.md" 2>/dev/null | wc -l | tr -d ' ')
        echo -e "  ${GREEN}✓${NC} $wf_count workflows"
    fi

    if [ -d "$INSTALL_DIR/agents" ]; then
        local agent_count
        agent_count=$(ls -1 "$INSTALL_DIR/agents/"*.md 2>/dev/null | wc -l | tr -d ' ')
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
            local count
            count=$(ls -1 "$INSTALL_DIR/commands/act/"*.md 2>/dev/null | wc -l | tr -d ' ')
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

        # Vérifier skills
        if [ -d "$INSTALL_DIR/skills" ]; then
            local skill_count
            skill_count=$(find "$INSTALL_DIR/skills" -name "SKILL.md" 2>/dev/null | wc -l | tr -d ' ')
            if [ "$skill_count" -gt 0 ]; then
                echo -e "  ${GREEN}✓${NC} Skills présentes ($skill_count)"
            else
                echo -e "  ${YELLOW}⚠${NC} Aucune skill trouvée"
            fi
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
    echo -e "${GREEN}│${NC}  ${BOLD}ACT Framework v${VERSION} installé avec succès !${NC}          ${GREEN}│${NC}"
    echo -e "${GREEN}╰─────────────────────────────────────────────────────────────╯${NC}"
    echo ""

    if [ "$INSTALL_MODE" = "local" ]; then
        echo "Composants installés :"
        echo -e "  ${BLUE}.claude/commands/act/${NC}       ← Commandes ACT"
        echo -e "  ${BLUE}.claude/commands/consider/${NC}  ← Thinking models"
        echo -e "  ${BLUE}.claude/skills/${NC}             ← 14 skills"
        echo -e "  ${BLUE}.claude/workflows/${NC}          ← BMAD workflows"
        echo -e "  ${BLUE}.claude/rules/${NC}              ← Iron Laws, Deviation Rules"
        echo -e "  ${BLUE}.claude/templates/${NC}          ← Project templates"
        echo -e "  ${BLUE}.claude/references/${NC}         ← Phase definitions"
        echo ""
        echo "Commandes disponibles :"
        echo -e "  ${YELLOW}/act:init${NC}       → Initialiser ACT dans ce projet"
        echo -e "  ${YELLOW}/act:start${NC}      → Démarrer une tâche (auto-détection niveau)"
        echo -e "  ${YELLOW}/act:status${NC}     → Voir l'état du projet"
        echo -e "  ${YELLOW}/act:resume${NC}     → Reprendre une session"
        echo -e "  ${YELLOW}/consider:*${NC}     → Modèles de pensée"
        echo ""
        echo -e "${BOLD}Redémarre Claude Code et tape /act:init pour commencer !${NC}"
    else
        echo "Plugin installé :"
        echo -e "  ${BLUE}~/.claude/plugins/act/${NC}"
        echo ""
        echo "Contenu :"
        echo -e "  ← Commandes, skills, workflows, agents, hooks, rules, templates"
        echo ""
        echo "Commandes disponibles globalement :"
        echo -e "  ${YELLOW}/act:init${NC}       → Initialiser un projet"
        echo -e "  ${YELLOW}/act:start${NC}      → Démarrer une tâche"
        echo -e "  ${YELLOW}/act:status${NC}     → État du projet"
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
