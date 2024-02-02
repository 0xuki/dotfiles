{ pkgs, ... }:
{
  imports = [
    ./development.nix
    ./direnv.nix
    ./git.nix
    ./neovim.nix
    ./starship.nix
    ./zsh.nix
    ./dconf.nix
    ./gtk/default.nix
    ./lazygit/default.nix
    ./music/default.nix
    ./neofetch/default.nix
    ./waybar/default.nix
    ./imgview
    ./firefox
    ./mako
    ./vscode
  ];
}

