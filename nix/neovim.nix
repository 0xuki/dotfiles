{pkgs, ...}: {
  #programs.neovim = {
    #enable = true;
    #viAlias = true;
    #vimAlias = true;
    #plugins = with pkgs.vimPlugins; [
    #];
    #extraPackages = with pkgs; [
    #];
    #extraLuaConfig = builtins.readFile ./dotfiles/common/.config/nvim/init.lua; 
  #};
}
