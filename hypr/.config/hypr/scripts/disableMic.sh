wpctl set-mute @DEFAULT_SOURCE@ toggle

if wpctl get-volume @DEFAULT_SOURCE@ | grep -q "MUTED"; then
    status="MUTED"
else
    status="UNMUTED"
fi

notify-send "Microphone Status" $status
