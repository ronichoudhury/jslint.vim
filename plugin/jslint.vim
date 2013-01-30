" This plugin requires jslint in your path.  To install it, make sure npm is
" installed and invoke the following command:
"
"   npm install -g jslint
"
" To run the JSLint service, simply do ":JSLint".

" Get a handle to the jslint program
if !exists("g:jslintprg")
    let g:jslintprg="jslint"
endif

function! s:JSLint(cmd)
    redraw

    " Process the current file.
    let l:fileargs = expand("%")

    " Save the current grep settings.
    let grepprg_bak=&grepprg
    let grepformat_bak=&grepformat

    " Perform the jslint operation.
    try
        " Set the appropriate grep options.
        let &grepprg=g:jslintprg
        let &grepformat="%-P%f,%A%>%\\s%\\?#%\\d%\\+\ %m,%Z%.%#Line\ %l\\,\ Pos\ %c,%-G%f\ is\ OK.,%-Q"

        " Construct the execution line.
        let cmdline = [a:cmd]
        call add(cmdline, l:fileargs)

        " Execute the command.
        silent execute join(cmdline)
    finally
        " Restore the old grep settings.
        let &grepprg=grepprg_bak
        let &grepformat=grepformat_bak
    endtry

    " Open the quickfix window and display the errors, if there were any;
    " otherwise, just display a happy message.
    if len(getqflist()) > 0
        botright copen

        exec "nnoremap <silent> <buffer> q :ccl<CR>"

        redraw!
    else
        cclose
        redraw!

        echo "JSLint: " . l:fileargs . " is OK"
    endif
endfunction

" Create the vim command.
command! -bang -nargs=* -complete=file JSLint call s:JSLint('grep<bang>')
