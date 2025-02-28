#!/bin/bash
sleep 2  # Wait for monitors to be detected

# Force the correct monitor layout
hyprctl keyword monitor "HDMI-A-1,preferred,0x0,1.0"
hyprctl keyword monitor "eDP-1,preferred,1366x0,1.0"

# Move workspaces back to their correct monitors (optional)
hyprctl dispatch moveworkspacetomonitor 1 eDP-1
hyprctl dispatch moveworkspacetomonitor 2 HDMI-A-1
