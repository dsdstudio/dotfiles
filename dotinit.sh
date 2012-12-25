#!/bin/sh 
##################################
# dotfiles initialization script #
# @author dsdgun@gmail.com       #
# @since 2012.12.25              #
##################################

# TODO 1. file check routine 
# TODO 2. 이미 파일이 있는경우 처리 루틴 
ln -sf $HOME/Dropbox/dotfiles/.bash_profile $HOME/.bash_profile
ln -sf $HOME/Dropbox/dotfiles/.gitconfig $HOME/.gitconfig
ln -sf $HOME/Dropbox/dotfiles/.shells $HOME/.shells
ln -sf $HOME/Dropbox/dotfiles/.vim $HOME/.vim
ln -sf $HOME/Dropbox/dotfiles/.vimrc $HOME/.vimrc
