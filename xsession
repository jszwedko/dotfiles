#!/bin/bash

exists()
{
    command -v $1 &> /dev/null
}

# Load resources

xrdb -merge .Xresources

# Set up an icon tray

# Set the background color<

xsetroot -solid midnightblue

# Fire up apps

if exists "xscreensaver" ; then
    xscreensaver -no-splash &
fi

if exists "bluetooth-applet" ; then
    bluetooth-applet &
fi

if exists "blueproximity" ; then
    blueproximity &
fi

if exists "xbindkeys" ; then
    xbindkeys &
fi

if exists "dropbox" ; then
    dropbox start
fi

if exists "redshift" ; then
    redshift &
fi

ssh-agent > ~/.ssh/agent.out
 
gpg-agent -q --daemon --enable-ssh-support --write-env-file \
  "${HOME}/.gpg-agent-info" 2>&1 > /dev/null

xsetroot -cursor_name left_ptr
 
exec i3
