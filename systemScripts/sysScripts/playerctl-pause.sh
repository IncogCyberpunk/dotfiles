#!/usr/bin/env bash

bluetoothConnected=$(bluetoothctl info | awk '/Connected: yes/ {print "1"}')

if [[ $(playerctl status) == "Playing" && bluetoothConnected -eq 1 ]]; then
    playerctl pause
fi
# pactl set-sink-volume @DEFAULT_SINK@ 20%
