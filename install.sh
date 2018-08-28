#!/bin/bash

# Currently supported:
# 1: Macintosh
# 2: Arch Linux
# 3: Centos

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OS=`uname -s`
DIST=0

if [ $OS == "Darwin" ]; then
    DIST=1
elif [ $OS == "Linux" ]; then
    distribution=`gawk -F= '/^NAME/{print $2}' /etc/os-release`
    if [ "$distribution" == "\"Arch Linux\"" ]; then
        DIST=2
    elif [ "$distribution" == "\"CentOS Linux\"" ]; then
        DIST=3
    fi
fi

if [ $DIST == 0 ]; then
    echo $'Unsupported OS\nAborting install_packages.sh!\n'
    exit 1
fi
if [ $DIST == 2 ] && ! type pacaur > /dev/null 2>&1; then
    echo "Install pacaur before continuing"
    exit 1
fi

# Install shell dependencies
if [[ ! -a ~/.vim/bundle/Vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi 
if [[ ! -d ~/.config/base16-shell ]]; then
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi

source ./deps/antigen.sh
source ./deps/pkgfile.sh
source ./deps/diff-so-fancy.sh
source ./deps/icdiff.sh
source ./deps/ag.sh
source ./deps/tmux.sh

# Create symbolic links
which zsh 2>&1 > /dev/null && ln -vis "${DIR}/.zshrc" ~/.zshrc
which vim 2>&1 > /dev/null && ln -vis "${DIR}/.vimrc" ~/.vimrc
which git 2>&1 > /dev/null && ln -vis "${DIR}/.gitconfig" ~/.gitconfig
which tmux 2>&1 > /dev/null && ln -vis "${DIR}/.tmux.conf" ~/.tmux.conf
which ag 2>&1 > /dev/null && ln -vis "${DIR}/.agignore" ~/.agignore
ln -vis "${DIR}/.ideavimrc" ~/.ideavimrc

# Install vim plugins
vim +PluginUpdate +qa
