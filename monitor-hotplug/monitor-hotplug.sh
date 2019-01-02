#!/bin/bash

DEVICE="card0"
#DEVICES=$(find /sys/class/drm/*/status)
# monitor port name does not match between /sys/class/drm/* and xrandr,
# which is why we need to define them separately.
SYS_CLASS_MONITOR='DP-3'
EXT_MONITOR='DP-1-1'
EXT_MONITOR_STATUS_FILE="/sys/class/drm/${DEVICE}-${SYS_CLASS_MONITOR}/status"

export DISPLAY=:0
export XAUTHORITY=$(ps -C Xorg -f --no-header | sed -n 's/.*-auth //; s/ -[^ ].*//; p')

wait_for_monitor() {
    while ! $(xrandr | grep -q "$EXT_MONITOR connected"); do
        sleep 0.3
    done
}

read STATUS < $EXT_MONITOR_STATUS_FILE
if  [ "$STATUS" == "connected" ]; then
    # xrandr sometimes is slow to detect monitor connection.
    wait_for_monitor
    xrandr --output $EXT_MONITOR --right-of eDP-1 --auto
    #xrandr -s 1920x1080
    /usr/local/bin/i3-workspaces.py restore
else
    /usr/local/bin/i3-workspaces.py save
    xrandr --output $EXT_MONITOR --off
fi
