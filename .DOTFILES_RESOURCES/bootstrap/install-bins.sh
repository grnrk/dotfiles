#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo Exactly one arg required
	exit 1
fi

BIN_DIR_SPEC=$1
DST_BIN_DIR=/usr/local/bin
SRC_BIN_DIR=~/.DOTFILES_RESOURCES/bin/$BIN_DIR_SPEC

test -d $SRC_BIN_DIR ||  {
	echo $SRC_BIN_DIR not found!
	exit 1
}

SRC_BIN_DIR_BINS=$(find $SRC_BIN_DIR -maxdepth 2 -type f -executable)

echo Linking bins from $SRC_BIN_DIR to $DST_BIN_DIR

# Symlink executables to /usr/local/bin.                                                                           
for bin in $SRC_BIN_DIR_BINS; do
    sudo ln -sf $bin $DST_BIN_DIR/$(basename $bin)
done
