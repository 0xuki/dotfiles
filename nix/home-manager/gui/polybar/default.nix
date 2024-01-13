{ config, pkgs, ... }:

let
  polybarConfig = pkgs.writeText "polybar-config" ''
    [bar/top]
    font-0 = "Hack Regular:size=10;2"
    font-1 = "Material Design Icons:size=10;2"
    width = 100%
    height = 32
    background = #222222
    foreground = #bbbbbb
    modules-left = date cpu
    modules-center = window
    modules-right = memory battery

    [module/date]
    type = internal/date
    interval = 5
    date = "%Y-%m-%d"
    time = "%H:%M:%S"
    format-prefix = " "
    format-prefix-foreground = "#ff0000"
    format-foreground = "#ffffff"

    [module/window]
    type = internal/xwindow
    format = "<label>"
    format-foreground = "#ffffff"

    [module/cpu]
    type = internal/cpu
    interval = 2
    format = "CPU: <label>"
    format-foreground = "#ffffff"

    [module/memory]
    type = internal/memory
    format = "RAM: <label>"
    format-foreground = "#ffffff"

    [module/battery]
    type = internal/battery
    battery = 0
    adapter = "ADP1"
    format = "<label>"
    format-foreground = "#ffffff"
    format-discharging = "  <ramp-capacity>"
    format-charging = "  <ramp-capacity>"
  '';
in
{
  home.packages = with pkgs; [
    polybar
    nerdfonts 
    material-design-icons # fonts with glyphs
  ];

  home.file.".config/polybar/config.ini".source = polybarConfig;
}

