" ==============================================================
" Arquivo: vim-shortcuts.vim
" Autor: Bruno Franco
" Ultima_modificacao: 14-05-2025
" Download: git@github.com:brnfra
" Licence:Este arquivo é de domínio público
" Garantia: O autor não se responsabiliza por eventuais danos
"             causados pelo uso deste arquivo.
" 
" Vim global plugin for write my personal snippets for;
" 
"   - java
"   - c
"   - cpp
"   - php
"   - html 
"   - markdown 
"        _               _                _             _       
" __   _(_)_ __ ___  ___| |__   ___  _ __| |_ ___ _   _| |_ ___ 
" \ \ / / | '_ ` _ \/ __| '_ \ / _ \| '__| __/ __| | | | __/ __|
"  \ V /| | | | | | \__ \ | | | (_) | |  | || (__| |_| | |_\__ \
"   \_/ |_|_| |_| |_|___/_| |_|\___/|_|   \__\___|\__,_|\__|___/
"            
"https://vimhelp.org/usr_41.txt.html#write-plugin
"-------------------------------------------------------
inoremap <leader><leader> <Esc>/<++><cr>"_c4l
nnoremap <leader><leader> /<++><cr>"_c4l
"""ToggleHidden by @LukeSmithxyz"{{{
let s:hidden_all = 1 
function ToggleHidden()
    if s:hidden_all == 0
	let s:hidden_all = 1
	set number
	set ruler
	set relativenumber
	set laststatus=2
	set list
    else
	let s:hidden_all = 0
	set nonumber
	set noruler
	set norelativenumber
	set laststatus=0
	set nolist
    endif
endfunction
"}}}
"""ToggleFold"{{{
let s:fold_all = 1 
function ToggleFold()
    if s:fold_all == 0
	let s:fold_all = 1
	:%foldclose!
    else
	let s:fold_all = 0
	:%foldopen!
    endif
