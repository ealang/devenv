import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Util.EZConfig
import Graphics.X11.ExtraTypes.XF86

main = xmonad $ defaultConfig {
    startupHook = setWMName "LG3D"
} `additionalKeys`
    [
        ((0, xF86XK_AudioLowerVolume   ), spawn "amixer -D pulse sset Master 5%-"),
        ((0, xF86XK_AudioRaiseVolume   ), spawn "amixer -D pulse sset Master 5%+"),
        ((0, xF86XK_AudioMute          ), spawn "amixer -D pulse sset Master toggle")
    ]
