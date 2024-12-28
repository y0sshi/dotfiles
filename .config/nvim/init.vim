"" Color
set bg=dark
syntax enable

"" Key Bind
map 0 ^
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
inoremap <C-w> <C-o>w
inoremap <C-e> <C-o>e<C-o>l
inoremap <C-b> <C-o>b
inoremap <C-s> <C-o>:w<CR>

"" Environment Variable
let VIM_DIR = $HOME . '/.vim'

"" Indent
filetype plugin indent on
set cindent
set autoindent
set smartindent 
set list listchars=tab:\¦\ 
highlight SpecialKey ctermbg=None ctermfg=242

"" Basic
set number
set cursorline
"set directory=$HOME/.vim/directory
"set undodir=$HOME/.vim/undodir
"set undofile
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set showmatch
set wildmenu
set ttimeoutlen=50
set mouse=a
set encoding=utf-8
set clipboard+=unnamed
set fileencodings=cp932,utf-8,utf-16le,utf-16be,utf-32le,utf-32be,ucs-bom,ucs2le,ucs-2,iso-2022-jp,euc-jp,sjis,latin1
set fileformats=unix,dos,mac
lang en_US.UTF-8

"" Highlight Search
set hlsearch
set incsearch
nmap <Esc><Esc> :nohlsearch<CR>

"" Tabstop and Shift width
set expandtab " tab -> space
set shiftwidth=4
set tabstop=4
set softtabstop=4

"" Paste from Clipboard
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"" disable tex-conceal
let g:tex_conceal=''

if has('nvim')
    let g:ruby_host_prog    = '/usr/bin/ruby'
    let g:python_host_prog  = '/usr/bin/python2'
    "let g:python3_host_prog = 'C:\Tools\python3\3.10.11'
    let g:python3_host_prog = 'C:\Tools\python3\3.12.6'


    if has('python3')
        let g:deoplete#enable_at_startup = 1
    endif
endif

lua << EOF
require('plugins')
EOF

