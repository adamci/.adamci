#!/bin/bash

if ! type "tmux" &> /dev/null; then
    if [ "$DIST" = "1" ]; then
        brew install tmux
    elif [ "$DIST" = "2" ]; then
        $ARCH_PACMAN -S tmux
    elif [ "$DIST" = "4" ]; then
        dnf install tmux
    else
        echo "No instructions for tmux"
        exit 1
    fi
fi
