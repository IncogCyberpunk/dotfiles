# Specify the shell you want to use
#!/bin/zsh  

# Decreases the brightness of the laptop's screen by 10%. 
# If the brightness is at 10%, it will only decrease to 5% 

# Get the current brightness value
currentBrightness=$(brightnessctl g)

if ((currentBrightness > 1920)); then
    brightnessctl set 10%-
else 
    notify-send "Minimum brightness reached !!"
    brightnessctl set 10
fi
