NVM_DIR=$HOME/.nvm

export M2_HOME=/usr/share/maven
export GRADLE_HOME=$HOME/Environment/tools/gradle
export DART_HOME=$HOME/Environment/tools/dart-sdk
export PATH=$M2_HOME/bin:$HOME/Environment/racket/bin:$HOME/Dropbox/bin:$PATH:$GRADLE_HOME/bin:$DART_HOME/bin
export LANG=ko_KR.UTF-8
set -o vi

export PS1='\[$(tput setaf 2)\]\u\[$(tput sgr0)\]@\[$(tput setaf 3)\]\h\[$(tput sgr0)\] \w\[$(tput setaf 5)\]`if [ "$(vcprompt)" != "" ]; then echo " $(vcprompt)"; fi`\[$(tput setaf 2)\]``\[$(tput sgr0)\] \n  '

source /usr/local/etc/bash_completion

## nvm 
source ~/.nvm/nvm.sh
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

## specific settings
source ~/.shells/aliases

