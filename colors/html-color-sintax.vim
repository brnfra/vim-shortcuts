" Vim syntax file
" Language: HTML syntax
" Maintainer: Bruno Franco
" Latest Revision: 

if exists("b:current_syntax")
  finish
endif
" Keywords
"syn keyword syntaxElementKeyword keyword1 keyword2 nextgroup=syntaxElement2

" Matches
"syn match syntaxElementMatch 'regexp' contains=syntaxElement1 nextgroup=syntaxElement2 skipwhite
"
" Regions
""syn region syntaxElementRegion start='x' end='y'

syn keyword basicLanguageKeywords DOCTYPE meta
syn keyword celBlockCmd html head body

syn region celDescBlock start="<!--" end="-->" fold transparent
syn region celDescBlock start="<#--" end="-->" fold transparent
syn match celComment '<!--' contains=celTodo

"vim higlights
"
let b:current_syntax = "cel"

hi def link celTodo        Todo
hi def link celComment     Comment
hi def link celBlockCmd    Statement
hi def link celHip         Type
hi def link celString      Constant
hi def link celDesc        PreProc
hi def link celNumber      Constant
