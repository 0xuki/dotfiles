{ pkgs, ... }:
{
  home.packages = [ 
    pkgs.ranger 
    pkgs.ueberzug
  ];
  home.file = {
    ".config/ranger/rc.conf".source = ./rc.conf;
  };
}
