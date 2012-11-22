" script encoding
scriptencoding utf-8

" GUIメニューの非表示
set guioptions-=m
set guioptions-=T

" カラースキーム
colorscheme Tomorrow-Night-Bright

" setup font
if has('unix')
	set guifont=あずきフォント\ 13
elseif has('win64') || has('win32')
	set guifont=あずきフォント:h13:cSHIFTJIS
endif
