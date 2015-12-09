execute 'source' '/home/skt/.vim/vimrc'

set termencoding=utf-8

cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <M-p> <Up>
cnoremap <M-n> <Down>

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"set runtimepath+=/home/skt/.vim/bundle/deoplete.nvim

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"let $NVIM_PYTHON_LOG_FILE='/home/skt/tmp/nvimlog-python'
"let $NVIM_PYTHON_LOG_LEVEL='DEBUG'

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

"let g:deoplete#enable_at_startup = 1
"autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#smart_auto_mappings = 0
"let g:jedi#show_call_signatures = 0

" vim: set ft=vim fdm=marker
