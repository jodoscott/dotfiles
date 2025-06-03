#!/bin/bash
echo "Installing dotfiles..."

# Copy shell configuration files
cp .zshrc ~/.zshrc 2>/dev/null || true
cp .bashrc ~/.bashrc 2>/dev/null || true
cp .gitconfig ~/.gitconfig 2>/dev/null || true

# Install oh-my-zsh if it doesn't exist
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Copy VS Code settings
mkdir -p ~/.vscode-server/data/Machine
cp vscode/settings.json ~/.vscode-server/data/Machine/settings.json 2>/dev/null || true

# Also copy for local VS Code if the directory exists
mkdir -p ~/.config/Code/User
cp vscode/settings.json ~/.config/Code/User/settings.json 2>/dev/null || true

echo "Dotfiles installation complete!"