# Git User Information Display Function
show_git_user() {
    local git_user_name="$(git config --global user.name)"
    local git_user_email="$(git config --global user.email)"
    if [ -n "$git_user_name" ] && [ -n "$git_user_email" ]; then
        echo "Current Git User: $git_user_name ($git_user_email)"
    fi
}

# Call the Git User Display Function
show_git_user

# Start tmux Automatically if Available
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach -t default || tmux new -s default
fi

# Enable Powerlevel10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Exit if not Running Interactively
[[ $- != *i* ]] && return

# Enable AutoCD
setopt autocd

# Make less More Friendly for Non-Text Input Files
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# Set Variable Identifying the Chroot You Work In
if [[ -z "${debian_chroot:-}" ]] && [[ -r /etc/debian_chroot ]]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a Fancy Prompt
if [[ "$TERM" == "xterm-color" ]] || [[ "$TERM" == *-256color ]]; then
    PS1='%F{green}%n@%m%f:%F{blue}%~%f$ '
else
    PS1='%n@%m:%~$ '
fi

# Zinit Initialization
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# Source Zinit
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Zinit Plugins
# Syntax Highlighting, Autocompletions, History Search, Fuzzy Finder, etc.
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma/history-search-multi-word
zinit ice lucid from"gh-r" as"program" mv"fzf -> ${ZPFX}/bin/fzf"
zinit light junegunn/fzf
zinit light Aloxaf/fzf-tab
zinit ice lucid as"program"
zinit snippet 'https://github.com/junegunn/fzf/blob/master/bin/fzf-tmux'
zinit light yukiycino-dotfiles/zsh-show-buffer-stack
zinit ice lucid depth"1" blockf
zinit light yuki-yano/zeno.zsh

# Zeno Settings
if [[ -n $ZENO_LOADED ]]; then
  bindkey ' '  zeno-auto-snippet
  bindkey '^m' zeno-auto-snippet-and-accept-line
  bindkey '^i' zeno-completion
  bindkey '^g' zeno-ghq-cd
  bindkey '^r' zeno-history-selection
  bindkey '^x' zeno-insert-snippet
fi

# Color Support and Aliases for ls, grep, etc.
if [[ -x /usr/bin/dircolors ]]; then
    [[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Additional ls Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alert Alias for Long Running Commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Source Additional Aliases if Exists
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

# Custom Aliases for Git, Docker, Vim, etc.
alias g="git"
alias gi="git init"
alias gadd="git add"
alias gc="git commit -m"
alias gpl="git pull"
alias gps="git push"
alias gf="git fetch"
alias d="docker"
alias ssdstart="sudo service docker start"
alias dcmrun="docker compose run --rm"
alias vi="vim"
alias nvi="nvim"
alias gswitch="/home/az/git-switch-user.sh"

# Powerlevel10k Theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Run p10k Configure or Edit ~/.p10k.zsh for Prompt Customization
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

