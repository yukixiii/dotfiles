"---------------------------------------------------------------------------
" deoplete.nvim
"

" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

inoremap <expr><C-g> deoplete#undo_completion()
" <C-l>: redraw candidates
inoremap <expr><C-l>       deoplete#refresh()

" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#cancel_popup() . "\<CR>"
" endfunction

call deoplete#custom#source('_', 'matchers',
      \ ['matcher_fuzzy', 'matcher_length'])
" call deoplete#custom#source('buffer', 'mark', '')
" call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
" call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])
" call deoplete#custom#source('buffer', 'mark', '*')

call deoplete#custom#source('zsh', 'filetypes', ['zsh', 'sh'])

call deoplete#custom#source('_', 'converters', [
      \ 'converter_remove_paren',
      \ 'converter_remove_overlap',
      \ 'matcher_length',
      \ 'converter_truncate_abbr',
      \ 'converter_truncate_menu',
      \ 'converter_auto_delimiter',
      \ ])

" call deoplete#custom#source('buffer', 'min_pattern_length', 9999)
" call deoplete#custom#source('clang', 'input_pattern', '\.\w*|\.->\w*|\w+::\w*')
" call deoplete#custom#source('clang', 'max_pattern_length', -1)

call deoplete#custom#option('keyword_patterns', {
      \ '_': '[a-zA-Z_]\k*\(?',
      \ 'tex': '[^\w|\s][a-zA-Z_]\w*',
      \ })

" inoremap <silent><expr> <C-t> deoplete#manual_complete('file')

call deoplete#custom#option('camel_case', v:true)
call deoplete#custom#option('refresh_always', v:true)
call deoplete#custom#option('auto_complete_delay', 0)
call deoplete#custom#option('async_timeout', 100)
" call deoplete#custom#option('num_processes', 0)

" call deoplete#custom#option('profile', v:true)
" call deoplete#enable_logging('DEBUG', 'deoplete.log')
" call deoplete#custom#source('clang', 'debug_enabled', 1)


let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']


" old config
" " <CR>: close popup and save indent.
" " inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" " function! s:my_cr_function() abort
" "   return deoplete#cancel_popup() . "\<CR>"
" " endfunction
"
" " call deoplete#custom#set('_', 'matchers', ['matcher_head'])
" call deoplete#custom#set('ghc', 'sorters', ['sorter_word'])
" " call deoplete#custom#set('buffer', 'mark', '')
" " call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
" " call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])
" " call deoplete#custom#set('buffer', 'mark', '*')
"
" " Use auto delimiter
" " call deoplete#custom#set('_', 'converters',
" "       \ ['converter_auto_paren',
" "       \  'converter_auto_delimiter', 'remove_overlap'])
" call deoplete#custom#set('_', 'converters', [
"      \ 'converter_remove_paren',
"      \ 'converter_remove_overlap',
"      \ 'converter_truncate_abbr',
"      \ 'converter_truncate_menu',
"      \ 'converter_auto_delimiter',
"      \ ])
"
" " call deoplete#custom#set('buffer', 'min_pattern_length', 9999)
" call deoplete#custom#set('clang', 'input_pattern', '\.\w*|\.->\w*|\w+::\w*')
" call deoplete#custom#set('clang', 'max_pattern_length', -1)
"
" let g:deoplete#keyword_patterns = {}
" let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*'
" " let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'
" " let g:deoplete#keyword_patterns.tex = '\\?[a-zA-Z_]\w*'
" let g:deoplete#keyword_patterns.tex = '[^\w|\s][a-zA-Z_]\w*'
"
" let g:deoplete#omni#input_patterns = {}
" let g:deoplete#omni#input_patterns.python = ''
"
"
" let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
" let g:deoplete#ignore_sources.php = ['omni']
" " let g:deoplete#omni#input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
" " let g:deoplete#omni#input_patterns.php =
" "            \ '\w+|[^. \t]->\w*|\w+::\w*'
" " let g:deoplete#omni#functions = {}
"
" " inoremap <silent><expr> <C-t> deoplete#manual_complete('file')
"
" " let g:deoplete#enable_refresh_always = 1
" let g:deoplete#enable_camel_case = 1
" " let g:deoplete#auto_complete_delay = 50
" " let g:deoplete#auto_complete_start_length = 3
"
" let g:deoplete#skip_chars = ['(', ')']
"
" " let g:deoplete#enable_profile = 1
" " call deoplete#enable_logging('DEBUG', 'deoplete.log')
" " call deoplete#custom#set('clang', 'debug_enabled', 1)
"
"
" " autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
