
" remap the action to leave Insert mode
inoremap jk <ESC>

" remap the shortcut activation key to the spacebar
let mapleader = "\<Space>"

" basics
filetype plugin indent on
syntax on
set encoding=utf-8

" add runtime path manipulation to Vim
execute pathogen#infect()

" tabs to spaces conversion
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" enable line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" make an always visible list of buffers (press Tab on command line)
set wildchar=<Tab> wildmenu wildmode=full
