{ pkgs, ... }:
{
  imports = [
    ./apps.nix
    ./browser.nix
    ./wezterm.nix
    ./xdg.nix
  ];
}

