#!/usr/bin/env bash

playerctl -a pause
hyprctl dispatch exec swaylock 
systemctl suspend
