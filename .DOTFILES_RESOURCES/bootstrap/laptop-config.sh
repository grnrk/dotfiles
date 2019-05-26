#!/bin/bash

echo Installing X11 configuration for laptops

TOUCHPAD_CONF="/etc/X11/xorg.conf.d/30-touchpad.conf"
SRC_TOUCHPAD_CONF=~/.DOTFILES_RESOURCES${TOUCHPAD_CONF}

sudo install -o root -g root -m 644 $SRC_TOUCHPAD_CONF $TOUCHPAD_CONF
