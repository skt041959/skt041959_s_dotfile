
function! InplaceTagJump(tag) abort
    let s:items = taglist(a:tag)

python <<EOF
import os.path
template = 'echohl Error | echomsg "{}"| echohl None'

tag = vim.eval('a:tag')
items = vim.eval('s:items')

EOF
endfunction

command! ITag call InplaceTagJump(expand("<cword>"))

"nnoremap <C-]> :ITag<CR>
