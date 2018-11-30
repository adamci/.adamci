#!/bin/bash

# Currently supported:
# 1: Macintosh
# 2: Arch Linux
# 3: Centos

OS=`uname -s`
DIST=0
ARCH_PACMAN=yay

if [ $OS == "Darwin" ]; then
    DIST=1
elif [ $OS == "Linux" ]; then
    distribution=`gawk -F= '/^NAME/{print $2}' /etc/os-release`
    if [ "$distribution" == "\"Arch Linux\"" ]; then
        DIST=2
    elif [ "$distribution" == "\"CentOS Linux\"" ]; then
        DIST=3
    fi
fi

if [ $DIST == 0 ]; then
    echo $'Unsupported OS\nAborting install_packages.sh!\n'
    exit 1
fi
if [ $DIST == 2 ] && ! type $ARCH_PACMAN > /dev/null 2>&1; then
    echo "Install pacaur before continuing"
    exit 1
fi
