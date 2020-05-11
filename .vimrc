syntax on

" Indentation is 3 spaces
" Comments are aligned to 8 spaces
" No tabs
set shiftwidth=3
set expandtab
set smarttab
set mouse=a
set encoding=utf-8

" NASM syntax for assembler files
au BufNewFile,BufRead *.asm set filetype=nasm
