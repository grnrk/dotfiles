#!/bin/bash

TMP_DIR=~/.mutt/.cal

NUM_FILES=$(ls -1 $TMP_DIR | wc -l)

if [ "${NUM_FILES}" -ne 1 ]; then
    echo "Found $NUM_FILES files. Expected 1."
    exit 0
fi

ICS_FILE=$(find $TMP_DIR -type f)

khal import -a work --batch $ICS_FILE && \
rm $ICS_FILE && \
echo "Added $(basename $ICS_FILE | cut -d'.' -f1) to calendar."
