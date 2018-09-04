import System.Exit
import Graphics.X11.ExtraTypes.XF86
import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.SetWMName
import XMonad.Layout.MouseResizableTile
import XMonad.Layout.ShowWName
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS

myAddKeys = [((0, xF86XK_AudioLowerVolume), spawn "amixer -D pulse sset Master 3%-"),
          ((0, xF86XK_AudioRaiseVolume), spawn "amixer -D pulse sset Master 3%+"),
          ((0, xF86XK_AudioMute), spawn "amixer -D pulse sset Master toggle"),
          ((0, xF86XK_MonBrightnessUp), spawn "light -A 10"),
          ((0, xF86XK_MonBrightnessDown), spawn "light -U 10"),
          ((0, xF86XK_Calculator), spawn "gnome-terminal -e python3"),
          ((0, xK_Print), spawn "gnome-screenshot"),
          ((mod4Mask .|. shiftMask, xK_l), spawn "sleep 0.3 && xset dpms force off && slock"),
          ((mod4Mask, xK_i), sendMessage ShrinkSlave),
          ((mod4Mask, xK_u), sendMessage ExpandSlave),
          ((mod4Mask, xK_w), prevScreen),
          ((mod4Mask, xK_e), nextScreen),
          ((mod4Mask .|. shiftMask , xK_w), shiftPrevScreen),
          ((mod4Mask .|. shiftMask , xK_e), shiftNextScreen),
          ((mod4Mask, xK_p), spawn "dmenu_run"),
          ((mod4Mask .|. shiftMask, xK_z), io (exitWith ExitSuccess))]

myRemoveKeys = [(mod4Mask .|. shiftMask, xK_q),
                (mod4Mask, xK_w),
                (mod4Mask, xK_e),
                (mod4Mask, xK_r)]

myStartupHook = do
    spawn "xcompmgr &"

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 0.90

noGapDragger = FixedDragger { gapWidth = 8, draggerWidth = 6 }
myLayoutHook = showWName ( mouseResizableTile { isMirrored = False, draggerType = noGapDragger } |||
                           Full )

main = xmonad $ gnomeConfig {
    borderWidth = 0,
    layoutHook = myLayoutHook,
    logHook = myLogHook,
    modMask = mod4Mask,
    startupHook = myStartupHook
} `removeKeys` myRemoveKeys `additionalKeys` myAddKeys
