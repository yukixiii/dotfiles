" vim:set noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
if filereadable(expand('~/.config/nvim/dein.rc.vim'))
	source ~/.config/nvim/dein.rc.vim
endif

if filereadable(expand('~/.vim/encode.vim'))
	source ~/.vim/encode.vim
endif

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
if has('unnamedplus')
	set clipboard=unnamedplus
else
	set clipboard+=unnamed
endif

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
set expandtab " タブをスペースに展開する

" 分割時に右、下にフォーカス
set splitbelow
set splitright

" terminal
" terminalをinsertで始める
autocmd TermOpen * startinsert

" if has('nvim')
" 	let g:python_host_prog = '/usr/bin/python2'
" 	let g:python3_host_prog = '/usr/bin/python'
" endif

" 「日本語入力固定モード」切替キー
" dein.tmlに書こうとしたけどうまく行かなかった
let IM_CtrlMode = 1
if !exists('*IMCtrl')
	silent! function IMCtrl(cmd)
		let cmd = a:cmd
		if cmd == 'On'
			call system('fcitx-remote -o > /dev/null 2>&1 '.g:IM_CtrlAsync)
		elseif cmd == 'Off'
			call system('fcitx-remote -c > /dev/null 2>&1 '.g:IM_CtrlAsync)
		elseif cmd == 'Toggle'
			call system('fcitx-remote -t > /dev/null 2>&1 '.g:IM_CtrlAsync)
		endif
		return ''
	endfunction
endif
inoremap <silent> <C-o> <C-r>=IMState('FixMode')<CR>
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
set cmdheight=1
set laststatus=2

" tabと行末スペースを表示
set list
set listchars=tab:^\ ,trail:~

" 検索時にハイライト表示
set hlsearch

" 端末色数
" set t_Co=256
set termguicolors

" colorscheme
set background=light
" set background=dark
colorscheme gruvbox

" if !exists('g:gui_oni')
" 	let g:seiya_auto_enable=1
" endif


" 行ハイライト
set cursorline
" set cursorcolumn

" 行ハイライトを現在のウィンドウでのみ行う
au WinLeave * set nocursorline
au WinEnter * set cursorline

" 相対行番号
" set relativenumber

" 特殊記号の幅
set ambiwidth=single

" 折り返し時のインデント
set breakindent

" diff表示
set diffopt+=iblank,iwhite

" 折りたたみテキスト変更
" if neobundle#is_installed('foldCC.vim')
" 	set foldtext=FoldCCtext()
" endif

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
nnoremap <silent> <Leader>u :<C-u>e ++enc=utf-8<CR>
nnoremap <silent> <Leader>c :<C-u>e ++enc=cp932<CR>
nnoremap <silent> <Leader>e :<C-u>e ++enc=euc-jp<CR>
nnoremap <Leader>r :<C-u>e ++ff=

" 改行コード、文字コードの設定
nnoremap <Leader>fe :<C-u>set fileencoding=
nnoremap <Leader>ff :<C-u>set fileformat=

" filetypeの設定
nnoremap <Leader>ft :<C-u>set filetype=

" terminal emulator
nnoremap <silent> ,st :<C-u>tabnew +terminal<CR>
nnoremap <silent> ,sh :<C-u>terminal<CR>
nnoremap <silent> ,sp :<C-u>split +terminal<CR>
nnoremap <silent> ,sv :<C-u>vsplit +terminal<CR>

" tab
nnoremap <silent> <Leader>t :<C-u>tabnew<CR>
nnoremap <silent> <Leader>w :<C-u>tabclose<CR>
nnoremap <silent> <C-S-PageDown> :<C-u>tabmove +<CR>
nnoremap <silent> <C-S-PageUp> :<C-u>tabmove -<CR>
nnoremap <silent> <A-1> :<C-u>tabnext 1<CR>
nnoremap <silent> <A-2> :<C-u>tabnext 2<CR>
nnoremap <silent> <A-3> :<C-u>tabnext 3<CR>
nnoremap <silent> <A-4> :<C-u>tabnext 4<CR>
nnoremap <silent> <A-5> :<C-u>tabnext 5<CR>
nnoremap <silent> <A-6> :<C-u>tabnext 6<CR>
nnoremap <silent> <A-7> :<C-u>tabnext 7<CR>
nnoremap <silent> <A-8> :<C-u>tabnext 8<CR>
nnoremap <silent> <A-9> :<C-u>tabnext 9<CR>
nnoremap <silent> <A-0> :<C-u>tabnext $<CR>

" diff
nnoremap <Leader>dt :<C-u>diffthis<CR>
nnoremap <Leader>do :<C-u>diffoff!<CR>

" background
nnoremap <silent> <Leader>bl :<C-u>set background=light<CR>
nnoremap <silent> <Leader>bd :<C-u>set background=dark<CR>

" Plugin
" nmap ,a :<C-u>Unite buffer_tab file file_mru<CR>
" nmap ,t :<C-u>Unite buffer_tab<CR>
" nmap ,y :<C-u>Unite buffer<CR>
" nmap ,m :<C-u>Unite file_mru<CR>
" nmap ,r :<C-u>Unite file_rec/async<CR>
" nmap ,p :<C-u>Unite file_rec/async:!<CR>
" nmap ,g :<C-u>UniteWithBufferDir file file/new directory/new<CR>
" nmap ,j :<C-u>Unite file file/new directory/new<CR>
" nmap ,f :<C-u>VimFiler<CR>
" nmap ,d :<C-u>VimFilerBufferDir<CR>
" nmap ,sh :<C-u>VimShell<CR>
" nmap ,sp :<C-u>VimShellPop<CR>
" nmap ,b :<C-u>Unite bookmark:default -input=[<CR>
" nmap ,v :<C-u>Unite bookmark:default -input=[ -default-action=vimfiler<CR>
" nmap ,/ :<C-u>Unite line -start-insert<CR>
" nmap ,n/ :<C-u>Unite line -start-insert -no-quit<CR>
" nmap ,e :<C-u>UniteResume<CR>
" nmap <Leader>o :<C-u>Unite outline<CR>
" nmap <Leader>gr :<C-u>Unite grep -no-quit<CR>
"
" nmap <Leader>tw :<C-u>Unite tweetvim<CR>
" nmap <Leader>n :<C-u>TweetVimSay<CR>
" }}}
" insert mode {{{
" インサートモードでもHJKL移動
" imap <C-h> <Left>
" imap <C-j> <Down>
" imap <C-k> <Up>
" imap <C-l> <Right>
" Escのキーバインド
" inoremap <C-c> <Esc>
" inoremap <C-f> <Esc>
" }}}
" visual mode {{{
" 選択中にF3キーで選択中の文字列検索
vmap <F3> y/\V<C-R>=substitute(escape(@",'/'),"\n","\\\\n","g")<CR>/<CR>
" vnoremap <C-c> <Esc>
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
" terminal windowの設定 {{{
"------------------------------
" tnoremap <A-h> <C-\><C-N><C-w>h
" tnoremap <A-j> <C-\><C-N><C-w>j
" tnoremap <A-k> <C-\><C-N><C-w>k
" tnoremap <A-l> <C-\><C-N><C-w>l
" inoremap <A-h> <C-\><C-N><C-w>h
" inoremap <A-j> <C-\><C-N><C-w>j
" inoremap <A-k> <C-\><C-N><C-w>k
" inoremap <A-l> <C-\><C-N><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l

autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
" }}}
"------------------------------
