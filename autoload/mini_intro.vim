
" #region Guard
if exists('g:load_mini_intro')
  finish
endif
let g:load_mini_intro = 1

let s:save_cpo = &cpo
set cpo&vim
" #endregion

let s:replace_version= "%%VERSION%%"
let s:replace_vimrc= "%%VIMRC%%"

let $VIMHOME=expand('<sfile>:p:h:h:h:h')
let s:file_intro_name= 'intro-template.md'
let s:filepath_intro_default= expand('<sfile>:p:h:h').'/'.s:file_intro_name
let s:filepath_intro= $VIMHOME.'/'.s:file_intro_name

function! mini_intro#getTemplateFile()
    try
        return readfile(s:filepath_intro)
    catch
        let template= readfile(s:filepath_intro_default)
        call writefile(template, s:filepath_intro)
        return template
    endtry
endfunction
function! mini_intro#OnVimEnter()
    " Don't run if:
    " - there are commandline arguments;
    " - the buffer isn't empty (e.g. cmd | vi -);
    " - we're not invoked as vim or gvim;
    " - we're starting in insert mode.
    if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode | return | endif
    e :: Intro Page ::
    for line in mini_intro#getTemplateFile()
        if matchstr(line, s:replace_version) != ""
            let line= substitute(line, s:replace_version, systemlist('vim --version')[0], 'a')
        elseif matchstr(line, s:replace_vimrc) != ""
            let vimrc= readfile(expand('$MYVIMRC'))
            let rand= str2nr(matchstr(reltimestr(reltime()), '\v\.\zs\d+')) % ( len(vimrc) - 2 ) + 1
            let rand_line= min([ len(vimrc)-10, rand ])
            call append('$', substitute(line, s:replace_vimrc, '', 'a'))
            for line in vimrc[rand_line:rand_line+10]
                call append('$', line)
                continue
            endfor
        endif
        call append('$', line)
        if line =~ '^nnoremap' | execute line | endif
    endfor
    :1
    normal dd
    let w:scratch = 1
    setlocal bufhidden=wipe buftype=nofile nobuflisted noswapfile
        \ nocursorcolumn nocursorline nolist nonumber norelativenumber
        \ filetype=markdown foldmethod=marker foldmarker=<!--region,<!--endregion-->
        \ nomodifiable nomodified
    redraw!
endfunction

augroup mini_intro
    autocmd!
    autocmd VimEnter * call mini_intro#OnVimEnter()
augroup END

" #region Finish
let &cpo = s:save_cpo
unlet s:save_cpo
" #endregion

" vim: set tabstop=4 shiftwidth=4 textwidth=250 expandtab :
" vim>60: set foldmethod=marker foldmarker=#region,#endregion :
