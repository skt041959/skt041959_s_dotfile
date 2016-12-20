
call plug#begin()
"{{{
    Plug 'KabbAmine/zeavim.vim'
    Plug 'thinca/vim-quickrun'
    Plug 'critiqjo/lldb.nvim', {'for': ['c++', 'c']}
    Plug 'hynek/vim-python-pep8-indent', {'for': ['python']}
    Plug 'rhysd/vim-clang-format'

    Plug 'kshenoy/vim-signature'
    Plug 'scrooloose/syntastic', {'for': []}
    Plug 'davidhalter/jedi-vim', {'for': ['python']}
    Plug 'bfredl/nvim-ipy', {'on': ['IPython']}
    Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
    Plug 'tmhedberg/SimpylFold'

    Plug 'Valloric/YouCompleteMe', {
                \'for': ['c', 'cpp', 'cmake', 'python', 'rust']}

    Plug 'Shougo/deoplete.nvim', {
                \'for': ['java', 'lua', 'pandoc', 'markdown', 'sh', 'vim', 'verilog', 'verilog_systemverilog', 'html', 'make'],
                \'on': ['DeopleteEnable']
                \ }
    Plug 'zchee/deoplete-go', {'do': 'make'}
    Plug 'zchee/deoplete-zsh'
    Plug 'Shougo/echodoc.vim'
    Plug 'zchee/deoplete-jedi'
    Plug 'artur-shaik/vim-javacomplete2', {'for': ['java'],}
                " \ 'tag': 'v2.3.5',
                " \ }
    Plug 'racer-rust/vim-racer', {'for': ['rust']}
    Plug 'Shougo/neco-vim', {'for': ['vim']}
    Plug 'Shougo/neosnippet.vim', {'for': []}
    Plug 'Shougo/neosnippet-snippets'

    Plug 'vhakulinen/neovim-intellij-complete-deoplete', {'on': ['IntellijComplete']}

    Plug 'benekastah/neomake'

    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
    Plug 'Xuyuanp/nerdtree-git-plugin', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
    " Plug 'ryanoasis/vim-devicons'
    Plug 'Raimondi/delimitMate'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'SirVer/ultisnips'
    Plug 'godlygeek/tabular'

    Plug 'honza/vim-snippets'
    Plug 'mbbill/fencview'
    Plug 'mbbill/undotree'
    " Plug 'kana/vim-submode'
    Plug 'ConradIrwin/vim-bracketed-paste'

    Plug 'Shougo/vimproc.vim', {'do': 'make'}
    Plug 'Shougo/unite.vim'
    Plug 'Shougo/unite-outline'
    Plug 'Shougo/neoyank.vim'
    Plug 'Shougo/neomru.vim'
    Plug 'Shougo/unite-session'
    Plug 'Shougo/unite-help'
    Plug 'chemzqm/unite-git-log'
    Plug 'thinca/vim-unite-history'
    Plug 'junegunn/vim-peekaboo'
    Plug 'wellle/visual-split.vim'

    Plug 'easymotion/vim-easymotion'
    Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-easymotion.vim'
    Plug 'rhysd/clever-f.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    " Plug 'c0r73x/neotags.nvim'
    Plug 'christoomey/vim-tmux-navigator'

    Plug 'majutsushi/tagbar'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'kopischke/vim-stay'
    Plug 'Konfekt/FastFold'
    Plug 'arakashic/chromatica.nvim'
    Plug 'Chiel92/vim-autoformat'

    Plug 'a.vim'
    Plug 'Mark--Karkat'
    Plug 'renamer.vim'
    Plug 'zenbro/mirror.vim'
    Plug 'fcitx.vim'
    Plug 'DoxygenToolkit.vim'
    Plug 'bps/vim-textobj-python'
    Plug 'kana/vim-textobj-user'

    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vim-pandoc/vim-pandoc-after'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'miyakogi/livemark.vim'
    "Plug 'skt041959/markdown-preview.vim', {'for': ['pandoc', 'markdown']}

    " Plug 'fatih/vim-go', {'for': 'go'}
    Plug 'rust-lang/rust.vim', {'for': 'rust'}
    Plug 'peterhoeg/vim-qml', {'for': 'qml'}
    Plug 'Cognoscan/vim-vhdl', {'for': []}
    Plug 'vhda/verilog_systemverilog.vim', {'for': ['verilog', 'verilog_systemverilog']}
    Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}

    Plug 'kurayama/systemd-vim-syntax'
    Plug 'chrisbra/csv.vim', {'on': ['InitCSV']}
    Plug 'keith/tmux.vim'
    " Plug 'nhooyr/neoman.vim'
    Plug 'lambdalisue/vim-gista'

    Plug 'guns/xterm-color-table.vim'
    Plug 'skt041959/vim-color-skt'
    Plug 'nanotech/jellybeans.vim'
    Plug 'trusktr/seti.vim'
    Plug 'morhetz/gruvbox'

    Plug 'skt041959/vim-libpinyin', {'for': []}

    Plug '~/code/gdbmi.nvim', {'on': ['GDBLaunch']}

    "Plug 'rhysd/nyaovim-popup-tooltip'
    " Plug 'rhysd/nyaovim-markdown-preview'
