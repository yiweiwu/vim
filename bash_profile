#!/bin/bash

PATH=$PATH:~/devtools/arcanist/bin

# added by setup_fb4a.sh
export ANDROID_SDK=/opt/android_sdk
export ANDROID_NDK_REPOSITORY=/opt/android_ndk
export ANDROID_HOME=${ANDROID_SDK}
export PATH=${PATH}:${ANDROID_SDK}/tools:${ANDROID_SDK}/platform-tools

# I need to know is it running on Linux
# or on my Mac
platform='unknown'
osname=$(uname)
if [[ "${osname}" == 'Linux' ]]; then
    platform='linux'
elif [[ "${osname}" == 'Darwin' ]]; then
    platform='darwin'
fi

# Make the ls colorful
if [[ "${platform}" == 'darwin' ]]; then
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
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
        if [ -f /opt/facebook/share/scm-prompt ]; then
            source /opt/facebook/share/scm-prompt
            if [[ -n $(_dotfiles_scm_info) ]]; then
                printf "%s" "$1$(_dotfiles_scm_info)"
            fi
        fi
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
