" Vim syntax file
" Language: HTML syntax
" Maintainer: Bruno Franco
" Latest Revision: 
" OriginalfilefromMaintainer:	Lutz Eymers <ixtab@polzin.com>
" URL:	          https://aurelio.net/vim/php3.vim  	
" Email:        Subject: send syntax_vim.tgz
" Last change:	1999 Jun 14
"
" Options       php_sql_query = 1 for SQL syntax highligthing inside strings
"               php_minlines = x     to sync at least x lines backwards
"
"   2000-01-07 <verde (a) aurelio net>
" added initialization of php_minlines, php_sql_query
" added , and ; as phpOperator
" added highlight on simple html tags inside phpString* (phpStringHtml)
" added highlight for user functions                     (phpFunctionsMine) 
" added themes support                                   (php_syntax_theme)
"   the main idea is to highlight _everything_ on the file
"   comments on gray (no color)
"   available themes: forest1, forest2 
"
" just copy this file to ~/.php.vim and put this line in your ~/.vimrc:
" au! Syntax php so ~/.php.vim
"set syntax=php
"
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


"   -- PHP -- {{{ 

" Remove any old syntax stuff hanging around
syn clear

if !exists("main_syntax")
  let main_syntax = 'php'
endif

"if you'll put this file in your home dir, use absolute path to html.vim
"so <sfile>:p:h/html.vim
if has('unix')
"<++>"so /usr/share/vim/vim81/syntax/html.vim
endif

syn cluster htmlPreproc add=phpRegionInsideHtmlTags

if exists( "php_sql_query")
  if php_sql_query == 1

    "if you'll put this file in your home dir, use absolute path to html.vim
    "syn include @phpSql <sfile>:p:h/sql.vim
    if has('unix')
 "<++>"   syn include @phpSql /usr/share/vim/vim81/syntax/sql.vim
    endif
  endif
endif
syn cluster phpSql remove=sqlString,sqlComment

syn case match

" Env Variables
syn keyword phpEnvVar SERVER_SOFTWARE SERVER_NAME SERVER_URL GATEWAY_INTERFACE   contained
syn keyword phpEnvVar SERVER_PROTOCOL SERVER_PORT REQUEST_METHOD PATH_INFO  contained
syn keyword phpEnvVar PATH_TRANSLATED SCRIPT_NAME QUERY_STRING REMOTE_HOST contained
syn keyword phpEnvVar REMOTE_ADDR AUTH_TYPE REMOTE_USER CONTEN_TYPE  contained
syn keyword phpEnvVar CONTENT_LENGTH HTTPS HTTPS_KEYSIZE HTTPS_SECRETKEYSIZE  contained
syn keyword phpEnvVar HTTP_ACCECT HTTP_USER_AGENT HTTP_IF_MODIFIED_SINCE  contained
syn keyword phpEnvVar HTTP_FROM HTTP_REFERER contained

" Internal Variables
syn keyword phpIntVar GLOBALS contained
syn case ignore
syn keyword phpIntVar GLOBALS php_errmsg php_self contained

" Comment
syn region phpComment		start="/\*" skip="?>" end="\*/"  contained contains=phpTodo
syn match phpComment		"#.*$"  contained contains=phpTodo
syn match phpComment		"//.*$"  contained contains=phpTodo

