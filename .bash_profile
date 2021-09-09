#!/bin/bash 
# https://stackoverflow.com/questions/11287564/getting-sed-error-illegal-byte-sequence-in-bash
# illegal byte sequence error 관련 오류
unset LANG
export EDITOR='vim'
OS=""
detect_os() {
	case `uname` in
		Linux) OS="linux" ;;
		Darwin) OS="osx" ;;
		*) OS="unknown" ;;
	esac
}

update_java_home() {
	case $OS in
		osx) export JAVA_HOME=$(/usr/libexec/java_home -v 11) ;;
		*) export JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home' | awk '{print $3}');;
	esac
}

update_prompt() {
	export BASH_SILENCE_DEPRECATION_WARNING=1
	case $OS in
		osx) source ~/Library/Python/3.9/lib/python/site-packages/powerline/bindings/bash/powerline.sh ;;
		*) source $HOME/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh ;;
	esac
}

update_path() {
	export NVM_DIR=$HOME/.nvm
	export ANDROID_HOME=$HOME/Library/Android/sdk
	export PATH=$PATH:$HOME/.local/bin:/opt/homebrew/bin:$HOME/Library/Python/3.9/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
}
update_config() {
# use vim keybinding in commandline 
	set -o vi
# ls coloring for OSX Dark background 
	export LSCOLORS=dxfxcxdxbxegedabagacad
# nvm 
	source ~/.nvm/nvm.sh
# bash completion 
	local COMPLETION_CMD=""
	case $OS in
		osx) COMPLETION_CMD=/opt/homebrew/etc/profile.d/bash_completion.sh;;
		*) COMPLETION_CMD=/usr/local/etc/bash_completion;;
	esac

	[[ -r "$COMPLETION_CMD" ]] && . "$COMPLETION_CMD"

	[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
	if [ -f $HOME/.fzf.bash ]; then
		. $HOME/.fzf.bash
	fi

# known_hosts completion http://feeds.macosxhints.com/~r/macosxhints/recent/~3/257065700/article.php
	complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

## shell aliases
	source $HOME/.shells/aliases

## shell option 
	shopt -s histappend

## Environment setting 
	export HISTSIZE=10000
	export HISTFILESIZE=409600
	export HISTIGNORE="cd:ls:[bf]g:clear:exit:"
	export HISTCONTROL=ignoreups
# https://coderwall.com/p/-k_93g/mac-os-x-valueerror-unknown-locale-utf-8-in-python python tmux 관련 오류 수정
	export LANG=ko_KR.UTF-8
	export LC_ALL=ko_KR.UTF-8
}

detect_os
update_java_home
update_prompt
update_path

