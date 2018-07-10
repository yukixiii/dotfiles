" Change file_rec command.
call denite#custom#var('file_rec', 'command',
			\ ['pt', '--follow', '--hidden', '--nocolor', '--nogroup', '-g=', ''])

call denite#custom#var('file_rec', 'command', ['scantree.py'])

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

" Change matchers.
call denite#custom#source(
			\ 'file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
call denite#custom#source(
			\ 'file_rec', 'matchers', ['matcher_cpsm'])
call denite#custom#source(
			\ 'grep', 'matchers', ['matcher_cpsm'])

" Change sorters.
call denite#custom#source(
			\ 'file_rec', 'sorters', ['sorter_sublime'])

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
call denite#custom#var('grep', 'command', ['pt'])
call denite#custom#var('grep', 'default_opts',
			\ ['--nogroup', '--nocolor', '--smart-case'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#source('file_mru', 'converters',
			\ ['converter_relative_word'])

" Define alias
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
			\ ['git', 'ls-files', '-co', '--exclude-standard'])

" Change default prompt
call denite#custom#option('default', 'prompt', '>')

" Change default updatetime
" call denite#custom#option('default', 'updatetime', '50')

" Change ignore_globs
" call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
" 			\ [ '.git/', '.ropeproject/', '__pycache__/',
" 			\   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
