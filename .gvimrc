" script encoding
scriptencoding utf-8

" GUIメニューの非表示
set guioptions-=m
set guioptions-=T

" カラースキーム
colorscheme hybrid
set background=dark

" setup font
if has('unix')
	set guifont=Ricty\ Diminished\ 12
elseif has('win64') || has('win32')
	set guifont=MyricaM_M:h10:cSHIFTJIS
endif
