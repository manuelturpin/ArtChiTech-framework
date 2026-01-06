#!/bin/bash
# Installation LOCALE du plugin ACT dans un projet cible

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_SOURCE="$(dirname "$SCRIPT_DIR")/plugin"

# Vérifier si un chemin cible est fourni
if [ -z "$1" ]; then
    echo "❌ Usage: ./install-local.sh /chemin/vers/projet"
    echo ""
    echo "Exemple:"
    echo "  ./install-local.sh ~/mes-projets/mon-app"
    echo ""
    echo "Cela installera le plugin ACT dans:"
    echo "  ~/mes-projets/mon-app/.claude/plugins/act/"
    exit 1
fi

TARGET_PROJECT="$1"
INSTALL_DIR="$TARGET_PROJECT/.claude/plugins/act"

# Vérifier que le projet cible existe
if [ ! -d "$TARGET_PROJECT" ]; then
    echo "❌ Le dossier cible n'existe pas: $TARGET_PROJECT"
    exit 1
fi

echo "🚀 Installation du plugin ACT dans: $TARGET_PROJECT"

# Créer le répertoire d'installation
mkdir -p "$INSTALL_DIR"

# Copier le plugin (inclure les fichiers cachés comme .claude-plugin)
cp -r "$PLUGIN_SOURCE/." "$INSTALL_DIR/"

echo "✅ Plugin ACT installé dans: $INSTALL_DIR"
echo ""
echo "Commandes disponibles (dans ce projet uniquement):"
echo "  /onboard  - Auditer le projet"
echo "  /projet   - Hub principal"
echo "  /status   - État du projet"
echo "  /resume   - Reprendre session"
echo "  /fix      - Corriger erreur"
echo "  /next     - Étape suivante"
echo "  /help     - Aide contextuelle"
echo ""
echo "Lance Claude Code dans $TARGET_PROJECT pour utiliser le plugin."
