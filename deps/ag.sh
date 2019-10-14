#! /bin/bash

if ! type "ag" &> /dev/null; then
    if [ "$DIST" = "1" ]; then
        brew install the_silver_searcher
    elif [ "$DIST" = "2" ]; then
        $ARCH_PACMAN -S the_silver_searcher
    fi
fi
