#!/usr/bin/env bash
pkill -x hyprlock
sleep 0.5 && hyprctl dispatch dpms off && hyprlock  
