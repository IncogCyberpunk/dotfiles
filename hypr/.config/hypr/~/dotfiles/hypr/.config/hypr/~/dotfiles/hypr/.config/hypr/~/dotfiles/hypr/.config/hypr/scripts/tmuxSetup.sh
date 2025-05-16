#/usr/bin/env bash

# Switch to workspace 3
hyprctl dispatch workspace 3
sleep 0.5 

# Create a session for all the different configs 
tmux new -d -s Configs -n NvimConfigs "nvim ~/.config/nvim/" \; neww -n HyprConfigs "nvim ~/.config/hypr/" \;  neww -n TmuxConfigs "nvim ~/.config/tmux/" \; neww -n WeztermConfigs "nvim ~/.config/wezterm/"

# Create a session for the Next.js project 
tmux new -d -s next\.js -n nextApp "nvim /mnt/Aayush/WEB/NEXT.JS/" \; neww -n ForServer \; send-keys "cd /mnt/Aayush/WEB/NEXT.JS/ && clear" Enter \;

# Attach to the `configs` session 
tmux a -t Configs \; select-window -t 1 \;

sleep 0.5
hyprctl dispatch workspace 1
