set nocompatible 
set cindent     
set smartindent 
set nobackup	
set incsearch		" do incremental searching
set showmatch	        " see matches on {} and ()
set formatoptions=croq		
set comments=sr:/*,mb:*,el:*/,://,b:#,:%L%,:%l%,:%,:XCOMM,n:>,fb:- " comentarios
set ruler 
set visualbell 
set bs=2		" allow backspacing over everything in insert mode
set background=dark 
set sw=4
set ts=4 	
set nu	
set hlsearch	
set wrap
set history=1000 
set undolevels=1000 
set fencs=ucs-bom,utf-8,euc-kr.latin1 
set fileencoding=utf-8 
set tenc=utf-8	
set linebreak
" set expandtab	


colorscheme desert 
syntax on


" powerline settings
language en_US.UTF-8
let g:Powerline_symbols = 'fancy'
set laststatus=2


" vundle settings
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-pathogen.git'
Bundle 'Lokaltog/vim-powerline.git'


Bundle 'L9'
Bundle 'FuzzyFinder'

filetype plugin indent on     " required!

" pathogen setting 
runtime bundle/vim-pathogen/autoload/pathogen.vim
