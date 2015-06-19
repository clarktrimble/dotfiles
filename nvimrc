

let mapleader = " "

set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2
set autowrite

set hidden
set scrolloff=3

set hlsearch!

call plug#begin('~/.vim/plugged')
  Plug 'bling/vim-airline'
  Plug 'kien/ctrlp.vim'
	Plug 'fatih/vim-go'
	Plug 'morhetz/gruvbox'
  Plug 'sickill/vim-monokai'
  Plug 'jonathanfilip/vim-lucius'
  Plug  'croaky/vim-colors-github'
  Plug  'tpope/vim-fugitive'
  Plug  'tpope/vim-unimpaired'
"
call plug#end()

"colorscheme lucius
"LuciusDark
colorscheme gruvbox
set background=dark

"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

    let g:airline#extensions#tabline#enabled = 2
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#right_sep = ' '
    let g:airline#extensions#tabline#right_alt_sep = '|'
    let g:airline_left_sep = ' '
    let g:airline_left_alt_sep = '|'
    let g:airline_right_sep = ' '
    let g:airline_right_alt_sep = '|'
    set laststatus=2

set tabstop=2
set shiftwidth=2
set shiftround
""set expandtab

set number
set numberwidth=5

nnoremap <leader><leader> <c-^>

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

set splitbelow
set splitright

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

set diffopt+=vertical

"let g:go_fmt_command = "goimports"

"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"


