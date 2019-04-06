## zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e

## compinstall
zstyle :compinstall filename '/home/yi/.zshrc'
zstyle ':completion:*' menu select

export TERM="xterm-256color"

autoload -Uz compinit
compinit

## Aliases
alias ls='ls --color=auto'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

## C++ complie functions
c() { # Compile
    if [[ -n "$1" ]]
    then 
        cf="${1%.*}"
    fi
    echo "\n===Compiling [$cf.cpp]==="
    g++ -std=c++11 -O2 -fsanitize=undefined -Wall -Wextra -Wshadow -o "$cf.o" "$cf.cpp"
    echo "===Compile Finished==="
}

x() { # Run
    if [[ -n "$1" ]]
    then 
        cf="${1%.*}"
    fi
    if [ -f "$cf.i" ]
    then
        echo "\n===Running [$cf.o] < [$cf.i]==="
        ./$cf.o < $cf.i
    else
         echo "\n===Running [$cf.o]==="
        ./$cf.o
    fi
}

cx() { # Compile & Run
    c $1
    x $1
}

## Powerlevel9k
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
#POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(dir_writable status battery time)
#POWERLEVEL9K_BATTERY_ICON=""


## zgen
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
EOPLUGINS
    # ^ can't indent this EOPLUGINS

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    # zgen oh-my-zsh themes/arrow
    # save all to init script
    zgen save
fi
