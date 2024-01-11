{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    interactiveShellInit = ''
      export XDG_CONFIG_HOME="$HOME/dotfiles/nix"
    '';

    shellAliases = {
      cat = "bat";
      grep = "rg";
      ls = "eza --icons --classify";
      la = "eza --all --icons --classify";
      ll = "eza --long --all --git --icons";
      tree = "eza --icons --classify --tree";
    };
  };
}

