# #!/usr/bin/env bash
#
# sleep 1
# notify-send "Trying to play music"
# echo "Bluetooth device added at $(date)" >>/tmp/scripts.log
# playerctl play
# notify-send "Executed the playMusic script"

#!/bin/bash
logger "Bluetooth device connected"
echo "Connected at $(date)" >> /tmp/bt-log.txt
