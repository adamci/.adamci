#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $DIR != ~/.adamci ]; then
    echo "Repo .adamci must be installed in home directory!"
    exit
fi

# Validate OS
source ./identify_os.sh
if [ "$DIST" = "0" ]; then
    echo $'Unsupported OS\nAborting install_packages.sh!\n'
    exit 1
fi
if [ "$DIST" = "2" ] && ! type $ARCH_PACMAN > /dev/null 2>&1; then
    echo "Install $ARCH_PACMAN before continuing"
    exit 1
fi

# Validate presence of best editor
if [ ! type "vim" > /dev/null 2>&1 ] || [ "$(vim --version | head -1 | cut -d ' ' -f 5 | head -c 1)" -lt "8" ]; then
    echo "Please install vim at version 8 or higher!"
    exit 1
fi

# Install shell dependencies
if [[ ! -a ~/.vim/bundle/Vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi 
if [[ ! -d ~/.config/base16-shell ]]; then
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi

# Create symbolic links
which zsh 2>&1 > /dev/null && ln -vis "${DIR}/.zshrc" ~/.zshrc
which vim 2>&1 > /dev/null && ln -vis "${DIR}/.vimrc" ~/.vimrc
which git 2>&1 > /dev/null && ln -vis "${DIR}/.gitconfig" ~/.gitconfig
which tmux 2>&1 > /dev/null && ln -vis "${DIR}/.tmux.conf" ~/.tmux.conf
which ag 2>&1 > /dev/null && ln -vis "${DIR}/.agignore" ~/.agignore
ln -vis "${DIR}/.ideavimrc" ~/.ideavimrc

# Install vim plugins
vim +PluginUpdate +qa
source ./deps/command-t.sh

# Install apps
source ./deps/antigen.sh
source ./deps/pkgfile.sh
source ./deps/diff-so-fancy.sh
source ./deps/icdiff.sh
source ./deps/ag.sh
source ./deps/tmux.sh
