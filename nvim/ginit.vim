" vim:set noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
GuiFont! Consolative:h10
GuiTabline 0
GuiLinespace -3
GuiPopupmenu 0


" zoom.vim 無理やりもってきた
if &cp || exists("g:loaded_zoom") || ! exists('g:GuiLoaded')
    finish
endif
let g:loaded_zoom = 1

let s:save_cpo = &cpo
set cpo&vim

" keep default value
let s:current_font = g:GuiFont

" command
command! -narg=0 ZoomIn    :call s:ZoomIn()
command! -narg=0 ZoomOut   :call s:ZoomOut()
command! -narg=0 ZoomReset :call s:ZoomReset()

" map
nmap + :ZoomIn<CR>
nmap - :ZoomOut<CR>

" guifont size + 1
function! s:ZoomIn()
  let l:fsize = substitute(g:GuiFont, '^.*:h\([^:]*\).*$', '\1', '')
  let l:fsize += 1
  let l:guifont = substitute(g:GuiFont, ':h\([^:]*\)', ':h' . l:fsize, '')
  " let g:GuiFont = l:guifont
  call GuiFont(l:guifont, 1)
endfunction

" guifont size - 1
function! s:ZoomOut()
  let l:fsize = substitute(g:GuiFont, '^.*:h\([^:]*\).*$', '\1', '')
  let l:fsize -= 1
  let l:guifont = substitute(g:GuiFont, ':h\([^:]*\)', ':h' . l:fsize, '')
  " let g:GuiFont = l:guifont
  call GuiFont(l:guifont, 1)
endfunction

" reset guifont size
function! s:ZoomReset()
  " let g:GuiFont = s:current_font
  call GuiFont(s:current_font, 1)
endfunction

let &cpo = s:save_cpo
finish
