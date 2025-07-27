#!/usr/bin/env bash

set -euo pipefail

# ─── Détection des chemins ───────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.local/bin"
CONFIG_DIR="$HOME/.config/projectfetch"
ASCII_DIR="$CONFIG_DIR/ascii"
SRC_BIN="$SCRIPT_DIR/bin/projectfetch"

# ─── Création des dossiers ───────────────────────────────────────────────
echo "📁 Création des dossiers..."
mkdir -p "$BIN_DIR"
mkdir -p "$ASCII_DIR"

# ─── Copie du binaire ────────────────────────────────────────────────────
echo "📄 Copie du script dans $BIN_DIR"
cp "$SRC_BIN" "$BIN_DIR/projectfetch"
chmod +x "$BIN_DIR/projectfetch"

# ─── Copie des fichiers ASCII ────────────────────────────────────────────
echo "🎨 Copie des fichiers ASCII dans $ASCII_DIR"
cp "$SCRIPT_DIR/ascii/"*.txt "$ASCII_DIR/"

# ─── Fin ───────────────────────────────────────────────────────────
echo -e "\n✅ Installation terminée !\n"
echo "🔁 Ajoute ceci à la fin de ton ~/.zshrc ou ~/.bashrc :"
cat <<'EOF'

autoload -U add-zsh-hook
project_cd() { builtin cd "$@" && projectfetch; }
add-zsh-hook chpwd project_cd
project_cd "$PWD"
EOF

echo -e "\n🚀 Installation terminée ! Ouvre un nouveau terminal ou exécute :"
echo "   source $SHELL_RC"
