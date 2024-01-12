{ pkgs, ... }:
let
  username = "az";
  homeDirectory = "/home/${username}";
  stateVersion = "22.11";
in
{
  imports = [
    ./cli/default.nix
    ./gui/default.nix
    ./desktop/default.nix
  ];

  programs.home-manager.enable = true;

  home.username = username;
  home.homeDirectory = homeDirectory;
  home.stateVersion = stateVersion;
  
  home.sessionVariables = {
    XDG_CONFIG_HOME = "${homeDirectory}/.config";
  };
  
  home.enableNixpkgsReleaseCheck = false;  #Home ManagerとNixpkgsのバージョン不一致の警告を無視

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    bat
    bottom
    eza
    httpie
    pingu
    ripgrep
    xclip
  ];
}
