{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      kitty
    ];
  };
  home.sessionVariables.TERMINAL = "kitty";
  
  imports = [
    ./kitty
  ];
}
