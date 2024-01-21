{
  lib,
  pkgs,
  ...
}: let
  _ = lib.getExe;
  inherit (pkgs) brightnessctl pamixer;

  snowflake = builtins.fetchurl rec {
    name = "Logo-${sha256}.svg";
    url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake.svg";
    sha256 = "14mbpw8jv1w2c5wvfvj8clmjw0fi956bq5xf9s2q3my14far0as8";
  };

  sharedScripts = import ./share_scripts.nix { inherit pkgs; };

in {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        exclusive = true;
        fixed-center = true;
        gtk-layer-shell = true;
        spacing = 0;
        margin-top = 5;
        margin-bottom = 5;
        margin-left = 5;
        margin-right = 0;
        modules-left = [
          "custom/logo"
          "hyprland/workspaces"
        ];
        modules-center = [];
        modules-right = [
          "custom/wallpaper"
          "group/network-pulseaudio-backlight-battery"
          "clock"
          "group/powermenu"
        ];
        "custom/logo" = {
          format = " ";
          tooltip = false;
        };
        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = true;
          disable-scroll = true;
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            active = "󰋘";
            default = "󰋙";
            empty = "󰋙";
            persistent = "󰋙";
            special = "󰋙";
            urgent = "󰋙";
          };
          persistent-workspaces = {
            "*" = 5;
          };
        };
        "custom/wallpaper" = {
          "format" = " ";
          "tooltip" = "Change Wallpaper";
          "on-click" = "${sharedScripts.wallpaper_random}/bin/wallpaper_random";
          "on-click-middle" = "${sharedScripts.default_wall}/bin/default_wall";
          "on-click-right" = "killall dynamic_wallpaper || ${sharedScripts.dynamic_wallpaper}/bin/dynamic_wallpaper &";
        };
        "group/network-pulseaudio-backlight-battery" = {
          modules = [
            "network"
            "pulseaudio"
            "backlight"
            "battery"
          ];
          orientation = "inherit";
        };
        network = {
          format-wifi = "󰖩";
          format-ethernet = "󰈀";
          format-disconnected = "󰖪";
          tooltip-format-wifi = "WiFi: {essid} ({signalStrength}%)\n󰅃 {bandwidthUpBytes} 󰅀 {bandwidthDownBytes}";
          tooltip-format-ethernet = "Ethernet: {ifname}\n󰅃 {bandwidthUpBytes} 󰅀 {bandwidthDownBytes}";
          tooltip-format-disconnected = "Disconnected";
          on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
        };
        pulseaudio = {
          format = "{icon}";
          format-bluetooth = "󰂯";
          format-muted = "󰖁";
          format-icons = {
            default = ["󰕿" "󰖀" "󰕾"];
          };
          tooltip-format = "Volume: {volume}%";
          on-click = "${_ pamixer} -t";
          on-scroll-up = "${_ pamixer} -d 1";
          on-scroll-down = "${_ pamixer} -i 1";
        };
        backlight = {
          format = "{icon}";
          format-icons = ["󰝦" "󰪞" "󰪟" "󰪠" "󰪡" "󰪢" "󰪣" "󰪤" "󰪥"];
          tooltip-format = "Backlight: {percent}%";
          on-scroll-up = "${_ brightnessctl} -q s 1%-";
          on-scroll-down = "${_ brightnessctl} -q s +1%";
        };
        battery = {
          format = "{icon}";
          format-charging = "󱐋";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          format-plugged = "󰚥";
          states = {
            warning = 30;
            critical = 15;
          };
          tooltip-format = "{timeTo}, {capacity}%";
        };
        clock = {
          format = "{:%H\n%M}";
          actions = {
            on-scroll-down = "shift_down";
            on-scroll-up = "shift_up";
          };
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            format = {
              days = "<span color='#4A5051'><b>{}</b></span>";
              months = "<span color='#C5C8C9'><b>{}</b></span>";
              today = "<span color='#C5C8C9'><b><u>{}</u></b></span>";
              weekdays = "<span color='#96CDFB'><b>{}</b></span>";
            };
            mode = "month";
            on-scroll = 1;
          };
        };
        "group/powermenu" = {
          drawer = {
            children-class = "power-child";
            transition-duration = 300;
            transition-left-to-right = false;
          };
          modules = [
            "custom/power"
            "custom/exit"
            "custom/lock"
            "custom/suspend"
            "custom/reboot"
          ];
          orientation = "inherit";
        };
        "custom/exit" = {
          format = "󰈆";
          on-click = "${pkgs.hyprland}/bin/hyprctl dispatch exit";
          tooltip = false;
        };
        "custom/lock" = {
          format = "󰌾";
          on-click = "${pkgs.swaylock-effects}/bin/swaylock -S --daemonize";
          tooltip = false;
        };
        "custom/suspend" = {
          format = "󰤄";
          on-click = "${pkgs.systemd}/bin/systemctl suspend";
          tooltip = false;
        };
        "custom/reboot" = {
          format = "󰜉";
          on-click = "${pkgs.systemd}/bin/systemctl reboot";
          tooltip = false;
        };
        "custom/power" = {
          format = "󰐥";
          on-click = "${pkgs.systemd}/bin/systemctl poweroff";
          tooltip = false;
        };
      };
    };

    style = ''
      * {
        all: unset;
        font-family: "Material Design Icons", "Iosevka Fixed", sans-serif;
        font-size: 13pt;
        font-weight: bold;
      }

      window#waybar {
        background: #0D1416;
        border-radius: 0.5rem;
        color: #C5C8C9;
        transition-property: background-color;
        transition-duration: 0.5s;
      }

      button {
        box-shadow: inset 0 -3px transparent;
        border: none;
      }

      button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
      }

      .modules-left {
        padding-top: 0.5rem;
      }

      .modules-right {
        padding-bottom: 0.5rem;
      }

      #clock,
      #custom-lock,
      #custom-logo,
      #custom-exit,
      #custom-power,
      #custom-reboot,
      #custom-suspend,
      #network-pulseaudio-backlight-battery,
      #workspaces {
        background: #192022;
        border-radius: 1rem;
        color: #C5C8C9;
        margin: 0.25rem 0.5rem;
        padding: 1rem 0.5rem;
      }

      #custom-logo {
        background: transparent;
        background-image: url("${snowflake}");
        background-position: center;
        background-repeat: no-repeat;
        background-size: 2rem;
      }

      #network-pulseaudio-backlight-battery,
      #workspaces {
        padding: 1rem 0;
      }

      #network,
      #pulseaudio,
      #backlight,
      #battery,
      #workspaces button {
        padding: 0.375rem 0.5rem;
      }

      #workspaces button.empty label {
        color: #4A5051;
      }

      #workspaces button.urgent label {
        color: #F28FAD;
      }

      #workspaces button.special label {
        color: #FAE3B0;
      }

      #workspaces button.active label {
        color: #96CDFB;
      }

      #network.disconnected,
      #pulseaudio.muted {
        color: #F28FAD;
      }

      #battery.charging,
      #battery.plugged {
        color: #ABE9B3;
      }

      #battery.critical:not(.charging) {
        color: #F28FAD;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #custom-exit,
      #custom-lock,
      #custom-suspend,
      #custom-reboot,
      #custom-power {
        font-size: larger;
        padding: 0.5rem;
        background: transparent;
      }

      #custom-power {
        color: #F28FAD;
      }

      #custom-reboot {
        color: #F8BD96;
      }

      #custom-suspend {
        color: #FAE3B0;
      }

      #custom-lock {
        color: #ABE9B3;
      }

      #custom-exit {
        color: #96CDFB;
      }

      menu,
      tooltip {
        background: #0D1416;
        border: 1px solid #4A5051;
        border-radius: 0.5rem;
        padding: 0.5rem;
      }

      menu label,
      tooltip label {
        font-weight: normal;
        padding: 1rem;
      }

      @keyframes blink {
        to {
          color: #C5C8C9;
        }
      }
    '';

    systemd.enable = true;
    systemd.target = "graphical-session.target";
  };
}

