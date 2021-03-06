set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'
Plugin 'hdima/python-syntax'
Plugin 'python-mode/python-mode'
Plugin 'django.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'flazz/vim-colorschemes'
Plugin 'fisadev/vim-isort'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'posva/vim-vue'
Plugin 'w0rp/ale'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'prettier/vim-prettier'

call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set updatetime=100
set colorcolumn=80
set path=$PWD/**
set nofoldenable
colorscheme gruvbox

function! ToggleLines()
    if (&relativenumber == 1)
        set number
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
set hlsearch
set relativenumber
set smartindent
set number
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set cindent
set mouse=a
if has('mouse_sgr')
  set ttymouse=sgr
endif
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <left> <C-W>h
map <right> <C-W>l
map <up> <C-W>k
map <down> <C-W>j
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>
autocmd InsertEnter * :set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
nnoremap <C-l> :call ToggleLines()<CR>

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

hi ColorColumn ctermbg=234

autocmd BufRead * syn keyword pythonBuiltin self cls
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
vmap <leader>y :w! /tmp/vitmp<CR>
nmap <leader>p :r! cat /tmp/vitmp<CR>

"
"Python syntax
"
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"Bad whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1
syntax on

"WTF
set backspace=indent,eol,start

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
let g:ale_linters = {
\   'javascript': ['flow', 'eslint'],
\}
