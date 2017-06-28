#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# TODO install base16 clone
#git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
# TODO install command-not-found
#brew tap homebrew/command-not-found
# TODO install diff-so-fancy
# TODO install icdiff

# Create symbolic links
which zsh 2>&1 > /dev/null && ln -vis "${DIR}/.zshrc" ~/.zshrc
which vim 2>&1 > /dev/null && ln -vis "${DIR}/.vimrc" ~/.vimrc
which git 2>&1 > /dev/null && ln -vis "${DIR}/.gitconfig" ~/.gitconfig
which tmux 2>&1 > /dev/null && ln -vis "${DIR}/.tmux.conf" ~/.tmux.conf

# TODO install vundle
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# TODO install vim plugins
#vim +PluginInstall
# TODO compile command-t
# TODO compile YouCompleteMe
