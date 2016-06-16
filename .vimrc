" encode.vim, neobundle.vimrcの読み込み "{{{
" unix版
if filereadable(expand('~/.vim/encode.vim'))
	source ~/.vim/encode.vim
endif

if filereadable(expand('~/.vim/neobundle.vimrc'))
	source ~/.vim/neobundle.vimrc
endif

" win版
" windowsでパスを/にする
if exists('+shellslash')
	set shellslash
endif
if filereadable(expand('~/vimfiles/encode.vim'))
	source ~/vimfiles/encode.vim
endif

if filereadable(expand('~/vimfiles/neobundle.vimrc'))
	source ~/vimfiles/neobundle.vimrc
endif
"}}}

" vi互換かどうか
set nocompatible

"-------------------------------
" 編集設定 {{{
"-------------------------------
" backup swapfile
set nobackup
set noswapfile

" undofile
set undofile
set undodir=~/.vimundo

" backspaceで削除するもの
set backspace=indent,eol,start

" クリップボードと無名レジスタの共有
set clipboard+=unnamed

" 矩形ヴィジュアルモードでフリーカーソル
set virtualedit=block

" 行末・行頭をまたいで移動
" b <BS>
" s <Space>
" [ ] 挿入と置換モードで
" < > ノーマルとビジュアルで
set whichwrap=b,s,[,],<,>

" 文字化け対策
" set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,default,latin

" マウスを有効
if has('mouse')
	set mouse=a
endif

" 検索時に大文字小文字無視
set ignorecase
set smartcase

" 折りたたみをマーカーで
set foldmethod=marker

" タブ設定
set tabstop=4 " 画面上でのタブの空白数
set shiftwidth=4 " autoindentや>>などでずれる幅
set softtabstop=4 " <Tab><BS>を打った時の動く幅

" 分割時に右、下にフォーカス
set splitbelow
set splitright

" windowsでパスを/にする
if exists('+shellslash')
	set shellslash
endif

" 日本語入力固定モードIBus+Python
let IM_CtrlIBusPython = 1
" }}}
"-------------------------------
" 表示設定 {{{
"-------------------------------
" 行番号
set number

" syntaxをオン
if has('syntax')
	syntax enable
endif

" 自動インデント
set autoindent
set smartindent

" コマンドラインの大きさ
set cmdheight=2
set laststatus=2

" tabと行末スペースを表示
set list
set listchars=tab:^\ ,trail:~

" 検索時にハイライト表示
set hlsearch

" colorscheme
colorscheme ron

" 端末色数
set t_Co=256

" 特殊記号の幅
set ambiwidth=double

" 折り返し時のインデント
set breakindent

" ステータスラインに文字コードBOM16進表示
if has('iconv')
	set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\ 
else
	set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 
endif
" iconvが使用可能なときにカーソル上の文字コードをエンコードに応じた表示にする
function! FencB()
	let c = matchstr(getline('.'), '.', col('.') - 1)
	let c = iconv(c, &enc, &fenc)
	return s:Byte2hex(s:Str2byte(c))
endfunction

function! s:Str2byte(str)
	return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
	return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction

" 全角スペースの表示
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme       * call ZenkakuSpace()
		autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
	augroup END
	call ZenkakuSpace()
endif
" }}}
"------------------------------
" キーバインド
"------------------------------
" normal mode {{{
" 現在のvimスクリプトファイルを実行
nnoremap <F8> :<C-u>source %<CR>

" 現在のファイル位置をカレントディレクトリにする
nnoremap <F7> :<C-u>cd %:h<CR>

" 強制全保存終了無効化
nnoremap ZZ <Nop>

" カーソルを表示行移動にする
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap h <Left>zv
nnoremap j gj
nnoremap k gk
nnoremap l <Right>zv

" 文字コードを指定して開き直し
nnoremap <Leader>u :<C-u>e ++enc=utf-8<CR>
nnoremap <Leader>c :<C-u>e ++enc=cp932<CR>
nnoremap <Leader>e :<C-u>e ++enc=euc-jp<CR>
nnoremap <Leader>q :<C-u>e ++enc=
nnoremap <Leader>r :<C-u>e ++ff=

" 改行コード、文字コードの設定
nnoremap <Leader>fe :<C-u>set fileencoding=
nnoremap <Leader>ff :<C-u>set fileformat=

" Plugin
nmap ,a :<C-u>Unite buffer_tab file file_mru<CR>
nmap ,t :<C-u>Unite buffer_tab<CR>
nmap ,y :<C-u>Unite buffer<CR>
nmap ,m :<C-u>Unite file_mru<CR>
" map ,r :<C-u>Unite file_rec/async<CR>
" map ,p :<C-u>Unite file_rec/async:!<CR>
nmap ,g :<C-u>UniteWithBufferDir file file/new directory/new<CR>
nmap ,j :<C-u>Unite file file/new directory/new<CR>
nmap ,f :<C-u>VimFiler<CR>
nmap ,d :<C-u>VimFilerBufferDir<CR>
nmap ,sh :<C-u>VimShell<CR>
nmap ,sp :<C-u>VimShellPop<CR>
nmap ,b :<C-u>Unite bookmark:default -input=[<CR>
nmap ,v :<C-u>Unite bookmark:default -input=[ -default-action=vimfiler<CR>
nmap ,/ :<C-u>Unite line -start-insert<CR>
nmap ,n/ :<C-u>Unite line -start-insert -no-quit<CR>
nmap <Leader>o :<C-u>Unite outline<CR>
nmap <Leader>gr :<C-u>Unite grep -no-quit<CR>

nmap <Leader>tw :<C-u>Unite tweetvim<CR>
nmap <Leader>n :<C-u>TweetVimSay<CR>

nmap <Space> <Plug>(easymotion-prefix)
" }}}
" insert mode {{{
" インサートモードでもHJKL移動
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>
" Escのキーバインド
inoremap <C-c> <Esc>
inoremap <C-f> <Esc>
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-o> <C-^><C-r>=IMState('FixMode')<CR>
" }}}
" visual mode {{{
" 選択中にF3キーで選択中の文字列検索
vmap <F3> y/\V<C-R>=substitute(escape(@",'/'),"\n","\\\\n","g")<CR>/<CR>
vnoremap <C-c> <Esc>
" }}}
" command line mode {{{
cnoremap <C-c> <Esc>
" }}}
"------------------------------
" command-line windowの設定 {{{
"------------------------------
" :を入力した時コマンドラインウィンドウに入る
" <sid>はファイルごとに割り振られたスクリプト番号を呼び出す(<SNR>{スクリプト番号}_に置き換えられる)
" この<sid>はキーボードから入力できないため副作用のないキーマッピングができる
nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>

" 意外と使いにくいしほしい時は自分でq:で呼んだほうが使いやすい
" nmap :  <sid>(command-line-enter)
" xmap :  <sid>(command-line-enter)

" コマンドラインウィンドウに入った際の設定
" インサートモードで開始するなど
autocmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin()
	" qとTABでコマンドラインウィンドウを抜ける
	nnoremap <buffer> q :<C-u>quit<CR>
	nnoremap <buffer> <TAB> :<C-u>quit<CR>
	inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
	inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
	inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

	" Completion.
	inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	startinsert!
endfunction
" }}}
"------------------------------
" solarizedの設定 {{{
"------------------------------
if neobundle#is_installed('vim-colors-solarized')
	let g:solarized_visibility = "low"
	let g:solarized_italic = 0
	let g:solarized_underline = 0
endif
" }}}
"------------------------------
" Alignの設定 {{{
"------------------------------
if neobundle#is_installed('Align')
	let g:Align_xstrlen = 3
endif
" }}}
"------------------------------
" vim-refの設定 {{{
"------------------------------
if neobundle#is_installed('vim-ref')
	let g:ref_phpmanual_path = expand('~/php-chunked-xhtml')
endif
" }}}
"------------------------------
" VimFilerの設定 {{{
"------------------------------
if neobundle#is_installed('vimfiler')
	let g:vimfiler_as_default_explorer = 1
endif
" }}}
"------------------------------
" Unite.vimの設定 {{{
"------------------------------
if neobundle#is_installed('unite.vim')
	let g:unite_source_rec_async_command =
				\ ['ag', '--follow', '--nocolor', '--nogroup',
				\  '--hidden', '-g', '']
	let g:unite_source_file_rec_max_cache_files = 100000

	" Start insert mode in unite-action buffer.
	call unite#custom#profile('action', 'context', {
				\   'start_insert' : 1
				\ })

	" Set "-no-quit" automatically in grep unite source.
	call unite#custom#profile('source/grep', 'context', {
				\   'no_quit' : 1
				\ })
	call unite#custom#profile('source/vimgrep', 'context', {
				\   'no_quit' : 1
				\ })

	" Use start insert by default.
	call unite#custom#profile('default', 'context', {
				\   'start_insert' : 1
				\ })
