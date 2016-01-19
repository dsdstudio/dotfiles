#!/bin/bash 

## Language setting 
export LANG=ko_KR.UTF-8

## Path 
export NVM_DIR=$HOME/.nvm
export M2_HOME=$HOME/Environment/tools/mvn
export GRADLE_HOME=$HOME/Environment/tools/gradle
export SCALA_HOME=$HOME/Environment/tools/scala
export ANT_HOME=$HOME/Environment/tools/ant
export ANDROID_HOME=$HOME/Environment/tools/adt/sdk
export PATH=$HOME/.cask/bin:$M2_HOME/bin:$HOME/Environment/racket/bin:$HOME/Dropbox/bin:$PATH:$GRADLE_HOME/bin:$SCALA_HOME/bin:$ANT_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

## Colors 
_green=`tput setaf 2`
_yellow=`tput setaf 3`
_pink=`tput setaf 5`
_sgr0=`tput sgr0`

# use vim syntax in commandline 
set -o vi

# Prompt setting
export PS1='\[${_green}\]\u\[${_sgr0}\]@\[${_yellow}\]\h\[${_sgr0}\] \w\[${_pink}\]`if [ "$(vcprompt)" != "" ]; then echo " $(vcprompt)"; fi`\[${c_g}\]``\[${_sgr0}\] λ '

# ls coloring for OSX Dark background 
export LSCOLORS=dxfxcxdxbxegedabagacad

# bash completion 
source /usr/local/etc/bash_completion

# http://feeds.macosxhints.com/~r/macosxhints/recent/~3/257065700/article.php
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

## nvm 
source ~/.nvm/nvm.sh
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

## for nvm node_path 
NP=$(which node) 
BP=${NP%bin/node} 
LP="${BP}lib/node_modules"
export NODE_PATH=$LP



## specific settings
source ~/.shells/aliases

## shell option 
shopt -s histappend 

## Environment setting 
export HISTSIZE=10000
export HISTFILESIZE=409600
export HISTIGNORE="cd:ls:[bf]g:clear:exit:"
export HISTCONTROL=ignoreups 
