" script encoding
scriptencoding utf-8

" GUIメニューの非表示
set guioptions-=m
set guioptions-=T

" カラースキーム
colorscheme hybrid

" setup font
if has('unix')
	set guifont=あずきフォント\ 12
elseif has('win64') || has('win32')
	set guifont=あずきフォント:h12:cSHIFTJIS
endif
