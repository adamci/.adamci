#!/bin/bash

if ! type "icdiff" &> /dev/null; then
    if [ "$DIST" = "1" ]; then
        brew install icdiff
    elif [ "$DIST" = "2" ]; then
        $ARCH_PACMAN -S icdiff
        sudo ln -s /usr/bin/icdiff /usr/local/bin/icdiff
    else
        echo "No instructions for icdiff"
        exit 1
    fi
fi
