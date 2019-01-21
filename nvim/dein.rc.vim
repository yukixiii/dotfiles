" vim: noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
if &compatible
	set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" set runtimepath+=/home/yuki/.cache/dein/repos/github.com/Shougo/dein.vim
execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	call dein#load_toml('~/.config/nvim/dein.toml', {'lazy' : 0})
	call dein#load_toml('~/.config/nvim/deinlazy.toml', {'lazy' : 1})
	" if has('nvim')
	" 	call dein#load_toml('~/.config/nvim/deineo.toml', {})
	" endif
	call dein#load_toml('~/.config/nvim/deinft.toml')

	" Load plugin from "~/.config/nvim/bundle".
	" call dein#local("~/.config/nvim/bundle")

	if dein#tap('deoplete.nvim') && has('nvim')
		call dein#disable('neocomplete.vim')
	endif
	call dein#disable('neobundle.vim')

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable
