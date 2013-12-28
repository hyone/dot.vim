if exists('g:loaded_operator_format_seq')
  finish
endif

call operator#user#define('format-seq-normal', 'operator#format_seq#normal')
call operator#user#define('format-seq-oneline', 'operator#format_seq#oneline')
call operator#user#define('format-seq-each', 'operator#format_seq#each')

let g:loaded_operator_format_seq = 1


" vim: foldmethod=marker
