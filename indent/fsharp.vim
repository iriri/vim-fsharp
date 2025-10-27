" Vim indent file
" Language: F#

if exists("b:did_indent")
   finish
endif

let s:sw = shiftwidth()

function! s:Trim(line)
   let line = substitute(a:line, '(.*)\/\/.*', '\1', '')
   return substitute(line, '\v^\s*(.{-})\s*$', '\1', '')
endfunction

function! FSharpIndent()
   let lnum = v:lnum
   let prev_nb_lnum = prevnonblank(lnum - 1)
   let prev_nb_line = s:Trim(getline(prev_nb_lnum))
   let prev_indent = indent(prev_nb_lnum)

   if prev_nb_line =~ '\s\+\(=\|{\|->\|function\|try\)$'
      return prev_indent + s:sw
   endif
   return -1
endfunction

setl inde=FSharpIndent()
let b:did_indent = 1
