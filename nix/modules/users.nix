{ config, pkgs, ... }:
{
  users.users.az = {
    isNormalUser = true;
    description = "az";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ firefox ];
    shell = pkgs.zsh;
  };
}

