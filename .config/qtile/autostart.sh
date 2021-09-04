#!/bin/bash

# If the process doesn't exists, start one in background
run() {
	if ! pgrep $1 ; then
		$@ &
	fi
}

lock &
nm-applet &                              # network manager applet 
nitrogen --restore &                    # wallpaper
picom  &                                 # compositor


