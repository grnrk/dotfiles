#!/bin/bash

if [ "$#" -ne "1" ]; then
  echo Expected 1 arg.
  exit 1
fi

case $1 in
  "sway")
    PACKAGES=(
      'sway'
      'swaylock'
      'swayidle'
      'swayimg'
      'waybar'
      'wofi'
      'brightnessctl'
      'wdisplays'
      'grimshot'
      'wofi-pass'
      'dunst'
      'network-manager-gnome'
      'fonts-font-awesome'
      'pipewire'
      'pipewire-audio'
      )
  ;;
  "display")
    PACKAGES=(
      'adapta-gtk-theme'
      'ddgr'
      'pavucontrol'
      'playerctl'
      )
  ;;
  "nodisplay")
    PACKAGES=(
      'neovim'
      'python3-pynvim'
      'python3-flake8'
      'python3-mypy'
      'python3-virtualenv'
      'yamllint'
      'black'
      'eslint'
      'pandoc'
      'texlive-xetex'
      'shellcheck'
      'fish'
      'pass'
      )
  ;;
  *)
    echo Unexpected input. 
    exit 1
  ;;  
esac

echo Installing packages for "$1"

for package in "${PACKAGES[@]}"; do
  if ! dpkg -l "$package" &> /dev/null; then
    sudo apt install -yq "$package"
  fi
done
