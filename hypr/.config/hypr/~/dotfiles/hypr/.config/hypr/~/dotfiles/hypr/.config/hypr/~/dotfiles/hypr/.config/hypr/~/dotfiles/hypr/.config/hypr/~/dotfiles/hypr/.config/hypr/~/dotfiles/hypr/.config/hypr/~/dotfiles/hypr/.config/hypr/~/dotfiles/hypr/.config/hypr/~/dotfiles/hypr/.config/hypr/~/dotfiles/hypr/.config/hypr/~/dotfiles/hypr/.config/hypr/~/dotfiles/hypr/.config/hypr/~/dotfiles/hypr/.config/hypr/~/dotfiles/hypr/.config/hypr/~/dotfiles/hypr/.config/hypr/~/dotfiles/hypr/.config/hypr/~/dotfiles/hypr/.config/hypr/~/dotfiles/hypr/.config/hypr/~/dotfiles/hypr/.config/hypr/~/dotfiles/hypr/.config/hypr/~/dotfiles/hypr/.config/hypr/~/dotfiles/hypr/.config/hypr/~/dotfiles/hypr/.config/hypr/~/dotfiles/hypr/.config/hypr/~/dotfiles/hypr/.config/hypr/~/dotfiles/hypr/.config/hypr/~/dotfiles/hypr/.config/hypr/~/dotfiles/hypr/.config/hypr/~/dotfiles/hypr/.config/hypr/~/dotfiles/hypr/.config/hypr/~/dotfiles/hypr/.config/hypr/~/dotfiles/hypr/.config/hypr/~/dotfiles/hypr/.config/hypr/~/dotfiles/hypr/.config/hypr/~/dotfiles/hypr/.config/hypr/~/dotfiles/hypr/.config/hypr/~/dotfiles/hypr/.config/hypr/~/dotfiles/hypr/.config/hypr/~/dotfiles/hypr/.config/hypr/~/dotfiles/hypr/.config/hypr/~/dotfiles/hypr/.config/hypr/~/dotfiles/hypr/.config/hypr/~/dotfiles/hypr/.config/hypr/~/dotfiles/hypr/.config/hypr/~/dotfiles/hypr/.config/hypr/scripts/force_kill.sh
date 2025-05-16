#!/bin/bash

# Get the active window's PID using hyprctl
ACTIVE_PID=$(hyprctl activewindow | grep "pid:" | awk '{print $2}')

# Check if the PID is valid
if [[ -n "$ACTIVE_PID" ]]; then
    # Forcefully kill the process
    kill -9 "$ACTIVE_PID"
    echo "Killed process with PID: $ACTIVE_PID"
else
    echo "No active window found or PID is invalid."
fi