
{ config, pkgs, ... }:
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
    };
    config = ./config.ini;
    extraConfig = ''
      [include-file]
      path = ~/.config/polybar/bars.ini
    '';
  };
}