" Function names
syn keyword phpFunctions  Abs contained
syn keyword phpFunctions  ada_afetch ada_autocommit ada_close ada_commit contained
syn keyword phpFunctions  ada_connect ada_exec ada_fetchrow ada_fieldname contained
syn keyword phpFunctions  ada_fieldnum ada_fieldtype ada_freeresult ada_numfields contained
syn keyword phpFunctions  ada_numrows ada_result ada_resultall ada_rollback contained
syn keyword phpFunctions  array arsort asort count current each end key ksort contained
syn keyword phpFunctions  list next pos prev reset rsort sizeof sort contained
syn keyword phpFunctions  bcadd bccomp bcdiv bcmod bcmul bcpow bcscale bcsqrt contained
syn keyword phpFunctions  bcsub contained
syn keyword phpFunctions  JDToGregorian GregorianToJD JDToJulian JulianToJD contained
syn keyword phpFunctions  JDToJewish JewishToJD JDToFrench FrenchToJD contained
syn keyword phpFunctions  JDMonthName JDDayOfWeek contained
syn keyword phpFunctions  checkdate date getdate gmdate mktime time microtime contained
syn keyword phpFunctions  set_time_limit contained
syn keyword phpFunctions  dbase_create dbase_open dbase_close dbase_pack contained
syn keyword phpFunctions  dbase_add_record dbase_delete_record dbase_get_record contained
syn keyword phpFunctions  dbase_numfields dbase_numrecords contained
syn keyword phpFunctions  dbmopen dbmclose dbmexists dbmfetch dbminsert contained
syn keyword phpFunctions  dbmreplace dbmdelete dbmfirstkey dbmnextkey dbmlist contained
syn keyword phpFunctions  chdir dir closedir opendir readdir rewindir contained
syn keyword phpFunctions  dl contained
syn keyword phpFunctions  escapeshellcmd exec system passthru virtual contained
syn keyword phpFunctions  filepro filepro_fieldname filepro_fieldtype contained
syn keyword phpFunctions  filepro_fieldwidth filepro_retrieve contained
syn keyword phpFunctions  filepro_fieldcount filepro_rowcount contained
syn keyword phpFunctions  basename chgrp chmod chown clearstatcache copy contained
syn keyword phpFunctions  dirname fclose feof fgetc fgets fegtss file contained
syn keyword phpFunctions  file_exists fileatume filectime filegroup fileinode contained
syn keyword phpFunctions  filemtime fileowner fileperms filesize filetype contained
syn keyword phpFunctions  fileumask fopen fpassthru fputs fseek ftell contained
syn keyword phpFunctions  is_dir is_executable is_file is_link is_readable contained
syn keyword phpFunctions  is_writeable link linkinfo mkdir pclose popen contained
syn keyword phpFunctions  readfile readlink rename rewind rmdir stat contained
syn keyword phpFunctions  symlink tempnam touch umask unlink contained
syn keyword phpFunctions  getallheaders header setcookie contained
syn keyword phpFunctions  GetImageSize ImageArc ImageChar ImageCharUp contained
syn keyword phpFunctions  ImageColorAllocate ImageColorTransparent  contained
syn keyword phpFunctions  ImageCopyResized ImageCreate ImageCreateFromGif contained
syn keyword phpFunctions  ImageDashedLine ImageDestroy ImageFill contained
syn keyword phpFunctions  ImageFilledPolygon ImageFilledRectangle contained
syn keyword phpFunctions  ImageFillToBorder ImageFontHeight ImageFontWidth contained
syn keyword phpFunctions  ImageGif ImageInterlace ImageLine ImageLoadFont contained
syn keyword phpFunctions  ImagePolygon ImageRectangle ImageSetPixel contained
syn keyword phpFunctions  ImageString ImageStringUp ImageSX ImageSY contained
syn keyword phpFunctions  ImageTTFText ImageColorAt ImageColorClosest contained
syn keyword phpFunctions  ImageColorExact ImageColorSet ImageColorsForIndex contained
syn keyword phpFunctions  ImageColorsTotal contained
syn keyword phpFunctions  imap_append imap_base64 imap_body imap_check contained
syn keyword phpFunctions  imap_close imap_createmailbox imap_delete contained
syn keyword phpFunctions  imap_deletemailbox imap_expunge imap_fetchbody contained
syn keyword phpFunctions  imap_fetchstructure imap_header imap_headerinfo contained
syn keyword phpFunctions  imap_headers imap_listmailbox imap_listsubscribed contained
syn keyword phpFunctions  imap_mail_copy imap_mail_move imap_num_msg contained
syn keyword phpFunctions  imap_num_recent imap_open imap_ping contained
syn keyword phpFunctions  imap_renamemailbox map_reopen imap_subscribe contained
syn keyword phpFunctions  imap_undelete imap_unsubscribe imap_qprint contained
syn keyword phpFunctions  imap_8bit contained
syn keyword phpFunctions  error_log error_reporting getenv get_cfg_var contained
syn keyword phpFunctions  get_current_user getlastmod getmyinode getmypid contained
syn keyword phpFunctions  getmyuid phpinfo phpversion putenv contained
syn keyword phpFunctions  ldap_add ldap_bind ldap_close ldap_connect contained
syn keyword phpFunctions  ldap_count_entries ldap_delete ldap_dn2ufn contained
syn keyword phpFunctions  ldap_first_attribute ldap_first_entry contained
syn keyword phpFunctions  ldap_free_entry ldap_free_result ldap_get_attributes contained
syn keyword phpFunctions  ldap_get_dn ldap_get_entries ldap_get_values contained
syn keyword phpFunctions  ldap_list ldap_modify ldap_next_attribute contained
syn keyword phpFunctions  ldap_next_entry ldap_read ldap_search contained
syn keyword phpFunctions  ldap_unbind contained
syn keyword phpFunctions  mail contained
syn keyword phpFunctions  Abs Acos Asin Atan BinDec Ceil Cos DecBin DecHex contained
syn keyword phpFunctions  DecOct Exp Floor getrandmax HexDec Log Log10 contained
syn keyword phpFunctions  max min OctDec pi pow rand round Sin Sqrt srand contained
syn keyword phpFunctions  Tan contained
syn keyword phpFunctions  sleep usleep uniqid leak contained
syn keyword phpFunctions  msql msql_close msql_connect msql_create_db contained
syn keyword phpFunctions  msql_createdb msql_data_seek msql_dbname contained
syn keyword phpFunctions  msql_drop_db msql_dropdb msql_error contained
syn keyword phpFunctions  msql_fetch_array msql_fetch_field msql_fetch_object contained
syn keyword phpFunctions  msql_fetch_row msql_fieldname msql_field_seek contained
syn keyword phpFunctions  msql_fieldtable msql_fieldtype msql_fieldflags contained
syn keyword phpFunctions  msql_fieldlen msql_free_result msql_freeresult contained
syn keyword phpFunctions  msql_list_fields msql_listfields msql_list_dbs contained
syn keyword phpFunctions  msql_listdbs msql_list_tables msql_listtables contained
syn keyword phpFunctions  msql_num_fields msql_num_rows msql_numfields contained
syn keyword phpFunctions  msql_numrows msql_pconnect msql_query contained
syn keyword phpFunctions  msql_regcase msql_result msql_select_db contained
syn keyword phpFunctions  msql_selectdb msql_tablename contained
syn keyword phpFunctions  mysqli_affected_rows mysqli_close mysqli_connect contained
syn keyword phpFunctions  mysqli_create_db mysqli_data_seek mysqli_dbname contained
syn keyword phpFunctions  mysqli_db_query mysqli_drop_db mysqli_errno contained
syn keyword phpFunctions  mysqli_error mysqli_fetch_array mysqli_fetch_field contained
syn keyword phpFunctions  mysqli_fetch_lengths mysqli_fetch_object contained
syn keyword phpFunctions  mysqli_fetch_row mysqli_field_name mysqli_field_seek contained
syn keyword phpFunctions  mysqli_field_table mysqli_field_type mysqli_field_flags contained
syn keyword phpFunctions  mysqli_field_len mysqli_free_result mysqli_insert_id contained
syn keyword phpFunctions  mysqli_list_dbs mysqli_list_tables mysqli_num_fields contained
syn keyword phpFunctions  mysqli_num_rows mysqli_pconnect mysqli_query contained
syn keyword phpFunctions  mysqli_result mysqli_select_db mysqli_tablename contained
syn keyword phpFunctions  sybase_close sybase_connect sybase_data_seek contained
syn keyword phpFunctions  sybase_fetch_array sybase_fetch_field contained
syn keyword phpFunctions  sybase_fetch_object sybase_fetch_row sybase_field_seek contained
syn keyword phpFunctions  sybase_num_fields sybase_num_rows sybase_pconnect contained
syn keyword phpFunctions  sybase_query sybase_result sybase_select_db contained
syn keyword phpFunctions  fsockopen gethostbyaddr gethostbyname openlog contained
syn keyword phpFunctions  syslog closelog debugger_on debugger_off contained
syn keyword phpFunctions  odbc_autocommit odbc_binmode odbc_close contained
syn keyword phpFunctions  odbc_close_all odbc_commit odbc_connect contained
syn keyword phpFunctions  odbc_cursor odbc_do odbc_exec odbc_execute contained
syn keyword phpFunctions  odbc_fetch_into odbc_fetch_row odbc_field_name contained
syn keyword phpFunctions  odbc_field_num odbc_field_type odbc_free_result contained
syn keyword phpFunctions  odbc_longreadlen odbc_num_fields odbc_pconnect contained
syn keyword phpFunctions  odbc_prepare odbc_num_rows odbc_result contained
syn keyword phpFunctions  odbc_result_all odbc_rollback contained
syn keyword phpFunctions  Ora_Close Ora_ColumnName Ora_ColumnType contained
syn keyword phpFunctions  Ora_Commit Ora_CommitOff Ora_CommitOn Ora_Error contained
syn keyword phpFunctions  Ora_ErrorCode Ora_Exec Ora_Fetch Ora_GetColumn contained
syn keyword phpFunctions  Ora_Logoff Ora_Logon Ora_Open Ora_Parse contained
syn keyword phpFunctions  Ora_Rollback contained
syn keyword phpFunctions  Ora_Close Ora_ColumnName Ora_ColumnType Ora_Commit contained
syn keyword phpFunctions  Ora_CommitOff Ora_CommitOn Ora_Error Ora_ErrorCode contained
syn keyword phpFunctions  Ora_Exec Ora_Fetch Ora_GetColumn Ora_Logoff contained
syn keyword phpFunctions  Ora_Logon Ora_Open Ora_Parse Ora_Rollback contained
syn keyword phpFunctions  pg_Close pg_cmdTuples pg_Connect pg_DBname contained
syn keyword phpFunctions  pg_Fetch_Array pg_Fetch_Object pg_Fetch_Row contained
syn keyword phpFunctions  pg_ErrorMessage pg_Exec pg_FieldIsNull pg_FieldName contained
syn keyword phpFunctions  pg_FieldNum pg_FieldPrtLen pg_FieldSize contained
syn keyword phpFunctions  pg_FreeResult pg_GetLastOid pg_Host pg_loclose contained
syn keyword phpFunctions  pg_locreate pg_loopen pg_loread pg_loreadall contained
syn keyword phpFunctions  pg_lounlink pg_lowrite pg_NumFields pg_NumRows contained
syn keyword phpFunctions  pg_Options pg_pConnect pg_Port pg_Result contained
syn keyword phpFunctions  pg_tty contained
syn keyword phpFunctions  ereg ereg_replace eregi eregi_replace split contained
syn keyword phpFunctions  sql_regcase contained
syn keyword phpFunctions  solid_close solid_connect solid_exec contained
syn keyword phpFunctions  solid_fetchrow solid_fieldname solid_fieldnum contained
syn keyword phpFunctions  solid_freeresult solid_numfields solid_numrows contained
syn keyword phpFunctions  solid_result contained
syn keyword phpFunctions  snmpget snmpwalk contained
syn keyword phpFunctions  AddSlashes Chop Chr crypt echo explode flush contained
syn keyword phpFunctions  htmlspecialchars htmlentities implode join contained
syn keyword phpFunctions  nl2br Ord print printf QuoteMeta rawurldecode contained
syn keyword phpFunctions  rawurlencode setlocale sprintf strchr StripSlashes contained
syn keyword phpFunctions  strlen strtok strrchr strrev strstr contained
syn keyword phpFunctions  strtolower strtoupper strtr substr ucfirst contained
syn keyword phpFunctions  md5 soundex parse_str contained
syn keyword phpFunctions  parse_url urldecode urlencode base64_encode contained
syn keyword phpFunctions  base64_decode contained
syn keyword phpFunctions  gettype intval doubleval strval is_array contained
syn keyword phpFunctions  is_double is_integer is_long is_object is_real contained
syn keyword phpFunctions  is_string isset settype empty eval contained
syn keyword phpFunctions  die contained

