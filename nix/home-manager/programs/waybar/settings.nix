{ 
    custom ? {
        font = "JetBrainsMono Nerd Font";
        fontsize = "12";
        primary_accent = "D8DEE9";
        secondary_accent = "D8DEE9";
        tertiary_accent = "D8DEE9";
        background = "3b4252";
        opacity = ".85";
        cursor = "Numix-Cursor";
    },
    pkgs,
    sharedScripts,
    ... 
}:
{
  programs.waybar.settings.mainBar = {
    position= "top";
    layer= "top";
    # height= 15;
    margin-top= 0;
    margin-bottom= 0;
    margin-left= 0;
    margin-right= 0;
    modules-left= [
        "custom/launcher"
        "custom/wallpaper"
        "custom/playerctl#backward" 
        "custom/playerctl#play" 
        "custom/playerctl#foward" 
        "custom/nowplaying"
    ];
    modules-center= [
        "hyprland/workspaces"
    ];
    modules-right= [
        "tray" 
        "cpu"
        "memory"
        "disk"
        "pulseaudio" 
        "network"
        "clock" 
    ];
    clock= {
        format = " {:%H:%M}";
        tooltip= "true";
        tooltip-format= "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt= " {:%d/%m}";
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
          "*" = 10;
        };
    };
    "custom/nowplaying"= {
        return-type= "json";
        max-length= 64;
        exec= "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F"; 
    };
    "custom/playerctl#backward"= {
        format= "󰙣 "; 
        on-click= "playerctl previous";
        on-scroll-up = "playerctl volume .05+";
        on-scroll-down = "playerctl volume .05-";
    };
    "custom/playerctl#play"= {
        format= "{icon}";
        return-type= "json";
        exec= "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
        on-click= "playerctl play-pause";
        on-scroll-up = "playerctl volume .05+";
        on-scroll-down = "playerctl volume .05-";
        format-icons= {
            Playing = "<span>󰏥 </span>";
            Paused = "<span> </span>";
            Stopped = "<span> </span>";
        };
    };
    "custom/playerctl#foward"= {
        format= "󰙡 ";
        on-click= "playerctl next";
        on-scroll-up = "playerctl volume .05+";
        on-scroll-down = "playerctl volume .05-";
    };
    memory= {
        format= " {}%";
        format-alt= " {used} GiB"; # 󰟜 
        interval= 2;
    };
    cpu= {
        format= " {usage}%";
        format-alt= " {avg_frequency} GHz";
        interval= 2;
    };
    disk = {
        # path = "/";
        format = "󰋊 {percentage_used}%";
        interval= 60;
    };
    network = {
        format-wifi = "  {signalStrength}%";
        format-ethernet = "󰀂 ";
        tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
        format-linked = "{ifname} (No IP)";
        format-disconnected = "󰖪 ";
    };
    tray= {
        icon-size= 20;
        spacing= 8;
    };
    pulseaudio= {
        format= "{icon}{volume}%";
        format-muted= "󰖁 ";
        format-icons= {
            default= [" "];
        };
        scroll-step= 5;
        on-click= "pamixer -t";
    };
    "custom/wallpaper" = {
      "format" = " ";
      "tooltip" = "Change Wallpaper";
      "on-click" = "${sharedScripts.wallpaper_random}/bin/wallpaper_random";
      "on-click-middle" = "${sharedScripts.default_wall}/bin/default_wall";
      "on-click-right" = "killall dynamic_wallpaper || ${sharedScripts.dynamic_wallpaper}/bin/dynamic_wallpaper &";
    };
    "custom/launcher"= {
        format= " ";
        "on-click" = "pkill rofi || ~/.config/rofi/launcher.sh"; 
        tooltip= "false";
    };
  };
}
