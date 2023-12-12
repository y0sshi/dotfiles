"" Color
set bg=dark
syntax enable

"" Key Bind
map 0 ^

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
set fileencodings=utf-8,cp932
set fileformats=unix,dos,mac
lang en_US.UTF-8

"" Highlight Search
set hlsearch
set incsearch
nmap <Esc><Esc> :nohlsearch<CR>

"" Tabstop and Shift width
"set expandtab " tab -> space
set shiftwidth=2
set tabstop=2
set softtabstop=2

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

lua << EOF
	require('plugins')
EOF
if has('nvim')
	let g:ruby_host_prog    = '/usr/bin/ruby'
	let g:python_host_prog  = '/usr/bin/python2'
	let g:python3_host_prog = '/usr/bin/python3'


	if has('python3')
		let g:deoplete#enable_at_startup = 1
	endif
endif