" Identifier
syn match  phpIdentifier "$\{1,}[a-zA-Z_][a-zA-Z0-9_]*" contained contains=phpEnvVar,phpIntVar
syn match  phpIdentifier "${"me=e-1,he=e-1 contained

" Conditional
syn keyword phpConditional  if else elseif endif switch endswitch contained

" Repeat
syn keyword phpRepeat  do for while endwhile contained

" Repeat
syn keyword phpLabel  case default switch  contained

" Statement
syn keyword phpStatement  break return continue exit contained

" Keyword
syn keyword phpKeyword var contained

" Structure
syn keyword phpStructure class extends contained

" StorageClass
syn keyword phpStorageClass global static contained

" Operator
syn match phpOperator  "[-=+%^&|*!.~?:]" contained
syn match phpOperator  "[-+*/%^&|.]=" contained
syn match phpOperator  "/[^*/]"me=e-1 contained
syn match phpOperator  "/$" contained
syn match phpOperator  "&&\|\<and\>" contained
syn match phpOperator  "||\|\<x\=or\>" contained
syn match phpRelation  "[!=<>]=" contained
syn match phpRelation  "[<>]" contained

" Include
syn keyword phpInclude  include require contained

" Define
syn keyword phpDefine  Function cfunction new contained

" Boolean
syn keyword phpBoolean true false contained

