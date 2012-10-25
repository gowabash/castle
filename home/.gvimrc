set nocompatible
if has("syntax")
    so ${VIMRUNTIME}/syntax/syntax.vim
endif
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" How can I make the toolbar stay hidden after a restart?
set guioptions-=T

" pathogen autoloading stuff
call pathogen#infect()

" colorscheme wombat256
colorscheme codeschool
set number
set nowrap
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set nobackup
set nohlsearch
set showmode
set cindent
set title
set tags=tags;/
filetype plugin indent on
" set guifont=Inconsolata:h16
" https://github.com/adobe/Source-Code-Pro/downloads
set guifont=Source\ Code\ Pro:h15

au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile *.ru set filetype=ruby
au BufRead,BufNewFile *.jad set filetype=java
