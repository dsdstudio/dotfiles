set nocompatible 
set cindent     
set smartindent 
set smarttab
set nobackup	
set incsearch		" do incremental searching
set showmatch	        " see matches on {} and ()
set formatoptions=croq		
set comments=sr:/*,mb:*,el:*/,://,b:#,:%L%,:%l%,:%,:XCOMM,n:>,fb:- " comentarios
set ruler 
set visualbell " 부저 대신 화면 빤짝이 
set bs=2		" allow backspacing over everything in insert mode
set background=dark 
set sw=4 " << >> 눌렀을때 몇칸 이동할꺼냐 ?
set ts=4 
set sts=4 " 탭키 눌렀을때 몇칸 이동할꺼냐 ?
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

" Bubbling Text http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> [e
nmap <C-Down> ]e

vmap <C-Up> [egv
vmap <C-Down> ]egv

colorscheme desert 
syntax on


" powerline settings
language en_US.UTF-8
set laststatus=2
set rtp+=~/Library/Python/3.6/lib/python/site-packages/powerline/bindings/vim/

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Meslo\ LG\ S\ for\ Powerline
   endif
endif

" vundle settings
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'pangloss/vim-javascript'
Plugin 'L9'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'isRuslan/vim-es6'
Plugin 'SilVer/ultisnips'
call vundle#end()

filetype plugin indent on     " required!
