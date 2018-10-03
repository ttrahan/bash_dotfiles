" PACKAGE MANAGER 
"
" add runtime path manipulation to Vim
execute pathogen#infect()


" BASICS 
set encoding=utf-8
set clipboard=unnamed
set mouse=a
filetype plugin on

" VIM MAPPING DEFAULTS
" remap the shortcut activation key to the comma key
let mapleader = ","
" remap the action to leave Insert mode
inoremap jk <ESC>

" APPEARANCE
set colorcolumn=80
set background=dark
" set t_Co=16 " for monrovia
" set termguicolors
" colorscheme monrovia
" let g:solarized_termcolors=256
colorscheme solarized
" enable line numbers
set number
" set relativenumber
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE 
" guifg=DarkGrey guibg=NONE
" make the statusline visible

" SPACING 
" tabs to spaces conversion
filetype plugin indent on
" wrap indented lines at the indent level
set breakindent
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces, or turn off tab expansion
"set expandtab
set noexpandtab
" set tabstops for particular filetypes
autocmd Filetype yml setlocal tabstop=2 shiftwidth=2
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2
autocmd Filetype pug setlocal tabstop=2 shiftwidth=2

" NAVIGATION
" remap C-w to use leader key
nnoremap <Leader>w <C-W>
" move by virtual lines when no count, physical lines if count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" change default split behavior
set splitbelow
set splitright
" easier split navigation
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
" easier page up/down navigation
" down
nnoremap <Leader>f <C-F>
" up
nnoremap <Leader>b <C-B>

" EDITING
" shortcuts to insert blank line without entering insert mode
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>
" create mapping to delete a word with leader+d, doesn't add to register
nnoremap <leader>d "_d

" BUFFERS 
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" make an always visible list of buffers (press Tab on command line)
set wildchar=<Tab> wildmenu wildmode=full
" leave panes open when closing buffer
" command BD bp|bd #

" REGISTERS
" List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

" FILE NAVIGATION
" CtrlP config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_dotfiles = 1
"let g:ctrlp_prompt_mappings

" " FUGITIVE SETTINGS 
" set statusline+=%{FugitiveStatusline()}

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


" Groovy syntax
au BufNewFile,BufRead *.groovy setf groovy

" COMMENTING
" nerdcommenter config
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCustomDelimiters = { 'yaml': { 'left': '#','leftAlt': '//' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" NERDTree config
let NERDTreeShowHidden=1

" enable Python support in Neovim
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Typescript settings
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost l* nested lwindow
autocmd FileType typescript JsPreTmpl html

" Ragtag settings for xml/xhtml editing
inoremap <M-o> <ESC>o
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
let g:ragtag_global_maps = 1

