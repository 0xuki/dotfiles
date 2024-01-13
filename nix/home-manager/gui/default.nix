{ pkgs, ... }:
{
  imports = [
    ./apps.nix
    ./browser.nix
    ./wezterm.nix
    ./alacritty.nix
    ./tmux.nix
    ./rofi/default.nix
  ];
}

