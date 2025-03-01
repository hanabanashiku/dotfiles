DOTIFLES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."

move_and_link() {
    local src_file="$DOTFILES_DIR/$1" local dest_file="$2"
    if [ -e "$dest_file" ]; then
        mv "$dest_file" "$dest_file.old"
    fi
    ln -sf "$src_file" "$dest_file"
}