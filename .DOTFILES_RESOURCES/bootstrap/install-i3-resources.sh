#!/bin/bash

install_sleep_lock() {
	UNIT_FILE="/etc/systemd/system/i3lock.service"
	SRC_FILE=~/.DOTFILES_RESOURCES/etc/systemd/system/i3lock.service.template
	TMP_FILE="/tmp/i3lock.service.tmp"
	test -f $UNIT_FILE || {
		echo $(basename $UNIT_FILE) not found - Installing
		cat $SRC_FILE | sed "s/###USER###/$USER/" > $TMP_FILE
		sudo install -o root -g root -m 644 $TMP_FILE $UNIT_FILE
		rm $TMP_FILE
		sudo systemctl daemon-reload
    }
}

install_sleep_lock
