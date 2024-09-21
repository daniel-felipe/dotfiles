#!/bin/bash


# ----------------------------------------------------
# Install System Packages
# ----------------------------------------------------
yay -S --noconfirm --needed curl fzf unzip tmux zsh \
  streamlink protonvpn-cli-community clamav btop \
  appimagelauncher metadata-cleaner tor torbrowser-launcher \
  easyeffects syncthing


# ----------------------------------------------------
# Setup Syncthing
# ----------------------------------------------------
systemctl --user enable syncthing.service


# ----------------------------------------------------
# Install Virtualbox
# ----------------------------------------------------
sudo pacman -Syu --needed --noconfirm virtualbox linux-virtualbox-host-module 
sudo vboxreload
sudo pamac build virtualbox-ext-oracle


# ----------------------------------------------------
# Install Docker
# ----------------------------------------------------
yay -S --noconfirm --needed docker docker-compose
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker "$USER"
newgrp docker


# ----------------------------------------------------
# Install NextDNS
# ----------------------------------------------------
sh -c "$(curl -sL https://nextdns.io/install)"


# ----------------------------------------------------
# Zap Plugin Manager
# ----------------------------------------------------
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

