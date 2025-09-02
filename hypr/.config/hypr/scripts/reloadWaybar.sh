#!/usr/bin/env bash

if (pgrep waybar >/dev/null); then
    pkill waybar
    hyprctl dispatch exec waybar
fi
