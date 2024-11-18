export ZSH="$HOME/.oh-my-zsh"

# Check if oh-my-zsh is installed, if not, clone it
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Cloning Oh My Zsh..."
  KEEP_ZSHRC=yes /usr/bin/env sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
fi

ZSH_THEME="catppuccin"
CATPPUCCIN_FLAVOR="macchiato"

 zstyle ':omz:update' mode auto      # update automatically without asking

COMPLETION_WAITING_DOTS="true"

plugins=(
	git
	git-prompt
	vi-mode
	dotnet
	docker
	npm
	bgnotify
	sudo
	colored-man-pages
	wd
	zsh-autosuggestions
 	fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

VI_MODE_SET_CURSOR=true

bindkey -v
setopt INC_APPEND_HISTORY
export HISTFILE=~/.zsh_history
export HISTSIZE=10000



