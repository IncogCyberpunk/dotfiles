#!/bin/bash

# Switch to workspace 3 and open ~/.config/hypr/ in NVIM
hyprctl dispatch workspace 3
kitty -e nvim ~/.config/hypr/  &
sleep 1

# Switch to workspace 3 and open ~/.config/hypr/ in NVIM
hyprctl dispatch workspace 4
kitty -e nvim ~/.config/nvim/init.lua  &
sleep 1

# Return to workspace 1 after doing the above
hyprctl dispatch workspace 1
sleep 1

notify-send "Restored Hyprland config on workspace 3."
