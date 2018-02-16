#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OS=`uname -s`;

# TODO compile command-t
# TODO compile YouCompleteMe
# TODO Check for correct vim version
# TODO Check that zsh is installed
# TODO Remove use of sudo in this script if possible

# Limit install script to Macintosh or Arch Linux
if [ $OS == "Linux" ]; then
    distribution=`gawk -F= '/^NAME/{print $2}' /etc/os-release`
    if [ "$distribution" == "\"Arch Linux\"" ]; then
        if ! type "pacaur" > /dev/null 2>&1; then
            echo $'Missing dependency: pacaur\nAborting install.sh\n'
            exit 1
        fi
    else
        echo $'Unsupported distribution\nAborting install.sh\n'
        exit 1
    fi
elif [ $OS != "Darwin" ]; then
    echo $'Unsupported OS\nAborting install.sh\n'
    exit 1
fi

# Install shell dependencies
if [[ ! -a ~/.vim/bundle/Vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi 
if [[ ! -d ~/.config/base16-shell ]]; then
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi
if [[ ! -a /usr/local/share/antigen/antigen.zsh ]]; then
    if [ $OS == "Darwin" ]; then
        brew install antigen
    else
        pacaur -S antigen-git
        sudo mkdir -p /usr/local/share/antigen
        sudo ln -s /usr/share/zsh/share/antigen.zsh /usr/local/share/antigen/antigen.zsh
    fi
fi
if [[ $OS == "Linux" ]] && ! type "pkgfile" > /dev/null 2>&1; then
    # pkgfile is required for command-not-found support
    pacaur -S pkgfile
    echo "Updating pkgfile"
    sudo pkgfile -u
    echo "Enabling pkgfile daily update"
    systemctl enable --now pkgfile-update.timer
fi
if ! type "diff-so-fancy" > /dev/null 2>&1; then
    if [ $OS == "Darwin" ]; then
        brew install diff-so-fancy
    else
        pacaur -S diff-so-fancy
    fi
fi
if ! type "icdiff" > /dev/null 2>&1; then
    if [ $OS == "Darwin" ]; then
        brew install icdiff
    else
        pacaur -S icdiff
        sudo ln -s /usr/bin/icdiff /usr/local/bin/icdiff
    fi
fi
if ! type "ag" > /dev/null 2>&1; then
    if [ $OS == "Darwin" ]; then
        brew install the_silver_searcher
    else
        pacaur -S the_silver_searcher
    fi
fi
if ! type "tmux" > /dev/null 2>&1; then
    if [ $OS == "Darwin" ]; then
        brew install tmux
    else
        pacaur -S tmux
    fi
fi

# Create symbolic links
which zsh 2>&1 > /dev/null && ln -vis "${DIR}/.zshrc" ~/.zshrc
which vim 2>&1 > /dev/null && ln -vis "${DIR}/.vimrc" ~/.vimrc
which git 2>&1 > /dev/null && ln -vis "${DIR}/.gitconfig" ~/.gitconfig
which tmux 2>&1 > /dev/null && ln -vis "${DIR}/.tmux.conf" ~/.tmux.conf
which ag 2>&1 > /dev/null && ln -vis "${DIR}/.agignore" ~/.agignore

# Install vim plugins
vim +PluginUpdate +qa
