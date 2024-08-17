" ==============================================================
" Arquivo: vim-shortcuts.vim
" Autor: Bruno Franco
" Ultima_modificacao: 17-08-2024
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

    " Percorre cada linha selecionada da selecao
function! SurroundQuotes()
    " Obtém os num das linhas corrente 
    let line_num = line(".")
    let line = getline(line_num)
    let new_line = substitute(line, ".*" , "'&'", '')
    call setline(line_num, new_line)
endfunction

"function ConvertMarkdownTitlesoVimwikiTitles()
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
autocmd FileType c,h,o inoremap #str #include <string.h><cr>
autocmd FileType c,h,o inoremap #mat #include <math.h><cr>
autocmd FileType c,h,o inoremap #def #define 

" basics libraries snippet
autocmd FileType c,h,o inoremap main \#include <stdio.h><cr>
            \#include <stdlib.h><cr>
            \/*     Constants       */<cr>
            \#define EXIT_SUCCESS 0<cr>
            \int main(int argc, char *argv[]) {<cr>
	    \/*	setlocale(LC_ALL, "pt_BR.UTF-8") */
            \setlocale(LC_ALL,"en_US.UTF-8");<cr>
            \<cr>
            \/*     Your Program Here!      */<cr>
            \<++><cr><cr>
            \return EXIT_SUCCESS;<cr>
            \}

"--  tags 
autocmd FileType c,h,o inoremap prt printf("<++>",<++>); 
autocmd FileType c,h,o inoremap put puts("<++>");

autocmd FileType c,h,o inoremap sca scanf("<++>",&<++>);<cr>fflush(stdin);<cr>
autocmd FileType c,h,o inoremap get gets(<++>);<cr>fflush(stdin);<cr>
autocmd FileType c,h,o inoremap fget /*aux var buff created, get <++> var from stdin*/<cr>
            \char buff[100];<cr>
            \fgets( buff , sizeof ( buff ) , stdin );<cr>
            \if ( 1 != sscanf( buff , "%[^\n]s" , <++>)){
            \/*validate and check*/<cr>
            \<++><cr>
            \}<cr>
            \fflush(stdin);<cr>
           
""-- loops and control flux

autocmd FileType c,h,o inoremap <leader>if if(<++>){<cr>
            \<++><cr>
            \}
autocmd FileType c,h,o inoremap <leader>ie  if(<++>){<cr>
            \<++><cr>
            \} else {<cr>
            \<++><cr>
            \}<cr>

autocmd FileType c,h,o inoremap <leader>s switch (<++>)<cr>
            \{<cr>
            \case <++>: <cr>
            \<++>;<cr>
            \break;<cr>
            \case <++>: <cr>
            \<++>;<cr>
            \break;<cr>
            \case <++>: <cr>
            \<++>;<cr>
            \break;<cr>
            \default:<cr>
            \<++>;<cr>
            \break;<cr>
            \}<cr>


autocmd FileType c,h,o inoremap <leader>f for(<++>;<++>;<++>){<cr>
            \<++><cr>
            \}<cr>
autocmd FileType c,h,o inoremap <leader>w while(<++>){<cr>
            \<++><cr>
            \}<cr>
autocmd FileType c,h,o inoremap <leader>dw do{<cr>
            \<++><cr>
            \}while(<++>);<cr>

"" especials

autocmd FileType c,h,o inoremap <leader>st /*struct name*/ <cr>
            \struct <++><cr>
            \{<cr>
            \/*     types and fields    */<cr>
            \<++><cr>
            \<cr>
            \};<cr>

"" functions

autocmd FileType c,h,o inoremap <leader>F \*<type> <name>(<parameters>)*\<cr>
            \<++> <++>(<++>,<++>){<cr>
            \<++><cr>
            \}<cr>

""-------------------Specials
" make files... in future
"------------------------------------------}}}
"           -- JAVA --{{{      

"Main"
autocmd FileType java inoremap main public static void main(String[] args){\<cr>
            \<cr>
            \<++><cr>
	    \<cr>
            \}<cr>