" String
syn region phpStringDouble keepend matchgroup=None start=+"+ skip=+\\\\\|\\"+  end=+"+ contains=phpStringHtml,phpIdentifier,phpSpecialChar,@phpSql contained
syn region phpStringSingle keepend matchgroup=None start=+'+ skip=+\\\\\|\\'+  end=+'+ contains=phpStringHtml,phpSpecialChar,@phpSql contained

" Number
syn match phpNumber  "-\=\<\d\+\>" contained

" Float
syn match phpFloat  "\(-\=\<\d+\|-\=\)\.\d\+\>" contained

" SpecialChar
syn match phpSpecialChar "\\[abcfnrtyv\\]" contained
syn match phpSpecialChar "\\\d\{3}" contained contains=phpOctalError
syn match phpSpecialChar "\\x[0-9a-fA-F]\{2}" contained

" Error
syn match phpOctalError "[89]" contained
syn match phpParentError "[)}\]]" contained

" Todo
syn keyword phpTodo TODO Todo todo contained

"--aurélio's hacks 
syn match   phpOperator  "[;,]" contained
syn match   phpStringHtml "<\(/\{0,1}\([biup]\|li\|ul\|h[1-6]\)\|[hb]r\)>" contained
syn case match
"user functions literally
syn keyword phpFunctionsMine  ErroSai ChkSenhaTmp GeraSenhaTmp contained
"user functions with a prefix
syn match   phpFunctionsMine  "\<\(Bd\|Num\|Html\|Ped\|Form\)[A-Z2][A-Za-z0-9_]*\>" contained
syn case ignore
"--end aurélio's hacks


