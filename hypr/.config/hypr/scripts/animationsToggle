#!/usr/bin/env bash

 animationsState=$(hyprctl getoption animations:enabled | awk '/int/ {print $2}')

if [[ "$animationsState" -eq 1 ]]  ; then
    hyprctl keyword animations:enabled 0
    dunstify "Animations" "Disabled"
else
    hyprctl keyword animations:enabled 1
    dunstify "Animations" "Enabled"
fi
