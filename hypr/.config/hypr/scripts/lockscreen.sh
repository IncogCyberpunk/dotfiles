#!/usr/bin/env bash
pkill -x swaylock
hyprctl dispatch exec swaylock && sleep 0.5 && hyprctl dispatch dpms off    
