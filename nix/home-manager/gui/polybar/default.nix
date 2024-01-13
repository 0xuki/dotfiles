{ config, lib, pkgs, specialArgs, ... }:

let
  openCalendar = "${pkgs.xfce.orage}/bin/orage";

  hdmiBar = pkgs.callPackage ./bar.nix { };

  laptopBar = pkgs.callPackage ./bar.nix {
    font0 = 10;
    font1 = 12;
    font2 = 24;
    font3 = 18;
    font4 = 5;
    font5 = 10;
  };

  mainBar = if specialArgs.hidpi then hdmiBar else laptopBar;

  openGithub = "${lib.getExe pkgs.firefox-beta-bin} -new-tab https\\://github.com/notifications";

  mypolybar = pkgs.polybar.override {
    alsaSupport   = true;
    githubSupport = true;
    mpdSupport    = true;
    pulseSupport  = true;
  };

  # theme adapted from: https://github.com/adi1090x/polybar-themes#-polybar-5
  bars   = lib.readFile ./bars.ini;
  colors = lib.readFile ./colors.ini;
  mods1  = lib.readFile ./modules.ini;
  mods2  = lib.readFile ./user_modules.ini;

  in
{
  home.packages = with pkgs; [
    font-awesome          # awesome fonts
    material-design-icons # fonts with glyphs
    xfce.orage            # lightweight calendar
  ];

  services.polybar = {
    enable = true;
    package = mypolybar;
    config = ./config.ini;
    extraConfig = bars + colors + mods1 + mods2; 
  };
}
