{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.layout = "jp";
  services.xserver.xkbVariant = "";
  console.keyMap = "jp106";
}

