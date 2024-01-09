bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

source ~/.zshrc

zinit self-update

zinit snippet https://gist.githubusercontent.com/hightemp/5071909/raw/

zinit light zsh-users/zsh-syntax-highlighting

zinit light zsh-users/zsh-autosuggestions

zinit light zsh-users/zsh-completions

zinit light zdharma/history-search-multi-word
