
call plug#begin()
"{{{
Plug 'thinca/vim-quickrun'
Plug 'critiqjo/lldb.nvim', {'for': ['c++', 'c']}
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
"Plug 'lambdalisue/vim-pyenv'
"Plug 'jmcantrell/vim-virtualenv'
"Plug 'KabbAmine/zeavim.vim'

Plug 'kshenoy/vim-signature'
Plug 'scrooloose/syntastic'
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'bfredl/nvim-ipy', {'for': 'python'}
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/echodoc.vim'
Plug 'benekastah/neomake'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'mbbill/fencview'
Plug 'mbbill/undotree'
"Plug 'DoxygenToolkit.vim'

Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'chemzqm/unite-git-log'
Plug 'Shougo/neoyank.vim'
Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'kopischke/vim-stay'

Plug 'a.vim'
Plug 'Mark--Karkat'
Plug 'renamer.vim'
Plug 'fcitx.vim'

Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'phildawes/racer', {'for': 'rust'}

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'
Plug 'dhruvasagar/vim-table-mode'

Plug 'fatih/vim-go', {'for': 'go'}

Plug 'peterhoeg/vim-qml', {'for': 'qml'}

Plug 'skt041959/markdown-preview.vim'

Plug 'kurayama/systemd-vim-syntax'
Plug 'chrisbra/csv.vim', {'for': 'csv'}

Plug 'vim-utils/vim-man'
Plug 'lambdalisue/vim-gista'
Plug 'guns/xterm-color-table.vim'
Plug 'skt041959/vim-color-skt'
Plug 'skt041959/vim-libpinyin'
Plug 'skt041959/vim-mdpreview'
"}}}
call plug#end()

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

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

"let $NVIM_PYTHON_LOG_FILE = '/home/skt/tmp/nvimlog-python'
"let $NVIM_PYTHON_LOG_LEVEL = 'DEBUG'

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

"====deoplete===={{{
"let g:deoplete#enable_at_startup = 1
"autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#smart_auto_mappings = 0
"let g:jedi#show_call_signatures = 0
"}}}

"====neomake===={{{
"let g:neomake_python_enabled_makers = ['flake8']
"autocmd! BufWritePost * Neomake
"}}}

"====nvim-ipy===={{{
let g:nvim_ipy_perform_mappings = 0
function Map_nvim_ipy()
    nnoremap <F5> <Plug>(IPy-Run)
    nnoremap <F10> <Plug>(IPy-Interrupt)
    nnoremap <space>o <Plug>(IPy-WordObjInfo)
    inoremap <C-F> <Plug>(IPy-Complete)
endfunction
autocmd FileType python call Map_nvim_ipy()
"}}}

"====lldb.nvim===={{{
function LLDB_debug_mode()
    vmap <F2> <Plug>LLStdInSelected
    nnoremap <C-F4> :LLstdin<CR>
    nnoremap <F8> :LL continue<CR>
    nnoremap <F9> :LL next<CR>
    nnoremap <S-F8> :LL process interrupt<CR>
    nnoremap <F10> :LL print <C-R>=expand('<cword>')<CR>
    vnoremap <F10> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>
    LLmode debug
endfunction
function LLDB_code_mode()
    LLmode code
endfunction
nmap <M-b> <Plug>LLBreakSwitch
autocmd FileType c,cpp nmap <F5> :call LLDB_debug_mode()<CR>
autocmd FileType c,cpp nmap <S-F5> :call LLDB_code_mode()<CR>
"}}}

" vim: set ft=vim fdm=marker