endfunction
""}}}
"""ToggleCreateFold"{{{
function ToggleCreateFold()
    if foldclosed(".") < 0
	let s:make_fold = 0
	:'<,'>fold
    else
	:normal zd
    endif
endfunction
""}}}
""OneLineAllText{{{
function OneLineAllText()
    :%j
endfunction    
""}}}
" SurroundQuotes{{{
" Percorre cada linha selecionada da selecao
function! SurroundQuotes()
    " Obtém os num das linhas corrente 
    let line_num = line(".")
    let line = getline(line_num)
    let new_line = substitute(line, ".*" , "'&'", '')
    call setline(line_num, new_line)
endfunction
" "}}}
" ConvertMarkdownTitlesoVimwikiTitles() {{{
"   /\<###\><cr> 
"endfunction
function! ConvertMarkdownTitlestoVimwikiTitles()
    for line_num in range(1, line('$'))
        " Obtém o conteúdo da linha
        let line = getline(line_num)
        " Faz a substituição se a linha contiver o padrão
        if line =~ '### \(\w\+\s\+\)*\w\+'
            let new_line = substitute(line, '### ', '', '')
	    let new_line = substitute(new_line, '.*', '=== & ===', '')
            call setline(line_num, new_line)
        elseif line =~ '## \(\w\+\s\+\)*\w\+'
            let new_line = substitute(line, '## ', '', '')
            let new_line = substitute(new_line, '.*', '== & ==', '')
            call setline(line_num, new_line)
        elseif line =~ '# \(\w\+\s\+\)*\w\+'
            let new_line = substitute(line, '# ', '', '')
            let new_line = substitute(new_line, '.*', '= & =', '')
            call setline(line_num, new_line)
	endif
	if line =~ '```'
	    let new_line = substitute(line, '```', '`', 'g')
            call setline(line_num, new_line)
	endif
	if line =~ '``'
	    let new_line = substitute(line, '``', '`', 'g')
            call setline(line_num, new_line)
	endif
	if line =~ '\*\*\*'
	    let new_line = substitute(line, '\*\*\*\+', '\*', 'g')
            call setline(line_num, new_line)
	endif
	if line =~ '\*\*'
	    let new_line = substitute(line, '\*\*', '\*', 'g')
            call setline(line_num, new_line)
	endif

        if line =~ '__'
            let new_line = substitute(line, '__', '_', 'g')
            call setline(line_num, new_line)
        endif
        if line =~ '___'
            let new_line = substitute(line, '___\+', '_', 'g')
            call setline(line_num, new_line)
        endif
    endfor

endfunction
" "}}}
"--------------------------------------------------------------------------- 
" Tip #382: Search for <cword> and replace with input() in all open buffers 
"--------------------------------------------------------------------------- 
"Replace{{{
nnoremap <leader>r :call Replace()<Enter>
vnoremap <leader>r :call Replace()<Enter>
fun! Replace() 
    let s:word = input("Replace " . expand('<cword>') . " with:") 
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge' 
    :unlet! s:word 
endfun 
""}}}
"                       -- Markdown  --{{{
"-------------------------------------------------------

" Visual surroundings
inoremap <localleader>/ </<C-X><C-O>
nnoremap <silent> vi" ?"<Enter><space>v/"<Enter><BS>
nnoremap <silent> vi' ?'<Enter><space>v/'<Enter><BS>
nnoremap <silent> vi` ?`<Enter><space>v/`<Enter><BS>
nnoremap <silent> va" ?"<Enter>v/"<Enter>
nnoremap <silent> va' ?'<Enter>v/'<Enter>
nnoremap <silent> va` ?`<Enter>v/`<Enter>
" Delete
nnoremap <silent> di" ?"<Enter><space>v/"<Enter><BS>d
nnoremap <silent> di' ?'<Enter><space>v/'<Enter><BS>d
nnoremap <silent> di` ?`<Enter><space>v/`<Enter><BS>d
nnoremap <silent> da" ?"<Enter>v/"<Enter>d
nnoremap <silent> da' ?'<Enter>v/'<Enter>d
nnoremap <silent> da` ?`<Enter>v/`<Enter>d
" Change
nnoremap <silent> ci" ?"<Enter><space>v/"<Enter><BS>c
nnoremap <silent> ci' ?'<Enter><space>v/'<Enter><BS>c
nnoremap <silent> ci` ?`<Enter><space>v/`<Enter><BS>c
nnoremap <silent> ca" ?"<Enter>v/"<Enter>c
nnoremap <silent> ca' ?'<Enter>v/'<Enter>c
nnoremap <silent> ca` ?`<Enter>v/`<Enter>c

""surround "" ou '' ss or SS for surround special chars"
"words s or "S
nnoremap <S-s> bcw''<esc>P
nnoremap <S-s>S bcw""<esc>P
nnoremap ** <esc>bcw**<esc>Pi
nnoremap __ <esc>bcw__<esc>Pi
nnoremap == <esc>bcw==<esc>Pi

"line
nnoremap <S-a> 0i'<esc>$i<Right>'<esc>
nnoremap <S-a>A 0i"<esc>$i<Right>"<esc>
nnoremap <S-b>B <esc>0i*<esc>$i<Right>*<esc>
nnoremap <S-i>I <esc>0i_<esc>$i<Right>_<esc>
nnoremap <S-t>T <esc>0i=<esc>$i<Right>=<esc>

"Problem when no words
vnoremap " c""<ESC><ESC>hp
vnoremap ' c''<ESC><ESC>hp

"line
inoremap <localleader>' <esc>0i'<esc>$i<Right>'<esc>i
inoremap <localleader>" <esc>0i"<esc>$i<Right>"<esc>i
inoremap <S-b>B <esc>0i*<esc>$i<Right>*<esc>i
inoremap <S-i>I <esc>0i_<esc>$i<Right>_<esc>i
inoremap <S-t>T <esc>0i=<esc>$i<Right>=<esc>i


autocmd Filetype markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt setlocal ts=8 sw=4 
""markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt 

"--  autocompletes
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt vnoremap ` c``<esc>hp 
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt vnoremap * c**<esc>hp
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,RMd,txt vnoremap ~ c~~~~<esc>2hp
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,RMd,txt vnoremap ^ c^^<esc>hp
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,RMd,txt vnoremap , c,,,,<esc>2hp
"vimwiki conflict
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt vnoremap + c++<esc>hp
"tables
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <leader>t "<Char-0x7c>"<++>h1"<Char-0x7c>"<++>h2"<Char-0x7c>"<Enter>
            \"<Char-0x7c>"---"<Char-0x7c>"---"<Char-0x7c>"<Enter>
            \"<Char-0x7c>"<++>c1"<Char-0x7c>"<++>c2"<Char-0x7c>"<esc>v2k0:s/"/ /g<Enter>2li
"line"
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap \n <br>
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap !i ![<++>ImgDscr](<++>link_Img)
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap !l [<++>LnkDscr](<++>link_add)
"footnote"
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap ^^ <!--Footnote 1-->link1[^<!--link1-->]<cr>[^<!--link1-->]:<!--Footnote_description--><esc>i
"custom container"
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap :: ::::::<esc>2hi
"                       }}}
" --- Compile builds --- {{{
augroup CBuild

    au FileType c,h,o nnoremap <buffer> <leader>r :!clear && gcc % -o %:r.o && ./%:r.o<cr>
    au FileType c,h,o nnoremap <buffer> <leader>b :!clear && gcc -Wall % -o %:r.o<cr>

augroup END

augroup JavaBuild
    "java"
    au FileType java nnoremap <buffer> <leader>r :!clear && javac % && java %:r<cr>
    au FileType java nnoremap <buffer> <leader>b :!clear && javac %<cr>

    "javafx"
    au FileType java nnoremap <buffer> <leader>x :!clear &&
		\ javac --module-path $PATH_TO_FX --add-modules javafx.controls % &&
		\ java --module-path $PATH_TO_FX --add-modules javafx.controls %:r<cr>
    au FileType java nnoremap <buffer> <leader>c :!clear && 
		\ javac --module-path $PATH_TO_FX --add-modules javafx.controls %<cr> 


augroup END

"  }}}"
"                       -- C --  {{{
"Head and body frequent tags
""autocmd Filetype c,h,o setlocal ts=4 sw=4 
"-- preprocessor a once
"autocmd FileType c,h,o inoremap #io #include <stdio.h><cr>
autocmd FileType c,h,o iabbrev [#str] #include <string.h><cr>
autocmd FileType c,h,o iabbrev [#mat] #include <math.h><cr>
autocmd FileType c,h,o iabbrev [#def] #define 

" basics libraries snippet
autocmd FileType c,h,o iabbrev [main] \#include <stdio.h><cr>
            \#include <stdlib.h><cr>
            \#include <math.h><cr>
            \#include <locale.h><cr>
            \setlocale(LC_ALL,"Portuguese");<cr>
            \#elif __linux__<cr>
            \#include <stdio.h><cr>
            \#include <stdlib.h><cr>
            \#include <math.h><cr>
            \#include <locale.h><cr>
            \#endif<cr><cr>
            \/*     Constants       */<cr>
            \#define EXIT_SUCCESS 0<cr>
            \int main(int argc, char *argv[]) {<cr>
            \<cr>
            \/*     Your Program Here!      */<cr>
            \<++><cr>
            \#if defined(WIN32) \|\| defined(_WIN32) \|\| defined(__WIN32__) \|\| defined(__NT__)<cr>
            \system("pause");
            \return (EXIT_SUCCESS);<cr>
            \#include <locale.h><cr>
            \setlocale(LC_ALL,"Portuguese")<cr><cr>
            \#elif __linux__<cr>
            \#define EXIT_SUCCESS 0<cr>
            \return EXIT_SUCCESS;<cr>
            \#endif<cr>
            \}

"--  tags 
autocmd FileType c,h,o iabbrev [print] printf("<++>",<++>); 
autocmd FileType c,h,o iabbrev [put] puts("<++>");
autocmd FileType c,h,o iabbrev [scanf] scanf("<++>",&<++>);<cr>fflush(stdin);<cr>
autocmd FileType c,h,o iabbrev [get] gets(<++>);<cr>fflush(stdin);<cr>
autocmd FileType c,h,o iabbrev [fget] /*aux var buff created, get <++> var from stdin*/<cr>
            \char buff[100];<cr>
            \fgets( buff , sizeof ( buff ) , stdin );<cr>
            \if ( 1 != sscanf( buff , "%[^\n]s" , <++>)){
            \	/*validate and check*/<cr>
            \	<++><cr>
            \}<cr>
            \fflush(stdin);<cr>
           
""-- loops and control flux

autocmd FileType c,h,o iabbrev [if] if(<++>){<cr>
            \<++><cr>
            \}
autocmd FileType c,h,o iabbrev [ifelse] if(<++>){<cr>
            \<++><cr>
            \} else {<cr>
            \<++><cr>
            \}<cr>

autocmd FileType c,h,o iabbrev [switch] switch (<++>){<cr>
            \	case <++>: <cr>
            \		<++>;<cr>
            \	break;<cr>
            \	case <++>: <cr>
            \		<++>;<cr>
            \	break;<cr>
            \	case <++>: <cr>
            \		<++>;<cr>
            \	break;<cr>
            \	default:<cr>
            \		<++>;<cr>
            \	break;<cr>
            \}<cr>


autocmd FileType c,h,o iabbrev [for] for(<++>;<++>;<++>){<cr>
            \	<++><cr>
            \}<cr>
autocmd FileType c,h,o iabbrev [while] while(<++>){<cr>
            \	<++><cr>
            \}<cr>
autocmd FileType c,h,o iabbrev [dowhile] do{<cr>
            \	<++><cr>
            \}while(<++>);<cr>

"" especials

autocmd FileType c,h,o iabbrev [struct] /*struct name*/ <cr>
            \struct <++>{<cr>
            \/*     types and fields    */<cr>
            \	<++><cr>
            \	<cr>
            \};<cr>

"" functions

autocmd FileType c,h,o iabbrev [type] \*<type> <name>(<parameters>)*\<cr>
            \<++> <++>(<++>,<++>){<cr>
            \<++><cr>
            \}<cr>

"-------------------Specials
"
"Head and body frequent tags
autocmd Filetype c,h,o setlocal ts=4 sw=4 
"-- preprocessor a once
"--c-support plugin
noremap <leader>t <leader>ntw

""-------------------compiling & Run

if !exists("g:gcc")
    "compilator - gcc
    let g:c_command = "gcc"
endif

function! CCompileAndBuildFile()
    silent !clear
    exec "!mkdir" . " " . "comp"
   " %:t receive file name in the tail of path %:r remove extension

    execute "!" . g:c_command . " " .expand("%:t"). " " . "-o" . " " .expand("%:r").".o"

endfunction

function! CRunFile()
    silent !clear

   "" execute "!" . g:c_command . " " . bufname("%")
    execute "!" . "\.\/" .expand("%:r").".o"

endfunction

nnoremap <buffer> <localleader>b :call CCompileAndBuildFile()<cr>
nnoremap <buffer> <localleader>e :call CRunFile()<cr>




" make files... [TODO]
"------------------------------------------}}}
"           -- JAVA --{{{      

"Main"
autocmd FileType java iabbrev [main] public static void main(String[] args){\<cr>
            \<cr>
            \<++><cr>
	    \<cr>
            \}<cr>

"class"   <c-r> o prox char é um registro
autocmd FileType java iabbrev [class] public class <c-r>=expand("%:r")<cr>{<cr>
            \<cr>
            \<++><cr>
	    \<cr>
            \}<cr>
   
                           
"		}}}
"                       -- HTML --{{{      
"-------------------------------------------------------
"Head and body frequent tags
""autocmd Filetype html setlocal ts=4 sw=4 
"-- body and head
autocmd FileType html,htm,php,sxhtml,xml iabbrev [html] <Enter>
	    \<!DOCTYPE html><Enter><html lang="pt-br"><Enter><head><Enter><!-- Required meta tags --><Enter>
            \<meta charset="utf-8"><Enter>
            \<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><Enter>
            \<meta http-equiv="X-UA-Compatible" content="IE-edge"><Enter><Enter>
            \<!--Opcional--><Enter>
            \<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" /><Enter>
            \<link rel="stylesheet" type="text/css" href="style.css"><Enter>
            \<title>My Site</title><Enter></head><Enter><body><Enter><++><Enter><Enter>
            \<script type="text/javascript" src="app.js"></script><Enter>
	    \</body><Enter></html>
"add a comment
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [!] <!-- <++> --> 
"--  tags
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [a] <a href="<++>"> <++> </a> 
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [em] <em> <++> </em> 
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [u] <u> <++> </u><esc>3hi
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [st] <strong> <++> </strong><esc>8hi
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [sc] <script> <++> </script><esc>8hi
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [p] <p> <++> </p><esc>3hi
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [span] <span> <++> </span><esc>v6hx2o<esc>p0<esc>==<esc>ki
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [i] <i> <++> </i><esc>3hi
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [b] <b> <++> </b><esc>3hi
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [sub] <sub> <++> </sub><esc>5hi
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [sup] <sup> <++> </sup><esc>5hi
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [u] <u> <++> </u><esc>3hi
"Spam definition
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [abr] <abbr> <++> </abbr><esc>6hi   
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [h1] <h1> <++> </h1>
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [h2] <h2> <++> </h2>
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [h3] <h3> <++> </h3>
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [h4] <h4> <++> </h4>
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [h5] <h5> <++> </h5>
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [div] <div> <++> </div><esc>v5hx2o<esc>p0<esc>==<esc>ki
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [amd] <amd> <++> </amd><esc>v5hx2o<esc>p0<esc>==<esc>ki


"Form
autocmd FileType html,htm,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [form] <form action="<++>" method="<++>" style="<++>"></form><esc>v6hx2o<esc>p0<esc>==<esc>ki
            \<label for="[name]">[Say Label]</label><br><esc>o
            \<input type="<++>" id="<++>" class="<++>" value="<++>"><br><esc>o
            \<input type="submit" id="<++>" class="<++>" value="[Submit]"><br><esc>ki

"Ordened List
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [olist] <ol type="<++>"><CR>
	\ <li> <++> </li><CR>
	\ </ol>
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [item] <li> <++> </li>      

"UnOrdened List
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [ulist] <ul type="<++>"> <++> </ul>

"Table
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [table] <table border="<++>" width="<++>"><CR>
	    \ <caption> <CR><!-- Describe the table --><CR></caption>
	    \ <thead><CR>
	    \ 	<tr><CR>
            \ 		<th><!--Head1 col1--> <++> </th><CR>
            \ 		<th><!--Head2 col2--> <++> </th><CR>
            \ 		<th><!--Head3 col3--> <++> </th><CR>
	    \ 	</tr><CR>
	    \ </thead><CR>
	    \ <tbody><CR>
	    \	<tr><CR>
	    \		<td><!--data1 col 1--> <++> </td><CR>
	    \		<td><!--data2 col 2--> <++> </td><CR>
	    \		<td><!--data3 col 3--> <++> </td><CR>
	    \	</tr><CR>
	    \	<tr><CR>
	    \		<td><!--data4 col 1--> <++> </td><CR>
	    \		<td><!--data5 col 2--> <++> </td><CR>
	    \		<td><!--data6 col 3--> <++> </td><CR>
	    \	</tr><CR>
	    \ </tbody><CR>
	    \ <tfoot><CR>
            \ 		<th><!--footer-header col1--> <++> </th><CR>
	    \		<td><!--footer-data col2--> <++> </td><CR>
	    \ </tfoot><CR>
	    \</table><CR>


autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [img] <img src="<++>" alt="describe_the_file"> 

"-------------------Specials
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [&] &amp;
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [<] &lt;
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [>] &gt;
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [.] &middot;
autocmd FileType html,htm,php,sxhtml,xml,markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt iabbrev [+] &nbsp;

"------------------------------------------ }}}
"                      -- PHP -- {{{ 

let php_minlines = 500
autocmd FileType php iabbrev [php] <?php <++> ?>            

" }}}

