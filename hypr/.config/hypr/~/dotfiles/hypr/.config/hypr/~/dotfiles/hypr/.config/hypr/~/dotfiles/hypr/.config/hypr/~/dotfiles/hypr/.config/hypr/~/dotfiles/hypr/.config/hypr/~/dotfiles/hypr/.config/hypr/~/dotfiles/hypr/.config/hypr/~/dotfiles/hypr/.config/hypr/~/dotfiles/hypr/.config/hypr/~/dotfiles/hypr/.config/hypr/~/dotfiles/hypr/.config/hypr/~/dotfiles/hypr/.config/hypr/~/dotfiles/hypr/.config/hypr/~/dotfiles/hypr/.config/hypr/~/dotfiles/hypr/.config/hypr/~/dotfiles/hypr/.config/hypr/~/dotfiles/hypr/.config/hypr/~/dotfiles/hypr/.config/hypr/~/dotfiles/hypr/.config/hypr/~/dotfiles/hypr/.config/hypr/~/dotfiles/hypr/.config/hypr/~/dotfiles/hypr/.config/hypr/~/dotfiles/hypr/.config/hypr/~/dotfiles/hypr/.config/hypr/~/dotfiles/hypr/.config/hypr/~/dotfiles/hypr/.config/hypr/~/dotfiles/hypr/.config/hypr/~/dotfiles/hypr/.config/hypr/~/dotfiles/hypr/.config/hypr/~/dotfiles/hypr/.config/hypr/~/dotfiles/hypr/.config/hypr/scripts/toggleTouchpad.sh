#!/usr/bin/env bash

touchpadEnabledStatus=$(cat ~/.config/hypr/conf/touchpad/touchpad.conf | awk '/enabled/ {print $3}')
printf "%s\n" "$touchpadEnabledStatus"
if [[ "$touchpadEnabledStatus" == "true" ]]; then
     dunstify "Touchpad" "Touchpad disabled"
     sed -i  's/enabled = true/enabled = false/' ~/.config/hypr/conf/touchpad/touchpad.conf
else
     dunstify "Touchpad" "Touchpad enabled"
    sed -i  's/enabled = false/enabled = true/' ~/.config/hypr/conf/touchpad/touchpad.conf
fi

