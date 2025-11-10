#!/usr/bin/env bash

playerctl -a pause
hyprctl dispatch exec hyprlock 
systemctl suspend