"}}}
call plug#end()

execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/vimrc'
colorscheme darkblack_skt

xnoremap p "_dP
set termguicolors
set termencoding=utf-8
set exrc
set inccommand=split

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

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

"let $NVIM_PYTHON_LOG_FILE = '/home/skt/tmp/nvimlog-python'
"let $NVIM_PYTHON_LOG_LEVEL = 'DEBUG'

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

" Neovim-qt Guifont command
command -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', "<args>") | let g:Guifont="<args>"
Guifont Source Code Pro:h10

"====vim-plug===={{{
function! s:plug_doc()
    let name = matchstr(getline('.'), '^- \zs\S\+\ze:')
    if has_key(g:plugs, name)
        for doc in split(globpath(g:plugs[name].dir, 'doc/*.txt'), '\n')
            execute 'e' doc
        endfor
    endif
endfunction

augroup PlugHelp
    autocmd!
    autocmd FileType vim-plug nnoremap <buffer> <silent> H :call <sid>plug_doc()<cr>
augroup END

function! s:plug_gx()
    let line = getline('.')
    let sha  = matchstr(line, '^  \X*\zs\x\{7}\ze ')
    let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
                \ : getline(search('^- .*:$', 'bn'))[2:-2]
    let uri  = get(get(g:plugs, name, {}), 'uri', '')
    if uri !~ 'github.com'
        return
    endif
    let repo = matchstr(uri, '[^:/]*/'.name)
    let url  = empty(sha) ? 'https://github.com/'.repo
                \ : printf('https://github.com/%s/commit/%s', repo, sha)
    call netrw#BrowseX(url, 0)
endfunction

augroup PlugGx
    autocmd!
    autocmd FileType vim-plug nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
augroup END

function! s:scroll_preview(down)
    silent! wincmd P
    if &previewwindow
        execute 'normal!' a:down ? "\<c-e>" : "\<c-y>"
        wincmd p
    endif
endfunction

function! s:setup_extra_keys()
    nnoremap <silent> <buffer> J :call <sid>scroll_preview(1)<cr>
    nnoremap <silent> <buffer> K :call <sid>scroll_preview(0)<cr>
    nnoremap <silent> <buffer> <c-n> :call search('^  \X*\zs\x')<cr>
    nnoremap <silent> <buffer> <c-p> :call search('^  \X*\zs\x', 'b')<cr>
    nmap <silent> <buffer> <c-j> <c-n>o
    nmap <silent> <buffer> <c-k> <c-p>o
endfunction

augroup PlugDiffExtra
    autocmd!
    autocmd FileType vim-plug call s:setup_extra_keys()
augroup END
"}}}

"====deoplete===={{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 2
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1
"}}}

