#!/bin/bash
# 초기화 선행조건 
# Xcode command Line tools

NODE_VERSION=v6.2.2
NVM_DIR=~/.nvm

brew update && brew install git tmux tree bash bash-completion leiningen
# vcprompt => vcs info shell 표시용 프로그램 같은 옵션으로 설치불가능 
brew install --HEAD vcprompt 

## nvm 
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
. ~/.nvm/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION

# Mac Keybindings for Home, end, pageup pagedown 
mkdir -p ~/Library/KeyBindings/
echo " {
	\"\UF729\" = \"moveToBeginningOfLine:\";
	\"$\UF729\" = \"moveToBeginningOfLineAndModifySelection:\";
	\"\UF72B\" = \"moveToEndOfLine:\";
	\"$\UF72B\" = \"moveToEndOfLineAndModifySelection:\";
	\"\UF72C\" = \"pageUp:\";
	\"\UF72D\" = \"pageDown:\";
}" > ~/Library/KeyBindings/DefaultKeyBinding.dict
