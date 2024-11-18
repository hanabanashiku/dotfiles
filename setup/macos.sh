#!/bin/sh

DOTIFLES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."

if ! command -v brew &> /dev/null; then
    echo "Installing brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing packages"
brew update
brew install git nvm neovim
brew upgrade git nvm neovim
brew install --cask dotnet-sdk
brew install --cask iterm2
brew install --cask font-meslo-lg-nerd-font
brew install spotify-tui

echo "Linking configuration"

move_and_link() {
    local src_file="$1" local dest_file="$2"
    if [ -e "$dest_file" ]; then
        mv "$dest_file" "$dest_file.old"
    fi
    ln -sf "$src_file" "$dest_file"
}

move_and_link "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
move_and_link "$DOTFILES_DIR/.ideavimrc" "$HOME/.ideavimrc"
move_and_link "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
move_and_link "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
