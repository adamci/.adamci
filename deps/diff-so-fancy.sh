#!/bin/bash

if ! type "diff-so-fancy" &> /dev/null; then
    if [ "$DIST" = "1" ]; then
        brew install diff-so-fancy
    elif [ "$DIST" = "2" ]; then
        $ARCH_PACMAN -S diff-so-fancy
    else
        echo "No instructions for diff-so-fancy"
        exit 1
    fi
fi
