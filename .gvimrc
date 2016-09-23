" script encoding
scriptencoding utf-8

" GUIメニューの非表示
set guioptions-=m
set guioptions-=T

" カラースキーム
" colorscheme mayansmoke
colorscheme PaperColor
set background=dark

" setup font
if has('unix')
	" set guifont=Ricty\ Diminished\ 12
	set guifont=Hermit\ medium\ 10
	set guifontwide=うずらフォント\ 11
	set linespace=-3
elseif has('win64') || has('win32')
	set guifont=Ricty_Diminished_Discord:h10:cSHIFTJIS
endif
