export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

 zstyle ':omz:update' mode auto      # update automatically without asking

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
	git
	npm
	sudo
	colored-man-pages
	dotnet
)

source $ZSH/oh-my-zsh.sh
eval "$(oh-my-posh init zsh)"

bindkey -v
setopt INC_APPEND_HISTORY
export HISTFILE=~/.zsh_history
export HISTSIZE=10000



