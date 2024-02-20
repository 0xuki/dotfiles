{ pkgs, ... }:
let
  config = import ./config.nix { inherit pkgs; };
in
{
  home.packages = [ pkgs.lazygit ];
  home.file = {
    ".config/lazygit/config.yml".text = config.lazygit;
  };
}
