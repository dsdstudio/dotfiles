#!/bin/bash
# 초기화 선행조건 
# Xcode command Line tools

package_install(){
    brew -v update && brew -v install git tmux tree bash bash-completion leiningen tmuxinator-completion the_silver_searcher rbenv fzf
    brew install -v emacs  --with-cocoa --with-imagemagick@6 --with-librsvg
    brew cask install qlmarkdown
    # vcprompt => vcs info shell 표시용 프로그램 같은 옵션으로 설치불가능 
    brew install --HEAD vcprompt 

    ## nvm 
    curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
    . ~/.nvm/nvm.sh && nvm install --lts && nvm alias default node
}

ruby_package_install() {
    ## ruby
    rbenv install 2.4.2
    rbenv global 2.4.2
    rbenv rehash
    ## tmuxinator 설치 tmux 세션 관리용
    gem install tmuxinator
}

link_files() {
    # 미리 정의해놓은 설정파일들 링크 처리
    for file_item in $LINK_TARGET_FILES
    do
	    [ ! -h $HOME/$file_item ] && ln -sf $BASE_DIR/$file_item $HOME/$file_item
    done
}

dialog() {
    local msg
    echo "설정하시겠습니까? [y/N]"
    read msg
    case "$msg" in
        [y,Y]) package_install && ruby_package_install && link_target_files && source .osx;;
        [n,N]) exit -1;;
        *) echo "다시 입력해주세요" && dialog;;
    esac
}
BASE_DIR=`pwd`
LINK_TARGET_FILES=".bash_profile .gitconfig .shells .vim .vimrc .tmux.conf .emacs.d"

dialog
