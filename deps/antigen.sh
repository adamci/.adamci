#!/bin/bash

if [ ! -f /usr/local/share/antigen/antigen.zsh ]; then
    if [ "$DIST" = "1" ]; then
        brew install antigen
    elif [ "$DIST" = "2" ]; then
        $ARCH_PACMAN -S antigen-git
        sudo mkdir -p /usr/local/share/antigen
        sudo ln -s /usr/share/zsh/share/antigen.zsh /usr/local/share/antigen/antigen.zsh
    elif [ "$DIST" = "4" ]; then
        cd /tmp
        sudo curl -L git.io/antigen > antigen.zsh
        sudo mkdir -p /usr/local/share/antigen
        sudo cp antigen.zsh /usr/local/share/antigen
        cd $DIR
    else
        echo "No instructions for installing antigen"
        exit 1
    fi
fi
