{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    polybar
    nerdfonts 
    material-design-icons # fonts with glyphs
  ];

  home.file.".config/polybar/config.ini".source = ./config.ini;
  home.file.".config/polybar/colors.ini".source = ./colors.ini;
  home.file.".config/polybar/modules.ini".source = ./modules.ini;
  home.file.".config/polybar/scripts/diskusage".source = ./scripts/diskusage;
  home.file.".config/polybar/scripts/memory".source = ./scripts/memory;
  home.file.".config/polybar/scripts/network".source = ./scripts/network;
  home.file.".config/polybar/scripts/sblt".source = ./scripts/sblt;

}

