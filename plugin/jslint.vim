" This plugin requires jslint in your path.
"
" To install it, make sure npm is installed and invoke the following command:
"
"   npm install -g jslint

" Get a handle to the jslint program
if !exists("g:jslintprg")
    let g:jslintprg="jslint"
endif

function! s:JSLint(cmd, args)
    redraw

    " Default to current file.
    if empty(a:args)
        let l:fileargs = expand("%")
    else
        let l:fileargs = a:args
    end

    " Save the current grep settings.
    let grepprg_bak=&grepprg
    let grepformat_bak=&grepformat

    " Perform the jslint operation.
    try
        let &grepprg=g:jslintprg
        let &grepformat=""
        let cmdline = [a:cmd]
        
        call add(cmdline, l:fileargs)
        "silent execute join(cmdline)
        echo join(cmdline)
    finally
        " Restore the old grep settings.
        let &grepprg=grepprg_bak
        let &grepformat=grepformat_bak
    endtry
endfunction

command! -bang -nargs=* -complete=file JSLint call s:JSLint('grep<bang>',<q-args>)
