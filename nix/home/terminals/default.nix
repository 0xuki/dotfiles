{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      kitty
      wezterm
      alacritty
      tmux
    ];
  };
  home.sessionVariables.TERMINAL = "kitty";
  
  imports = [
    ./kitty
    ./wezterm
    ./alacritty
    ./tmux
  ];
}