"====javacomplete2===={{{
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_LibsPath = '/home/skt/code/leetcode/algorithms/java/junit-4.7.jar'
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
let g:neomake_python_flake8_args = ['--first'
            \ , '--ignore='
            \ .'E111,E114,E121,E125,E126,E127,E128,E129,E131,E133,E201,E202,'
            \ .'E203,E211,E221,E222,E241,E251,E261,E303,E402,E501,W503']
let g:neomake_vim_enabled_makers = ['vint']
let g:neomake_cpp_enabled_makers = []
let g:neomake_c_enabled_makers = []
let g:neomake_markdown_enabled_makers = []
let g:neomake_pandoc_enabled_makers = []
let g:neomake_c_cscope_maker = {
            \ 'exec': 'cscope',
            \ 'args': ['-RbqkU'],
            \ 'append_file': 0,
            \ }
"let g:neomake_java_javac_args = ['-d', '../out']
call add(g:airline_extensions, 'neomake')
autocmd! BufWritePost * Neomake
"}}}

"====nvim-ipy===={{{
let g:nvim_ipy_perform_mappings = 1
let g:ipy_set_ft = 1
let g:ipy_truncate_input = 30
function Map_nvim_ipy()
    nmap <F5> <Plug>(IPy-Run)
    vmap <F5> <Plug>(IPy-Run)
    nmap <F10> <Plug>(IPy-Interrupt)
    nmap <space>? <Plug>(IPy-WordObjInfo)
    imap <C-F> <Plug>(IPy-Complete)
    nmap <space>v <Plug>(IPy-VariableValue)
endfunction
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
            \ 'Todo': { 'guifg': '303030', 'guibg': 'f0f000'
            \ , 'ctermfg': 'Black', 'ctermbg': 'Yellow', 'attr': 'bold' } }
"}}}

"====verilog===={{{
let g:verilog_syntax_fold_lst = 'class,'
            \.'function,'
            \.'task,'
            \.'block,'
            \.'comment'
let g:verilog_disable_indent_lst = 'module'
let g:tagbar_type_verilog_systemverilog = {
            \ 'ctagstype'   : 'SystemVerilog',
            \ 'kinds'       : [
            \     'b:blocks:1:1',
            \     'c:constants:1:0',
            \     'e:events:1:0',
            \     'f:functions:1:1',
            \     'm:modules:0:1',
            \     'n:nets:1:0',
            \     'p:ports:1:0',
            \     'r:registers:1:0',
            \     't:tasks:1:1',
            \     'A:assertions:1:1',
            \     'C:classes:0:1',
            \     'V:covergroups:0:1',
            \     'I:interfaces:0:1',
            \     'M:modport:0:1',
            \     'K:packages:0:1',
            \     'P:programs:0:1',
            \     'R:properties:0:1',
            \     'T:typedefs:0:1'
            \ ],
            \ 'sro'         : '.',
            \ 'kind2scope'  : {
            \     'm' : 'module',
            \     'b' : 'block',
            \     't' : 'task',
            \     'f' : 'function',
            \     'C' : 'class',
            \     'V' : 'covergroup',
            \     'I' : 'interface',
            \     'K' : 'package',
            \     'P' : 'program',
            \     'R' : 'property'
            \ },
            \ }
"}}}

"====chromatica===={{{
let g:chromatica#libclang_path='/usr/lib'
"}}}

"====autoformat===={{{
let g:autoformat_autoindent=0
let g:autoformat_retab=0
let g:autoformat_remove_trailing_spaces=0
"}}}

"====vim-tmux-navigator===={{{
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 0

nnoremap <silent> ;h :TmuxNavigateLeft<cr>
nnoremap <silent> ;j :TmuxNavigateDown<cr>
nnoremap <silent> ;k :TmuxNavigateUp<cr>
nnoremap <silent> ;l :TmuxNavigateRight<cr>
nnoremap <silent> ;p :TmuxNavigatePrevious<cr>
"}}}

"====gdbmi.nvim===={{{
let g:gdbmi#auto_mapping=1
"}}}

"===={{{
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
"}}}
" vim: set fdm=marker
