{ config, lib, pkgs, ... }:

{
  services = {
    gnome.gnome-keyring.enable = true;
    upower.enable = true;
    dbus = {
      enable = true;
      packages = [ pkgs.dconf ];
    };

    xserver = {
      enable = true;
      layout = "jp";
      libinput = {
        enable = true;
        touchpad = {
          disableWhileTyping = true;
        };
      };

      displayManager.defaultSession = "none+xmonad";

      # Enable the Gnome3 desktop manager
      displayManager.gdm.enable    = true;
      displayManager.gdm.wayland   = false; # screen-sharing is broken
      desktopManager.gnome3.enable = true;

      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };

      xkbOptions = "caps:ctrl_modifier";
    };
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  systemd.services.upower.enable = true;
}

