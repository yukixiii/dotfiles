set nocompatible
filetype off

" neobundleは~/.bundle
" neobundlelocalは~/.vim/bundle

if has('vim_starting')
	set runtimepath+=~/.bundle/neobundle.vim
	call neobundle#begin(expand('~/.bundle'))
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
NeoBundle 'Shougo/unite-sudo'
NeoBundle 'Shougo/neossh.vim'
NeoBundle 'Shougo/tabpagebuffer.vim'
NeoBundle 'Shougo/neomru.vim'
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
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'sudo.vim'
NeoBundle 'vim-latex/vim-latex'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'yuratomo/dbg.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'kannokanno/previm'
" NeoBundle 'Align'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'will133/vim-dirdiff'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'fuenor/im_control.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'joonty/vdebug'
NeoBundleLazy 'leafgarland/typescript-vim', {
			\ 'autoload': {
			\	'filetypes': ['typescript'],
			\ }}
NeoBundleLazy 'jason0x43/vim-js-indent', {
			\ 'autoload': {
			\	'filetypes': ['javascript', 'typescript', 'html'],
			\ }}
let g:js_indent_typescript = 1
NeoBundle 'Quramy/tsuquyomi'
" NeoBundleLazy 'clausreinke/typescript-tools', {
" 			\ 'autoload' : {
" 			\	'filetypes' : ['typescript'] }
" 			\}
NeoBundle 'wavded/vim-stylus'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'miyakogi/seiya.vim'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'dbext.vim'

" colorscheme
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'newspaper.vim'
NeoBundle 'GGalizzi/cake-vim'
NeoBundle 'aereal/vim-colors-japanesque'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'hail2u/h2u_colorscheme'
NeoBundle 'noahfrederick/vim-hemisu'
NeoBundle 'mayansmoke'
NeoBundle 'NLKNguyen/papercolor-theme'

" gitとかで管理できないもの
if isdirectory(expand('~/.vim'))
	NeoBundleLocal ~/.vim/bundle
endif
if isdirectory(expand('~/vimfiles'))
	NeoBundleLocal ~/vimfiles/bundle
endif

call neobundle#end()

filetype plugin on
filetype indent on
