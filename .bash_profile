#!/bin/bash 

## Language setting 
export LANG=ko_KR.UTF-8

## Path 
export NVM_DIR=$HOME/.nvm
export M2_HOME=/usr/share/maven
export GRADLE_HOME=$HOME/Environment/tools/gradle
export DART_HOME=$HOME/Environment/tools/dart-sdk
export PLAY_HOME=$HOME/Enviromnent/tools/play
export PATH=$M2_HOME/bin:$HOME/Environment/racket/bin:$HOME/Dropbox/bin:$PATH:$GRADLE_HOME/bin:$DART_HOME/bin:$PLAY_HOME

# use vim syntax in commandline 
set -o vi

# Prompt setting
export PS1='\[$(tput setaf 2)\]\u\[$(tput sgr0)\]@\[$(tput setaf 3)\]\h\[$(tput sgr0)\] \w\[$(tput setaf 5)\]`if [ "$(vcprompt)" != "" ]; then echo " $(vcprompt)"; fi`\[$(tput setaf 2)\]``\[$(tput sgr0)\] \n  '

# ls coloring for OSX Dark background 
export LSCOLORS=dxfxcxdxbxegedabagacad

# bash completion 
source /usr/local/etc/bash_completion

# http://feeds.macosxhints.com/~r/macosxhints/recent/~3/257065700/article.php
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

## nvm 
source ~/.nvm/nvm.sh
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

## specific settings
source ~/.shells/aliases

## shell option 
shopt -s histappend 

## Environment setting 
export HISTSIZE=10000
export HISTFILESIZE=409600
export HISTIGNORE="cd:ls:[bf]g:clear:exit:"
export HISTCONTROL=ignoreups 


