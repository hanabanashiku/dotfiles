#!/bin/sh

source util.sh

chsh -s /bin/zsh

# setup oh-my-zsh
source zsh.sh

echo "Installing packages"
brew update
brew install git neovim tmux
brew install --cask ghostty
brew install --cask font-meslo-lg-nerd-font

# window management
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

echo "Linking configuration"
move_and_link "ghostty/config" "$HOME/Library/Application\ Support/com.mitchellh.ghostty/config"
move_and_link ".zshrc" "$HOME/.zshrc"
move_and_link ".ideavimrc" "$HOME/.ideavimrc"
move_and_link "nvim" "$HOME/.config/nvim"
move_and_link ".tmux.conf" "$HOME/.tmux.conf"
