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
NeoBundle 'Shougo/neosnippet-snippets'
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
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'yuratomo/dbg.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'kannokanno/previm'

" colorscheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'

" gitとかで管理できないもの
if isdirectory(expand('~/.vim'))
	NeoBundleLocal ~/.vim/bundle
endif
if isdirectory(expand('~/vimfiles'))
	NeoBundleLocal ~/vimfiles/bundle
endif

filetype plugin on
filetype indent on
