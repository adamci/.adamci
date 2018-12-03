#!/bin/bash

if ! grep -q "+ruby" <(vim --version); then
    echo "Vim version must support ruby!"
    exit 1
fi

if [ ! type "ruby" > /dev/null 2>&1 ]; then
    if [ "$DIST" = "1" ]; then
        brew install ruby
    elif [ "$DIST" = "2" ]; then
        $ARCH_PACMAN -S ruby
    fi
fi

cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t
ruby extconf.rb
make
cd $DIR