
function! InplaceTagJump(tag)
python <<EOF
import ctags
import os.path
from ctags import CTags, TagEntry
template = 'echohl Error | echomsg "{}"| echohl None'

tag = vim.eval('a:tag')
vim.command("let g:tagfiles = tagfiles()")
tagfiles = vim.eval("g:tagfiles")
itemN = 0

for tagfile in tagfiles:
    tf = CTags(tagfile)
    entry = TagEntry()
    itemN += tf.find(entry, tag, ctags.TAG_PARTIALMATCH)
    if itemN > 1:
        vim.command(template.format("tag multiple match!"))
    elif itemN == 1:
        filename = os.path.abspath(entry['file'])
        for w in vim.windows:
            #vim.command(template.format(w.buffer.name))
            if filename == w.buffer.name:
                vim.current.window = w
                vim.command('split')
                vim.command('tag {}'.format(tag))
                break
        else:
            vim.command('split')
            vim.command('tag {}'.format(tag))
        break
else:
    vim.command(template.format("missing tag"))
EOF
endfunction

command ITag call InplaceTagJump(expand("<cword>"))

nnoremap <C-]> :ITag<CR>
