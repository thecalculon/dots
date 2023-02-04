#!/bin/bash
#
session=$XDG_SESSION_TYPE
# If the process doesn't exists, start one in background
run() {
	if ! pgrep $1 ; then
		$@ &
	fi
}

lock &
nm-applet &                        # network manager applet 

if [ "$session" = x11 ]
    then
    nitrogen --restore &                    # wallpaper
    flameshot &                    # wallpaper
    picom & 
fi


