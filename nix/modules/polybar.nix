{ config, pkgs, lib, ... }:
let
  format = pkgs.formats.ini {};
in {
  # Polybarの設定
  environment.etc."polybar/config".source = format.generate "polybar-config.ini" {
    "bar/example" = {
      width = "100%";
      height = "30";
      monitor = "\${env:MONITOR:eDP1}";
      bottom = "true";
      modules-left = "date";
      modules-center = "";
      modules-right = "memory cpu";
      background = "#222";
      foreground = "#fff";
      "font-0" = "DejaVu Sans Mono:size=10;2";
    };
    "module/date" = {
      type = "internal/date";
      interval = "5";
      date = "%Y-%m-%d";
      "date-alt" = "%A, %d %B";
      time = "%H:%M";
      "time-alt" = "%H:%M:%S";
      "format-prefix" = " ";
      "format-prefix-foreground" = "#555";
      label = "%date% %time%";
    };
  };
}

