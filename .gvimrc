" GUIメニューの非表示
set guioptions-=m
set guioptions-=T

" カラースキーム
colorscheme koehler

" setup font
if has('unix')
	set guifont=あずきフォント\ 13
elseif has('win64') || has('win32')
	set guifont=あずきフォント:h13:cSHIFTJIS
endif
