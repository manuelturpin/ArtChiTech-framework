#!/bin/bash
# ACT Framework - Installation Script

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PLUGIN_DIR="$HOME/.claude/plugins"
ACT_DIR="$PLUGIN_DIR/act"

echo "=============================================="
echo "  ACT Framework - Installation"
echo "=============================================="
echo ""

# Verifier Python
if ! command -v python3 &> /dev/null; then
    echo "X Python 3 requis mais non trouve"
    echo "   Installez Python 3.8+ et reessayez"
    exit 1
fi

PYTHON_VERSION=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
echo "  Python $PYTHON_VERSION detecte"

# Verifier Git
if ! command -v git &> /dev/null; then
    echo "X Git requis mais non trouve"
    exit 1
fi
echo "  Git detecte"

# Creer dossier plugins si necessaire
mkdir -p "$PLUGIN_DIR"

# Supprimer ancien lien si existe
if [ -L "$ACT_DIR" ]; then
    rm "$ACT_DIR"
    echo "  Ancien lien supprime"
elif [ -d "$ACT_DIR" ]; then
    echo ""
    echo "! Dossier $ACT_DIR existe deja"
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
echo "  Plugin installe dans $ACT_DIR"

# Verifier superpowers
echo ""
echo "Verification des dependances..."
if [ -d "$PLUGIN_DIR/superpowers" ] || [ -d "$HOME/.claude/plugins/cache/superpowers-marketplace" ]; then
    echo "  Plugin superpowers detecte"
else
    echo ""
    echo "! Plugin superpowers non detecte"
    echo "   Installez-le avec:"
    echo "   claude plugins:install superpowers-marketplace/superpowers"
fi

echo ""
echo "=============================================="
echo "  ACT Framework installe !"
echo "=============================================="
echo ""
echo "  Redemarrez Claude Code"
echo "  Tapez /projet pour commencer"
echo ""
