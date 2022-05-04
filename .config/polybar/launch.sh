#!/usr/bin/env bash

##
## ██████╗  ██████╗ ██╗  ██╗   ██╗██████╗  █████╗ ██████╗     ██╗      █████╗ ██╗   ██╗███╗   ██╗ ██████╗██╗  ██╗
## ██╔══██╗██╔═══██╗██║  ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗    ██║     ██╔══██╗██║   ██║████╗  ██║██╔════╝██║  ██║
## ██████╔╝██║   ██║██║   ╚████╔╝ ██████╔╝███████║██████╔╝    ██║     ███████║██║   ██║██╔██╗ ██║██║     ███████║
## ██╔═══╝ ██║   ██║██║    ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗    ██║     ██╔══██║██║   ██║██║╚██╗██║██║     ██╔══██║
## ██║     ╚██████╔╝███████╗██║   ██████╔╝██║  ██║██║  ██║    ███████╗██║  ██║╚██████╔╝██║ ╚████║╚██████╗██║  ██║
## ╚═╝      ╚═════╝ ╚══════╝╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚═╝  ╚═╝
## 27


# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
if [[ $(xrandr -q | grep 'eDP1 connected') ]]; then
    polybar top -c ~/.config/polybar/config.ini &
fi

if [[ $(xrandr -q | grep 'HDMI1 connected') ]]; then
    polybar top_external -c ~/.config/polybar/config.ini &
fi
