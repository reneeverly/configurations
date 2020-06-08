syntax on

" Source defaults
source $VIMRUNTIME/defaults.vim

" Indentation is 3 spaces
" Comments are aligned to 8 spaces
" No tabs
set shiftwidth=3
set expandtab
set smarttab

" Send all mouse events to vim
set mouse=a

" UTF-8, not ASCII
set encoding=utf-8

" NASM syntax for assembler files
au BufNewFile,BufRead *.asm set filetype=nasm

" Yoink buffer size in lines
set viminfo='20,<500
