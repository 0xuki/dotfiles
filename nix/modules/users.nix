{ config, pkgs, ... }:
{
  users.users.az = {
    isNormalUser = true;
    description = "az";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ firefox ];
    shell = pkgs.zsh;
  };

  programs.git = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true; # $EDITOR=nvimに設定
    viAlias = true;
    vimAlias = true;
  };

  programs.starship = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
  };
}

