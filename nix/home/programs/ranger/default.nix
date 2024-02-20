{ pkgs, ... }:
let
  config = import ./config.nix { inherit pkgs; };
in
{
  home.packages = [ pkgs.ranger ];
  home.file = {
    ".config/ranger/rc.conf".text = config.ranger;
  };
}
