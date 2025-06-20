#!/usr/bin/env bash

echo -e 'monitor = eDP-1,1920x1080,0x0,1\nmonitor = HDMI-A-1,disable' > ~/.config/hypr/monitors.conf

waypaper --restore
