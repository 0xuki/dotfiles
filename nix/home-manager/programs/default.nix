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
  ];
}

