#!/bin/bash
# 초기화 선행조건 
# Xcode command Line tools
OS=""
BASE_DIR=`pwd`

link_files() {
	local LINK_TARGET_FILES=".bash_profile .gitconfig .shells .vim .vimrc .tmux.conf .emacs.d"
    # 미리 정의해놓은 설정파일들 링크 처리
    for file_item in $LINK_TARGET_FILES
    do
	    [ ! -h $HOME/$file_item ] && ln -sf $BASE_DIR/$file_item $HOME/$file_item
    done
}

detect_os() {
	case `uname` in
		Linux) OS="linux" ;;
		Darwin) OS="osx" ;;
		*) OS="unknown" ;;
	esac
}

package_install_osx() {
    brew -v update && brew -v install git tmux tree bash bash-completion clojure the_silver_searcher rbenv fzf
    brew install -v emacs  --with-cocoa --with-imagemagick@6 --with-librsvg
    brew cask install qlmarkdown

    ## nvm 
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
    . ~/.nvm/nvm.sh && nvm install --lts && nvm alias default node
}
package_install_linux() {
    sudo apt-get install -yy tmux openjdk-11-jdk curl tree rbenv
    ## nvm 
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
}

setup() {
	detect_os
	if [ -L "$HOME/.gitconfig" ]; then
		echo "이미 설정되어있습니다."
		exit -1
	fi
	eval "package_install_$OS" && link_files
	case "$OS" in
	   linux) ;;
	   osx) source .osx;;
	   *) ;;
	esac

}

dialog() {
    local msg
    echo "설정하시겠습니까? [y/N]"
    read msg
    case "$msg" in
        [y,Y]) setup ;;
        [n,N]) exit -1;;
        *) echo "다시 입력해주세요" && dialog;;
    esac
}

dialog
