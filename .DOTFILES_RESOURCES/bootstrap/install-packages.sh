#!/bin/bash

PACKAGES=('', '')

for package in ${PACKAGES[@]}; do
    if ! [ package_installed ]; then
        apt install $package
    fi
done
