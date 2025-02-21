syntax on

" Source defaults
source $VIMRUNTIME/defaults.vim

" Indentation is 3 spaces
" Comments are aligned to 8 spaces
" No tabs
" set shiftwidth=3
" set expandtab
" set smarttab

" Indentation is tabs, shown as three columns.
set noexpandtab
set nosmarttab
set autoindent
set shiftwidth=3
set tabstop=3

" Send all mouse events to vim
set mouse=a

" UTF-8, not ASCII
set encoding=utf-8

" NASM syntax for assembler files
au BufNewFile,BufRead *.asm set filetype=nasm

" Yoink buffer size in lines
set viminfo='20,<500

" set syntax highlighting engine
" (rendering engine)
set re=2

" show match count
set shortmess-=S

" Other indendation styles based on filetype requirements
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
