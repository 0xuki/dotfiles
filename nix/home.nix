{ pkgs, ... }:
let
  username = "az";
  homeDirectory = "/home/${username}";
  stateVersion = "22.11";
in
{
  imports = [
    ./cli/default.nix
    ./gui/default.nix
    ./desktop/default.nix
  ];

  programs.home-manager.enable = true;

  home.username = username;
  home.homeDirectory = homeDirectory;
  home.stateVersion = stateVersion;

  home.packages = with pkgs; [
    bat
    bottom
    eza
    httpie
    pingu
    ripgrep
    xclip
  ];
}

