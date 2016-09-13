import XMonad
import XMonad.Hooks.SetWMName
main = xmonad $ defaultConfig { startupHook = setWMName "LG3D" }
