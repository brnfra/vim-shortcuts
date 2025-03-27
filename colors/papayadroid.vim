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


hi Normal           ctermbg=Gray    ctermfg=Black   guifg=#3f1f1f   guibg=#fff0c2 
hi NonText                      ctermfg=Brown   guifg=Brown     guibg=#d4c7a1 
hi LineNr                                       guibg=#d4c7a1

hi Comment                      cterm=italic    guifg=Grey      gui=italic
"hi Constant             cterm=italic guifg=#7300ff gui=italic
hi String                       cterm=italic    guifg=#7300ff   gui=italic
hi Number           term=none       cterm=none          ctermfg=DarkRed     guifg=DarkRed   gui=none

hi DiffDelete                   ctermbg=DarkRed     ctermfg=White       guibg=LightRed  guifg=Black 

hi DiffAdd                      ctermbg=DarkGreen   ctermfg=White       guibg=LightGreen 

hi DiffChange                   ctermbg=DarkCyan    ctermfg=White       guibg=LightCyan3 
hi DiffText                     ctermbg=DarkCyan    ctermfg=Yellow      guibg=Gray80 gui=none 
hi StatusLine       cterm=bold      ctermbg=Brown       ctermfg=White       guibg=White guifg=#5f3705 

hi StatusLineNC                                                         guibg=Gray
hi VertSplit                                                            guibg=Gray

"hi Special          term=none   ctermfg=red         cterm=bold  guifg=Red       gui=bold
hi SpecialChar      term=none   ctermfg=red     cterm=bold  guifg=Red           gui=bold
hi SpecialComment   term=none   ctermfg=red     cterm=bold  guifg=Red           gui=bold
hi Tag              term=none   ctermfg=10      cterm=bold  guifg=Green         gui=bold
hi Title            term=none   ctermfg=2       cterm=bold  guifg=DArkGreen     gui=bold
hi Delimiter        term=none   ctermfg=2       cterm=bold  guifg=DarkGreen     gui=bold
hi SpecialKey	                                                guifg=Brown

"hi Identifier       term=bold   ctermfg=DarkRed     cterm=bold  guifg=#755e00   gui=bold
hi Function         term=bold   ctermfg=DarkRed     cterm=bold  guifg=#755e00   gui=bold

hi Error            term=bold   ctermbg=Yellow ctermfg=Red cterm=bold,italic  guifg=red  guibg=yellow gui=underline

hi Statement        term=bold   ctermfg=5   cterm=bold  guifg=DarkMagenta   gui=bold
hi Operator         term=bold   ctermfg=DarkRed   cterm=none  guifg=DarkRed      gui=none
hi Keyword          term=bold   ctermfg=2   cterm=bold  guifg=DarkGreen     gui=bold
hi Repeat           term=bold   ctermfg=3   cterm=bold  guifg=DarkCyan      gui=bold
hi Conditional      term=bold   ctermfg=5   cterm=bold  guifg=DarkMagenta   gui=bold
hi Label            term=bold   ctermfg=5   cterm=bold  guifg=DarkMagenta   gui=bold

hi PreProc          term=bold   ctermfg=DarkGreen   cterm=bold,italic  guifg=#755e00   gui=bold
hi PreCondit        term=bold   ctermfg=DarkGreen   cterm=bold,italic  guifg=#755e00   gui=bold

hi Type             term=bold   ctermfg=DarkGreen   cterm=none  guifg=#4c008f   gui=italic
hi Directory        term=none	ctermfg=Brown    cterm=none  guifg=Brown      gui=italic

"----------------------------------------------------------------
hi VimwikiHeader1    term=none  cterm=bold   ctermfg=0   guifg=#000FFD  gui=bold 
hi VimwikiHeader2    term=none  cterm=bold   ctermfg=0   guifg=#000379  gui=bold
hi VimwikiHeader3    term=none  cterm=bold   ctermfg=0   guifg=#aa0000  gui=bold
hi VimwikiH1Folding  term=bold  cterm=bold   ctermfg=204  guifg=#e5c07b gui=bold 
hi VimwikiH2Folding  term=bold  cterm=bold   ctermfg=204  guifg=#98c379 gui=bold
hi VimwikiH3Folding  term=bold  cterm=bold   ctermfg=204  guifg=#c678dd gui=bold
hi VimwikiLink       term=bold  cterm=italic ctermfg=204  guifg=#00655D gui=italic
hi VimwikiBold       term=bold  cterm=bold   ctermfg=204  guifg=#fe0000 gui=bold
hi VimwikiBoldItalic term=bold  cterm=bold   ctermfg=204  guifg=#ae0000 gui=bold

hi shDerefSpecial   term=bold   cterm=bold  guifg=DarkYellow  gui=italic 
hi shDerefVar       term=bold   cterm=bold  guifg=DarkGrey    gui=italic
hi shDerefVarArray  term=bold   cterm=bold  guifg=DarkGreen   gui=italic
hi shDeref          term=bold   cterm=bold  guifg=DarkRed     gui=italic
hi shDerefOp        term=bold   cterm=bold  guifg=Brown       gui=italic

" coc-vim
hi CocMenuSel       ctermfg=15 ctermbg=2 guibg=NvimDarkGrey1 guifg=LightGreen                                            
hi CocSearch        ctermfg=15 guifg=#15aabf 
