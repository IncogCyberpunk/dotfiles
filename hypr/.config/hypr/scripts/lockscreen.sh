#!/usr/bin/env bash
if pgrep -x hyprlock ; then
    pkill -x hyprlock
fi

sleep 0.5 && hyprctl dispatch dpms off && hyprlock
