#!/usr/bin/env bash

getVolumePercentage(){
    volume=$(wpctl get-volume @DEFAULT_SINK@) # Output: `Volume: 0.65`
    volume=${volume#* } # Output: `0.65`
    actualVolume=${volume#*.} # Output: `65`

    isAmplified=$(if [[ ${volume%.*} == "1" ]]; then echo "true"; else echo "false"; fi)
    if [[ $isAmplified == "true" ]]; then
        echo "1${actualVolume}"
    else
        echo "${actualVolume}"
    fi
}

# NOTE: Different functions based on argument

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

# Exhibit volume notification
if [[ $(getVolumePercentage) -gt 100 ]]; then
    notify-send "Volume (Amplified)" "$(getVolumePercentage)%" -t 700 -u low
else
    notify-send "Volume" "$(getVolumePercentage)%" -t 700 -u low
fi
