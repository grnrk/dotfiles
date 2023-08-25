# Offlineimap timer

Put .offlineimaprc and .offlineimap.py in ~
Put the .timer and .service files under ~/.config/systemd/user/

systemctl --user daemon-reload

systemctl --user enable offlineimap.timer
systemctl --user start offlineimap.timer

systemctl --user start offlineimap.service

systemctl --user list-timers