endif
" }}}
"------------------------------
" vim-easymotionの設定 {{{
"------------------------------
let g:EasyMotion_leader_key = '<Space>'
" }}}
"------------------------------
" dbg.vimの設定 {{{
"------------------------------
if neobundle#is_installed('dbg.vim')
	let g:dbg#command_shell = 'zsh'
	let g:dbg#shell_prompt = '> '

	let g:dbg#command_jdb = 'jdb'
	let g:dbg#command_gdb = 'gdb'
endif
" }}}
"------------------------------
" neocomplcacheの設定 いずれ1から書きたい {{{
"------------------------------
if neobundle#is_installed('neocomplcache')
	" Use neocomplcache.
	let g:neocomplcache_enable_at_startup = 1
	" Use smartcase.
	let g:neocomplcache_enable_smart_case = 1
	" Use camel case completion.
	let g:neocomplcache_enable_camel_case_completion = 1
	" Use underbar completion.
	let g:neocomplcache_enable_underbar_completion = 1
	" Set minimum syntax keyword length.
	let g:neocomplcache_min_syntax_length = 3
	let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

	" Define dictionary.
	let g:neocomplcache_dictionary_filetype_lists = {
				\ 'default' : '',
				\ 'vimshell' : $HOME.'/.vimshell_hist',
				\ 'scheme' : $HOME.'/.gosh_completions'
				\ }

	" Define keyword.
	if !exists('g:neocomplcache_keyword_patterns')
		let g:neocomplcache_keyword_patterns = {}
	endif
	let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplcache#undo_completion()
	" inoremap <expr><C-l>     neocomplcache#complete_common_string()

	" SuperTab like snippets behavior.
	imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplcache#close_popup()
	inoremap <expr><C-e>  neocomplcache#cancel_popup()
	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplcache_enable_auto_select = 1
	"let g:neocomplcache_disable_auto_complete = 1
	"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
	"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

	" Enable heavy omni completion.
	if !exists('g:neocomplcache_omni_patterns')
		let g:neocomplcache_omni_patterns = {}
	endif
	let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
	let g:neocomplcache_omni_patterns['php'] = '[^. \t]->\h\w*\|\h\w*::'
	autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

	" snippets
	imap <C-d> <plug>(neocomplcache_snippets_expand)
	smap <C-d> <plug>(neocomplcache_snippets_expand)
