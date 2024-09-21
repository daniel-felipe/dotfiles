#!/bin/sh


# ----------------------------------------------------
# Install Multimedia Packages
# ----------------------------------------------------
yay -S --noconfirm --needed ffmpeg hlsdl thunderbird \
  onlyoffice vlc calibre freetube discord stremio kasts \
  xiphos qbittorrent veracrypt flameshot localsend bitwarden 


# ----------------------------------------------------
# Install Spotdl & yt-dlp
# ----------------------------------------------------
pipx install spotdl yt-dlp


# ----------------------------------------------------
# Install Calf Studio Gear
# ----------------------------------------------------
git clone https://github.com/calf-studio-gear/calf.git 
cd calf
sudo ./autogen.sh
sudo make -j2
sudo make install
cd .. && rm -rf calf


# ----------------------------------------------------
# Install Zap Plugin Manager
# ----------------------------------------------------
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

