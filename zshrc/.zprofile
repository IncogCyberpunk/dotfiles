if [[ -z $WAYLAND_DISPLAY && -z $DISPLAY ]]; then
    if uwsm check may-start && uwsm select; then
    exec uwsm start default
    fi
fi
