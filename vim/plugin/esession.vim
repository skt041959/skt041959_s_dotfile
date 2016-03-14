
if exists("g:has_esession")
    finish
endif
let g:has_esession = 1

let g:esession_registerd_vars = []
let g:esession_registerd_options = []
let g:esession_registerd_cmd = []

function! Register_variable(var, ...)
    call add(g:esession_registerd_vars, a:var)
    if a:0
        exec 'let '.a:var.' = '.a:1
    endif
endfunction

function! Register_option(option, ...)
    call add(g:esession_registerd_options, a:option)
    if a:0
        let s:opt = escape(a:1, ' \')
        exec 'set '.a:option.'='.s:opt
    endif
endfunction

function! Register_command(cmd, ...)
    call add(g:esession_registerd_cmd, a:cmd)
    if a:0
        exec a:cmd
    endif
endfunction

function! EMksession()
python << EOF
rv = vim.eval("g:esession_registerd_vars")
ro = vim.eval("g:esession_registerd_options")
rc = vim.eval("g:esession_registerd_cmd")

vim.command("mksession!")
with open("Session.vim", "at") as f:
    for v in rv:
        f.write("call Register_variable('{}', '{}')\n".format(v, repr(vim.eval(v)).replace("'", '"')))
    for o in ro:
        f.write("call Register_option('{}', {})\n".format(o, repr(vim.eval("&"+o)).replace("'", '"')))
    for c in rc:
        f.write("call Register_command('{}', 1)\n".format(c))
EOF
endfunction
