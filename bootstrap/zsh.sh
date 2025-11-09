SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/util.sh"

if ! command -v omz > /dev/null 2>&1; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    move_and_link ".oh-my-zsh/custom/plugins/jira-git-commit"  "$HOME/.oh-my-zsh/custom/plugins/jira-git-commit"

    # install theme
    git clone https://github.com/JannoTjarks/catppuccin-zsh.git
    mkdir -p "$HOME/.oh-my-zsh/themes/catppuccin-flavors"
    mv catppuccin-zsh/catppuccin.zsh-theme "$HOME/.oh-my-zsh/themes/"
    mv catppuccin-zsh/catppuccin-flavors/* "$HOME/.oh-my-zsh/themes/catppuccin-flavors"
fi