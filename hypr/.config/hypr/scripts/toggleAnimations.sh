#!/usr/bin/env bash

animationsState=$(hyprctl getoption animations:enabled | awk '/int/ {print $2}')

if [[ "$animationsState" -eq 1 ]]  ; then
    hyprctl --batch "\
    keyword animations:enabled 0;\
    hyprctl keyword decorations:blur:enabled 0;\
    hyprctl keyword decorations:shadow:enabled 0 "
    notify-send "Animations & Decorations Disabled" -t 0
else
    hyprctl --batch "\
    keyword animations:enabled 1;\
    hyprctl keyword decorations:blur:enabled 1;\
    fyprctl keyword decorations:shadow:enabled 1 "
    notify-send "Animations & Decorations Enabled" -t 0
fi
