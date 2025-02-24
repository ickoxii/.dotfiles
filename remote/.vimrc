" Author: Icko Iben
" Date Created: Idk August 2024?
"
" ISSUES
" [001] - netrw opening new buffer
"   netrw opens a new buffer whenever my current buffer is not currently saved

set nocompatible

let mapleader = " "
let maplocalleader = " "

" Normal mode remaps
nnoremap <leader>pv :Ex<CR>
nnoremap j gj
nnoremap k gk

" Visual mode remaps
vnoremap j gj
vnoremap k gk

" Line numbers and relative line numbers
set nu
set rnu

" Set wrapping at 80 characters with light grey color column
set textwidth=80

" Enable sign column to prevent screen from jumping
set signcolumn="yes"

" Better pane splitting (default is up and left)
set splitbelow
set splitright

" Syntax highlighting
syntax on

" Indent using C-style blocks
set autoindent
set smartindent
" set formatoptions="cro"
set cindent

" Treat tabs and indentations like 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Tab indentation for makefiles
autocmd FileType make setlocal noexpandtab

" Incremental searching without highlighting
set incsearch
set nohlsearch

" Ignore case when searching
" set ignorecase

" Highlight all occurrences of a search term
" set hlsearch

" Keep status line at bottom of screen
set laststatus=2

" Better fps (theoretically)
" Increases frequency we write to swap files
set updatetime=50

" Keep 8 lines above/below cursor
set scrolloff=8

" Mouse support (because i can)
set mouse=a

" Best setting of your life
set belloff=all

" Persistent undo's
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Folding
set foldenable
"set foldmethod=syntax
"set foldlevelstart=10
