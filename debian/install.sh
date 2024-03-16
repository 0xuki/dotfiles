#!/bin/bash

sudo apt update

sudo apt install -y curl git build-essential

# Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
which nvim
nvim --version

# Vim
sudo apt install -y vim

# tmux
sudo apt install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# gcc
sudo apt install -y gcc

# Zsh
sudo apt install -y zsh

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Starship
curl -sS https://starship.rs/install.sh | sh

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

cargo install eza
sudo apt-get install zip unzip

# golang
curl -LO https://go.dev/dl/go1.22.1.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz

# Node.js
sudo apt install -y nodejs npm
sudo npm install n -g
sudo n stable
sudo apt purge -y nodejs npm
sudo apt autoremove -y
node -v
npm -v

# Denoのインストール
curl -fsSL https://deno.land/x/install/install.sh | sh

chsh -s $(which zsh)

echo "completed"

