#!/bin/bash

# Make the ls colorful
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Prompt
# Copy and revise from:
#   https://github.com/necolas/dotfiles

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
    PS1+="\n"
    PS1+="\[$reset$white\]\$ \[$reset\]"

    export PS1
}

set_prompts
unset set_prompts
