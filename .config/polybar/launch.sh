#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Wait for polybar to die
while pgrep --exact polybar > /dev/null; do sleep 0.3; done

# Example:
# Launch bar1 and bar2
# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
# polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

# Launch [bar/main] in polybar config
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload main & disown
done
