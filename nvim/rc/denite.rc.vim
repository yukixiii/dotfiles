" Change file/rec command.
" call denite#custom#var('file/rec', 'command',
"			\ ['pt', '--follow', '--nocolor', '--nogroup', '-g=', ''])
call denite#custom#var('file/rec', 'command',
			\ ['rg', '--files', '--glob', '!.git'])

" call denite#custom#var('file/rec', 'command', ['scantree.py'])

" Change mappings.
call denite#custom#map(
			\ 'insert',
			\ '<C-j>',
			\ '<denite:move_to_next_line>',
			\ 'noremap'
			\)
call denite#custom#map(
			\ 'insert',
			\ '<C-k>',
			\ '<denite:move_to_previous_line>',
			\ 'noremap'
			\)
call denite#custom#map(
			\ 'insert',
			\ '<C-d>',
			\ '<denite:do_action:cd>',
			\ 'noremap'
			\)
call denite#custom#map(
			\ 'normal',
			\ 'cd',
			\ '<denite:do_action:cd>',
			\ 'noremap'
			\)
call denite#custom#map(
			\ 'insert',
			\ '..',
			\ '<denite:move_up_path>',
			\ 'noremap'
			\)
call denite#custom#map(
			\ 'insert',
			\ '<Esc>',
			\ '<denite:enter_mode:normal>',
			\ 'noremap'
			\)
call denite#custom#map(
			\ 'normal',
			\ '<Esc>',
			\ '<denite:quit>',
			\ 'noremap'
			\)
call denite#custom#map(
			\ 'normal',
			\ 's',
			\ '<denite:do_action:split>',
			\ 'noremap'
			\)
call denite#custom#map(
			\ 'insert',
			\ '<C-s>',
			\ '<denite:do_action:split>',
			\ 'noremap'
			\)
call denite#custom#map(
			\ 'normal',
			\ 'v',
			\ '<denite:do_action:vsplit>',
			\ 'noremap'
			\)
call denite#custom#map(
			\ 'insert',
			\ '<C-v>',
			\ '<denite:do_action:vsplit>',
			\ 'noremap'
			\)

" Change matchers.
call denite#custom#source('_', 'matchers', ['matcher/substring'])
call denite#custom#source(
			\ 'file_mru', 'matchers', ['matcher/substring', 'matcher/project_files'])
" call denite#custom#source(
"			\ 'file/rec', 'matchers', ['matcher/substring'])
" call denite#custom#source(
"			\ 'file', 'matchers', ['matcher/substring'])
" call denite#custom#source(
"			\ 'grep', 'matchers', ['matcher/fruzzy'])

" Change sorters.
call denite#custom#source(
			\ 'file/rec', 'sorters', ['sorter_sublime'])
call denite#custom#source(
			\ 'file', 'sorters', ['sorter_word'])

" jvgrep command on grep source
" call denite#custom#var('grep', 'command', ['jvgrep'])
" call denite#custom#var('grep', 'default_opts', [])
" " call denite#custom#var('grep', 'default_opts',
" " 			\ ['-i', '--exclude', '\.(git|svn|hg|bzr)'])
" call denite#custom#var('grep', 'recursive_opts', ['-R'])
" call denite#custom#var('grep', 'pattern_opt', [])
" call denite#custom#var('grep', 'separator', [])
" call denite#custom#var('grep', 'final_opts', [])

" Pt command on grep source
" call denite#custom#var('grep', 'command', ['pt'])
" call denite#custom#var('grep', 'default_opts',
"			\ ['--nogroup', '--nocolor', '--smart-case'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', [])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])

" ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
			\ ['-i', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#source('file_mru', 'converters',
			\ ['converter_relative_word'])

" Define alias
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
			\ ['git', 'ls-files', '-co', '--exclude-standard'])

" Change default prompt
call denite#custom#option('default', 'prompt', '>')

" Change default updatetime
" call denite#custom#option('default', 'updatetime', '50')

" Change ignore_globs
" call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
" 			\ [ '.git/', '.ropeproject/', '__pycache__/',
" 			\   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
