#!/bin/sh

source util.sh

if command -v microdnf > /dev/null 2>&1; then
    dnf="microdnf"
else
    dnf="dnf"
fi

if ! command -v zsh > /dev/null 2>&1 then
    echo "Installing zsh"
    $dnf install -y zsh 
fi
chsh -s /bin/zsh

# setup oh-my-zsh
source zsh.sh

$dnf install -y git neovim tmux

move_and_link ".zshrc" "$HOME/.zshrc"
move_and_link "nvim" "$HOME/.config/nvim"
move_and_link ".tmux.conf" "$HOME/.tmux.conf"