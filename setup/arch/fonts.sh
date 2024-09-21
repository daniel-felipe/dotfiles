#!/bin/sh


info "Installing Nerd Fonts"

# ----------------------------------------------------
# Install Nerd Fonts
# ----------------------------------------------------
yay -S --noconfirm --needed getnf 
getnf -i "MartianMono,JetBrainsMono,FireCode,DroidSansMono"

