
call plug#begin()
"{{{
    Plug 'KabbAmine/zeavim.vim'
    Plug 'thinca/vim-quickrun'
    Plug 'critiqjo/lldb.nvim', {'for': ['c++', 'c']}
    Plug 'hynek/vim-python-pep8-indent', {'for': ['python']}

    Plug 'kshenoy/vim-signature'
    Plug 'scrooloose/syntastic', {'for': []}
    Plug 'davidhalter/jedi-vim', {'for': []}
    Plug 'bfredl/nvim-ipy', {'for': 'python'}
    Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
    Plug 'tmhedberg/SimpylFold'

    "Plug 'Valloric/YouCompleteMe', {'on': 'YcmCompleter'}
    "autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif
    "augroup load_us_ycm
    "  autocmd!
    "  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
    "                     \| call youcompleteme#Enable() | autocmd! load_us_ycm
    "augroup END
    Plug 'Valloric/YouCompleteMe', {'for': ['c', 'cpp', 'cmake', 'python', 'rust']}

    Plug 'Shougo/deoplete.nvim', {'for': ['java', 'lua', 'pandoc', 'markdown', 'sh', 'vim', 'html', 'make'], 'on': ['DeopleteEnable']}
    Plug 'Shougo/echodoc.vim'
    Plug 'zchee/deoplete-jedi'
    Plug 'Shougo/neco-vim'
    Plug 'Shougo/neosnippet.vim', {'for': []}
    Plug 'Shougo/neosnippet-snippets'

    Plug 'benekastah/neomake'

    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
    Plug 'Raimondi/delimitMate'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'SirVer/ultisnips'

    Plug 'honza/vim-snippets'
    Plug 'mbbill/fencview'
    Plug 'mbbill/undotree'
    Plug 'kana/vim-submode'

    Plug 'Shougo/vimproc.vim', {'do': 'make'}
    Plug 'Shougo/unite.vim'
    Plug 'Shougo/unite-outline'
    Plug 'Shougo/neoyank.vim'
    Plug 'chemzqm/unite-git-log'
    Plug 'junegunn/vim-peekaboo'
    Plug 'wellle/visual-split.vim'

    Plug 'easymotion/vim-easymotion'
    Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-easymotion.vim'
    Plug 'rhysd/clever-f.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    Plug 'majutsushi/tagbar'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'kopischke/vim-stay'

    Plug 'a.vim'
    Plug 'Mark--Karkat'
    Plug 'renamer.vim'
    Plug 'fcitx.vim'

    Plug 'rust-lang/rust.vim', {'for': 'rust'}

    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vim-pandoc/vim-pandoc-after'
    Plug 'dhruvasagar/vim-table-mode'

    Plug 'fatih/vim-go', {'for': 'go'}

    Plug 'peterhoeg/vim-qml', {'for': 'qml'}

    "Plug 'skt041959/markdown-preview.vim', {'for': ['pandoc', 'markdown']}
    Plug 'miyakogi/livemark.vim'

    Plug 'kurayama/systemd-vim-syntax'
    Plug 'chrisbra/csv.vim', {'on': ['InitCSV']}
    Plug 'keith/tmux.vim'

    Plug 'nhooyr/neoman.vim'
    Plug 'lambdalisue/vim-gista'
    Plug 'guns/xterm-color-table.vim'
    Plug 'skt041959/vim-color-skt'
    Plug 'nanotech/jellybeans.vim'
    Plug 'skt041959/vim-libpinyin'

    Plug '~/code/gdbmi.nvim'

    "Plug '~/.vim/plugged/eclim/', {'for': ['java', 'python']}

    "Plug 'rhysd/nyaovim-popup-tooltip'
    "Plug 'rhysd/nyaovim-markdown-preview'
"}}}
call plug#end()

execute 'source' '/home/skt/.vim/vimrc'
colorscheme darkblack_skt

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

" Neovim-qt Guifont command
command -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', "<args>") | let g:Guifont="<args>"
Guifont Source Code Pro:h10

"====deoplete===={{{
let g:deoplete#enable_at_startup = 1
"}}}

"====neosnippt===={{{
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'
"}}}

"====neomake===={{{
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_args = ['--first', '--ignore=E111,E114,E121,E125,E126,E127,E128,E129,E131,E133,E201,E202,E203,E211,E221,E222,E241,E251,E261,E303,E402,E501,W503']
let g:neomake_vim_enabled_makers = ['vint']
let g:neomake_cpp_enabled_makers = []
let g:neomake_c_enabled_makers = []
let g:neomake_c_cscope_maker = {
            \ 'exec': 'cscope',
            \ 'args': ['-RbqkU'],
            \ 'append_file': 0,
            \ }
call add(g:airline_extensions, 'neomake')
autocmd! BufWritePost * Neomake
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
    "vmap <F2> <Plug>LLStdInSelected
    nnoremap <F2> :LLstdin<CR>
    nnoremap <F8> :LL continue<CR>
    nnoremap <S-F8> :LL process interrupt<CR>
    nnoremap <F9> :LL next<CR>
    nnoremap <F10> :LL step<CR>
    nnoremap <F12> :LL print <C-R>=expand('<cword>')<CR>
    vnoremap <F12> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>
    LLmode debug
endfunction
function LLDB_code_mode()
    LLmode code
endfunction
"nmap <M-b> <Plug>LLBreakSwitch
"autocmd FileType c,cpp nmap <F5> :call LLDB_debug_mode()<CR>
"autocmd FileType c,cpp nmap <S-F5> :call LLDB_code_mode()<CR>
"}}}

"====eclim===={{{
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimFileTypeValidate = 0
"}}}

"====livemark===={{{
let g:livemark_browser = 'chromium'
let g:livemark_python = '/usr/bin/python'
"}}}

"====jellybeans===={{{
let g:jellybeans_use_lowcolor_black = 0
let g:jellybeans_overrides = {
            \ 'Todo': { 'guifg': '303030', 'guibg': 'f0f000', 'ctermfg': 'Black', 'ctermbg': 'Yellow', 'attr': 'bold' } }
"}}}

"{{{
function! s:termlog() abort
    vsplit
    wincmd l
    exec 'terminal'
    let s:term_id = b:terminal_job_id
    wincmd h
    call jobsend(s:term_id, "tail -f ~/tmp/nvimlog-python_".string(g:gdbmi#_python_pid)."\n")
    stopinsert
endfunction
command Termlog call <SID>termlog()
nnoremap <leader>br :GDBBreakSwitch<CR>
au BufRead ab.c silent GdbmiInitializePython
au VimEnter ab.c silent Termlog
"}}}

" vim: set ft=vim fdm=marker
