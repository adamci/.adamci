#! /bin/bash

if ! type "ag" &> /dev/null; then
    if [ "$DIST" = "1" ]; then
        brew install the_silver_searcher
    elif [ "$DIST" = "2" ]; then
        $ARCH_PACMAN -S the_silver_searcher
    elif [ "$DIST" = "4" ]; then
        dnf install the_silver_searcher
    else
        echo "No insturctions for silver searcher"
        exit 1
    fi
fi
