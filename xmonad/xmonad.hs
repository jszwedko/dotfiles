import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.Reflect
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle
import XMonad.Prompt
import XMonad.Prompt.Pass
import Graphics.X11.ExtraTypes.XF86

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    , className =? "Pinentry" --> doFloat
    , manageDocks
    ]

myLayoutHook =  smartBorders $
                avoidStruts $
                mkToggle (single REFLECTX) $
                mkToggle (single REFLECTY) $
                ( tall ||| Mirror tall ||| Full )
                where
                    tall = Tall 1 (3/100) (1/2)

myAdditionalKeys = [
  ((mod4Mask, xK_z), spawn "xscreensaver-command -lock")
  , ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock && systemctl suspend")
  , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
  , ((0, xK_Print), spawn "scrot")
  , ((mod4Mask, xK_x), sendMessage $ Toggle REFLECTX)
  , ((mod4Mask, xK_y), sendMessage $ Toggle REFLECTY)

  , ((mod4Mask .|. shiftMask, xK_p), passPrompt defaultXPConfig)

  , ((0, xF86XK_AudioRaiseVolume), spawn "amixer sset Master,0 5%+ unmute")
  , ((0, xF86XK_AudioLowerVolume), spawn "amixer sset Master,0 5%- unmute")
  , ((0, xF86XK_AudioMute), spawn "amixer sset Master,0 toggle")

  , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 10")
  , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10")

   , ((mod4Mask, xK_b), sendMessage ToggleStruts)
  ]

myConfig = def {
  layoutHook = myLayoutHook
  , manageHook = myManageHook
  , modMask = mod4Mask     -- Rebind Mod to the Windows key
  , borderWidth=2
  , terminal="urxvt"
  , normalBorderColor = "#cccccc" , focusedBorderColor = "#cd8b00"
  }

main = xmonad =<< xmobar ( myConfig `additionalKeys` myAdditionalKeys )
