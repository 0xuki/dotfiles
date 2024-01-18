{ inputs, pkgs, lib, ... }:
{
  imports = [ ./config.nix ];

  wayland.windowManager.hyprland = {
    enable = true; 
    #plugins = [
      #inputs.hycov.packages.${pkgs.system}.hycov
    #];
    systemd.enable = true;
  };

  home.packages = with pkgs;[
    grimblast
    hyprpicker
    swaylock-effects
    swayidle
    pamixer
    wf-recorder
    slurp
    grim
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];

  home = {
    sessionVariables = lib.mkForce {
      QT_SCALE_FACTOR = "1";
      SDL_VIDEODRIVER = "wayland";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      CLUTTER_BACKEND = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
    };

    file."bin/screenrecord.sh" = {
      enable = true;
      executable = true;
      text = ''
        #!/usr/bin/env bash
        filename="/home/yuki/Videos/$(date +%Y-%m-%d_%H-%M-%S).mp4"
        ${pkgs.wf-recorder}/bin/wf-recorder -g "$(${pkgs.slurp}/bin/slurp)" -t -f $filename
        [[ -e $filename ]] && ${pkgs.libnotify}/bin/notify-send "Screenrecord" "Saved to $filename"
      '';
    };

    file."bin/screenrecord-kill.sh" = {
      enable = true;
      executable = true;
      text = ''
        #!/usr/bin/env bash
        killall -SIGINT wf-recorder
      '';
    };
  };
}
