#!/usr/bin/env bash

# Safety check
if ! which wpctl &> /dev/null; then
    notify-send "Error" "\`wpctl\` command not found!"
    exit 1
fi

# Calculate the volume percentage
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

iconsDir="$HOME/.config/swaync/icons"

# Get Icons
getIcon(){
    if [[ $(getVolumePercentage) -le "35" ]]; then
        icon="$iconsDir/volume-low.png"
    elif [[ $(getVolumePercentage) -le "70" ]]; then
        icon="$iconsDir/volume-mid.png"
    else
        icon="$iconsDir/volume-high.png"
    fi

    echo $icon
}


# Exhibit volume notification OSD
sendNotification(){
if [[ $(getVolumePercentage) -gt 100 ]]; then
    notify-send -u low -t 700 -h string:x-canonical-private-synchronous:volume-notification -h int:value:$(getVolumePercentage) -i $(getIcon) "Volume (Amplified)" "$(getVolumePercentage)%" 
else
    notify-send -u low -t 700 -h string:x-canonical-private-synchronous:volume-notification  -h int:value:$(getVolumePercentage) -i $(getIcon) "Volume" "$(getVolumePercentage)%" 
fi
}

# NOTE: Different functions based on argument
# Increase volume
if [[ $1 == "increase" ]]; then
    wpctl set-volume @DEFAULT_SINK@ 5%+
    sendNotification

# Decrease volume
elif [[ $1 == "decrease" ]]; then
    wpctl set-volume @DEFAULT_SINK@ 5%-
    sendNotification

# Toggle mute 
elif [[ $1 == "toggle-mute" ]]; then
    wpctl set-mute @DEFAULT_SINK@ toggle
    if [[ $(wpctl get-volume @DEFAULT_SINK@ | grep -i "muted" | wc -l) -eq "1" ]]; then
        # NOTE: notify-send -h TYPE:NAME:VALUE
        # NOTE: `string:x-canonical-private-synchronous:`, can be used as hint 
        # with notify-send to replace previous notification from same app
        notify-send -u low -t 700 -h string:x-canonical-private-synchronous:volume-notification -i $iconsDir/volume-mute.png  "Muted" 
    else
        notify-send -u low -t 700 -h string:x-canonical-private-synchronous:volume-notification -h int:value:$(getVolumePercentage) -i $(getIcon)  "Unmuted" "$(getVolumePercentage)%"
    fi
    exit
fi

