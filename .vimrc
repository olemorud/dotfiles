" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Case insensitive search
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Adjust tab size
set tabstop=4
set shiftwidth=4

" F5 to compile and run C programs
autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc '.shellescape('%').' -lm -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

" Color scheme
set background=light
set termguicolors
colorscheme melange

" Save swap and undo and backup files in separate directory
set directory=$HOME/.vim/swapfiles//
set backupdir=$HOME/.vim/backups//
