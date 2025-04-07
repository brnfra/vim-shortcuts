" Arquivo: papayadroid.vim
" Autor: Bruno Franco
" Ultima_modificacao: 06-04-2025
" Download: git@github.com:brnfra
" Licence:Este arquivo é de domínio público
" Garantia: O autor não se responsabiliza por eventuais danos
"           causados pelo uso deste script.
set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "papayadroid"


hi Normal           cterm=none 	     ctermbg=Gray    ctermfg=Black   guifg=#3f1f1f   	guibg=#fff0c2
hi NonText          cterm=none       ctermfg=Brown      guifg=Brown     	guibg=#d4c7a1
hi LineNr           cterm=none 	     guibg=#d4c7a1
hi Cursor           cterm=none       ctermfg=White ctermbg=Brown guibg=#5c0053  guifg=#dbdbdb
hi CursorColumn     guibg=LightGrey                                                                  
hi CursorLine       guibg=LightGrey                                                                  
hi ColorColumn      cterm=reverse guibg=LightGrey                                                    

" for error highlight
hi clear 		SpellBad
hi SpellBad 		cterm=standout ctermfg=1 term=underline cterm=underline
hi clear SpellCap
hi SpellCap	 	cterm=underline cterm=underline
hi clear 		SpellRare
hi SpellRare 		cterm=underline
hi clear SpellLocal
hi SpellLocal 		cterm=underline 

hi Comment          cterm=italic    guifg=DarkGreen      			gui=italic
"hi Constant             cterm=italic guifg=#7300ff gui=italic
hi String           cterm=italic    guifg=#7300ff   gui=italic
hi Number           cterm=none  ctermbg=none 	    ctermfg=DarkRed     guifg=DarkRed   gui=none

hi DiffDelete       cterm=none  ctermbg=DarkRed     ctermfg=White       guibg=LightRed  guifg=Black

hi DiffAdd          cterm=none  ctermbg=DarkGreen   ctermfg=White       guibg=LightGreen

hi DiffChange       cterm=none  ctermbg=DarkCyan    ctermfg=White       guibg=LightCyan3
hi DiffText         cterm=none  ctermbg=DarkCyan    ctermfg=Yellow      guibg=Gray80 gui=none
hi StatusLine       cterm=bold  ctermbg=Brown       ctermfg=White       guibg=White guifg=#5f3705

hi StatusLineNC      guibg=Gray
hi VertSplit         guibg=Gray

"hi Special          cterm=none   ctermfg=red         cterm=bold  guifg=Red       gui=bold
hi SpecialChar      cterm=none   ctermfg=red     cterm=bold  guifg=Red           gui=bold
hi SpecialComment   cterm=none   ctermfg=red     cterm=bold  guifg=Red           gui=bold
hi Tag              cterm=none   ctermfg=10      cterm=bold  guifg=Green         gui=bold
hi Title            cterm=none   ctermfg=2       cterm=bold  guifg=DarkGreen     gui=bold
hi Delimiter        cterm=none   ctermfg=2       cterm=bold  guifg=DarkGreen     gui=bold
hi SpecialKey                                                guifg=Brown

"hi Identifier       cterm=bold   ctermfg=DarkRed     cterm=bold  guifg=#755e00   gui=bold
hi Function         cterm=bold   ctermfg=DarkRed     cterm=bold  guifg=#755e00   gui=bold

hi Error            cterm=bold   ctermbg=Yellow ctermfg=Red cterm=bold,italic  guifg=red  guibg=yellow gui=underline

hi Statement        cterm=bold   ctermfg=5   cterm=bold  guifg=DarkMagenta   gui=bold
hi Operator         cterm=bold   ctermfg=DarkRed   cterm=none  guifg=DarkRed      gui=none
hi Keyword          cterm=bold   ctermfg=2   cterm=bold  guifg=DarkGreen     gui=bold
hi Repeat           cterm=bold   ctermfg=3   cterm=bold  guifg=DarkCyan      gui=bold
hi Conditional      cterm=bold   ctermfg=5   cterm=bold  guifg=DarkMagenta   gui=bold
hi Label            cterm=bold   ctermfg=5   cterm=bold  guifg=DarkMagenta   gui=bold

hi PreProc          cterm=bold   ctermfg=DarkGreen   cterm=bold,italic  guifg=#755e00   gui=bold
hi PreCondit        cterm=bold   ctermfg=DarkGreen   cterm=bold,italic  guifg=#755e00   gui=bold

hi Type             cterm=bold   ctermfg=DarkGreen   cterm=none  guifg=#4c008f   gui=italic
hi Directory        cterm=none   ctermfg=Brown    cterm=none  guifg=Brown      gui=italic

""----------------------------------------------------------------
hi VimwikiHeader1    cterm=none  cterm=bold   ctermfg=0   guifg=#000FFD  gui=bold
hi VimwikiHeader2    cterm=none  cterm=bold   ctermfg=0   guifg=#000379  gui=bold
hi VimwikiHeader3    cterm=none  cterm=bold   ctermfg=0   guifg=#aa0000  gui=bold
hi VimwikiH1Folding  cterm=bold  cterm=bold   ctermfg=204  guifg=#e5c07b gui=bold
hi VimwikiH2Folding  cterm=bold  cterm=bold   ctermfg=204  guifg=#98c379 gui=bold
hi VimwikiH3Folding  cterm=bold  cterm=bold   ctermfg=204  guifg=#c678dd gui=bold
hi VimwikiLink       cterm=bold  cterm=italic ctermfg=204  guifg=#00655D gui=italic
hi VimwikiBold       cterm=bold  cterm=bold   ctermfg=204  guifg=#fe0000 gui=bold
hi VimwikiBoldItalic cterm=bold  cterm=bold   ctermfg=204  guifg=#ae0000 gui=bold
"----------------------------------------------------------------
hi default link WhichKey          Function
hi default link WhichKeySeperator DiffAdded
hi default link WhichKeyGroup     Keyword
hi default link WhichKeyDesc      Identifier
hi default link WhichKeyFloating  Pmenu

"----------------------------------------------------------------

hi shDerefSpecial   cterm=bold   cterm=bold  guifg=DarkYellow  gui=italic
hi shDerefVar       cterm=bold   cterm=bold  guifg=DarkGrey    gui=italic
hi shDerefVarArray  cterm=bold   cterm=bold  guifg=DarkGreen   gui=italic
hi shDeref          cterm=bold   cterm=bold  guifg=DarkRed     gui=italic
hi shDerefOp        cterm=bold   cterm=bold  guifg=Brown       gui=italic

" coc-vim
hi CocFloating      ctermbg=DarkGrey  
hi CocMenuSel       ctermfg=15 ctermbg=2 guibg=DarkGrey guifg=LightGreen
hi CocSearch        ctermfg=15 guifg=#15aabf
