call plug#begin()

" Language Server Protocol
Plug 'mattn/vim-lsp-settings', { 'commit': '33ad6db' }
Plug 'prabirshrestha/asyncomplete-lsp.vim', { 'commit': 'cc5247b' }
Plug 'prabirshrestha/asyncomplete.vim', { 'commit': '9c76518'  }
Plug 'prabirshrestha/vim-lsp', { 'commit': 'e82e73a' }

" Bufferline
Plug 'bling/vim-bufferline', { 'commit': '651fd01' }

" AI autocompletion (codeium)
Plug 'Exafunction/codeium.vim', { 'commit': '41b718e' }

call plug#end()

" Line numbers
set number

" Disable Ex mode
noremap Q <nop>

" Tab complete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"


" Preview Window
 " let g:asyncomplete_auto_completeopt = 0 " disable auto popup
set completeopt=menuone,noinsert,noselect,preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" File explorer side pane
let g:netrw_winsize = 12
let g:netrw_banner = 0
let g:netrw_liststyle = 3
autocmd VimEnter * Lexplore .

" Terminal bottom pane
" set termwinsize=15x0
" autocmd VimEnter * botright terminal
" ^^ Use ctrl+z from normal mode and go back with 'fg' instead

" Autoload file changes (undo with 'u')
set autoread

" Backspace through anything in insert mode
set backspace=indent,eol,start

" Make buffers behave more like tabs
set hidden
noremap gl :bnext!<CR>
noremap gh :bprevious!<CR>
noremap gd :bdelete!<CR>

" The souls of a thousand nerds torment me as I make the mouse more useful
set mouse=a

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

" F5 to compile and run simple C programs
autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc '.shellescape('%').' -lm -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

" Color scheme
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also https://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif

set t_8f=[38;2;%lu;%lu;%lum        " set foreground color
set t_8b=[48;2;%lu;%lu;%lum        " set background color
set background=light
set termguicolors
set t_Co=256
colorscheme melange

" Save swap and undo and backup files in separate directory
set directory=$HOME/.vim/swapfiles//
set backupdir=$HOME/.vim/backups//

