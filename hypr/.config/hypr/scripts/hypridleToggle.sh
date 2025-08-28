#!/bin/bash
#  _   _                  _     _ _
# | | | |_   _ _ __  _ __(_) __| | | ___
# | |_| | | | | '_ \| '__| |/ _` | |/ _ \
# |  _  | |_| | |_) | |  | | (_| | |  __/
# |_| |_|\__, | .__/|_|  |_|\__,_|_|\___|
#        |___/|_|
#

if  pgrep -x hypridle 2>/dev/null; then
    killall hypridle
    notify-send "Hypridle" "Hypridle has been stopped."
else
    hypridle &
    notify-send "Hypridle" "Hypridle has been started."
fi
