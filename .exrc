"if has('mouse')
"  set mouse=a
"  if has('mouse_sgr')
"    set ttymouse=sgr
"  elseif v:version > 703 || v:version is 703 && has('patch632')
"    set ttymouse=sgr
"  else
"    set ttymouse=xterm2
"  endif
"endif

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

" HighlightInfo {
function! s:get_syn_id(transparent)
  let synid = synID(line('.'), col('.'), 1)
  return a:transparent ? synIDtrans(synid) : synid
endfunction
function! s:get_syn_name(synid)
  return synIDattr(a:synid, 'name')
endfunction
function! s:show_highlight_info()
  execute "highlight " . s:get_syn_name(s:get_syn_id(0))
  execute "highlight " . s:get_syn_name(s:get_syn_id(1))
endfunction
command! HighlightInfo call s:show_highlight_info()
" HighlightInfo }

" memory_cursor_position {
augroup cursorPosition
  autocmd BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal g`\"" | endif
augroup END
" memory_cursor_position }

noremap <Space>d :VimShellInteractive<CR>
"noremap <Left> <Nop>
"noremap <Right> <Nop>
cnoremap <C-K> <C-\>e strpart(getcmdline(), 0, getcmdpos()-1)<CR>
cnoremap <C-a> <C-b>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
"command! MK w | silent make | redraw!
"inoremap <expr> / pumvisible()?"<C-x><C-f>":"/<C-x><C-f>"
"inoremap <expr> <CR> pumvisible()?"<ESC>":"<CR>"
inoremap {<CR> {}<Left><CR><Esc><S-o>
noremap 0 ^
noremap <C-e> 2<C-e>
noremap <C-j> gj
noremap <C-k> gk
noremap <C-l> <Space>
noremap <C-y> 2<C-y>
noremap ^ 0
noremap gj j
noremap gk k
noremap j gj
noremap k gk
noremap <C-S-k> <Nop>
noremap <C-k> <Nop>
noremap <S-k> <Nop>
set background=dark
set backspace=eol,indent,start
"set backup
"set backupdir=$HOME/.vim/backupdir
set cindent
set colorcolumn=81
set completeopt=menuone,longest,preview
set cursorline
set directory=$HOME/.vim/directory
set expandtab
set fileencodings=utf-8,iso-2022-jp,euc-jp
set hlsearch
nmap <Esc><Esc> :<C-u>nohlsearch<CR><Esc>
set ignorecase
set incsearch
set iskeyword=@,48-57,_,192-255,#
set laststatus=2
set lazyredraw
set mouse=nv
set nofileignorecase
set nowildignorecase
set nowildmenu

set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
set breakindent
"set nowrap
set nowrapscan
"set nrformats=alpha,bin,hex
set number
set ruler
set shiftwidth=2
set showcmd
set smartcase 
set smartindent
set softtabstop=2
set spellfile=~/.vim/spell/en.utf-8.add
set spelllang=en,cjk
set swapfile
set tabstop=2
set ttyfast
set undodir=$HOME/.vim/undodir
set undofile
set viminfo='20,s10
set visualbell t_vb=
set wildignore=*.dvi,*.pdf,*.aux,*.cpc
set wildmode=list:longest,full
syntax on

" augroup {
augroup vimrc
  autocmd!
  autocmd BufRead,BufNewFile *.html filetype plugin indent on
  autocmd BufRead,BufNewFile *.html setl filetype=html
  autocmd BufRead,BufNewFile *.md setl filetype=markdown
  autocmd BufRead,BufNewFile *.tex setl shiftwidth=1
  autocmd BufRead,BufNewFile *.tex setl softtabstop=1
  autocmd BufRead,BufNewFile *.tex setl tabstop=1
  autocmd BufRead,BufNewFile *.tex setl commentstring=\ %s
  autocmd FileType v setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sv setlocal sw=2 sts=2 ts=2 et
  autocmd FileType make setl noexpandtab   autocmd FileType python setl autoindent
  autocmd FileType python setl cinwords=class,def,elif,else,except,finally
  autocmd FileType python setl cinwords^=for,if,try,while,with
  autocmd FileType python setl nocindent
  autocmd FileType python setl smartindent 
  autocmd FileType vim setl commentstring="\ %s
  autocmd FileType vim syn keyword vimOption contained nofileignorecase
  autocmd FileType vim syn keyword vimOption contained nowildignorecase
augroup end
" augroup }

" highlight {
highlight DiffDelete ctermfg=6 cterm=bold 
highlight Directory ctermfg=6 cterm=bold 
highlight NonText ctermfg=6 cterm=bold 
highlight PreProc ctermfg=6 cterm=bold 
highlight SpecialKey ctermfg=6 cterm=bold 
highlight Underlined ctermfg=6 cterm=bold 
" highlight }


" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

"if &compatible

if has('vim_starting')
  set nocompatible               " Be iMproved
endif


" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'vhda/verilog_systemverilog.vim'

NeoBundleLazy 'tpope/vim-endwise'
NeoBundleLazy 'thinca/vim-quickrun'

"if neobundle#is_installed('neocomplcache.vim')
" Vim起動時にneocompleteを有効にする
let g:neocomplcache_enable_at_startup = 1
" smartcase有効化.大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete_enable_smart_case = 1
" 3文字以上の単語に対して補完を有効にする
let g:neocomplete_min_keyword_length = 3
" 区切り文字まで補完する
let g:neocomplete_enable_auto_delimiter = 1
"1文字目の入力から補完のポップアップを表示
let g:neocomplete_auto_completion_start_length = 1
"バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"
"エンターキーで補完候補の確定.スニペットの展開もエンターキーで確定・・・・・・②
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
"タブキーで補完候補の選択.スニペット内のジャンプもタブキーでジャンプ・・・・・・③
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
"endif


"Syntastic Setting
let g:syntastic_enable_signs = 1
" 他のVimプラグインと競合するのを防ぐ
let g:syntastic_always_populate_loc_list = 1
" 構文エラーリストを非表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時に構文エラーチェックを実行する
let g:syntastic_check_on_open = 1
" 「:wq」で終了する時も構文エラーチェックする
let g:syntastic_check_on_wq = 1

" Javascript用. 構文エラーチェックにESLintを使用
let g:syntastic_javascript_checkers=['eslint']
" Javascript以外は構文エラーチェックをしない
let g:syntastic_mode_map = { 'mode': 'passive',
      \ 'active_filetypes': ['javascript'],
      \ 'passive_filetypes': [] }

source $VIMRUNTIME/macros/matchit.vim
let NERDTreeShowHidden = 1
nmap <C-t> :NERDTreeToggle<CR>

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" if dein#load_state('~/.vim/dein')
"   call dein#begin(expand('~/.vim/dein'))
" 
"   call dein#add('~/.vim/dein')
"   call dein#add('Shougo/deoplete.nvim')
"   call dein#add('Shougo/neco-vim')
"   call dein#add('Shougo/neco-syntax')
"   call dein#add('ujihisa/neco-look')
"   call dein#add('Shougo/dein.vim')
"   call dein#add('Shougo/vimproc.vim', {'build': 'make'})
" 
"   call dein#add('Shougo/neocomplete.vim')
"   call dein#add('Shougo/neomru.vim')
"   call dein#add('Shougo/neosnippet')
"   
" 
"   if !has('nvim')
"     call dein#add('roxma/nvim-yarp')
"     call dein#add('roxma/vim-hug-neovim-rpc')
"   endif
" 
"   call dein#end()
"   call dein#save_state()
" endif

filetype plugin indent on
syntax enable

runtime! ~/.vim/syntax/verilog_systemverilog.vim
source ~/.vimrc_local
