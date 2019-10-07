#!/bin/bash

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

# fix long line entry wrapping in bash
shopt -s checkwinsize

export PATH
unset USERNAME

PATH=$PATH:~/devtools/arcanist/bin

# I need to know is it running on Linux or on my Mac
platform='unknown'
osname=$(uname)
if [[ "${osname}" == 'Linux' ]]; then
    platform='linux'
elif [[ "${osname}" == 'Darwin' ]]; then
    platform='darwin'
fi

# Make the ls colorful
if [[ "${platform}" == 'darwin' ]]; then
    # Note: install coreutils before running this.
    # brew install coreutils
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    alias ls="ls -G"
elif [[ "${platform}" == 'linux' ]]; then
    alias ls="ls --color=auto"
fi

# Prompt
# Copy and revise from:
#   https://github.com/necolas/dotfiles

prompt_source_control() {
    local branchName=""

    # check if the current directory is in a git repo
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; printf "%s" $?) == 0 ]; then

        # get the short symbolic ref
        # if HEAD isn't a symbolic ref, get the short SHA
        # otherwise, just give up
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
                      git rev-parse --short HEAD 2> /dev/null || \
                      printf "(unknown)")"

        printf "%s" "$1$branchName"

    else
        # Show the current bookmark
        if [ -f /usr/share/scm/scm-prompt.sh ]; then
            source /usr/share/scm/scm-prompt.sh
        fi
        if [ -f /opt/fbhg/share/scm/scm-prompt.sh ]; then
            source /opt/fbhg/share/scm/scm-prompt.sh
        fi
        if [ -f /opt/facebook/hg/share/scm-prompt.sh ]; then
            source /opt/facebook/hg/share/scm-prompt.sh
        fi
        printf "%s" "$1$(_scm_prompt)"
    fi

}

set_prompts() {
    local black=$(tput setaf 0)
    local blue=$(tput setaf 33)
    local bold=$(tput bold)
    local cyan=$(tput setaf 37)
    local green=$(tput setaf 64)
    local orange=$(tput setaf 166)
    local purple=$(tput setaf 125)
    local red=$(tput setaf 124)
    local reset=$(tput sgr0)
    local white=$(tput setaf 15)
    local yellow=$(tput setaf 136)

    local hostStyle="\[$yellow\]"
    local userStyle="\[$orange\]"

    # set the terminal title
    #PS1="\[\033]0;\w\007\]"

    PS1="\[$userStyle\]\u"
    PS1+="\[$reset$white\]@"
    PS1+="\[$hostStyle\]\h"
    PS1+="\[$reset$white\]: "
    PS1+="\[$green\]\w"
    PS1+="\$(prompt_source_control \"$white on $cyan\")"
    PS1+="\n"
    PS1+="\[$reset$white\]\$ \[$reset\]"

    export PS1
}

set_prompts
unset set_prompts

# Set number of lines in history
HISTSIZE=200
HISTFILESIZE=200
