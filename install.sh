#!/usr/bin/env bash

set -euo pipefail

# ─── Détection des chemins ─────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.local/bin"
CONFIG_DIR="$HOME/.config/projectfetch"
ASCII_DIR="$CONFIG_DIR/ascii"
SRC_BIN="$SCRIPT_DIR/bin/projectfetch"

# ─── Détection du fichier RC (bash ou zsh) ────────────────────────────
shell_name=$(basename "$SHELL")
if [[ "$shell_name" == "zsh" ]]; then
  SHELL_RC="${ZDOTDIR:-$HOME}/.zshrc"
elif [[ "$shell_name" == "bash" ]]; then
  SHELL_RC="${HOME}/.bashrc"
else
  echo "⚠️  Shell $shell_name non pris en charge pour l’autoload automatique."
  SHELL_RC=""
fi

# ─── Création des dossiers ─────────────────────────────────────────────
echo "📁 Création des dossiers..."
mkdir -p "$BIN_DIR"
mkdir -p "$ASCII_DIR"

# ─── Copie du binaire ───────────────────────────────────────────────────
echo "📄 Copie du script dans $BIN_DIR"
cp "$SRC_BIN" "$BIN_DIR/projectfetch"
chmod +x "$BIN_DIR/projectfetch"

# ─── Copie des fichiers ASCII ───────────────────────────────────────────
echo "🎨 Copie des fichiers ASCII dans $ASCII_DIR"
cp "$SCRIPT_DIR/ascii/"*.txt "$ASCII_DIR/"

# ─── Instructions d’intégration ────────────────────────────────────────
echo -e "\n✅ Installation terminée !\n"

if [[ -n "$SHELL_RC" ]]; then
  echo "🔁 Pour lancer ProjectFetch automatiquement à chaque `cd`, ajoute à la fin de :"
  echo "   $SHELL_RC"
  cat <<'EOF'

# ProjectFetch configuration
projectfetch_hook() {
  # Ne s'exécute qu'en mode interactif et pas si déjà dans un prompt
  [[ -o interactive ]] || return
  [[ -z "$PROJECTFETCH_ACTIVE" ]] || return
  export PROJECTFETCH_ACTIVE=1
  projectfetch
  unset PROJECTFETCH_ACTIVE
}
autoload -U add-zsh-hook
add-zsh-hook chpwd projectfetch_hook
EOF
  echo -e "\n💡 Ensuite, recharge ton RC :\n   source $SHELL_RC"
else
  echo "ℹ️  Aucune configuration automatique disponible pour ton shell."
  echo "   Tu peux lancer manuellement : projectfetch"
fi

echo -e "\n🚀 Fini !\n"
