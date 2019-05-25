#!/bin/bash

DEVICE="card0"
EXT_MONITOR="DP-1-1"
INT_MONITOR="eDP-1"
# Set DEBUG to yes to log some activity to $LOG_FILE
DEBUG="yes"
LOG_FILE=~/.monitor-hotplug.log
I3_WS_BIN="/usr/local/bin/i3-workspaces.py"


export DISPLAY=:0
export XAUTHORITY=$(ps -C Xorg -f --no-header | sed -n 's/.*-auth //; s/ -[^ ].*//; p')

wait_for_monitor() {
    while ! $(xrandr | grep -q "$EXT_MONITOR connected"); do
        sleep 0.3
    done
}

dp_status() {

    # This function returns DISPLAYPORT_CONNECTED="yes" if any connected displayports are found.

    # Monitor port names does not match between /sys/class/drm/* and xrandr,
    # and device names may change under /sys/class/drm, so we go through all of them.
    DISPLAYPORTS=$(find /sys/class/drm/${DEVICE}-DP-*/status)
    for dp_stat in $DISPLAYPORTS; do
        read STATUS < $dp_stat
        if [ $STATUS == "connected" ]; then
            if [ "$DEBUG" == "yes" ]; then
                echo "$dp_stat is connected" >> $LOG_FILE
            fi
            DISPLAYPORT_CONNECTED="yes"
            break
        fi
    done
}

# MAIN
if [ "$DEBUG" == "yes" ]; then
    echo "Running `basename $0` `date '+%T'`" >> $LOG_FILE
fi

# Check for any connected displayport monitors.
dp_status

if  [ "$DISPLAYPORT_CONNECTED" == "yes" ]; then
    if [ "$DEBUG" == "yes" ]; then
        echo "Monitor detected, activating $EXT_MONITOR." >> $LOG_FILE
    fi
    # xrandr sometimes is slow to detect monitor connection.
    wait_for_monitor
    xrandr --output $EXT_MONITOR --right-of $INT_MONITOR --auto
    if [ -f "$I3_WS_BIN" ]; then
        $I3_WS_BIN restore
    fi
else
    if [ "$DEBUG" == "yes" ]; then
        echo "No monitor found, deactivating $EXT_MONITOR." >> $LOG_FILE
    fi
    if [ -f "$I3_WS_BIN" ]; then
        $I3_WS_BIN save
    fi
    xrandr --output $EXT_MONITOR --off
fi
