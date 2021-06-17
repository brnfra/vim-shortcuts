" ====================================================================
" Arquivo: vim-short-cpp.vim
" Autor: Bruno Franco
" Ultima_modificacao: 17-06-2021
" Download: git@github.com:brnfra
" Licence:Este arquivo é de domínio público
" Garantia: O autor não se responsabiliza por eventuais danos
"             causados pelo uso deste arquivo.
"
"      (_)                   | |              | |                         
"__   ___ _ __ ___ ______ ___| |__   ___  _ __| |_ ______ ___ _ __  _ __  
"\ \ / / | '_ ` _ \______/ __| '_ \ / _ \| '__| __|______/ __| '_ \| '_ \ 
" \ V /| | | | | | |     \__ \ | | | (_) | |  | |_      | (__| |_) | |_) |
"  \_/ |_|_| |_| |_|     |___/_| |_|\___/|_|   \__|      \___| .__/| .__/ 
"                                                            | |   | |    
"                                                            |_|   |_|    
""     
"
"-------------------------------------------------------
let maplocalleader = ","

" map by Luke Smith
inoremap <C-Space> <Esc>/<++><cr>"_c4l
nnoremap <localleader>r :!gcc % -o %:r.o && ./%:r.o<cr>
nnoremap <localleader>b :!gcc -Wall % -o %:r.o<cr>

"                       -- C --      {{{
"-------------------------------------------------------
"Head and body frequent tags
autocmd Filetype c,h,o setlocal ts=4 sw=4 
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

autocmd FileType c,h,o inoremap <localleader>if if(<++>){<cr>
            \<++><cr>
            \}
autocmd FileType c,h,o inoremap <localleader>ie  if(<++>){<cr>
            \<++><cr>
            \} else {<cr>
            \<++><cr>
            \}<cr>

autocmd FileType c,h,o inoremap <localleader>s switch (<++>)<cr>
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


autocmd FileType c,h,o inoremap <localleader>f for(<++>;<++>;<++>){<cr>
            \<++><cr>
            \}<cr>
autocmd FileType c,h,o inoremap <localleader>w while(<++>){<cr>
            \<++><cr>
            \}<cr>
autocmd FileType c,h,o inoremap <localleader>dw do{<cr>
            \<++><cr>
            \}while(<++>);<cr>

"" especials

autocmd FileType c,h,o inoremap <localleader>st /*struct name*/ <cr>
            \struct <++><cr>
            \{<cr>
            \/*     types and fields    */<cr>
            \<++><cr>
            \<cr>
            \};<cr>

"" functions

autocmd FileType c,h,o inoremap <localleader>F \*<type> <name>(<parameters>)*\<cr>
            \<++> <++>(<++>,<++>){<cr>
            \<++><cr>
            \}<cr>



""-------------------Specials
" make files... in future
"------------------------------------------}}}
"-------------------------------------------------------

