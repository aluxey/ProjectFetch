#!/usr/bin/env bash

echo "📦 Installing projectfetch..."

# Create bin directory if needed
mkdir -p "$HOME/.local/bin"
cp ./bin/projectfetch "$HOME/.local/bin/projectfetch"

# Check if already added to shell config
if ! grep -q 'projectfetch' ~/.bashrc && ! grep -q 'projectfetch' ~/.zshrc; then
  echo -e '\n# projectfetch' >> ~/.bashrc
  echo 'function chpwd() { command projectfetch; }' >> ~/.bashrc

  echo -e '\n# projectfetch' >> ~/.zshrc
  echo 'function chpwd() { command projectfetch; }' >> ~/.zshrc
fi

echo "✅ Done. Restart your terminal or run 'source ~/.bashrc' / 'source ~/.zshrc'"
echo "📂 Try it by navigating into a project folder!"
