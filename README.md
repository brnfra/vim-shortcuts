# Shortcuts and Snippets for edit Vim files

This plugin is only a collection of snippets and shortcuts for editing **c, java, html, php and markdown** files. Nothing more. In fact, it's just a key binding collection.

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

### Documentation 

 
Just begin edit the files ```.c, .java, .html, .php or .markdown ``` in **insert mode** on VIM . Like described bellow. 
This plugin is for unix based systems. 
Using gcc or javac compiler for run and build this. Others compilers will be add in future.

Examples;

| Start with | Write complete tag |
| --- | --- |
| prt | printf("<++>",<++>); |
| puts | puts("<++>"); |
| sca | scanf("<++>",&<++>); |
|main | basic structure on unix for c lang |

- Maps 

> ``` <leader>b``` to **build**  output has the same name.
> ``` <leader>r``` to **run** to execute compiled file.

![Demo](https://github.com/brnfra/vim-short-cpp/blob/master/assets/cpp-plugin.gif)
  
# My tags shortcuts for Vim-HTML editing

## Usage

### Documentation 

Just begin the tag in **insert mode** on VIM. Like described bellow;
 
| Start with | Write complete tag | 
| --- | --- |
| \<e | \<em\> | 
| \<u | \<u\> | 
| \<s | \<strong\> | 
| \<p | \<p\> | 
| \<sp | \<span\> | 
| \<i | \<i\> | 
| \<b | \<b\> | 
| \<sub | \<sub\> | 
| \<fo | \<form\> | 
| \<html | \<html\> | 
| \<div | \<div\> | 
| \<ol | \<ol\> | 
| \<ul | \<ul\> | 
| \<ta | \<table\> |
| \<li | \<li\> | 
| \<img | \<img\> | 
| \\& | &amp; | 
| \\< | &lt; | 
| \\> | &gt; | 
| \\. | &middot; | 

![Demo](https://github.com/brnfra/vim-short-html/blob/master/assets/html-plugin.gif)
