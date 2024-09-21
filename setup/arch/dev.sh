#!/bin/sh


# ----------------------------------------------------
# Install Development Packages
# ----------------------------------------------------
yay --noconfirm --needed base-devel git lazygit neovim \
  python python-setuptools pipx vscodium tableplus \
  lazydocker php php-sqlite composer


# ----------------------------------------------------
# Install Astronvim
# ----------------------------------------------------
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

