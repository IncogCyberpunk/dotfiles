#!/usr/bin/env bash

# Safety check
if ! which brightnessctl &> /dev/null; then
    notify-send "Error" "brightnessctl command not found!"
    exit 1
fi

iconsDir="$HOME/.config/swaync/icons"

# Calculate the brightness percentage
getBrightnessPercentage() {
    currentValue=$(brightnessctl g)
    maxValue=$(brightnessctl m)
    percentage=$(echo "scale=2; $currentValue / $maxValue * 100" | bc)
    percentage=${percentage%.*}
    echo "$percentage"
}

# Get Icons
getIcon(){
    if [[ $(getBrightnessPercentage) -le "20" ]]; then
        icon="$iconsDir/brightness-20.png"
    elif [[ $(getBrightnessPercentage) -le "40" ]]; then
        icon="$iconsDir/brightness-40.png"
    elif [[ $(getBrightnessPercentage) -le "60" ]]; then
        icon="$iconsDir/brightness-60.png"
    elif [[ $(getBrightnessPercentage) -le "80" ]]; then
        icon="$iconsDir/brightness-80.png"
    else
        icon="$iconsDir/brightness-100.png"
    fi

    echo $icon
}


if [[ $1 == "increase" ]]; then
    # Calculate current and target brightness
    currentPercentage=$(getBrightnessPercentage)
    targetPercentage=$(( currentPercentage + 10 ))

    # Limit max brightness to 100%
    if (( targetPercentage > 100 )); then
        targetPercentage=100
    fi

    # Apply new brightness
    brightnessctl set "${targetPercentage}%"

    # Notify user
    notify-send -u low -t 700  -h string:x-canonical-private-synchronous:brightness-notification -h int:value:$targetPercentage -i $(getIcon) "Backlight" "${targetPercentage}%" 

elif [[ $1 == "decrease" ]]; then
    # Calculate current and target brightness
    currentPercentage=$(getBrightnessPercentage)
    targetPercentage=$(( currentPercentage - 10 ))

    # Prevent dropping below 5%
    if (( targetPercentage < 10 )); then
        targetPercentage=10
        brightnessctl set "${targetPercentage}%"
        notify-send -u low -t 700 -h string:x-canonical-private-synchronous:brightness-notification -h int:value:$targetPercentage "Minimum brightness reached!" "Brightness: ${targetPercentage}%" 
        exit
    fi

    # Apply new brightness
    brightnessctl set "${targetPercentage}%"

    # Notify user
    notify-send -u low -t 700 -h string:x-canonical-private-synchronous:brightness-notification -h int:value:$targetPercentage -i $(getIcon) "Backlight" "${targetPercentage}%" 

else
    echo "Usage: $0 {increase|decrease}"
    exit 1
fi
