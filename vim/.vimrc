
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
set undodir=/home/%WHOAMI%/.vim/undo

" Required for vim-polygot
set nocompatible

" Install and load plugins
execute pathogen#infect()

" Syntax highlighting
syntax enable                  " Turn on syntax highlighting
colorscheme onedark            " Set syntax color scheme
