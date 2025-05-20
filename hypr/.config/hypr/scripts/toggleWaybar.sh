#!/usr/bin/env bash

# we just need to check if waybar is running so we redirect the output of `pgrep waybar` to /dev/null
if (pgrep waybar > /dev/null ) ; then
    pkill waybar 
else
    waybar &
fi
