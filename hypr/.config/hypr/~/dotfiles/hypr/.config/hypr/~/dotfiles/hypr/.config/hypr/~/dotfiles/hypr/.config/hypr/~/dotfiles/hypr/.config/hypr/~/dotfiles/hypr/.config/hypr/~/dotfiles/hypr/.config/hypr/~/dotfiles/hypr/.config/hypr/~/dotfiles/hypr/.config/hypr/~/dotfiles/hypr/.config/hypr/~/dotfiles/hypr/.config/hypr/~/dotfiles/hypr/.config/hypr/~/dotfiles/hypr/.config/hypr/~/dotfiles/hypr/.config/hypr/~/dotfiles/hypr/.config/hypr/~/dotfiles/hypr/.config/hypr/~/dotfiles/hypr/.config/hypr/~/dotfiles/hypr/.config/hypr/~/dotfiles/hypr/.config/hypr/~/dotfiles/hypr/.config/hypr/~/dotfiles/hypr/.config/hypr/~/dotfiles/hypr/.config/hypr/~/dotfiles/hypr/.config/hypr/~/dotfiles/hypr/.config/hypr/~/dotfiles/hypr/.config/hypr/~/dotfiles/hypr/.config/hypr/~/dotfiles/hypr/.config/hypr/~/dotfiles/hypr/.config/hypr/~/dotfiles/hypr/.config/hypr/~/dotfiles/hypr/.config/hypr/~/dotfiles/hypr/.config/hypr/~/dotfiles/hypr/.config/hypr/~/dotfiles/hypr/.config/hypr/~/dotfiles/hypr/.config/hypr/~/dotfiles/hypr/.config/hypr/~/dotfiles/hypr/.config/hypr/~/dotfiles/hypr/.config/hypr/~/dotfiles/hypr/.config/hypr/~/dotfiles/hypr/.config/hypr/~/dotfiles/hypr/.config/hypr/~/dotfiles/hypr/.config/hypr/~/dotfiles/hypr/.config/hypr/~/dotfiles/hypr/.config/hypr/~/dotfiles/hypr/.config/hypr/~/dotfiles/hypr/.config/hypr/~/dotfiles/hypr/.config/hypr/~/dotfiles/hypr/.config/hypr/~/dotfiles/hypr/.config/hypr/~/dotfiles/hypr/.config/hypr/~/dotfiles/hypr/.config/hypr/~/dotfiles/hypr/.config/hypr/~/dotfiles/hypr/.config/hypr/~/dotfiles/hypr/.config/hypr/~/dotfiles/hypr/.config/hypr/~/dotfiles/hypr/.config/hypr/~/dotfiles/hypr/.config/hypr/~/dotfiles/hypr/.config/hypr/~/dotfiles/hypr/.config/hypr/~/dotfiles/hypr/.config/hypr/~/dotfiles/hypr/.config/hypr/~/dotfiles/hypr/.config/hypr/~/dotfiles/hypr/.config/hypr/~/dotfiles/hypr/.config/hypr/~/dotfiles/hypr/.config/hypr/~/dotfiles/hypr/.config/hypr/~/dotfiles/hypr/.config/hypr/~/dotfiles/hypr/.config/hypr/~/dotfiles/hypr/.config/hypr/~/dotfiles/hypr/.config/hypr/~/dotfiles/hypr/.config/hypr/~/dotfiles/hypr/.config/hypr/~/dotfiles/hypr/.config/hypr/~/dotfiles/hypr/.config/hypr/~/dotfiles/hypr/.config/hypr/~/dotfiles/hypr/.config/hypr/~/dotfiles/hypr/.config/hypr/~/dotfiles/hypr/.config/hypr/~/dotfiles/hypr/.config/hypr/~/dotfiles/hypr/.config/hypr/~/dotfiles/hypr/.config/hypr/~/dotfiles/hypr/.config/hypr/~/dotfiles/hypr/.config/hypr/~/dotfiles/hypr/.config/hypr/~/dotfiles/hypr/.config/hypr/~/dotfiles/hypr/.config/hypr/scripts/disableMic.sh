pactl set-source-mute @DEFAULT_SOURCE@ toggle 

status=$(pactl get-source-mute @DEFAULT_SOURCE@ | grep -q 'yes' && echo ' <b>(MUTED)</b>' || echo ' <b>(UNMUTED)</b>')
notify-send "Microphone Status" $status