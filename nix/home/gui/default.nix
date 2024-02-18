{ pkgs, ... }:
{
  imports = [
    ./apps.nix
    ./browser.nix
    ./rofi/default.nix
  ];
}

