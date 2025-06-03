#!/bin/bash
echo "Installing dotfiles..."

# Copy configuration files
cp .zshrc ~/.zshrc 2>/dev/null || true
cp .bashrc ~/.bashrc 2>/dev/null || true
cp .gitconfig ~/.gitconfig 2>/dev/null || true

# Install oh-my-zsh if it doesn't exist
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Change default shell to zsh
if [ "$SHELL" != "/bin/zsh" ] && [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "Changing default shell to zsh..."
    sudo chsh -s $(which zsh) $(whoami)
fi

echo "Dotfiles installation complete! Please restart your terminal or container."