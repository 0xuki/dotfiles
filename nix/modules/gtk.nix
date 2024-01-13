{ config, pkgs, ... }:

{
  environment.variables = {
    GTK2_RC_FILES = "${pkgs.gtk2}/etc/gtk-2.0/gtkrc";
    GTK_THEME = "Tokyo-Night-GTK";
    XCURSOR_THEME = "Bibata-Cursor";
  };

  environment.systemPackages = with pkgs; [
    gtk3
  ];
  services.xserver.desktopManager.gnome = {
    enable = true;
    gtk = {
      theme.name = "Tokyo-Night-GTK-"; # GTKテーマ
    };
  };
}

