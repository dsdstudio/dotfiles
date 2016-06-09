#!/bin/sh 
##################################
# dotfiles initialization script #
# @author dsdgun@gmail.com       #
# @since 2012.12.25              #
##################################

# TODO 1. file check routine 
# TODO 2. 이미 파일이 있는경우 처리 루틴 

BASE_DIR=$HOME/Dropbox/dotfiles

ln -sf $BASE_DIR/.bash_profile $HOME/.bash_profile
ln -sf $BASE_DIR/.gitconfig $HOME/.gitconfig
ln -sf $BASE_DIR/.shells $HOME/.shells
ln -sf $BASE_DIR/.vim $HOME/.vim
ln -sf $BASE_DIR/.vimrc $HOME/.vimrc
ln -sf $BASE_DIR/.tmux.conf $HOME/.tmux.conf
