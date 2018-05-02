#!/bin/bash 
# https://stackoverflow.com/questions/11287564/getting-sed-error-illegal-byte-sequence-in-bash
# illegal byte sequence error 관련 오류
unset LANG
export EDITOR='vim'

## Path 
export NVM_DIR=$HOME/.nvm
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:
export JAVA_HOME=$(/usr/libexec/java_home -v 10)

## Colors 
_red=`tput setaf 1`
_sgr0=`tput sgr0`

# use vim keybinding in commandline 
set -o vi

# Prompt setting
export PS1='\[${_red}\]`if [ "$(vcprompt)" != "" ]; then echo "• $(vcprompt -f %b%m)"; fi`\[${c_g}\]``\[${_sgr0}\] \w λ '

# ls coloring for OSX Dark background 
export LSCOLORS=dxfxcxdxbxegedabagacad

## nvm 
source ~/.nvm/nvm.sh

## rbenv
eval "$(rbenv init -)"
rbenv global 2.4.2
rbenv rehash

# bash completion 
if [ -f /usr/local/etc/bash_completion ]; then
	. /usr/local/etc/bash_completion
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
export LANG=ko_KR.UTF-8
