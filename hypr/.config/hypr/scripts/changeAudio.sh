#!/usr/bin/env bash

# Safety check
if ! which wpctl &> /dev/null; then
    notify-send "Error" "\`wpctl\` command not found!"
    exit 1
fi

getVolume(){
    if [[ $1 == "sink" ]]; then
        volume=$(wpctl get-volume @DEFAULT_SINK@) # Output: `Volume: 0.65`
    elif [[ $1 == "source" ]]; then
        if  wpctl get-volume @DEFAULT_SOURCE@ | grep -iq "muted" ; then
            echo "0"
            exit
        else
            volume=$(wpctl get-volume @DEFAULT_SOURCE@) # Output: `Volume: 0.65`
        fi
    fi

    volume=${volume#* } # Output: `0.65`
    actualVolume=${volume#*.} # Output: `65`

    isAmplified=$(if [[ ${volume%.*} == "1" ]]; then echo "true"; else echo "false"; fi)
    if [[ $isAmplified == "true" ]]; then
        echo "1${actualVolume}"
    else
        echo "${actualVolume}"
    fi
}

# Calculate the volume percentage
getSinkVolumePercentage(){
    echo $(getVolume sink)
}

# Check the source volume
getSourceVolumePercentage(){
    echo $(getVolume source)
}

iconsDir="$HOME/.config/swaync/icons"
# Get Icons
getIcon(){
    if [[ $1 == "sink" ]]; then
        if [[ $(getSinkVolumePercentage) -le "35" ]]; then
            icon="$iconsDir/volume-low.png"
        elif [[ $(getSinkVolumePercentage) -le "70" ]]; then
            icon="$iconsDir/volume-mid.png"
        else
            icon="$iconsDir/volume-high.png"
        fi
    elif [[ $1 == "source" ]]; then
        if wpctl get-volume @DEFAULT_SOURCE@ | grep -iq "MUTED"; then
            icon="$iconsDir/block-microphone.png"
        else
            icon="$iconsDir/microphone.png"
        fi
    fi
    echo $icon
}


# Exhibit volume notification OSD
sendNotification(){
if [[ $(getSinkVolumePercentage) -gt 100 ]]; then
    notify-send -u low -t 700 -h string:x-canonical-private-synchronous:volume-notification -h int:value:$(getSinkVolumePercentage) -i $(getIcon sink) "Volume (Amplified)" "$(getSinkVolumePercentage)%" 
else
    notify-send -u low -t 700 -h string:x-canonical-private-synchronous:volume-notification  -h int:value:$(getSinkVolumePercentage) -i $(getIcon sink) "Volume" "$(getSinkVolumePercentage)%" 
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

    if wpctl get-volume @DEFAULT_SINK@ | grep -iq "muted" ; then
        notify-send -u low -t 700 -h string:x-canonical-private-synchronous:volume-notification -i $iconsDir/volume-mute.png  "Muted" 
    else
        notify-send -u low -t 700 -h string:x-canonical-private-synchronous:volume-notification -h int:value:$(getSinkVolumePercentage) -i $(getIcon sink)  "Unmuted" "$(getSinkVolumePercentage)%"
    fi

# Toggle microphone mute
elif [[ $1 == "toggle-mic" ]]; then
    wpctl set-mute @DEFAULT_SOURCE@ toggle

    if wpctl get-volume @DEFAULT_SOURCE@ | grep -iq "MUTED"; then
        status="MUTED"
    else
        status="UNMUTED"
    fi

    notify-send -u low -t 700 -h string:x-canonical-private-synchronous:mic-status -h int:value:$(getSourceVolumePercentage) -i $(getIcon source)   "Microphone Status" $status 
fi

