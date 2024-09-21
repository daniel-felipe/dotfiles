#!/bin/sh


# ----------------------------------------------------
# Update Dependencies
# ----------------------------------------------------
sudo pacman -Syyu --noconfirm


# ----------------------------------------------------
# Install yay
# ----------------------------------------------------
sudo pacman -S --noconfirm yay 


source "$DOTFILES/setup/arch/dev.sh"
source "$DOTFILES/setup/arch/media.sh"
source "$DOTFILES/setup/arch/fonts.sh"
source "$DOTFILES/setup/arch/sys.sh"


# ----------------------------------------------------
# Remove Unused Packages
# ----------------------------------------------------
yay -Rsn $(yay -Qdtq)

