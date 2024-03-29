source ~/.adamci/identify_os.sh

# Load local settings
if [ -f ~/.zshlocal ]; then
    source ~/.zshlocal
fi


# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 2 numeric
zstyle :compinstall filename "${HOME}/.zshrc"
autoload -Uz compinit
compinit

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=6000
SAVEHIST=6000
setopt appendhistory autocd
bindkey -v

# Misc settings
export TERM="xterm-256color"
mkdir -p ~/.vim/undodir
stty -ixon -ixoff

# Base16
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_ocean

#########################
##### Antigen begin #####
source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Install bundles 
antigen bundle git
antigen bundle node
antigen bundle npm
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle docker
if [ "$DIST" = "1" ]; then
    antigen bundle macos
fi

# Load the theme.
antigen theme wedisagree

# Tell Antigen that you're done.
antigen apply
###### Antigen end ######
#########################

# Aliases
alias gs='git status'
alias gl='git log --graph --left-right --format="%Cgreen%h %Cblue%an %Creset%s %Cred%d%Creset"'
alias ls='ls -GF'
alias la='ls -lAh'
alias mv='mv -i'
alias cp='cp -i'
alias f='find . -name'
alias fcount='for file in *; do echo "`find $file -type f | wc -l` $file"; done'

function manifest() {
    unzip -p $1 META-INF/MANIFEST.MF
}

# Colorful man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}
