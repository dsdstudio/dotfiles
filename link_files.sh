BASE_DIR=`pwd`
LINK_TARGET_FILES=".bash_profile .gitconfig .shells .vim .vimrc .tmux.conf .emacs.d"
# 미리 정의해놓은 설정파일들 링크 처리
for file_item in $LINK_TARGET_FILES
do
	[ ! -h $HOME/$file_item ] && ln -sf $BASE_DIR/$file_item $HOME/$file_item
done
