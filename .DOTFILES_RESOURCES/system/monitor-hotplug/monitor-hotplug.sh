#!/bin/bash

SCRIPT_DISABLED="yes"

# Run: `sudo udevadm monitor` and plug/unplug the monitor to see the card id.
# or check under /sys/class/drm..
DEVICE="card0"
# Set correct displays.
# Find with: env | grep DISPLAY
export DISPLAY=:0
export WAYLAND_DISPLAY=wayland-1

# Set DEBUG to yes to log some activity to $LOG_FILE
DEBUG="yes"
LOG_FILE="/tmp/monitor-hotplug.log"
MONITOR_CACHE="/tmp/last-connected-monitor.txt"

get_monitors() {

    # This function returns the first found connected displayport or HDMI screen in
    # $CONNECTED_MONITOR.
    CONNECTED_MONITOR=""
    MONITORS=$(find /sys/class/drm/ -regextype posix-extended -regex "/sys/class/drm/${DEVICE}-(DP|HDMI)[-A-Z0-9]+")
    for monitor in $MONITORS; do
        read -r STATUS < "$monitor/status"
        if [ "$STATUS" == "connected" ]; then
            if [ "$DEBUG" == "yes" ]; then
                echo "$monitor is connected" >> $LOG_FILE
            fi
            CONNECTED_MONITOR=$(basename "$monitor" | cut -d "-" -f 2-)
            break
        fi
    done
}

enable_monitor() {
    if [ "$DEBUG" == "yes" ]; then
        echo "Enabling $CONNECTED_MONITOR." >> $LOG_FILE
    fi
    swaymsg output "$CONNECTED_MONITOR" enable
    echo "$CONNECTED_MONITOR" > "$MONITOR_CACHE"
}

disable_monitor() {
    read -r DISCONNECTED_MONITOR < "$MONITOR_CACHE"
    if [ "$DEBUG" == "yes" ]; then
        echo "Disabling last known connected monitor $DISCONNECTED_MONITOR." >> $LOG_FILE
    fi
    swaymsg output "$DISCONNECTED_MONITOR" disable
}

# MAIN
if [ "$DEBUG" == "yes" ]; then
    echo "[$(date '+%T')] Running $(basename $0)" >> "$LOG_FILE"
fi

if [ $SCRIPT_DISABLED == "yes" ]; then
    echo "[$(date '+%T')] Script is disabled, exiting.." >> "$LOG_FILE"
    exit 0
fi

# Check for any connected monitors.
get_monitors

if  [ -n "$CONNECTED_MONITOR" ]; then
    enable_monitor
else
    disable_monitor
fi
