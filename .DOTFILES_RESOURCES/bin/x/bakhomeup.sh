#!/bin/bash

set -e

KEEP_DAYS="20"
date=`date +%Y-%m-%d_%H%M`
src="/home/gorane/"
mount="/h/gorane"
trg="${mount}/home"

# check mount
mountpoint -q $mount || {
  echo "$mount not mounted!"
  exit 1
}

# Clean up
find ${trg}/incr/ -maxdepth 1 -type d -mtime +$KEEP_DAYS -exec rm -rf {} \;

rsync -qaz --delete --inplace --backup \
--backup-dir=${trg}/incr/${date} \
--exclude="nobackup/" \
--exclude="VirtualBox*" \
--exclude="Maildir/" \
--exclude=".cache" \
--exclude=".local" \
--exclude="svn/" \
--exclude="git/" \
--exclude="Downloads/" \
--exclude="Pictures/" \
--exclude="tmpdocs/" \
--exclude="dotfiles/" \
--exclude="Nextcloud/" \
--exclude=".aws/" \
--exclude=".yadm/" \
--exclude=".vault-token" \
--exclude=".awx-env" \
$src ${trg}/full/
