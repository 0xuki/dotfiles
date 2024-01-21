{ config, pkgs, ... }:
let 
  custom = {
    font = "JetBrainsMono Nerd Font";
    fontsize = "12";
    primary_accent = "D8DEE9";
    secondary_accent= "D8DEE9";
    tertiary_accent = "D8DEE9";
    background = "3b4252";
    opacity = "0.98";
    cursor = "Numix-Cursor";
    palette = rec {
      primary_accent_hex = "D8DEE9";
      secondary_accent_hex = "D8DEE9";
      tertiary_accent_hex = "D8DEE9";
      primary_background_hex = "3b4252";
      secondary_background_hex = "3b4252";
      tertiary_background_hex = "3b4252";

      primary_accent_rgba = "rgba(128,160,192,${opacity})";
      secondary_accent_rgba = "rgba(192,202,245,${opacity})";
      tertiary_accent_rgba = "rgba(192,202,245,${opacity})";
      primary_background_rgba = "rgba(59,66,82,${opacity})";
      secondary_background_rgba = "rgba(59,66,82,${opacity})";
      tertiary_background_rgba = "rgba(59,66,82,${opacity})";

      opacity = "1";
    };
  };
  sharedScripts = import ./share_scripts.nix { inherit pkgs; };
  startDynScript = pkgs.writeScript "start_dyn" ''
    #!/usr/bin/env bash
    ${config.home.homeDirectory}/.config/hypr/scripts/tools/dynamic &
    while true
    do
        out=$(cat ${config.home.homeDirectory}/.config/hypr/store/dynamic_out.txt)
        echo "$out" | jq --unbuffered --compact-output
        sleep 0.5
    done
  '';
in
{
  _module.args = { inherit custom; };
  imports =  [ (import ./waybar.nix)   ]
          ++ [ (import ./settings.nix { inherit sharedScripts pkgs; }) ]
          ++ [ (import ./style.nix)    ];
}
