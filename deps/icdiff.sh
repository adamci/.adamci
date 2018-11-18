#! /bin/bash

if ! type "icdiff" > /dev/null 2>&1; then
    if [ $DIST == 1 ]; then
        brew install icdiff
    elif [ $DIST == 2 ]; then
        $ARCH_PACMAN -S icdiff
        sudo ln -s /usr/bin/icdiff /usr/local/bin/icdiff
    fi
fi
