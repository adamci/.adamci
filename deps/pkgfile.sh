#! /bin/bash

# pkgfile is required for command-not-found support

if ! type "pkgfile" > /dev/null 2>&1; then
    if [ $DIST == 2 ]; then
        $ARCH_PACMAN -S pkgfile
        echo "Updating pkgfile"
        sudo pkgfile -u
        echo "Enabling pkgfile daily update"
        systemctl enable --now pkgfile-update.timer
    fi
fi
