{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

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

