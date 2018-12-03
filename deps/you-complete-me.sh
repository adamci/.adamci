#!/bin/bash

if [ ! type "cmake" > /dev/null 2>&1 ]; then
    if [ "$DIST" = "1" ]; then
        brew install cmake 
    elif [ "$DIST" = "2" ]; then
        $ARCH_PACMAN -S cmake
    fi
fi

cd ~/.vim/bundle/YouCompleteMe
./install.py --all
cd $DIR
