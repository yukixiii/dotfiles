" vim: noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
let g:unite_source_file_rec_max_cache_files = -1

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

" Custom filters."{{{
call unite#custom#source(
			\ 'buffer,file_rec,file_rec/async,file_rec/git', 'matchers',
			\ ['converter_relative_word', 'matcher_fuzzy'])
call unite#custom#source(
			\ 'file_mru', 'matchers',
			\ ['matcher_project_files', 'matcher_fuzzy',
			\  'matcher_hide_hidden_files', 'matcher_hide_current_file'])
call unite#custom#source(
			\ 'file_rec,file_rec/async,file_rec/git,file_mru', 'converters',
			\ ['converter_uniq_word'])
call unite#custom#source(
			\ 'buffer', 'converters',
			\ ['converter_uniq_word','converter_word_abbr'])
call unite#filters#sorter_default#use(['sorter_rank'])
"}}}

" unite grepにjvgrepを使う
if executable('jvgrep')
	let g:unite_source_grep_command = 'jvgrep'
	let g:unite_source_grep_default_opts =
				\ '-i --exclude ''\.(git|svn|hg|bzr)'''
	let g:unite_source_grep_recursive_opt = '-R'
endif
