#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $DIR != ~/.adamci ]; then
    echo "Repo .adamci must be installed in home directory!"
    exit
fi

source ./identify_os.sh

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
