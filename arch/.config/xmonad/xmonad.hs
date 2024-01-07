import XMonad
import XMonad.Hooks.DynamicLog

main :: IO()
main = do
    xmobar myConfig >>= xmonad

myConfig = defaultConfig
    { -- config
      terminal = myTerminal
    , startupHook = myStartupHook
    , modMask = mod4Mask -- 有効にするとMODキーがWinキーに変更される
    }

myTerminal = "xterm"
myStartupHook = do
    -- wallpaper
    spawn "feh --bg-scale $HOME/wallpaper.png"
    -- other