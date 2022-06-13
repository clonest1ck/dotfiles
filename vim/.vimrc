
" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Run clang-tidy on save
function! Formatonsave()
  let l:formatdiff = 1
  py3file /usr/share/clang/clang-format-10/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

" Tabs and spaces
set shiftwidth=2          " 1 level of indentation = 2 characters [spaces]
set tabstop=2             " Read <TAB> character as 2 spaces
set softtabstop=2         " IF using tabs, 1 <TAB> = 2 spaces
set expandtab             " Use spaces for indentation
filetype plugin indent on " load indentation files 

" Editor settings
set number                " enable line numbers

" Undo between runs
set undofile
set undodir=/home/anton/.vim/undo

" Required for vim-polygot
set nocompatible

" Install and load plugins
execute pathogen#infect()

" Syntax highlighting
syntax enable                  " Turn on syntax highlighting
colorscheme onedark            " Set syntax color scheme

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'ycm-core/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
