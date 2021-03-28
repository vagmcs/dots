#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Sleep until the processes have been shut down
while pgrep -u ${UID} -x polybar >/dev/null; do sleep 1; done

# Load Polybar, using default config location ~/.config/polybar/config
polybar main &

# Load on second monitor if connected
external_monitor=$(xrandr --query | grep 'HDMI-2')
if [[ "${external_monitor}" = HDMI-2\ connected* ]]; then
	polybar main &
fi
