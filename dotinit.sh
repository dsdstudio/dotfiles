#!/bin/sh 
##################################
# dotfiles initialization script #
# @author dsdgun@gmail.com       #
# @since 2012.12.25              #
##################################

BASE_DIR=$HOME/Dropbox/dotfiles
LINK_TARGET_FILES=".bash_profile .gitconfig .shells .vim .vimrc .tmux.conf .emacs.d/init.el"


# emacs 설정 디렉토리 없는경우 생성
[ ! -d $HOME/.emacs.d ] && mkdir -p $HOME/.emacs.d

# 미리 정의해놓은 설정파일들 링크 처리
for FILE_ITEM in $LINK_TARGET_FILES
do
	[ ! -h $HOME/$FILE_ITEM ] && ln -sf $BASE_DIR/$FILE_ITEM $HOME/$FILE_ITEM
done
