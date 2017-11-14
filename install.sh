#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Install base16 clone
if [[ ! -d ~/.config/base16-shell ]]; then
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi
# Install command-not-found
if ! type "command-not-found" > /dev/null 2>&1; then
    brew tap homebrew/command-not-found
fi
# Install diff-so-fancy
if ! type "diff-so-fancy" > /dev/null 2>&1; then
    brew install diff-so-fancy
fi
# Install icdiff
if ! type "icdiff" > /dev/null 2>&1; then
    brew install icdiff
fi
# Install ag
if ! type "ag" > /dev/null 2>&1; then
    brew install the_silver_searcher
fi

# Create symbolic links
which zsh 2>&1 > /dev/null && ln -vis "${DIR}/.zshrc" ~/.zshrc
which vim 2>&1 > /dev/null && ln -vis "${DIR}/.vimrc" ~/.vimrc
which git 2>&1 > /dev/null && ln -vis "${DIR}/.gitconfig" ~/.gitconfig
which tmux 2>&1 > /dev/null && ln -vis "${DIR}/.tmux.conf" ~/.tmux.conf
which ag 2>&1 > /dev/null && ln -vis "${DIR}/.agignore" ~/.agignore

# TODO Check for correct vim version
# Install vundle
if [[ ! -a ~/.vim/bundle/Vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi 
# Install vim plugins
vim +PluginUpdate +qa
# TODO compile command-t
# TODO compile YouCompleteMe
