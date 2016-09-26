set runtimepath^=~/.vim/bundle/ctrlp.vim

set nocompatible                " be iMproved
filetype off                    " required!
let mapleader=","               " change the leader to be a comma vs slash
set laststatus=2                " Always show the statusline
set encoding=utf-8              " Necessary to show Unicode glyphs
set hidden                      " makes vim work like every other multiple-file editor
set title                       " show title in console title bar
set number                      " Display line numbers
set numberwidth=1               " using only 1 column (and 1 space) while possible
set wildmenu                    " Menu completion in command mode on <Tab>
set wildmode=list:longest,full  " <Tab> cycles between all matching choices.
set ruler                       " show the cursor position all the
set backspace=indent,eol,start  " Allow backspacing over autoindent, EOL, and BOL

set autoindent                  " always set autoindenting on
set smartindent                 " use smart indent if there is no indent file
filetype plugin indent on       " get current file indentation

set tabstop=4                   " <tab> inserts 4 spaces
set shiftwidth=4                " but an indent level is 2 spaces wide.
set softtabstop=4               " <BS> over an autoindent deletes both spaces.
set expandtab                   " Use spaces, not tabs, for autoindent/tab key.

set ruler

:retab

set shiftround                  " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>             " show matching <> (html mainly) as well
set lazyredraw                  " do not redraw while running macros (muchfaster) (LazyRedraw)
set textwidth=80                " used by gqq or <VISUAL>gq command to format lines PEP8 :D

nnoremap R "_d                  " remove default behaviour of copy with d
nnoremap R "_dd                 " remove default behaviour of copy with dd

set buftype: ""                 " remove buf shit

set noswapfile

syntax on

set ffs=unix,dos                  " removing 0xD as ^M

set nu                            " Display number of lines
set hlsearch                      " highlight patterns

highlight Normal ctermfg=grey ctermbg=Black
nnoremap <silent> <C-l> :nohl<CR><C-l>              " ctrl + l unhighlight


" ctrl + r for replace shortcut
vnoremap <C-r> "hy:.,$s/<C-r>h//gc<left><left><left>

"set autochdir
"autocmd BufEnter * silent! lcd %:p:h "same as autochdir but with exceptions to run some plugins

set clipboard=Unnamed
set go+=a
set paste  "allow pasting on terminal at insert mode"

