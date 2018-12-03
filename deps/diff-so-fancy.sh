#!/bin/bash

if [ ! type "diff-so-fancy" > /dev/null 2>&1 ]; then
    if [ "$DIST" = "1" ]; then
        brew install diff-so-fancy
    elif [ "$DIST" = "2" ]; then
        $ARCH_PACMAN -S diff-so-fancy
    fi
fi
