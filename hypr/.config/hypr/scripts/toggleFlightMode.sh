#!/usr/bin/env bash

iconsDir="$HOME/.config/swaync/icons"
if rfkill | awk '{print $4}' | grep -qx blocked ; then
    rfkill unblock all
    notify-send -u normal -t 1100 -h string:x-canonical-private-synchronous:flight-mode-status -i $iconsDir/airplane-mode-off.png  "Flight Mode" "Disabled" 
else
    rfkill block all
    notify-send -u normal -t 1100 -h string:x-canonical-private-synchronous:flight-mode-status -i $iconsDir/airplane-mode-off.png  "Flight Mode" "Enabled"
fi
