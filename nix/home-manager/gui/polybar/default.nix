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

}

