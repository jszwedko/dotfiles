#!/bin/bash
 
# Load resources
 
xrdb -merge .Xresources
 
# Set up an icon tray
 
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x191970 --height 12 &
 
# Set the background color<
 
xsetroot -solid midnightblue
 
# Fire up apps
 
xscreensaver -no-splash &
 
#if [ -x /usr/bin/wicd-gtk ] ; then
   #/usr/bin/wicd-gtk &
#fi

sleep 3

if [ -x /usr/bin/gnome-power-manager ] ; then
   gnome-power-manager &
fi

if [ -x /usr/bin/bluetooth-applet ] ; then
    /usr/bin/bluetooth-applet &
fi

if [ -x /usr/bin/blueproximity ] ; then
    /usr/bin/blueproximity &
fi

if [ -x /usr/bin/nm-applet ] ; then
   /usr/bin/nm-applet &
fi

if [ -x /usr/bin/xbindkeys ] ; then
    /usr/bin/xbindkeys &
fi
 
xsetroot -cursor_name left_ptr
 
exec xmonad
