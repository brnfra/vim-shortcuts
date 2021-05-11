" ====================================================================
" Arquivo: vim-short-cpp.vim
" Autor: Bruno Franco
" Ultima_modificacao: 11-05-2021
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
" map by Luke Smith
inoremap <C-Space> <Esc>/<++><cr>"_c4l
let maplocalleader = ","

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
autocmd FileType c,h,o inoremap main #if defined(WIN32) \|\| defined(_WIN32) \|\|  defined(__WIN32__) \|\| defined(__NT__)<cr>
            \#include <stdio.h><cr>
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
            \#elif __linux__<cr>
            \#define EXIT_SUCCESS 0<cr>
            \return EXIT_SUCCESS;<cr>
            \#endif<cr>
            \}

"--  tags 
autocmd FileType c,h,o inoremap prt printf("<++>",<++>); 
autocmd FileType c,h,o inoremap put puts("<++>");

autocmd FileType c,h,o inoremap sca scanf("<++>",&<++>);<cr>fflush(stdin);<cr>
autocmd FileType c,h,o inoremap get gets(<++>);<cr>fflush(stdin);<cr>
           
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

autocmd FileType c,h,o inoremap str \*struct name*\ <cr>
            \struct <++><cr>
            \{<cr>
            \\*     types and fields    *\<cr>
            \<++><cr>
            \<cr>
            \};<cr>

"" functions

autocmd FileType c,h,o inoremap <leader>F \*<type> <name>(<parameters>)*\<cr>
            \<++> <++>(<++>,<++>){<cr>
            \<++><cr>
            \}<cr>



""-------------------compiling & Run
if !exists("g:gcc")
    "compilator - gcc
    let g:c_command = "gcc"
endif
if !exists("g:out_folder")
    "compilator - gcc
    let g:out_folder = "output"
endif

function! CCompileAndBuildFile()
    silent !clear
    exec "!mkdir" . " " . g:out_folder 
   " %:t receive file name in the tail of path %:r remove extension

    execute "!" . g:c_command . " " .expand("%:t"). " " . "-o" . " " .expand("%:p:h")."/".g:out_folder."/".expand("%:r").".o"

endfunction

function! CRunFile()
    silent !clear
    silent "!"."cd ".expand("%:p:h")."/".g:out_folder."/"
    silent !clear
    execute "!" . "\./" .expand("%:r").".o"
    silent "!"."cd ".expand("%:p:h")."/"

endfunction

nnoremap <buffer> <localleader>b :call CCompileAndBuildFile()<cr>
nnoremap <buffer> <localleader>r :call CRunFile()<cr>
""-------------------Specials
" make files... in future
"------------------------------------------}}}
"-------------------------------------------------------

