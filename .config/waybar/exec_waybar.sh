#!/bin/bash
#
SMBD=$(pidof waybar)
if [ "$SMBD" == "" ];
then
    waybar 2>&1 1>/dev/null &
else
    killall waybar 2>&1 1>/dev/null &
   # /etc/init.d/samba restart;
fi
# if pgrep waybar ; then
#     killall waybar 2>&1 1>/dev/null &
# fi


