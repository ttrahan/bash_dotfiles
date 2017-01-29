
" PACKAGE MANAGER 
" add runtime path manipulation to Vim
execute pathogen#infect()

" BASICS 
filetype plugin indent on
set encoding=utf-8

" APPEARANCE
set colorcolumn=80
set t_Co=16 " for monrovia 
set background=dark
set termguicolors
colorscheme monrovia
" enable line numbers
set number
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE 
" guifg=DarkGrey guibg=NONE

" SPACING 
" tabs to spaces conversion
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" MAPPING 
" remap the shortcut activation key to the spacebar
let mapleader = ","
" remap the action to leave Insert mode
inoremap jk <ESC>
" create mapping to delete a word with leader+d, doesn't add to register
nnoremap <leader>d "_d

" BUFFERS 
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" make an always visible list of buffers (press Tab on command line)
set wildchar=<Tab> wildmenu wildmode=full

" REGISTERS
" List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

" FILE NAVIGATION
" CtrlP config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_dotfiles = 1
" NERDTree config
let NERDTreeShowHidden=1

" SYNTAX HIGHLIGHTING
syntax enable
" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" enable Python support in Neovim
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
