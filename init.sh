#!/bin/bash
# 초기화 선행조건 
# Xcode command Line tools

NODE_VERSION=v8.11.2
NVM_DIR=~/.nvm

brew update && brew install git tmux tree bash bash-completion leiningen tmuxinator-completion the_silver_searcher rbenv fzf
brew cask install qlmarkdown

defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder

# vcprompt => vcs info shell 표시용 프로그램 같은 옵션으로 설치불가능 
brew install --HEAD vcprompt 

## nvm 
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
. ~/.nvm/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION

## ruby
rbenv install 2.4.2
rbenv global 2.4.2
rbenv rehash

## tmuxinator 설치 tmux 세션 관리용
gem install tmuxinator

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
