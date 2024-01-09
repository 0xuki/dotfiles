# Update package lists
sudo apt update

# Install necessary packages
sudo apt install -y docker-compose python3.11 python3-pip neovim

# sudo apt install xsel
sudo apt install xsel

# Add PPA for the latest version of Neovim
sudo add-apt-repository ppa:neovim-ppa/unstable -y

# Execute Node.js setup script
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -

# Update package lists again and upgrade
sudo apt update
sudo apt upgrade -y

# Install Node.js
sudo apt install -y nodejs

# Install Rust and rust-analyzer
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup component add rust-analyzer

# Install Zsh
sudo apt install -y zsh

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# install lsd
sudo apt install lsd

# install nasm
sudo apt-get install nasm build-essential

# install powerline fonts
sudo apt-get install fonts-powerline

echo "All installations are complete."
