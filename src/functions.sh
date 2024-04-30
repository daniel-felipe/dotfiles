handle_existing_file() {
    FILE_PATH=$1

    if [ -L $FILE_PATH ]; then
	    rm -rf $FILE_PATH
    fi
}

install_packages () {
    sudo apt-get install \
        python3 wget git ripgrep \
        neovim exa 
}

install_docker () {
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do 
        sudo apt-get remove $pkg; 
    done

    # Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    # Install docker:
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Handle permission
    sudo groupadd docker
    sudo usermod -aG docker $USER
}

install_astronvim () {
    # Rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    rustup update

    # Tree-sitter CLI
    cargo install tree-sitter-cli

    # Nerdfonts
    curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
    getnf -i FireCode,Hack,JetBrainsMono

    # Lazygit
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    
    # Bottom
    curl -LO https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb
    sudo dpkg -i bottom_0.9.6_amd64.deb

    mv ~/.config/nvim ~/.config/nvim.bak
    mv ~/.local/share/nvim ~/.local/share/nvim.bak
    mv ~/.local/state/nvim ~/.local/state/nvim.bak
    mv ~/.cache/nvim ~/.cache/nvim.bak

    git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
    rm -rf ~/.config/nvim/.git
}

install_php () {
    sudo dpkg -l | grep php | tee packages.txt

    sudo add-apt-repository ppa:ondrej/php
    sudo apt update

    sudo apt install php8.3 php8.3-{cli,bz2,curl,mbstring,intl,fpm}

    # Composer
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
    sudo mv composer.phar /usr/local/bin/composer

    # Laravel installer
    composer global require laravel/installer
}

install_warpterminal () {
    wget https://app.warp.dev/download?package=deb
    sudo apt install ./warp-terminal_*_amd64.deb
}

install_tmux () {
    sudo apt install tmux
    handle_existing_file "$HOME/.tmux.conf"
    ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf
}

install_zapzsh () {
    zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
}
