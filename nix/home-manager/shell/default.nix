{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      fish
    ];
  };

  imports = [
    ./fish
  ];
}
