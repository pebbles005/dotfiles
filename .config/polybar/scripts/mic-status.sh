#!/bin/bash

COLOR_MUTED="#61677a"

if pactl list sources | grep -A 10 "Name:.*alsa_input" | grep "Mute: yes" >/dev/null; then
    echo "%{F$COLOR_MUTED} muted%{F-}"
    exit 1
else
    VOLUME=$(pactl get-source-volume @DEFAULT_SOURCE@ | grep -Po '\d+(?=%)' | head -n 1)
    echo " $VOLUME%"
fi