endif
" }}}
"------------------------------
" neocompleteの設定 {{{
"------------------------------
if neobundle#is_installed('neocomplete')
	" Use neocomplete.
	let g:neocomplete#enable_at_startup = 1
	" Use smartcase.
	let g:neocomplete#enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplete#sources#syntax#min_keyword_length = 3
	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

	" Define dictionary.
	let g:neocomplete#sources#dictionary#dictionaries = {
				\ 'default' : '',
				\ 'vimshell' : $HOME.'/.vimshell_hist',
				\ 'scheme' : $HOME.'/.gosh_completions'
				\ }

	" Define keyword.
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'
	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplete#undo_completion()
	inoremap <expr><C-l>     neocomplete#complete_common_string()

	" SuperTab like snippets behavior.
	" imap <expr><TAB> neocomplete#sources#snippets_complete#expandable() ? "\<Plug>(neocomplete#snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <expr><CR>  neocomplete#smart_close_popup() . "\<CR>"
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplete#close_popup()
	inoremap <expr><C-e>  neocomplete#cancel_popup()
	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplete#enable_auto_select = 1
	"let g:neocomplete#disable_auto_complete = 1
	"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
	"inoremap <expr><CR>  neocomplete#smart_close_popup() . "\<CR>"

	" Enable omni completion.
	" Eclim
	let g:EclimCompletionMethod = 'omnifunc'

	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	" autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
	" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

	" Enable heavy omni completion.
	if !exists('g:neocomplete#sources#omni#input_patterns')
	  let g:neocomplete#sources#omni#input_patterns = {}
	endif
	if !exists('g:neocomplete#force_omni_input_patterns')
	  let g:neocomplete#force_omni_input_patterns = {}
	endif
	let g:neocomplete#sources#omni#input_patterns.php =
	\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
	let g:neocomplete#sources#omni#input_patterns.c =
	\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
	let g:neocomplete#sources#omni#input_patterns.cpp =
	\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

	" let g:neocomplete#omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
	let g:neocomplete#force_omni_input_patterns.java =
	\ '\k\.\k*'
	" \ '\%(\h\w*\|)\)\.\w*'

	" snippets
	imap <C-d> <Plug>(neosnippet_expand_or_jump)
	smap <C-d> <Plug>(neosnippet_expand_or_jump)
endif
" }}}
"------------------------------
" Vim-LaTeX {{{
"------------------------------
if neobundle#is_installed('vim-latex')
	set grepprg=grep\ -nH\ $*
	let g:tex_flavor='latex'
	let g:Imap_UsePlaceHolders = 1
	let g:Imap_DeleteEmptyPlaceHolders = 1
	let g:Imap_StickyPlaceHolders = 0
	let g:Tex_DefaultTargetFormat = 'pdf'
	let g:Tex_MultipleCompileFormats='dvi,pdf'
	"let g:Tex_FormatDependency_pdf = 'pdf'
	let g:Tex_FormatDependency_pdf = 'dvi,pdf'
	"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
	let g:Tex_FormatDependency_ps = 'dvi,ps'
	let g:Tex_CompileRule_pdf = 'ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" -od "-f uptex-ipaex.map -f otf-up-ipaex.map" $*'
	"let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
	"let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
	"let g:Tex_CompileRule_pdf = 'luajitlatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
	"let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
	"let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
	let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
	let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
	let g:Tex_BibtexFlavor = 'upbibtex'
	let g:Tex_MakeIndexFlavor = 'upmendex $*.idx'
	let g:Tex_UseEditorSettingInDVIViewer = 1
	let g:Tex_ViewRule_pdf = 'xdg-open'
	"let g:Tex_ViewRule_pdf = 'evince'
	"let g:Tex_ViewRule_pdf = 'okular --unique'
	"let g:Tex_ViewRule_pdf = 'zathura -x "vim --servername synctex -n --remote-silent +\%{line} \%{input}"'
	"let g:Tex_ViewRule_pdf = 'qpdfview --unique'
	"let g:Tex_ViewRule_pdf = 'texworks'
	"let g:Tex_ViewRule_pdf = 'mupdf'
	"let g:Tex_ViewRule_pdf = 'firefox -new-window'
	"let g:Tex_ViewRule_pdf = 'chromium --new-window'
endif
"}}}
"------------------------------
" TweetVim {{{
"------------------------------
if neobundle#is_installed('TweetVim')
	let g:tweetvim_tweet_per_page = 200
	let g:tweetvim_display_source = 1
	let g:tweetvim_display_time = 1
	let g:tweetvim_async_post = 1
	let g:tweetvim_display_username = 1
	let g:tweetvim_buffer_name = '[buffer]'
endif
"}}}
"------------------------------
