#! /bin/bash

if ! type "ag" > /dev/null 2>&1; then
    if [ $DIST == 1 ]; then
        brew install the_silver_searcher
    elif [ $DIST == 2 ]; then
        pacaur -S the_silver_searcher
    fi
fi
