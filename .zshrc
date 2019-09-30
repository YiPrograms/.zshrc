## zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e

## compinstall
zstyle :compinstall filename '/home/yi/.zshrc'
zstyle ':completion:*' menu select
zstyle :omz:plugins:ssh-agent agent-forwarding on

export TERM="xterm-256color"


## Aliases
alias ls='ls --color=auto'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias nv='optirun'
alias es='intel-virtual-output -f'


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
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(dir_writable status battery time)
POWERLEVEL9K_BATTERY_ICON=""
POWERLEVEL9K_TIME_BACKGROUND='blue'
POWERLEVEL9K_DIR_HOME_BACKGROUND='orangered1'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='orangered1'
POWERLEVEL9K_DIR_ETC_BACKGROUND='orangered1'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='orangered1'
POWERLEVEL9K_DIR_HOME_FOREGROUND='227'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='227'
POWERLEVEL9K_DIR_ETC_FOREGROUND='227'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='227'
#POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='112'
#POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='gold1'



## zgen
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/ssh-agent
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions

    # bulk load
    zgen loadall <<EOPLUGINS
        zsh-users/zsh-history-substring-search
EOPLUGINS
    # ^ can't indent this EOPLUGINS

    # completions
    zgen load zsh-users/zsh-completions src
    zgen load littleq0903/gcloud-zsh-completion src

    # theme
    # zgen oh-my-zsh themes/arrow
    # save all to init script
    zgen save
fi


autoload -Uz compinit
compinit








