"""""""""""""""""""""""""""""
" Skargor's .vimrc
" 2010-03-03
"
" skargor<skargor@gmail.com>
" http://nerdma.com
"
" References:
" http://amix.dk/vim/vimrc.html
" http://dev.gentoo.org/~bass/configs/vimrc.html
" http://github.com/roamlog/vimfiles/
" 
" Python Ref
" http://py.vaults.ca/~x/python_and_vim.html
"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" Global
"""""""""""""""""""""""""""""
set nocompatible

" Font
if has("gui_macvim")
    set gfn=Anonymous\ Pro:h12
else
    set gfn=Anonymous\ Pro\ 10
    set lines=65
    set columns=200
endif

" Scheme
if has("gui_running")
	colorscheme wombat
	set guioptions-=T   " no toolbar
else
    colorscheme ron
endif

"""""""""""""""""""""""""""""
" Interface
"""""""""""""""""""""""""""""
" show line number
set nu

" Show current position
set ruler

" syntax highlighter
syntax on

set nowrap

" highlight search
set hlsearch
" Ignore case when searching
set ignorecase
set incsearch

" show matching bracets
set showmatch

" No sound no errors
set noerrorbells
set novisualbell

" Set backspace
set backspace=eol,start,indent

" Backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

" show at least three lines and two columns
" while scrolling
set scrolloff=3
set sidescrolloff=2

" without swap file
setlocal noswapfile
set bufhidden=hide

" show status lines
set laststatus=2

" mouse support in all mode
set mouse=a
" hide mouse when typing
set mousehide

set wildmenu

" set mapleader
let mapleader = ','

"""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""
set shiftwidth=4
set tabstop=4
set smarttab

" For Python
set expandtab
set softtabstop=4

" remove any extra whitespace from the ends of lines
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

set encoding=utf-8
set fileencodings=utf-8

" 自動化格式
set formatoptions=tcrqn

" auto indent
set ai
" smart indent
set si

" Folding
set foldmethod=syntax

" Do not wrap for this words
set iskeyword+=_,$,@,%,#,-

"The commandbar is 2 high
set cmdheight=2

filetype plugin indent on

" auto load django/python snip
autocmd FileType python set ft=python.django
autocmd FileType html set ft=html.django_template

"""""""""""""""""""""""""""""
" Plugin
"""""""""""""""""""""""""""""

    """""""""""""""""""""""""
    " snipMate
    """""""""""""""""""""""""
    let g:snips_author = 'Jie Ma'

    """""""""""""""""""""""""
    " BufExplorer
    """""""""""""""""""""""""
    let g:bufExplorerDefaultHelp=0       " Do not show default help.
    let g:bufExplorerShowRelativePath=1  " Show relative paths.
    let g:bufExplorerSortBy='name'       " Sort by the buffer's name.
    let g:bufExplorerSplitBelow=1        " Split new window below current.
    let g:bufExplorerSplitRight=1        " Split right.    
