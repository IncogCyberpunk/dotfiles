
#!/bin/bash

# Detect monitors
monitors=$(xrandr --query | grep " connected" | awk '{print $1}')

# Show GUI list
choice=$(zenity --list --title="Select Monitor" --column="Monitor" $monitors)

if [[ -n "$choice" ]]; then
    echo "You selected: $choice"
else
    echo "No selection made."
f#!/bin/bash

# Detect monitors
monitors=$(xrandr --query | grep " connected" | awk '{print $1}')

# Show GUI list
choice=$(zenity --list --title="Select Monitor" --column="Monitor" $monitors)

if [[ -n "$choice" ]]; then
    echo "You selected: $choice"
else
    echo "No selection made."
fi

