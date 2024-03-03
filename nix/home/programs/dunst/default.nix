{ pkgs, ... }:
{
  home.packages = [ 
    pkgs.dunst 
  ];
  home.file = {
    ".config/dunst/dunst.conf".source = ./dunst.conf;
    ".config/dunst/dunstrc".source = ./dunstrc;
  };
}
