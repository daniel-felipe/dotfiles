#!bin/sh


# ----------------------------------------------------
# Functions
# ----------------------------------------------------
function backup() {
    filepath="$1"

    if [ ! -e "$filepath" ]; then
        return
    fi

    if [ ! -d "$filepath" ]; then
        mv "$filepath" "$filepath.bak"
        return
    fi

    for file in "$filepath"*; do
        mv "$file" "$file.bak"
    done
}


# ----------------------------------------------------
# Zsh
# ----------------------------------------------------
info "Copying zsh config files"
backup "$HOME/.zshrc"
backup "$HOME/.zprofile"
backup "$HOME/.functions.zsh"
cp -R "$DOTFILES/zsh/{.functions,.zprofile,.zshrc} "$HOME/"


# ----------------------------------------------------
# Kitty
# ----------------------------------------------------
info "Copying kitty config files"
backup "$HOME/.config/kitty/"
cp -R "$DOTFILES/config/kitty/" "$HOME/.config"
