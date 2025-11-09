#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/util.sh"

info() { echo -e "\e[1;32m[debian] $*\e[0m"; }

apt_install() {
    local pkg=$1
    if dpkg -s "$pkg" > /dev/null 2>&1; then
        info "Package '$pkg' already installed"
    else
        info "Installing '$pkg'"
        sudo apt-get update -qq
        sudo DEBIAN_FRONTEND=noninteractive apt-get install -y "$pkg"
    fi
}

snap_install() {
    local pkg=$1
    if ! command -v snap >/dev/null 2>&1; then
        apt_install snapd
    fi
    snap install --classic $pkg
}

apt_install zsh
if [[ "$SHELL" != *zsh ]]; then
    info "Changing default shell to zsh for user $USER"
    chsh -s "$(command -v zsh)"
fi

# setup oh-my-zsh
source "$SCRIPT_DIR/zsh.sh"

apt_install git
apt_install tmux
snap_install nvim

info "Install nvim requirements"
apt_install make
apt_install gcc
apt_install gh
apt_install lua5.1
apt_install luarocks
apt_install nvm
apt_install python3
apt_install python3-pip


mkdir -p "$HOME/.config"
info "Copying .zshrc"
move_and_link ".zshrc" "$HOME/.zshrc"
info Copying "Copying nvim config"
move_and_link "nvim" "$HOME/.config/nvim"
info "Copying tmux config"
move_and_link ".tmux.conf" "$HOME/.tmux.conf"