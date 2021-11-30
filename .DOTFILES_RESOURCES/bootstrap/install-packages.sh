#!/bin/bash

if [ "$#" -ne "1" ]; then
	echo Expected 1 arg.
	exit 1
fi

case $1 in
	"i3")
		PACKAGES=(
			'compton'
			'dunst'
			'rofi'
			'feh'
			'qalc'
			'scrot'
			'xss-lock'
			'network-manager-gnome'
            'brightness-udev'
			)
	;;
	"x")
		PACKAGES=(
			'adapta-gtk-theme'
            'ddgr'
            'pavucontrol'
            'playerctl'
			)
	;;
	"nox")
		PACKAGES=(
			'vim-nox'
			'vim-youcompleteme'
			'flake8'
			'yamllint'
			'pandoc'
			'texlive-xetex'
            'shellcheck'
            'fish'
			)
	;;
	*)
		echo Unexpected input. 
		exit 1
	;;  
esac

echo Installing packages for $1

for package in ${PACKAGES[@]}; do
    if ! dpkg -l $package &> /dev/null; then
        sudo apt install -yq $package
    fi
done
