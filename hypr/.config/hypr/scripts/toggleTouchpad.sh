#!/usr/bin/env bash

# NOTE: Script to toggle touchpad on/off for Hyprland

TOUCHPAD_DEVICE=$(hyprctl devices | grep touchpad | xargs)
TOUCHPAD_VARIABLE="device[$TOUCHPAD_DEVICE]:enabled"

if [ -z "$XDG_RUNTIME_DIR" ]; then
  export XDG_RUNTIME_DIR=/run/user/$(id -u)
fi

TOUCHPAD_STATUS="$XDG_RUNTIME_DIR/touchpad.status"

enable_touchpad() {
  printf "true" >"$TOUCHPAD_STATUS"
  notify-send -u low -t 700 "Touchpad Switched ON"
  hyprctl keyword $TOUCHPAD_VARIABLE "true" -r
}

disable_touchpad() {
  printf "false" >"$TOUCHPAD_STATUS"
  notify-send -u low -t 700 "Touchpad Switched OFF"
  hyprctl keyword $TOUCHPAD_VARIABLE "false" -r
}

if ! [ -f "$TOUCHPAD_STATUS" ]; then
  disable_touchpad
else
  if [ $(cat "$TOUCHPAD_STATUS") = "true" ]; then
    disable_touchpad
  elif [ $(cat "$TOUCHPAD_STATUS") = "false" ]; then
    enable_touchpad
  fi
fi
