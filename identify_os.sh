#!/bin/bash

# Currently supported:
# 1: Macintosh
# 2: Arch Linux
# 3: Centos
# 4: Fedora

OS=`uname -s`
DIST=0
ARCH_PACMAN=yay

if [ "$OS" = "Darwin" ]; then
    DIST=1
elif [ "$OS" = "Linux" ]; then
    distribution=`gawk -F= '/^NAME/{print $2}' /etc/os-release`
    if [ "$distribution" = "\"Arch Linux\"" ]; then
        DIST=2
    elif [ "$distribution" = "\"CentOS Linux\"" ]; then
        DIST=3
    elif [ "$distribution" = "Fedora" ]; then
        DIST=4
    fi
fi
