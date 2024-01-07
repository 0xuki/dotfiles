# dotfiles path
DOTFILES_DIR=~/dotfiles

# Name of backup directory
BACKUP_DIR=~/dotfiles_backup_$(date +%Y%m%d_%H%M%S)

# Paths for various configurations
ZSHRC_SOURCE="$DOTFILES_DIR/ubuntu/zsh/.zshrc"
ZSHRC_TARGET=~/.zshrc

VIFM_SOURCE="$DOTFILES_DIR/common/.config/.vifm"
VIFM_TARGET=~/.vifm

THEME_SOURCE="$DOTFILES_DIR/ubuntu/zsh/.p10k.zsh"
THEME_TARGET=~/.p10k.zsh

TMUX_CONF_SOURCE="$DOTFILES_DIR/ubuntu/.config/tmux/.tmux.conf"
TMUX_CONF_TARGET=~/.tmux.conf

NVIM_SOURCE="$DOTFILES_DIR/common/.config/nvim"
NVIM_TARGET="$HOME/.config/nvim"

# backup function
backup_config() {
    local config_path=$1
    local config_backup="${BACKUP_DIR}${config_path}"
    if [ -e "$config_path" ]; then
        echo "Create backup: $config_backup"
        mkdir -p "$(dirname "$config_backup")" && mv "$config_path" "$config_backup"
    fi
}

# TPM Installation
install_tpm() {
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        echo "Installing Tmux Plugin Manager..."
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    else
        echo "Tmux Plugin Manager already installed."
    fi
}

# main
main() {
    mkdir -p "$BACKUP_DIR"

    # Backup and create symbolic link for .zshrc
    backup_config "$ZSHRC_TARGET"
    echo "Create symbolic link: $ZSHRC_SOURCE -> $ZSHRC_TARGET"
    ln -s "$ZSHRC_SOURCE" "$ZSHRC_TARGET"

    # Backup and create symbolic link for .vifm
    backup_config "$VIFM_TARGET"
    echo "Create symbolic link: $VIFM_SOURCE -> $VIFM_TARGET"
    ln -s "$VIFM_SOURCE" "$VIFM_TARGET"
    
    # Backup and create symbolic link for .p10k.zsh
    backup_config "$THEME_TARGET"
    echo "Create symbolic link: $THEME_SOURCE -> $THEME_TARGET"
    ln -s "$THEME_SOURCE" "$THEME_TARGET"

    # Backup and create symbolic link for .tmux.conf
    backup_config "$TMUX_CONF_TARGET"
    echo "Creating symbolic link for .tmux.conf"
    ln -s "$TMUX_CONF_SOURCE" "$TMUX_CONF_TARGET"

    # Backup and create symbolic link for Neovim
    backup_config "$NVIM_TARGET"
    echo "Create symbolic link: $NVIM_SOURCE -> $NVIM_TARGET"
    ln -s "$NVIM_SOURCE" "$NVIM_TARGET"

    # Install TPM
    install_tpm

    echo "Setup of the configuration file is complete. Please start tmux and press 'prefix + I' to install plugins."
}

# boot
main
