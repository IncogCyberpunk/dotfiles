#!/usr/bin/env bash

getVolumePercentage(){
    volume=$(wpctl get-volume @DEFAULT_SINK@)
    volume=${volume#*.}
    echo "${volume}"
}

# Increase volume
if [[ $1 == "increase" ]]; then
    wpctl set-volume @DEFAULT_SINK@ 5%+

# Decrease volume
elif [[ $1 == "decrease" ]]; then
    wpctl set-volume @DEFAULT_SINK@ 5%-

# Toggle mute 
elif [[ $1 == "toggle-mute" ]]; then
    wpctl set-mute @DEFAULT_SINK@ toggle
    if [[ $(wpctl get-volume @DEFAULT_SINK@ | grep -i "muted" | wc -l) -eq "1" ]]; then
    notify-send "Muted"
    else
    notify-send "Unmuted"
    fi
    exit
fi

notify-send "Volume" "$(getVolumePercentage)%" -t 700 -u low
