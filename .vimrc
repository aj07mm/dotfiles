set nocompatible                " be iMproved
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

set tabstop=4                   " <tab> inserts 4 spaces
set shiftwidth=4                " but an indent level is 2 spaces wide.
set softtabstop=4               " <BS> over an autoindent deletes both spaces.
set expandtab                   " Use spaces, not tabs, for autoindent/tab key.
set modifiable                  " set modifiable for argdo replace
set autowriteall                " changed buffers are automatically saved when required
set ruler

set shiftround                  " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>             " show matching <> (html mainly) as well
set lazyredraw                  " do not redraw while running macros (muchfaster) (LazyRedraw)
set textwidth=80                " used by gqq or <VISUAL>gq command to format lines PEP8 :D

nnoremap R "_d                  " remove default behaviour of copy with d
nnoremap R "_dd                 " remove default behaviour of copy with dd

set buftype: ""                 " remove buf shit

set noswapfile

set term=builtin_beos-ansi
filetype plugin indent on       " get current file indentation
syntax on

set ffs=unix,dos                  " removing 0xD as ^M

set nu                            " Display number of lines
set hlsearch                      " highlight patterns
set autoread                      " Automatically refresh changed files
set modifiable                    " make a buffer modifiable

highlight Normal ctermfg=grey ctermbg=Black
nnoremap <silent> <C-l> :nohl<CR><C-l>              " ctrl + l unhighlight

" ctrl + r for replace shortcut
vnoremap <C-r> "hy:.,$s/<C-r>h//gc<left><left><left>

"set autochdir
autocmd BufEnter * silent! lcd %:p:h "same as autochdir but with exceptions to run some plugins

set clipboard^=unnamed
" set go+=a
set paste  "allow pasting on terminal at insert mode"

" fuzzy again to refresh
" reload all opened files pressing F5
nmap <F5> :tabdo windo edit<CR>
nnoremap <c-p> :GitFiles<cr>
nnoremap <c-t> :Tags<cr>
nnoremap <c-a> :Ag <C-r><CR>
" nnoremap <c-b> :Buffers<cr>
nnoremap <c-k> :Marks<cr>

execute pathogen#infect()

" 80-th column limit
set textwidth=79
set colorcolumn=+1
highlight ColorColumn term=reverse cterm=reverse gui=reverse

set makeprg=python\ %

" removing whitespaces on :w
autocmd BufWritePre * %s/\s\+$//e

" skipping backpup tmp vim
set backupskip=/tmp/*,/private/tmp/*"

" webpack https://webpack.github.io/docs/troubleshooting.html
set backupcopy=yes

" more colors!
let &t_Co=256
set t_Co=256

" The Silver Searcher configs https://github.com/mileszs/ack.vim
" let g:ag_prg="ag --vimgrep"
let g:ag_working_path_mode="r"

"Ag word under the cursor
noremap <leader>a :Ag! -Q <C-r>=expand('<cword>')<CR>
" noremap <leader>A :Ag  <C-r><CR>

noremap <leader>s :%!sqlformat --reindent --keywords upper --identifiers lower -<CR>

" reload all opened files pressing F5
nmap <F5> :tabdo windo edit<CR>

" ----------------------------------------------------------------
" lint
" let g:syntastic_mode_map = { 'mode': 'active',
"                             \ 'active_filetypes': ['python', 'javascript'],
"                             \ 'passive_filetypes': [] }

" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_javascript_checkers = ['eslint']
"
" let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
" if matchstr(local_eslint, "^\/\\w") == ''
"     let local_eslint = getcwd() . "/" . local_eslint
" endif
" if executable(local_eslint)
"     let g:syntastic_javascript_eslint_exec = local_eslint
" endif

" ----------------------------------------------------------------

" STATUSLINE

" set statusline=
" set statusline +=%2*/%L%*               "total lines
" set statusline +=%1*\ %n\ %*            "buffer number
" set statusline +=%5*%{&ff}%*            "file format
" set statusline +=%3*%y%*                "file type
" set statusline +=%4*\ %<%F%*            "full path
" set statusline +=%2*%m%*                "modified flag
" set statusline +=%1*%=%5l%*             "current line
" set statusline +=%1*%4v\ %*             "virtual column number
" set statusline +=%2*0x%04B\ %*          "character under cursor

" dunno what laststatus does :/
set laststatus=2

"These are to cancel the default behavior of d, D, c, C
"  to put the text they delete in the default register.
"  Note that this means e.g. "ad won't copy the text into
"  register a anymore.  You have to explicitly yank it.
" nnoremap d "_d
" vnoremap d "_d
" nnoremap D "_D
" vnoremap D "_D
" nnoremap c "_c
" vnoremap c "_c
" nnoremap C "_C
" vnoremap C "_C

" Folding
" set foldmethod=indent
" set foldlevel=1
" set foldclose=all

" zo - opens folds
" zc - closes fold
" zm - increases auto fold depth
" zr - reduces auto fold depth

colorscheme badwolf

" If installed using git
set rtp+=~/.fzf

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

noremap <F3> :Autoformat<CR>
let g:formatdef_sql = '"sqlformat --reindent --keywords upper - identifiers lower -"'
let g:formatters_sql = ['sql']

let g:netrw_localrmdir="rm -r"