"class"   <c-r> o prox char é um registro
autocmd FileType java inoremap class public class <c-r>=expand("%:r")<cr>{<cr>
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
autocmd FileType html,htm,php,sxhtml,xml inoremap <html 
            \<!DOCTYPE html><Enter><html lang="pt-br"><Enter><head><Enter><!-- Required meta tags --><Enter>
            \<meta charset="utf-8"><Enter>
            \<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><Enter>
            \<meta http-equiv="X-UA-Compatible" content="IE-edge"><Enter><Enter>
            \<!--Opcional--><Enter>
            \<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" /><Enter>
            \<link rel="stylesheet" type="text/css" href="style.css"><Enter>
            \<title>My Site</title><Enter></head><Enter><body><Enter><Enter><Enter>
            \<script type="text/javascript" src="app.js"></script><Enter>
	    \</body><Enter></html>

"--  tags
autocmd FileType html,htm,php,sxhtml,xml inoremap <e <em></em><esc>4hi 
autocmd FileType html,htm,php,sxhtml,xml inoremap <u <u></u><esc>3hi
autocmd FileType html,htm,php,sxhtml,xml inoremap <str <strong></strong><esc>8hi
autocmd FileType html,htm,php,sxhtml,xml inoremap <scr <script></script><esc>8hi
autocmd FileType html,htm,php,sxhtml,xml inoremap <p <p><++></p><esc>3hi
autocmd FileType html,htm,php,sxhtml,xml inoremap <sp <span><++></span><esc>v6hx2o<esc>p0<esc>==<esc>ki
autocmd FileType html,htm,php,sxhtml,xml inoremap <i <i></i><esc>3hi
autocmd FileType html,htm,php,sxhtml,xml inoremap <b <b></b><esc>3hi
autocmd FileType html,htm,php,sxhtml,xml inoremap <sub <sub></sub><esc>5hi
autocmd FileType html,htm,php,sxhtml,xml inoremap <sup <sup></sup><esc>5hi
autocmd FileType html,htm,php,sxhtml,xml inoremap <u <u></u><esc>3hi
"Spam definition
autocmd FileType html,htm,php,sxhtml,xml inoremap <abr <abbr></abbr><esc>6hi   
autocmd FileType html,htm,php,sxhtml,xml inoremap <h1 <h1></h1><esc>4hi
autocmd FileType html,htm,php,sxhtml,xml inoremap <h2 <h2></h2><esc>4hi
autocmd FileType html,htm,php,sxhtml,xml inoremap <h3 <h3></h3><esc>4hi
autocmd FileType html,htm,php,sxhtml,xml inoremap <h4 <h4></h4><esc>4hi
autocmd FileType html,htm,php,sxhtml,xml inoremap <h5 <h5></h5><esc>4hi
autocmd FileType html,htm,php,sxhtml,xml inoremap <di <div><++></div><esc>v5hx2o<esc>p0<esc>==<esc>ki


"Form
autocmd FileType html,htm,sxhtml,xml inoremap <fo <form action="<++>" method="<++>" style="<++>"></form><esc>v6hx2o<esc>p0<esc>==<esc>ki
            \<label for="[name]">[Say Label]</label><br><esc>o
            \<input type="<++>" id="<++>" class="<++>" value="<++>"><br><esc>o
            \<input type="submit" id="<++>" class="<++>" value="[Submit]"><br><esc>ki

"Ordened List
autocmd FileType html,htm,php,sxhtml,xml inoremap <ol <ol type="<++>"></ol><esc>v4hx2o<esc>p0<esc>==<esc>ki
autocmd FileType html,htm,php,sxhtml,xml inoremap <li <li></li><esc>4hi      

"UnOrdened List
autocmd FileType html,htm,php,sxhtml,xml inoremap <ul <ul type="<++>"></ul><esc>v4hx2o<esc>p0<esc>==<esc>ki
autocmd FileType html,htm,php,sxhtml,xml inoremap <li <li></li><esc>4hi      

"Table
autocmd FileType html,htm,php,sxhtml,xml inoremap <ta <table border="<++>" width="<++>"></table><esc>v7hx2o<esc>p0<esc>==<esc>k>>i
            \<tr></tr><esc>v4hx2o<esc>p0<esc>==<esc>ki
            \<th></th><esc>4hi<++>[Head1]<esc>o<esc>i<th></th><esc>4hi<++>[Head2]<esc>o<esc>i<th></th><esc>4hi<++>[Head3]<esc>
autocmd FileType html,htm,php,sxhtml,xml inoremap <li <li></li><esc>4hi      
autocmd FileType html,htm,php,sxhtml,xml inoremap <img <img src="<++>" alt="description_file"> 

"-------------------Specials
autocmd FileType html,htm,php,sxhtml,xml inoremap \& &amp;
autocmd FileType html,htm,php,sxhtml,xml inoremap \< &lt;
autocmd FileType html,htm,php,sxhtml,xml inoremap \> &gt;
autocmd FileType html,htm,php,sxhtml,xml inoremap \. &middot;

"------------------------------------------ }}}
"                      -- PHP -- {{{ 

let php_minlines = 500
autocmd FileType php inoremap <? <?php<esc>2o<esc>i?><esc>ki            

" }}}
"                       -- Markdown  --{{{
"-------------------------------------------------------
"
autocmd Filetype markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt setlocal ts=8 sw=4 
""markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt 

"--  autocompletes
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap ` ``````<esc>2hi 
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap * **<esc>i
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap ** ****<esc>hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap _ __<esc>i
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap __ ____<esc>hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap ~~ ~~~~<esc>hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap ++ ++++<esc>hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap == ====<esc>hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap -- ---
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap 3# ###
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap 2# ##
"comment"
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <! <!----><esc>2hi
"tables
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <leader>t "<Char-0x7c>"head1"<Char-0x7c>"head2"<Char-0x7c>"<Enter>
            \"<Char-0x7c>"---"<Char-0x7c>"---"<Char-0x7c>"<Enter>
            \"<Char-0x7c>"<++>cell1"<Char-0x7c>"<++>cell2"<Char-0x7c>"<esc>v2k0:s/"/ /g<CR>2li
"line"
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap \n <br>
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap !i ![<++>ImgDscr](<++>link_Img)
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap !l [<++>LnkDscr](<++>link_add)
"footnote"
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap ^^ <!--Footnote 1-->link1[^<!--link1-->]<cr>[^<!--link1-->]:<!--Footnote_description--><esc>i
"custom container"
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap :: ::::::<esc>2hi
"Specials
"&"
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap \& &amp; 
"<>"
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap \< &lt;
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap \> &gt;
"no-break space"
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap \+ &nbsp;
"html utils HTML tags"
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <u <u></u><esc>3hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <s <strong></strong><esc>8hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <p <p id="" class="" style=""></p><esc>3hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <sp <span id="" class="" style=""></span><esc>v6hx2o<esc>p0<esc>==<esc>ki
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <i <i></i><esc>3hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <b <b></b><esc>3hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <sub <sub></sub><esc>5hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <sup <sup></sup><esc>5hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <u <u></u><esc>3hi
"Spam definition
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <abr <abbr></abbr><esc>6hi   
"Subjects highlights "
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <h1 <h1><++></h1><esc>4hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <h2 <h2><++></h2><esc>4hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <h3 <h3><++></h3><esc>4hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <h4 <h4><++></h4><esc>4hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <h5 <h5><++></h5><esc>4hi
"div"
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <di <div id="<++>" class="<++>" style="<++>"></div><esc>v5hx2o<esc>p0<esc>==<esc>ki
"Ordened List
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <ol <ol type="<++>"></ol><esc>v4hx2o<esc>p0<esc>==<esc>ki
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <li <li></li><esc>4hi      
"UnOrdened List
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <ul <ul type="<++>"></ul><esc>v4hx2o<esc>p0<esc>==<esc>ki
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <li <li></li><esc>4hi      
"Table
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <ta <table border="<++>" width="<++>"></table><esc>v7hx2o<esc>p0<esc>==<esc>k>>i
            \<tr></tr><esc>v4hx2o<esc>p0<esc>==<esc>ki
            \<th></th><esc>4hi<++>Col1<esc>o<esc>i<th></th><esc>4hi<++>Col2<esc>o<esc>i<th></th><esc>4hi<++>Col3<esc>
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <li <li></li><esc>4hi
autocmd FileType markdown,mdown,mkdn,md,mkd,mdwn,mdtxt,mdtext,text,Rmd,txt inoremap <am <amd></amd><esc>5hi      
"                       }}}

