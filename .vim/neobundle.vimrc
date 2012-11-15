set nocompatible
filetype off

" neobundleだけじゃなくてプラグイン管理系
" neobundleは~/.bundle
" pathogenは~/.vim/bundle

if has('vim_starting')
	set runtimepath+=~/.bundle/neobundle.vim
	call neobundle#rc(expand('~/.bundle'))
endif

NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/neosnippet.git'
NeoBundle 'git://github.com/mattn/webapi-vim.git'
NeoBundle 'git://github.com/tyru/open-browser.vim.git'
NeoBundle 'git://github.com/tyru/caw.vim.git'
NeoBundle 'git://github.com/basyura/twibill.vim.git'
NeoBundle 'git://github.com/basyura/TweetVim.git'
NeoBundle 'surround.vim'
NeoBundle 'git://github.com/Lokaltog/vim-powerline'
NeoBundle 'sudo.vim'
NeoBundle 'afterimage.vim'

" neobundleが使えないやつとかはpathogenつかおね
NeoBundle 'git://github.com/tpope/vim-pathogen.git'
" pathogenが入ってたらpathogenをよぶ
if isdirectory(expand('~/.bundle/vim-pathogen'))
	call pathogen#infect('~/.vim/bundle/')
endif

filetype plugin on
filetype indent on
