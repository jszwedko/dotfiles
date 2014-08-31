#!/bin/bash

exists()
{
    command -v $1 &> /dev/null
}
 
# Load resources
 
xrdb -merge .Xresources
 
# Set up an icon tray
 
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x191970 --height 17 &
 
# Set the background color<
 
xsetroot -solid midnightblue
 
# Fire up apps
 
if exists "xscreensaver" ; then
    xscreensaver -no-splash &
fi

if exists "gnome-power-manager" ; then
   gnome-power-manager &
fi

if exists "bluetooth-applet" ; then
    bluetooth-applet &
fi

if exists "blueproximity" ; then
    blueproximity &
fi

if exists "nm-applet" ; then
   nm-applet &
fi

if exists "xbindkeys" ; then
    xbindkeys &
fi

if exists "dropbox" ; then
    dropbox start
fi

if exists "xflux" ; then
    xflux -z 15209 &
fi
 
xsetroot -cursor_name left_ptr
 
exec xmonad
