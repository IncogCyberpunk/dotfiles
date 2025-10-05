if rfkill | awk '{print $4}' | grep -qx blocked ; then
    rfkill unblock all
    notify-send "Flight Mode Disabled" 
else
    rfkill block all
    notify-send "Flight Mode Enabled" 
fi
