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
set directory=$HOME/.vim/directory
set undodir=$HOME/.vim/undodir
set undofile
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set showmatch
set wildmenu
set ttimeoutlen=50

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

"" pyenv
if has('nvim')
	let g:python_host_prog  = $PYENV_ROOT . '/versions/neovim2/bin/python'
	let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python3'
endif

"" Plugin Settings
source ${HOME}/.vim/script/.vimrc_pconfig
let g:deoplete#enable_at_startup = 1
