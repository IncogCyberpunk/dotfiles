#/usr/bin/bash

# supress output by `> /dev/null` which redirects the std. o/p to /dev/null

if (pgrep spotify > /dev/null) ; then
    #
    # syntax of if => if (command's exit status)
    #
    if (hyprctl activewindow | grep -v grep | grep -iw spotify > /dev/null) ; then
        hyprctl dispatch killactive
    else
        spotify
    fi
else
    spotify 
fi