" Parents
syn cluster phpInside contains=phpComment,phpFunctions,phpFunctionsMine,phpIdentifier,phpConditional,phpRepeat,phpLabel,phpStatement,phpOperator,phpRelation,phpStringSingle,phpStringDouble,phpNumber,phpFloat,phpSpecialChar,phpParent,phpParentError,phpInclude,phpKeyword,phpIdentifierParent,phpBoolean,phpStructure

syn cluster phpTop contains=@phpInside,phpDefine,phpParentError,phpStorageClass

syn region phpParent	matchgroup=Delimiter start="(" end=")" contained contains=@phpInside
syn region phpParent	matchgroup=Delimiter start="{" end="}" contained contains=@phpTop
syn region phpParent	matchgroup=Delimiter start="\[" end="\]" contained contains=@phpInside

syn region phpRegion keepend matchgroup=Delimiter start="<?\(php\)\=" skip=+".\{-}?>.\{-}"\|'.\{-}?>.\{-}'\|/\*.\{-}?>.\{-}\*/+ end="?>" contains=@phpTop
syn region phpRegion matchgroup=Delimiter start="<?\(php\)\=" end="?>" contains=@phpTop contained
syn region phpRegionInsideHtmlTags keepend matchgroup=Delimiter start="<?\(php\)\=" skip=+".\{-}?>.\{-}"\|'.\{-}?>.\{-}'\|/\*.\{-}?>.\{-}\*/+ end="?>" contains=@phpTop contained

syn region phpRegion keepend matchgroup=Delimiter start=+<script language="php">+ skip=+".\{-}</script>.\{-}"\|'.\{-}</script>.\{-}'\|/\*.\{-}</script>.\{-}\*/+ end=+</script>+ contains=@phpTop
syn region phpRegion matchgroup=Delimiter start=+<script language="php">+ end=+</script>+ contains=@phpTop contained
syn region phpRegionInsideHtmlTags keepend matchgroup=Delimiter start=+<script language="php">+ skip=+".\{-}</script>.\{-}"\|'.\{-}</script>.\{-}'\|/\*.\{-}</script>.\{-}\*/+ end=+</script>+ contains=@phpTop contained

" sync
if exists("php_minlines")
  exec "syn sync minlines=" . php_minlines
endif

