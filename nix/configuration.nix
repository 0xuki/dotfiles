{ config, pkgs, ... }:
{
  imports = [
    ./modules/boot.nix
    ./modules/fonts.nix
    ./modules/hardware.nix
    ./modules/network.nix
    ./modules/services.nix
    ./modules/system.nix
    ./modules/time.nix
    ./modules/users.nix
    ./modules/virtualisation.nix
    ./modules/xremap.nix
    ./modules/desktop
  ];
}

