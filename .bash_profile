#!/bin/bash 

## Language setting 
export LANG=ko_KR.UTF-8

## Path 
export NVM_DIR=$HOME/.nvm
export M2_HOME=$HOME/Environment/tools/mvn
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$HOME/.cask/bin:$M2_HOME/bin:$HOME/Dropbox/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

## Colors 
_green=`tput setaf 2`
_yellow=`tput setaf 3`
_pink=`tput setaf 5`
_red=`tput setaf 1`
_sgr0=`tput sgr0`

# use vim syntax in commandline 
set -o vi

# Prompt setting
export PS1='\[${_red}\]`if [ "$(vcprompt)" != "" ]; then echo "• $(vcprompt -f %b%m)"; fi`\[${c_g}\]``\[${_sgr0}\] \w λ '

# ls coloring for OSX Dark background 
export LSCOLORS=dxfxcxdxbxegedabagacad

## nvm 
source ~/.nvm/nvm.sh

# bash completion 
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# http://feeds.macosxhints.com/~r/macosxhints/recent/~3/257065700/article.php
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh


## for nvm node_path 
NP=$(which node) 
BP=${NP%bin/node} 
LP="${BP}lib/node_modules"
export NODE_PATH=$LP


# bash powerline
if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then
   	source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
fi

## specific settings
source ~/.shells/aliases

## shell option 
shopt -s histappend 

## Environment setting 
export HISTSIZE=10000
export HISTFILESIZE=409600
export HISTIGNORE="cd:ls:[bf]g:clear:exit:"
export HISTCONTROL=ignoreups 
