#!/bin/bash
# 초기화 선행조건 
# Xcode command Line tools

NODE_VERSION=0.8.16
NVM_DIR=~/.nvm

## HomeBrew Base configurations 
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

brew install git tmux mysql tree nginx bash bash-completion mercurial 
# vcprompt => vcs info shell 표시용 프로그램 같은 옵션으로 설치불가능 
brew install --HEAD vcprompt 

## nvm 
(curl https://raw.github.com/creationix/nvm/master/install.sh | sh) || (wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh)

. ~/.nvm/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION
