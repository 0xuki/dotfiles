{ pkgs, ... }:
{
  home.packages = [ pkgs.dunst ];

  home.file = {
    ".config/dunst/dunst.conf".source = ./dunst.conf;
    ".config/dunst/dunstrc".source = ./dunstrc;
  };

  home.activationScripts.icons = {
    text = ''
      $DRY_RUN_CMD mkdir -p ${pkgs.stdenv.mkDerivation {
        name = "home-config-dunst";
        phases = [ "installPhase" "fixupPhase" ];
        installPhase = "ln -sfn ${./icons} $out/.config/dunst/icons";
        buildInputs = [ pkgs.makeWrapper ];
      }}/home/yuki/.config/dunst
    '';
    deps = [ "dunst" ];
  };
}
