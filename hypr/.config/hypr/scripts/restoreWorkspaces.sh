#!/bin/bash

# Switch to workspace 3 and open VS Code in ~/.config/hypr/
hyprctl dispatch workspace 3
code ~/.config/hypr/ & disown
sleep 2

# Switch to workspace 4 and open VS Code in ~/.config/waybar/
hyprctl dispatch workspace 4
code ~/.config/waybar/ & disown
sleep 2

# Return to workspace 1 after doing the above
hyprctl dispatch workspace 1
sleep 1

notify-send "Restored the workspaces 3 and 4"
