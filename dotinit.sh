#!/bin/sh 
##################################
# dotfiles initialization script #
# @author dsdgun@gmail.com       #
# @since 2012.12.25              #
##################################

BASE_DIR=`pwd`
LINK_TARGET_FILES=".bash_profile .gitconfig .shells .vim .vimrc .tmux.conf .emacs.d"

link_files() {
    # 미리 정의해놓은 설정파일들 링크 처리
    for file_item in $LINK_TARGET_FILES
    do
	    [ ! -h $HOME/$file_item ] && ln -sf $BASE_DIR/$file_item $HOME/$file_item
    done
}
link_files
