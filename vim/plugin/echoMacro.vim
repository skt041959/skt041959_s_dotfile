let s:save_cpo = &cpo
set cpo&vim

function! s:macroDisplay()
    let l:macroName = expand("<cword>")
    call s:_macroDisplay(l:macroName)
endfunction

function! s:macroFind(test)
	call inputsave()
	echohl Question
	let l:macroName = input('Input macro to find: ',a:test)
	echohl None
	call inputrestore()
    echo "test"
    echo a:test
    echo l:macroName
    call s:_macroDisplay(l:macroName)
endfunction

function! s:_macroDisplay(macroName)
python << EOF
import linecache
macroName = vim.eval("a:macroName")+'\t'
try:
    with open('./tags', 'r') as tagfile:
        taglines = [e.strip().split('\t') for e in tagfile if e.startswith(macroName)]
    macroDefine = filter(lambda x: x[3].endswith('d'), taglines)
    defines = [linecache.getline(e[1], int(e[2][:-2])) for e in macroDefine]

    for define in defines:
        vim.command( 'echohl type|echo "{0}"|echohl None'.format(define) )
except IOError:
    print("no tag file")
EOF
endfunction

command MacroDisplay call s:macroDisplay()
command MacroFind call s:macroFind('')

autocmd FileType c,cpp nnoremap [d :MacroDisplay<CR>

"nnoremap [d :MacroDisplay<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
