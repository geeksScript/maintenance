#!/bin/bash
#clean journals
journalctl --vacuum-size=100M

#clean apt stuff
sudo apt-get clean; apt-get autoclean; apt-get autoremove -y

# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done