if !exists("did_php_syntax_inits")
  let did_php_syntax_inits = 1

  "default colors
  if !exists("php_syntax_theme")
    hi link phpComment                   Comment
    hi link phpBoolean                   Boolean
    hi link phpStorageClass              StorageClass
    hi link phpStructure                 Structure
    hi link phpStringSingle              String
    hi link phpStringDouble              String
    hi link phpNumber                    Number
    hi link phpFloat                     Float
    hi phpIdentifier guifg=DarkGray ctermfg=Brown
    hi link phpFunctions                 Function
    hi link phpRepeat                    Repeat
    hi link phpConditional               Conditional
    hi link phpLabel                     Label
    hi link phpStatement                 Statement
    hi link phpKeyword                   Statement
    hi link phpType                      Type
    hi link phpInclude                   Include
    hi link phpDefine                    Define
    hi link phpSpecialChar               SpecialChar
    hi link phpParentError	         Error
    hi link phpOctalError	         Error
    hi link phpTodo                      Todo
    hi phpRelation guifg=SeaGreen ctermfg=DarkGreen
    hi phpOperator guifg=SeaGreen ctermfg=DarkGreen
    hi phpIntVar guifg=Red ctermfg=DarkRed
    hi phpEnvVar guifg=Red ctermfg=DarkRed
  endif

  if exists("php_syntax_theme")

    "default for all themes
    hi link phpType             Type
    hi link phpParentError	 Error
    hi link phpOctalError	 Error
    hi link phpTodo             Todo
    hi phpComment               ctermfg=gray

    hi link phpFunctionsMine     A_FunctionsMine
    hi link phpStringHtml        A_StringLight
    hi link Delimiter             A_Operator
    "--------------------------------------------
    hi link phpStringSingle      A_String 
    hi link phpStringDouble      A_String
    hi link phpNumber            A_Number
    hi link phpFloat             A_Number
    hi link phpBoolean           A_Number
    hi link phpIdentifier        A_Variable
    hi link phpIntVar            A_VariableSys
    hi link phpEnvVar            A_VariableSys
    hi link phpInclude           A_Include
    hi link phpStorageClass      A_Declare
    hi link phpStructure         A_Declare
    hi link phpDefine            A_Declare
    hi link phpFunctions         A_Functions
    hi link phpRepeat            A_Commands
    hi link phpConditional       A_Commands
    hi link phpLabel             A_Commands
    hi link phpStatement         A_Statement
    hi link phpKeyword           A_Statement
    hi link phpSpecialChar       A_SpecialChar
    hi link phpRelation          A_Operator
    hi link phpOperator          A_Operator

    if php_syntax_theme == 'forest1'
      hi A_String         ctermfg=darkcyan
      hi A_StringLight    ctermfg=lightcyan
      hi A_Number         ctermfg=darkmagenta
      hi A_Variable       ctermfg=brown
      hi A_VariableSys    ctermfg=darkmagenta
      hi A_Declare        ctermfg=white
      hi A_Functions      ctermfg=darkgreen
      hi A_FunctionsMine  ctermfg=lightgreen
      hi A_Commands       ctermfg=lightmagenta
      hi A_Statement      ctermfg=lightred
      hi A_Include        ctermfg=lightred
      hi A_SpecialChar    ctermfg=lightred
      hi A_Operator       ctermfg=white
    endif

    if php_syntax_theme == 'forest2'
      hi A_Declare        ctermfg=yellow
      hi A_String         ctermfg=darkcyan
      hi A_StringLight    ctermfg=lightcyan
      hi A_Number         ctermfg=darkmagenta
      hi A_Variable       ctermfg=darkgreen
      hi A_VariableSys    ctermfg=lightgreen
      hi A_Functions      ctermfg=darkblue
      hi A_FunctionsMine  ctermfg=lightblue
      hi A_Commands       ctermfg=yellow
      hi A_Statement      ctermfg=lightmagenta
      hi A_Include        ctermfg=lightred
      hi A_SpecialChar    ctermfg=lightred
      hi A_Operator       ctermfg=white
    endif

    " if you want to do you own theme, just copy the "if ... endif"
    " structure above and change the theme name and colors. turn syntax
    " on to vim visually show you if your color has a invalid name

  endif  
endif

"<++>"let b:current_syntax = "php"

if main_syntax == 'php'
  unlet main_syntax
endif

"}}}
