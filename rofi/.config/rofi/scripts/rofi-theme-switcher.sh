#!/bin/bash

THEME_DIR="$HOME/.config/rofi/colors"
COLOR_FILE="$HOME/.config/rofi/color.rasi"

# List available themes
THEME=$(ls "$THEME_DIR" | sed 's/.rasi$//' | sort | rofi -dmenu -config ~/.config/rofi/menu/theme-switcher.rasi -p "Choose Rofi Theme")

# If theme is chosen
if [ -n "$THEME" ]; then
    echo "@import \"$THEME_DIR/$THEME.rasi\"" > "$COLOR_FILE"
    notify-send "Rofi" "Theme changed to: $THEME"
    rofi -show drun
fi

