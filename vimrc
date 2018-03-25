set nocompatible
set number
set nowrap

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'scrooloose/nerdtree' 
  Plugin 'kien/ctrlp.vim'
  
  Plugin 'altercation/vim-colors-solarized'
call vundle#end()           
filetype plugin indent on

"nerdtree
autocmd vimenter * NERDTree
map <C-l> :NERDTreeToggle<CR>


"solarized
syntax enable

set t_Co=256
set background=dark
if !has('gui_running')
  let g:solarized_termcolors=&t_Co
  let g:solarized_termtrans=1
endif
colorscheme solarized

