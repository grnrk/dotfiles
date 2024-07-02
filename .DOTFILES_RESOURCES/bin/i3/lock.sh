#!/bin/sh

# Uses i3lock-color
# https://github.com/Raymo111/i3lock-color

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#00897bE6'
# TEXT='#00897bE6'
TEXT='#00C4B0FF'
# WRONG='#E6000099'
WRONG='#22222299'
LWRONG='#4DFFFFbb'
VERIFYING='#00564dE6'

i3lock \
  --nofork \
  --image="${HOME}/Pictures/wallpapers/active_i3_wallpaper.png" \
  --ignore-empty-password \
  --clock \
  --ring-width=3.0 \
  \
  --inside-color=$BLANK \
  --ring-color=$DEFAULT \
  --insidever-color=$BLANK \
  --ringver-color=$VERIFYING \
  --insidewrong-color=$BLANK \
  --ringwrong-color=$WRONG \
  \
  --line-color=$BLANK \
  --keyhl-color=$LWRONG \
  --bshl-color=$LWRONG \
  --separator-color=$DEFAULT \
  \
  --verif-color=$TEXT \
  --wrong-color=$TEXT \
  --layout-color=$TEXT \
  --time-color=$TEXT \
  --date-color=$TEXT \
  \
  --time-str="%H:%M" \
  --date-str="%Y-%m-%d" \
  \
  --verif-font=monospace \
  --verif-size=20 \
  --wrong-font=monospace \
  --wrong-size=20 \
  --wrong-text="failed!" \
  --time-font=monospace \
  --time-size=26 \
  --date-font=monospace \
  --date-size=14
#   --bar-indicator \
#   --bar-max-height=10 \
#   --bar-base-width=10 \
#   --bar-periodic-step=6 \
#   --bar-color=$DEFAULT \
#   --bar-count=18
