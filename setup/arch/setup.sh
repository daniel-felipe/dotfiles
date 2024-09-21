#!/bin/sh


# ----------------------------------------------------
# Update Dependencies
# ----------------------------------------------------
sudo pacman -Syyu --noconfirm


# ----------------------------------------------------
# Install yay
# ----------------------------------------------------
sudo pacman -S --noconfirm yay 


source "$DOTFILES/setup/dev.sh"
source "$DOTFILES/setup/media.sh"
source "$DOTFILES/setup/fonts.sh"
source "$DOTFILES/setup/sys.sh"


# ----------------------------------------------------
# Remove Unused Packages
# ----------------------------------------------------
yay -Rsn $(yay -Qdtq)

