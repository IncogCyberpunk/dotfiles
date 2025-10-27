#!/usr/bin/env bash

# Decreases the brightness of the laptop's screen by 10%. 
# If the brightness is at 10%, it will only decrease to 5% 

# get the brightness value after the decrease 
currentBrightness=$(brightnessctl -q g)

getBrightnessPercentage(){
    # Get the brightness value after the decrease 
    currentValue=$(brightnessctl g)
    maxValue=$(brightnessctl m)

    percentage=$(echo "scale=2; $currentValue / $maxValue * 100" | bc )
    percentage=${percentage%.*}
    
    echo $percentage
}

if (( currentBrightness > 1920 )); then
    brightnessctl -q set 10%-
else 
    notify-send "Minimum brightness reached !!" "Brightness: $(getBrightnessPercentage)%"
    brightnessctl set 10
    exit
fi


notify-send "Backlight" "$(getBrightnessPercentage)%" -u low -t 700
