#!/bin/bash
# 초기화 선행조건 
# Xcode command Line tools

NODE_VERSION=0.10.32
NVM_DIR=~/.nvm

## HomeBrew Base configurations 
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

brew update && brew install git tmux mysql tree nginx bash bash-completion mercurial phantomjs mobile-shell clojure leiningen
# vcprompt => vcs info shell 표시용 프로그램 같은 옵션으로 설치불가능 
brew install --HEAD vcprompt 

## nvm 
(curl https://raw.github.com/creationix/nvm/master/install.sh | sh) || (wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh)

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
