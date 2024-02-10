" Vim color file
" Maintainer:   Bruno Franco
" Last Change:  2024 feb 09

" Only values that differ from defaults are specified.
	" 				cterm-colors
	"     NR-16   NR-8    COLOR NAME 
	"     0	    0	    Black
	"     1	    4	    DarkBlue
	"     2	    2	    DarkGreen
	"     3	    6	    DarkCyan
	"     4	    1	    DarkRed
	"     5	    5	    DarkMagenta
	"     6	    3	    Brown, DarkYellow
	"     7	    7	    LightGray, LightGrey, Gray, Grey
	"     8	    0*	    DarkGray, DarkGrey
	"     9	    4*	    Blue, LightBlue
	"     10	    2*	    Green, LightGreen
	"     11	    6*	    Cyan, LightCyan
	"     12	    1*	    Red, LightRed
	"     13	    5*	    Magenta, LightMagenta
	"     14	    3*	    Yellow, LightYellow
	"     15	    7*	    White

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "papayadroid"

hi Normal guifg=#3f1f1f guibg=#fff0c2 ctermbg=Gray ctermfg=Black
hi NonText guibg=#d4c7a1 guifg=Brown ctermfg=Brown
hi LineNr guibg=#d4c7a1

hi Comment              cterm=italic guifg=Grey    gui=italic
"hi Constant             cterm=italic guifg=#7300ff gui=italic
hi String               cterm=italic guifg=#7300ff gui=italic
hi Number       term=none   cterm=none   guifg=black   gui=None

hi DiffDelete   guibg=LightRed guifg=Black ctermbg=DarkRed ctermfg=White
hi DiffAdd      guibg=LightGreen ctermbg=DarkGreen ctermfg=White
hi DiffChange   guibg=LightCyan3 ctermbg=DarkCyan ctermfg=White
hi DiffText     gui=NONE guibg=Gray80 ctermbg=DarkCyan ctermfg=Yellow
hi StatusLine   guibg=White guifg=#5f3705 cterm=bold ctermbg=Brown ctermfg=White
hi StatusLineNC                                                 guibg=Gray
hi VertSplit                                                    guibg=Gray

"hi Special          term=none   ctermfg=red         cterm=bold  guifg=Red       gui=bold
hi SpecialChar      term=none   ctermfg=red         cterm=bold  guifg=Red           gui=bold
hi SpecialComment   term=none   ctermfg=red         cterm=bold  guifg=Red           gui=bold
hi Tag              term=none   ctermfg=10          cterm=bold  guifg=Green         gui=bold
hi Title            term=none   ctermfg=2           cterm=bold  guifg=DArkGreen     gui=bold
hi Delimiter        term=none   ctermfg=2           cterm=bold  guifg=DarkGreen     gui=bold
hi SpecialKey	                                                guifg=Brown

"hi Identifier       term=bold   ctermfg=DarkRed     cterm=bold  guifg=#755e00   gui=bold
hi Function         term=bold   ctermfg=DarkRed     cterm=bold  guifg=#755e00   gui=bold

hi Error         term=bold   ctermfg=Red     cterm=bold,italic  guifg=red   gui=bold

hi Statement        term=bold   ctermfg=5         cterm=bold  guifg=DarkMagenta       gui=bold
hi Operator         term=bold   ctermfg=1   cterm=bold  guifg=DarkBlue      gui=bold
hi Keyword          term=bold   ctermfg=2   cterm=bold  guifg=DarkGreen     gui=bold
hi Repeat           term=bold   ctermfg=3   cterm=bold  guifg=DarkCyan      gui=bold
hi Conditional      term=bold   ctermfg=5   cterm=bold  guifg=DarkMagenta   gui=bold
hi Label            term=bold   ctermfg=5   cterm=bold  guifg=DarkMagenta   gui=bold

hi PreProc          term=bold   ctermfg=DarkGreen   cterm=bold,italic  guifg=#755e00   gui=bold
hi PreCondit        term=bold   ctermfg=DarkGreen   cterm=bold,italic  guifg=#755e00   gui=bold

hi Type             term=bold   ctermfg=DarkGreen   cterm=none  guifg=#4c008f   gui=italic
hi Directory        term=none	ctermfg=cyan        cterm=none  guifg=cyan      gui=italic

"----------------------------------------------------------------
hi VimwikiHeader1 term=none  cterm=bold  ctermfg=0   guifg=#000FFD  gui=bold 
hi VimwikiHeader2 term=none  cterm=bold  ctermfg=0   guifg=#000379  gui=bold
hi VimwikiHeader3 term=none  cterm=bold  ctermfg=0   guifg=#aa0000  gui=bold
hi VimwikiH1Folding  term=bold  cterm=bold  ctermfg=204  guifg=#e5c07b gui=bold 
hi VimwikiH2Folding  term=bold  cterm=bold  ctermfg=204  guifg=#98c379 gui=bold
hi VimwikiH3Folding  term=bold  cterm=bold  ctermfg=204  guifg=#c678dd gui=bold
hi VimwikiLink  term=bold  cterm=italic  ctermfg=204  guifg=#00655D gui=italic
hi VimwikiBold  term=bold  cterm=bold  ctermfg=204  guifg=#E06C75 gui=bold

