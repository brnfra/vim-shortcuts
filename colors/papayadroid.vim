" Vim color file
" Maintainer:   Bruno Franco
" Last Change:  2024 feb 09

" Only values that differ from defaults are specified.

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "papayadroid"

hi Normal       guifg=#3f1f1f guibg=#fff0c2 ctermbg=Gray ctermfg=Black
hi NonText      guibg=#d4c7a1 guifg=Brown ctermfg=Brown
hi LineNr       guibg=#d4c7a1
hi DiffDelete   guibg=LightRed guifg=Black ctermbg=DarkRed ctermfg=White
hi DiffAdd      guibg=LightGreen ctermbg=DarkGreen ctermfg=White
hi DiffChange   guibg=LightCyan3 ctermbg=DarkCyan ctermfg=White
hi DiffText     gui=NONE guibg=Gray80 ctermbg=DarkCyan ctermfg=Yellow
hi Comment      guifg=Grey
hi Constant     guifg=#7300ff gui=italic
hi String       guifg=#7300ff gui=italic
hi StatusLine   guibg=White guifg=#5f3705 cterm=bold ctermbg=Brown ctermfg=White
hi StatusLineNC gui=None guibg=Gray
hi VertSplit    gui=None guibg=Gray

hi Special          term=none   ctermfg=red      cterm=bold guifg=#00ccff       gui=bold
hi SpecialChar      term=none   ctermfg=red      cterm=bold guifg=red      gui=bold
hi SpecialKey	                                            guifg=yellow
hi Statement        term=bold   ctermfg=DarkCyan cterm=bold guifg=DarkCyan  gui=bold
hi Identifier       term=bold   ctermfg=Yellow   cterm=bold guifg=#755e00   gui=bold
hi Operator         term=bold   ctermfg=red      cterm=bold guifg=red       gui=bold
hi PreProc          term=bold   ctermfg=Yellow   cterm=bold guifg=#755e00   gui=bold
hi Type             term=bold   ctermfg=Yellow   cterm=none guifg=Yellow    gui=none
hi Number           term=none   ctermfg=red      cterm=none guifg=red       gui=None
hi Directory        term=none	ctermfg=cyan     cterm=none guifg=cyan      gui=italic
hi Titles guifg=red
