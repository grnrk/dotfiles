#!/bin/bash

# This config is probably needed!
# echo "pinentry-program /usr/bin/pinentry-tty" > ~/.gnupg/gpg-agent.conf

gpgconf --kill gpg-agent
export GPG_TTY=$(tty)

# May not be needed...
gpg-connect-agent updatestartuptty /bye

