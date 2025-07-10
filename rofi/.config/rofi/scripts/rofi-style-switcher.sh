#!/bin/bash

STYLE_DIR="$HOME/.config/rofi/styles"
STYLE_FILE="$HOME/.config/rofi/style.rasi"

# List available STYLEs
STYLE=$(ls "$STYLE_DIR" | sed 's/.rasi$//' | sort | rofi -dmenu -config ~/.config/rofi/menu/theme-switcher.rasi -p "Choose Rofi STYLE")

# If STYLE is chosen
if [ -n "$STYLE" ]; then
    echo "@import \"$STYLE_DIR/$STYLE.rasi\"" > "$STYLE_FILE"
    notify-send "Rofi" "STYLE changed to: $STYLE"
    rofi -show drun
fi

