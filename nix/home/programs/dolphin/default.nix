{ pkgs, ... }:
let
  config = import ./config.nix { inherit pkgs; };
in
{
  home.packages = [ pkgs.dolphin ];
  home.file = {
    ".config/dolphinrc".text = config.dolphin;
  };
}
