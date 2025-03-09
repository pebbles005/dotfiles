#!/usr/bin/env bash

killall -q polybar

# Launch bar1 and bar2
polybar statusbar 2>&1 &
disown

echo "Bars launched..."
