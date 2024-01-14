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
  home.file.".config/polybar/system".source = ./system;
  home.file.".config/polybar/modules/heatSensors".source = ./modules/heatSensors;
  home.file.".config/polybar/modules/mediaModules".source = ./modules/mediaModules;
  home.file.".config/polybar/modules/modules".source = ./modules/modules;
  home.file.".config/polybar/modules/monitoringModules".source = ./modules/monitoringModules;
  home.file.".config/polybar/modules/separatorsModules".source = ./modules/separatorsModules;
  home.file.".config/polybar/scripts/cava".source = ./scripts/cava;
  home.file.".config/polybar/scripts/pipewire-microphone.sh".source = ./scripts/pipewire-microphone.sh; 

}

