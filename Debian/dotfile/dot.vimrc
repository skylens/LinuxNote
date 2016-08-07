syntax on              "高亮显示
set background=dark    "背景为dark
set number             "行号

"设置自动缩进
set autoindent
set cindent

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals
set nobackup
set writebackup

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>

map ^T :w!<CR>:!aspell check %<CR>:e! %<CR>

"自动添加shell python头文件
"set cursorline
autocmd BufNewFile *.py,*.sh, exec ":call SetTitle()"
let $author_name = "Dewen Qi"
let $author_email = "319085528@qq.com skylens116@outlook.com"

func SetTitle()
if &filetype == 'sh'
call setline(1,"\#######################################################################################")
call append(line("."),"\# File Name: ".expand("%"))
call append(line(".")+1,"\# Author: ".$author_name)
call append(line(".")+2,"\# mail: ".$author_email)
call append(line(".")+3,"\# Created Time: ".strftime("%c"))
call append(line(".")+4,"\#=============================================================================")
call append(line(".")+5,"\#!/bin/bash")
call append(line(".")+6,"")
else
call setline(1,"\#######################################################################################")
call append(line("."),"\# File Name: ".expand("%"))
call append(line(".")+1,"\# Author: ".$author_name)
call append(line(".")+2,"\# mail: ".$author_mail)
call append(line(".")+3,"\# Created Time: ".strftime("%c"))
call append(line(".")+4,"\#=============================================================================")
call append(line(".")+5,"\#!/usr/bin/env python")
call append(line(".")+6,"\#coding=utf8")
call append(line(".")+7,"")
endif
autocmd BufNewFile * normal G
endfunction
