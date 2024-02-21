{ config, pkgs, ... }: 
{
  services = {
    mako = {
      enable = true;
      font = "JetBrainsMono Nerd Font 12";
      padding = "15";
      defaultTimeout = 5000;
      borderSize = 2;
      borderRadius = 5;
      backgroundColor = "#eff1f580";
      borderColor = "#FFCBD0";
      progressColor = "over #313244";
      textColor = "#7c7f93";
      icons = true;
      actions = true;
      extraConfig = ''
        text-alignment=center
        [urgency=high]
        border-color=#fab387
      '';
    };
  };
}
