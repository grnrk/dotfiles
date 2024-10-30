#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo Exactly one arg required
    exit 1
fi

BIN_DIR_SPEC=$1
DST_BIN_DIR=/usr/local/bin
SRC_BIN_DIR=~/.config/yadm/bin/$BIN_DIR_SPEC

test -d $SRC_BIN_DIR ||  {
    echo $SRC_BIN_DIR not found!
    exit 1
}

SRC_BIN_DIR_BINS=$(find $SRC_BIN_DIR -maxdepth 2 -type f -executable)

echo Linking bins from $SRC_BIN_DIR to $DST_BIN_DIR

# Symlink executables to /usr/local/bin.                                                                           
for bin in $SRC_BIN_DIR_BINS; do
    if [[ "$bin" =~ \.install$ ]]; then
        bin_stripped=$(echo $bin | sed 's/\.install//')
        sudo install -o root -g staff -m 755 $bin \
        $DST_BIN_DIR/$(basename $bin_stripped)
    else
        sudo ln -sf $bin $DST_BIN_DIR/$(basename $bin)
    fi
done
