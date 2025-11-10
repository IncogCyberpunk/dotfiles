#!/usr/bin/env bash
if pgrep -x hyprlock ; then
    pkill -x hyprlock
fi
hyprctl dispatch exec hyprlock && sleep 0.5 && hyprctl dispatch dpms off    
