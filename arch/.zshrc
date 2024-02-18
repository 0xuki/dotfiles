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



zinit light catppuccin/zsh-syntax-highlighting
zinit light wfxr/forgit
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light hlissner/zsh-autopair 
zinit light Aloxaf/fzf-tab 

# Autosuggest
ZSH_AUTOSUGGEST_USE_ASYNC="true" 

# Group matches and describe.
zstyle ':completion:*' sort false
zstyle ':completion:complete:*:options' sort false
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
 zstyle ':completion:*' special-dirs true
 zstyle ':completion:*' rehash true

 zstyle ':completion:*' menu yes select # search
 zstyle ':completion:*' list-grouped false
 zstyle ':completion:*' list-separator '''
 zstyle ':completion:*' group-name '''
 zstyle ':completion:*' verbose yes
 zstyle ':completion:*:matches' group 'yes'
 zstyle ':completion:*:warnings' format '%F{red}%B-- No match for: %d --%b%f'
 zstyle ':completion:*:messages' format '%d'
 zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
 zstyle ':completion:*:descriptions' format '[%d]'

 # Fuzzy match mistyped completions.
 zstyle ':completion:*' completer _complete _match _approximate
 zstyle ':completion:*:match:*' original only
 zstyle ':completion:*:approximate:*' max-errors 1 numeric

 # Don't complete unavailable commands.
 zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

 # Array completion element sorting.
 zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

 # fzf-tab
 zstyle ':fzf-tab:complete:_zlua:*' query-string input
 zstyle ':fzf-tab:complete:kill:argument-rest' fzf-preview 'ps --pid=$word -o cmd --no-headers -w -w'
 zstyle ':fzf-tab:complete:kill:argument-rest' fzf-flags '--preview-window=down:3:wrap'
 zstyle ':fzf-tab:complete:kill:*' popup-pad 0 3
 zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
 zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
 zstyle ':fzf-tab:*' switch-group ',' '.'
 zstyle ":completion:*:git-checkout:*" sort false
 zstyle ':completion:*' file-sort modification
 zstyle ':completion:*:exa' sort false
 zstyle ':completion:files' sort false




cdg() {
    local selected_dir=$(find . -mindepth 1 -maxdepth 1 -type d | fzf --preview 'git -C {} remote get-url origin 2> /dev/null || echo "Not a Git repository"')

    # 選択されたディレクトリが空でないか確認
    if [[ -z "$selected_dir" ]]; then
      echo "No directory selected."
      return
    fi

    # 現在のディレクトリが Git リポジトリかどうかを確認
    local is_current_dir_git_repo=$(git rev-parse --is-inside-work-tree 2> /dev/null)

    # 選択されたディレクトリに移動
    cd "$selected_dir" || return

    # 移動後のディレクトリが Git リポジトリかどうかを確認
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        # 移動前のディレクトリが Git リポジトリでなかった場合のみ、Git 操作を行う
        if [[ -z "$is_current_dir_git_repo" ]]; then
            echo "This is a Git repository. Fetching updates..."
            git fetch

            local current_branch=$(git rev-parse --abbrev-ref HEAD)
            if ! git diff --quiet "$current_branch" "origin/$current_branch"; then
                echo "There are changes available from the remote branch."
                read -p "Do you want to pull the changes? (Yes/No) " answer
                if [[ "$answer" =~ ^[Yy]es$ ]]; then
                    git pull
                fi
            else
                echo "Your branch is up to date with the remote branch."
            fi
        fi
    else
        echo "Moved to $selected_dir (Not a Git repository)"
    fi
}


