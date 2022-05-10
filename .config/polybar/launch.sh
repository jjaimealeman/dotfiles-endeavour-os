#!/usr/bin/env bash

## /home/jaime/.config/polybar/launch.sh
## ██████╗  ██████╗ ██╗  ██╗   ██╗██████╗  █████╗ ██████╗     ██╗      █████╗ ██╗   ██╗███╗   ██╗ ██████╗██╗  ██╗
## ██╔══██╗██╔═══██╗██║  ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗    ██║     ██╔══██╗██║   ██║████╗  ██║██╔════╝██║  ██║
## ██████╔╝██║   ██║██║   ╚████╔╝ ██████╔╝███████║██████╔╝    ██║     ███████║██║   ██║██╔██╗ ██║██║     ███████║
## ██╔═══╝ ██║   ██║██║    ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗    ██║     ██╔══██║██║   ██║██║╚██╗██║██║     ██╔══██║
## ██║     ╚██████╔╝███████╗██║   ██████╔╝██║  ██║██║  ██║    ███████╗██║  ██║╚██████╔╝██║ ╚████║╚██████╗██║  ██║
## ╚═╝      ╚═════╝ ╚══════╝╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚═╝  ╚═╝
## 25


# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar primary -c ~/.config/polybar/config.ini &

if [[ $(xrandr -q | grep 'HDMI1 connected') ]]; then
    polybar secondary -c ~/.config/polybar/config.ini &
fi
