{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    polybar
    playerctl
    nerdfonts 
    material-design-icons # fonts with glyphs
  ];

  home.file.".config/polybar/config.ini".source = ./config.ini;
  home.file.".config/polybar/colors.ini".source = ./colors.ini; 
  home.file.".config/polybar/modules/mediaModules".source = ./modules/mediaModules;
  home.file.".config/polybar/modules/modules".source = ./modules/modules;
  home.file.".config/polybar/modules/monitoringModules".source = ./modules/monitoringModules;
  home.file.".config/polybar/modules/separatorsModules".source = ./modules/separatorsModules;
  home.file.".config/polybar/scripts/heatSensors".source = ./scripts/heatSensors;
  home.file.".config/polybar/scripts/network.sh".source = ./scripts/network.sh; 

}

