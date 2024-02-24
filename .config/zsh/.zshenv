# fuzzy finder
export ZENO_ENABLE_SOCK=1
export ZENO_ENABLE_FZF_TMUX=1
export FZF_PREVIEW_ENABLE_TMUX=1

# コマンド履歴の管理
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000

# Additional environment settings
source "$HOME/.cargo/env"
export PATH=~/clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-20.04/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Additional environment settings
source "$HOME/.cargo/env"
export PATH=~/clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-20.04/bin:$PATH
source ~/powerlevel10k/powerlevel10k.zsh-theme

alias gswitch="/home/az/git-switch-user.sh"

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

