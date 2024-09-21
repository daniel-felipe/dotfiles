#!/bin/sh


info "Installing developer packages"

# ----------------------------------------------------
# Install Development Packages
# ----------------------------------------------------
yay -S --noconfirm --needed base-devel git lazygit neovim \
  python python-pip python-setuptools python-pipx vscodium-bin \
  lazydocker php php-sqlite composer tableplus


# ----------------------------------------------------
# Install Astronvim
# ----------------------------------------------------
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

