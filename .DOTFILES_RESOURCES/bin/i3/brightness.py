#!/usr/bin/env python3

import sys

args = sys.argv
if len(args) != 2:
    print('Arg num errror')
    sys.exit(1)

bright_file = '/sys/class/backlight/intel_backlight/brightness'
cmd = args[1]
max_bright = 7500  # Highest possible value of bright_file
min_bright = 50  # Lowest possible value of bright_file

std_level_change = 700
lo_level_change = 100
# Thresholds for when to start using lo_level_change
lo_cutoff = 500

new_value = None

# Get current value
with open(bright_file, 'r') as f:
    current_brightness = int(f.read())

# Increase brightness
if cmd == 'inc':
    if current_brightness < max_bright:
        if current_brightness + std_level_change > max_bright:
            new_value = max_bright
        else:
            if current_brightness <= lo_cutoff:
                new_value = current_brightness + lo_level_change
            else:
                new_value = current_brightness + std_level_change

# Decrease brightness
elif cmd == 'dec':
    if current_brightness > min_bright:
        if current_brightness <= lo_cutoff:
            # Decrease with lo_level_change
            if current_brightness - lo_level_change < min_bright:
                new_value = min_bright
            else:
                new_value = current_brightness - lo_level_change
        else:
            # Decrease with std_level_change
            if current_brightness - std_level_change < min_bright:
                new_value = min_bright
            else:
                new_value = current_brightness - std_level_change

else:
    print('Arg cmd error')
    sys.exit(1)

# Set new value
print(new_value)
if new_value is not None:
    with open(bright_file, 'w') as f:
        f.write(str(new_value))
sys.exit(0)
