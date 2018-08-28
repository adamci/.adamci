#! /bin/bash

if [[ ! -a /usr/local/share/antigen/antigen.zsh ]]; then
    if [ $DIST == 1 ]; then
        brew install antigen
    elif [ $DIST == 2 ]; then
        pacaur -S antigen-git
        sudo mkdir -p /usr/local/share/antigen
        sudo ln -s /usr/share/zsh/share/antigen.zsh /usr/local/share/antigen/antigen.zsh
    fi
fi
