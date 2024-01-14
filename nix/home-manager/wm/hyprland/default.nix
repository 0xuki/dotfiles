{ inputs, pkgs, lib, ... }:

let
  hycov = inputs.hycov;
in
{
  imports = [ ./config.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = with inputs; with pkgs; [
      #hycov.packages.${pkgs.system}.hycov
    ];
    systemd.enable = true;
  };

  home.packages = with pkgs;[
    grimblast
    hyprpicker
    hycov.packages.${pkgs.system}.hycov
    swaylock-effects
    swayidle
    pamixer
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
  };
}
