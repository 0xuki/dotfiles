{ pkgs, ... }:
{
  ranger = ''
    set show_hidden true
    set preview_images true

    map gg move to_first
    map G move to_last

    map dd cut
    map yy yank
    map pp paste
  '';
}
