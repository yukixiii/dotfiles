set nocompatible
filetype off

" neobundleは~/.bundle
" neobundlelocalは~/.vim/bundle

if has('vim_starting')
	set runtimepath+=~/.bundle/neobundle.vim
	call neobundle#rc(expand('~/.bundle'))
endif

let g:neobundle#types#git#default_protocol = 'https'

if has('lua') && ( (v:version == 703 && has('patch885')) || v:version >= 704 )
	" luaがあればこっち
	NeoBundle 'Shougo/neocomplete'
else
	NeoBundle 'Shougo/neocomplcache'
endif
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neobundle-vim-scripts'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vinarise'
if !has('kaoriya') " kaoriya版にはvimproc同梱されてるしWinでコンパイル面倒なため
	NeoBundle 'Shougo/vimproc'
endif
NeoBundle 'Shougo/neosnippet'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/caw.vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'basyura/TweetVim'
NeoBundle 'surround.vim'
" NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'bling/vim-airline'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'sudo.vim'
NeoBundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'

" colorscheme
NeoBundle 'altercation/vim-colors-solarized'

" gitとかで管理できないもの
if isdirectory(expand('~/.vim'))
	NeoBundleLocal ~/.vim/bundle
endif
if isdirectory(expand('~/vimfiles'))
	NeoBundleLocal ~/vimfiles/bundle
endif

filetype plugin on
filetype indent on
