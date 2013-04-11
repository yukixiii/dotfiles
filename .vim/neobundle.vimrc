set nocompatible
filetype off

" neobundleは~/.bundle
" neobundlelocalは~/.vim/bundle

if has('vim_starting')
	set runtimepath+=~/.bundle/neobundle.vim
	call neobundle#rc(expand('~/.bundle'))
endif

let g:neobundle#types#git#default_protocol = 'https'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neobundle-vim-scripts'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vinarise'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/caw.vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'basyura/TweetVim'
NeoBundle 'surround.vim'
NeoBundle 'Lokaltog/vim-powerline'
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
