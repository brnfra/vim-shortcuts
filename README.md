# My tags shortcuts for Vim-C/C++ editing


## Installation

Copy the file on your .vim/bundle/ folder.


```bash
mkdir -p .vim/bundle/vim-short-cpp
cd .vim/bundle/
git clone https://github.com/brnfra/vim-short-cpp.git

```

>Plug Install

Put this on your vimrc

```.vim
let g:plug_url_format = 'git@github.com:%s.git'
Plug 'brnfra/vim-short-cpp'
unlet g:plug_url_format
```

## Usage

### Documentation 

Just begin edit the files ```.c ``` in **insert mode** on VIM . Like described bellow. 
This plugin is for unix based systems. But may can change for windows platform.
Using gcc compiler for run and build this. Others compilers will be add in future.

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

