#!/bin/bash

if ! type "cmake" &> /dev/null; then
    if [ "$DIST" = "1" ]; then
        brew install cmake 
    elif [ "$DIST" = "2" ]; then
        $ARCH_PACMAN -S cmake
    fi
fi

if ! type "go" &> /dev/null; then
    if [ "$DIST" = "1" ]; then
        brew install go
    elif [ "$DIST" = "2" ]; then
        $ARCH_PACMAN -S go
    fi
fi

cd ~/.vim/bundle/YouCompleteMe
python3 ./install.py --all
cd $DIR
