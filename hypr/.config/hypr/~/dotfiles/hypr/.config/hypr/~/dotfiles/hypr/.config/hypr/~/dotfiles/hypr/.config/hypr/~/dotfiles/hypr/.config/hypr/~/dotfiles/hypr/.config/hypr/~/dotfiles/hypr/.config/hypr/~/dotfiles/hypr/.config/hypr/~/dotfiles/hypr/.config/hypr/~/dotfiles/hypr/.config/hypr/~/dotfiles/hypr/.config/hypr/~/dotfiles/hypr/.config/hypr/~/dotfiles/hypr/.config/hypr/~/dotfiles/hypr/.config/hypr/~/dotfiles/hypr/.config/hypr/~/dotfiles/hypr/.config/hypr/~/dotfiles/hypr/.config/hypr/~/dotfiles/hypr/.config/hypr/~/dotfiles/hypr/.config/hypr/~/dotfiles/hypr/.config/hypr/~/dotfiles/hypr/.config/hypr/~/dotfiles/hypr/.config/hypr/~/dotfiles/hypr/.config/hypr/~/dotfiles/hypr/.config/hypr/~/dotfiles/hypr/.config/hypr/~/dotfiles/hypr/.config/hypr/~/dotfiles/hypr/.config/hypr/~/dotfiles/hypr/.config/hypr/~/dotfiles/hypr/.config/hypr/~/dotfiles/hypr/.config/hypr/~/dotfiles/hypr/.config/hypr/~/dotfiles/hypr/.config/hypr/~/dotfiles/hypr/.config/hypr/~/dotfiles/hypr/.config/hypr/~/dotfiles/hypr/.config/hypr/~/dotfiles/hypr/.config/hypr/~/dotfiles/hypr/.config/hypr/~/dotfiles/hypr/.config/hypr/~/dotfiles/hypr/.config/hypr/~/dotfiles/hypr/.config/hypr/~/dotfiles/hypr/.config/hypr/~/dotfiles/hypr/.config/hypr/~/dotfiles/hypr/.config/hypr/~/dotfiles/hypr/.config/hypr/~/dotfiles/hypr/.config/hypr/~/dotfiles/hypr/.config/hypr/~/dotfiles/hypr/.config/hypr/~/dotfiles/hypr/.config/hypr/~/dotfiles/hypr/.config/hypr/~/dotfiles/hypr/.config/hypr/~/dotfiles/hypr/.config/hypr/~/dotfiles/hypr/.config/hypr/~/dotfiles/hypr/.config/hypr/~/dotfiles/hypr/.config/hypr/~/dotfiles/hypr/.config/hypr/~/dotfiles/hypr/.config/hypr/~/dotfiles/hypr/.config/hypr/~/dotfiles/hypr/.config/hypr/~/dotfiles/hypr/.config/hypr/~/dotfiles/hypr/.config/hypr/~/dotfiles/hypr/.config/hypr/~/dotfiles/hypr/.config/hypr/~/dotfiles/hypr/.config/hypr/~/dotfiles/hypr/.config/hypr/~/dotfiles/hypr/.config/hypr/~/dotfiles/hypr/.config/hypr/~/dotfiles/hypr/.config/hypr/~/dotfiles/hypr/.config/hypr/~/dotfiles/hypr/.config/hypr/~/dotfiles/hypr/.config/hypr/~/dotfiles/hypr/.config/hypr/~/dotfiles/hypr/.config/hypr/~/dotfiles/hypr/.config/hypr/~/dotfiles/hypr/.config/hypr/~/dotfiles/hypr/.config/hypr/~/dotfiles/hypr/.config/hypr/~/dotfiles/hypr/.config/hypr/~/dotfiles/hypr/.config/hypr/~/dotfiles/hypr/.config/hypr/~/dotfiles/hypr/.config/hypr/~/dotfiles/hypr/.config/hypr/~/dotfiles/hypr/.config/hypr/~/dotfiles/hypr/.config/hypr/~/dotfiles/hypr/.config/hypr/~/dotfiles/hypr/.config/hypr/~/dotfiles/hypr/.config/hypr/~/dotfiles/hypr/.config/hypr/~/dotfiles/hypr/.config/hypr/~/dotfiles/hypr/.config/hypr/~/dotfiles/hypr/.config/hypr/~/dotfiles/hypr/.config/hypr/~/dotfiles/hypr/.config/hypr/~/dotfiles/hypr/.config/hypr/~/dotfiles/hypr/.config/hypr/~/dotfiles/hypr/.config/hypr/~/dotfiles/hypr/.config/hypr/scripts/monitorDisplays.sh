#!/bin/bash

hdmiDisplayStatus=$(hyprctl monitors all | awk 'BEGIN {IGNORECASE=1} /Monitor hdmi-a-1/ {found=1} /disabled/ && found {print $2 ; exit}')

edpDisplayStatus=$(hyprctl monitors all | awk 'BEGIN {IGNORECASE=1} /Monitor edp-1/ {found=1} /disabled/ && found {print $2 ; exit}')

# Both the displays are turned off , then make laptop's display on
if [[ "$hdmiDisplayStatus" = "false" && "$edpDisplayStatus" = "false" ]]; then

   echo -e "monitor=HDMI-A-1,preferred,0x0,1 \n monitor=HDMI-A-1,disable \n monitor=eDP-1,preferred,1366x0,1" > ~/.config/hypr/monitors.conf  

fi
