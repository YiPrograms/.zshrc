# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/yi/.zshrc'
zstyle ':completion:*' menu select

export TERM="xterm-256color"

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ls='ls --color=auto'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

c() {
    echo "\n===Complie Started==="
    g++ -std=c++11 -O2 -fsanitize=undefined -Wall -Wextra -Wshadow -o "${1%.*}.o" "$1"
    echo "===Compile Finished===\n"
    echo "=====Run====="
    ./${1%.*}.o
}

x() {
    echo "\n=====Run====="
    ./${1%.*}.o
}


source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(dir_writable status battery time)
POWERLEVEL9K_BATTERY_ICON=""

source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions

    # bulk load
    zgen loadall <<EOPLUGINS
        zsh-users/zsh-history-substring-search
        /path/to/local/plugin
EOPLUGINS
    # ^ can't indent this EOPLUGINS

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    # zgen oh-my-zsh themes/arrow
    # save all to init script
    zgen save
fi
