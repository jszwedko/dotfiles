import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ICCCMFocus
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.LayoutModifier
import XMonad.Layout.IM
import XMonad.Layout.MultiToggle
import XMonad.Layout.Reflect
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle
import XMonad.Layout.Master
import Graphics.X11.ExtraTypes.XF86
import System.IO
import Data.Ratio ((%))

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    , manageDocks
    ]

myLayoutHook =  smartBorders $
                avoidStruts $
                mkToggle (single REFLECTX) $
                mkToggle (single REFLECTY) $
                ( tall ||| Mirror tall ||| Full ||| skype )
                where
                    tall = Tall 1 (3/100) (1/2)
                    skype = withIM (1%7) (ClassName "Skype" `And` Role "MainWindow") (mastered (1/100) (1/2) Grid)

main = do
    xmproc <- spawnPipe "xmobar ~/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = myManageHook
        , layoutHook = myLayoutHook
        , logHook = do
                    takeTopFocus
                    dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , borderWidth=2
        , terminal="urxvt"
        , normalBorderColor = "#cccccc" , focusedBorderColor = "#cd8b00"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        , ((mod4Mask, xK_x), sendMessage $ Toggle REFLECTX)
        , ((mod4Mask, xK_y), sendMessage $ Toggle REFLECTY)
        , ((0, xF86XK_AudioRaiseVolume), spawn "amixer sset Master,0 5+")
        , ((0, xF86XK_AudioLowerVolume), spawn "amixer sset Master,0 5-")
        , ((0, xF86XK_AudioMute), spawn "amixer sset Master,0 0")
        , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 10")
        , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10")
        ]
