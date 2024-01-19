{ config, pkgs, lib, ...}: 
let
  themepkg = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "zsh-syntax-highlighting";
    rev = "06d519c20798f0ebe275fc3a8101841faaeee8ea";
    sha256 = "sha256-Q7KmwUd9fblprL55W0Sf4g7lRcemnhjh4/v+TacJSfo=";
  };
in
{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
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

    '';
    shellAliases = {
      cat = "bat";
      grep = "rg";
      g = "git";
      gs = "git status";
      ls = "eza --icons --classify";
      la = "eza --all --icons --classify";
      ll = "eza --long --all --git --icons";
      tree = "eza --icons --classify --tree";
    };
    oh-my-zsh = {
      enable = true;
      theme = "bira";
      plugins = [
        "git"
        "colorize"
        "colored-man-pages"
        "command-not-found"
        "history-substring-search"
      ];
    };
    plugins = with pkgs; [
      {
        name = "forgit"; # i forgit :skull:
        file = "forgit.plugin.zsh";
        src = fetchFromGitHub {
          owner = "wfxr";
          repo = "forgit";
          rev = "99cda3248c205ba3c4638c4e461afce01a2f8acb";
          sha256 = "0jd0nl0nf7a5l5p36xnvcsj7bqgk0al2h7rdzr0m1ldbd47mxdfa";
        };
      }
      {
        name = "fast-syntax-highlighting";
        file = "fast-syntax-highlighting.plugin.zsh";
        src = fetchFromGitHub {
          owner = "zdharma-continuum";
          repo = "fast-syntax-highlighting";
          rev = "13d7b4e63468307b6dcb2dadf6150818f242cbff";
          sha256 = "0ghzqg1xfvqh9z23aga7aafrpxbp9bpy1r8vk4avi6b80p3iwsq2";
        };
      }
      {
        name = "zsh-autopair";
        file = "zsh-autopair.plugin.zsh";
        src = fetchFromGitHub {
          owner = "hlissner";
          repo = "zsh-autopair";
          rev = "396c38a7468458ba29011f2ad4112e4fd35f78e6";
          sha256 = "0q9wg8jlhlz2xn08rdml6fljglqd1a2gbdp063c8b8ay24zz2w9x";
        };
      }
      {
        name = "fzf-tab";
        file = "fzf-tab.plugin.zsh";
        src = fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "5a81e13792a1eed4a03d2083771ee6e5b616b9ab";
          sha256 = "0lfl4r44ci0wflfzlzzxncrb3frnwzghll8p365ypfl0n04bkxvl";
        };
      }
      {
        name = "ctp-zsh-syntax-highlighting";
        src = themepkg;
        file = themepkg + "/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh";
      }
    ];
  };
}

