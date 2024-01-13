{ config, pkgs, ... }:
{
  services.fcitx5.enable = true;
  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };
}

