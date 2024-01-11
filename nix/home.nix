{ pkgs, ... }:
let
  username = "az";
  homeDirectory = "/home/${username}";
  stateVersion = "22.11";
in
{
  imports = [
    ./zsh.nix
    ./starship.nix
    ./neovim.nix
    ./direnv.nix
    ./development.nix
    ./wezterm.nix
    ./browser.nix
    ./apps.nix
  ];

  # home-manager を有効にする
  programs.home-manager.enable = true;

  # ユーザー固有の設定
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

