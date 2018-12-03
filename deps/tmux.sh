#!/bin/bash

if [ ! type "tmux" > /dev/null 2>&1 ]; then
    if [ "$DIST" = "1" ]; then
        brew install tmux
    elif [ "$DIST" = "2" ]; then
        $ARCH_PACMAN -S tmux
    fi
fi
