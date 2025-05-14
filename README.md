# Shortcuts and Snippets for edition with Vim

This plugin is only a collection of snippets and shortcuts for editing **c, java, html, php and markdown** files. Nothing more. In fact, it's just a key
snippets collection.

## Installation

Copy the folder on your .vim/bundle/ folder.


```bash
mkdir -p .vim/bundle/vim-shortcuts
cd .vim/bundle/
git clone https://github.com/brnfra/vim-shortcuts.git

```

>Plug Install

Put this on your vimrc

```.vim
let g:plug_url_format = 'git@github.com:%s.git'
Plug 'brnfra/vim-shortcuts'
unlet g:plug_url_format
```

## Usage
 
When in *INSERT MODE* for the files ```.c, .java, .html, .php or .markdown ``` in **insert mode** on VIM . Like described bellow. 
Using gcc or javac compiler for run and build this. Others compilers will be add in future.
Here we are using abbrev from vim(check :help iabbrev)

Then when you type key-word(for example [html]) insert the non-keyword character(usually _\<Space\>_ or _\<ESC\>_)

## Maps 

> ``` <leader>b``` to **build**  output has the same name.
> ``` <leader>r``` to **run** to execute compiled file.

## Tags for shortcuts in Vim editing

Depends of file type. Example for _html_ files.
Just begin the tag in **insert mode** on VIM. Like described bellow, use `[TAG] + non-keyword`;
 
| Tags    | Write snippet |
| ---     | ---           |
| [html]  | html snippet  |
| [table] | table sni     |
| [!]     | comment       |
| [a]     | a             |
| [em]    | em            |
| [u]     | u             |
| [st]    | strong        |
| [sc]    | script        |
| [p]     | p             |
| [span]  | span          |
| [i]     | i             |
| [b]     | b             |
| [sub]   | sub           |
| [u]     | u             |
| [sup]   | sup           |
| [form]  | form>         |
| [abr]   | abbr          |
| [h1]    | header 1      |
| [h2]    | header 2      |
| [h3]    | header 3      |
| [h4]    | header 4      |
| [h5]    | header 5      |
| [div]   | div           |
| [amd]   | amd           |
| [php]   | php code      |
| [&]     | &amp;         |
| [<]     | &lt;          |
| [>]     | &gt;          |
| [.]     | &middot;      |
