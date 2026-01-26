#!/usr/bin/env bash

# Define the directory containing the themes
THEME_DIR="$HOME/.config/rofi/themes"

# Get a list of available themes
THEMES=($(ls $THEME_DIR | grep "style"))


# Function to display the theme selection menu
change_theme(){
# Show available themes
    echo "Available themes:" 

    # Display numbered list
    for i in "${!THEMES[@]}"; do
        echo "$((i+1)). ${THEMES[$i]}"
    done
    echo
                
    read -p "Enter the theme number you want to apply: " themeNo
    themeFile="style-$themeNo.rasi"

    # If theme exists, apply
    if [[ -f "$THEME_DIR/$themeFile" ]]; then 
        sed -i "/^@theme/s/style-[0-9]\+\.rasi/style-$themeNo.rasi/" config.rasi 
        echo "Theme changed to $themeFile !!" 
    else 
        echo "Error: Theme $themeFile not found !!" 
        return 1
    fi
}

change_theme
