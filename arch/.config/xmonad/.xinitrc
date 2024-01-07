export LANG=ja_JP.UTF-8
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XMODIFIERS='@im=fcitx'
export DefaultIMModule=fcitx
xrdb ~/.Xresources
fcitx &
feh --bg-scale ~/path/to/wallpaper.png &
exec xmonad