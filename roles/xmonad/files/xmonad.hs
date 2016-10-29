import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.FadeInactive
import XMonad.Layout.MouseResizableTile
import XMonad.Layout.ShowWName
import XMonad.Util.EZConfig
import Graphics.X11.ExtraTypes.XF86

myKeys = [((0, xF86XK_AudioLowerVolume), spawn "amixer -D pulse sset Master 3%-"),
          ((0, xF86XK_AudioRaiseVolume), spawn "amixer -D pulse sset Master 3%+"),
          ((0, xF86XK_AudioMute), spawn "amixer -D pulse sset Master toggle"),
          ((0, xF86XK_Calculator), spawn "gnome-terminal -e python3"),
          ((mod4Mask .|. shiftMask, xK_l), spawn "sleep 0.3 && xset dpms force off && slock"),
          ((mod4Mask, xK_i), sendMessage ShrinkSlave),
          ((mod4Mask, xK_u), sendMessage ExpandSlave)]

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 0.85

noGapDragger = FixedDragger { gapWidth = 0, draggerWidth = 6 }
myLayoutHook = showWName ( mouseResizableTile { isMirrored = False, draggerType = noGapDragger } |||
                           Full |||
                           mouseResizableTile { isMirrored = True, draggerType = noGapDragger } )

main = xmonad $ defaultConfig {
    borderWidth = 0,
    layoutHook = myLayoutHook,
    logHook = myLogHook,
    modMask = mod4Mask,
    startupHook = setWMName "LG3D"
} `additionalKeys` myKeys
