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
    local type=$1
    local volume=$2
    
    if [[ $type == "sink" ]]; then
        if [[ $volume -le 35 ]]; then
            icon="$iconsDir/volume-low.png"
        elif [[ $volume -le 70 ]]; then
            icon="$iconsDir/volume-mid.png"
        else
            icon="$iconsDir/volume-high.png"
        fi
    elif [[ $type == "source" ]]; then
        if [[ $volume -eq 0 ]]; then
            icon="$iconsDir/block-microphone.png"
        else
            icon="$iconsDir/microphone.png"
        fi
    fi
    echo $icon
}


# Exhibit volume notification OSD
sendNotification(){
    local volume=$1
    local icon=$2
    
if [[ $volume -gt 100 ]]; then
    notify-send -u low -t 700 -h string:x-canonical-private-synchronous:volume-notification -h int:value:$volume -i $icon "Volume (Amplified)" "${volume}%" 
else
    notify-send -u low -t 700 -h string:x-canonical-private-synchronous:volume-notification  -h int:value:$volume -i $icon "Volume" "${volume}%" 
fi
}

# NOTE: Different functions based on argument
# Increase volume
if [[ $1 == "increase" ]]; then
    wpctl set-volume @DEFAULT_SINK@ 5%+
    
    # Cache values ONCE
    volume=$(getSinkVolumePercentage)
    icon=$(getIcon sink "$volume")
    
    sendNotification "$volume" "$icon"

# Decrease volume
elif [[ $1 == "decrease" ]]; then
    wpctl set-volume @DEFAULT_SINK@ 5%-
    
    # Cache values ONCE
    volume=$(getSinkVolumePercentage)
    icon=$(getIcon sink "$volume")
    
    sendNotification "$volume" "$icon"

# Toggle mute 
elif [[ $1 == "toggle-sink" ]]; then
    wpctl set-mute @DEFAULT_SINK@ toggle
    
    # Cache the mute check result
    volume_output=$(wpctl get-volume @DEFAULT_SINK@)

    if grep -iq "muted" <<< "$volume_output"; then
        notify-send -u low -t 700 -h string:x-canonical-private-synchronous:volume-notification -i $iconsDir/volume-mute.png  "Muted" 
    else
        volume=$(getSinkVolumePercentage)
        icon=$(getIcon sink "$volume")
        notify-send -u low -t 700 -h string:x-canonical-private-synchronous:volume-notification -h int:value:$volume -i $icon  "Unmuted" "${volume}%"
    fi

# Toggle microphone mute
elif [[ $1 == "toggle-source" ]]; then
    wpctl set-mute @DEFAULT_SOURCE@ toggle
    
    # Cache the mute check result
    volume_output=$(wpctl get-volume @DEFAULT_SOURCE@)

    if grep -iq "MUTED" <<< "$volume_output"; then
        status="MUTED"
    else
        status="UNMUTED"
    fi
    
    source_vol=$(getSourceVolumePercentage)
    icon=$(getIcon source "$source_vol")

    notify-send -u low -t 700 -h string:x-canonical-private-synchronous:mic-status -h int:value:$source_vol -i $icon   "Microphone Status" $status 
fi

