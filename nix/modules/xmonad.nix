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
      layout = "us";
      libinput = {
        enable = true;
        touchpad = {
          disableWhileTyping = true;
        };
      };

      displayManager.defaultSession = "none+xmonad";
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

