#! /bin/bash

if ! type "pkgfile" > /dev/null 2>&1; then
    if [ $DIST == 2 ]; then
        # pkgfile is required for command-not-found support
        pacaur -S pkgfile
        echo "Updating pkgfile"
        sudo pkgfile -u
        echo "Enabling pkgfile daily update"
        systemctl enable --now pkgfile-update.timer
    fi
fi
