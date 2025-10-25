#!/usr/bin/env bash


# Increases the brightness of the laptop's screen by 10%.
brightnessctl set 10%+

# get the brightness value after the increase 
currentvalue=$(brightnessctl g)
maxvalue=$(brightnessctl m)
percentage=$(echo "scale=2; $currentvalue / $maxvalue * 100" | bc )

# send a notification with the current brightness percentage
notify-send "Backlight" "${percentage%.*}%" -u low -t 700
