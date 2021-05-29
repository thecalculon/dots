#! /bin/zsh

# If the process doesn't exists, start one in background
run() {
	if ! pgrep $1 ; then
		$@ &
	fi
}

# Just as the above, but if the process exists, restart it
run-or-restart() {
	if ! pgrep $1 ; then
		$@ &
	else
		process-restart $@
	fi
}

run nitrogen --restore                      # wallpaper
run-or-restart picom                                   # compositor
run-or-restart redshift-gtk -t 5000:3500
run-or-restart nm-applet                               # network manager applet
run-or-restart lock

