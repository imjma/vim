"""""""""""""""""""""""""""""
" Skargor's .vimrc
" 2010-03-05
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
    " set transparency=2
else
    set gfn=Anonymous\ Pro\ 10
endif

" Scheme
if has("gui_running")
	colorscheme wombat
	set guioptions-=T   " no toolbar
    set lines=65
    set columns=200
else
    colorscheme ron
endif

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

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

" mouse support in all mode
set mouse=a
" hide mouse when typing
set mousehide

set wildmenu

" set mapleader
let mapleader = ','
let g:mapleader = ','


"""""""""""""""""""""""""""""
" Status bar
"""""""""""""""""""""""""""""

" show status lines
set laststatus=2

" special characters that can be used in search patterns
set magic

" Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

"""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""
set shiftwidth=4
set tabstop=4
set smarttab

" remove any extra whitespace from the ends of lines
" autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

set encoding=utf-8
set fileencodings=utf-8

" 自動化格式
set formatoptions=tcrqn

" auto indent
set ai
" smart indent
set si

" Folding
" set foldmethod=syntax
set foldmethod=indent

" Do not wrap for this words
set iskeyword+=_,$,@,%,#,-

"The commandbar is 2 high
set cmdheight=2

filetype plugin indent on

"""""""""""""""""""""""""""""
" Moving, tabs
"""""""""""""""""""""""""""""

" Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit 
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Specify the behavior when switching between buffers 
try
  set switchbuf=usetab
  set stal=2
catch
endtry


"""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""

" For Python
set expandtab
set softtabstop=4

let python_highlight_all = 1
au FileType python set nocindent
au FileType python syn keyword pythonDecorator True None False self

" auto load django/python snip
autocmd FileType python set ft=python.django
autocmd FileType html set ft=html.django_template


"""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

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
    let g:bufExplorerSplitRight=1        " Split right.    
    

    """""""""""""""""""""""""
    " NERDTree
    """""""""""""""""""""""""
    nmap <silent> <leader>e :NERDTreeToggle<cr>

    """""""""""""""""""""""""
    "  Fuzzy finder
    """""""""""""""""""""""""
    try
        call fuf#defineLaunchCommand('FufCWD', 'file', 'fnamemodify(getcwd(), ''%:p:h'')')
        map <leader>t :FufCWD **/<CR>
    catch
    endtry   
