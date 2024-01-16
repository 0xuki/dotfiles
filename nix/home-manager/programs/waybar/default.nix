{ ... }: 
let 
  custom = {
    font = "JetBrainsMono Nerd Font";
    fontsize = "12";
    primary_accent = "7ebae4";
    secondary_accent= "c0caf5";
    tertiary_accent = "c0caf5";
    background = "3b4252";
    opacity = "0.98";
    cursor = "Numix-Cursor";
    palette = rec {
      primary_accent_hex = "80A0C0";
      secondary_accent_hex = "c0caf5";
      tertiary_accent_hex = "c0caf5";
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
in
{
  _module.args = { inherit custom; };
  imports =  [ (import ./waybar.nix)   ]
          ++ [ (import ./settings.nix) ]
          ++ [ (import ./style.nix)    ];
}
