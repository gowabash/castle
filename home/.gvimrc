set nocompatible
if has("syntax")
  so ${VIMRUNTIME}/syntax/syntax.vim
endif
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" How can I make the toolbar stay hidden after a restart?
set guioptions-=T

" pathogen autoloading stuff
call pathogen#infect()

"no bells of any kind
set noeb vb t_vb=

set nopaste
set number
set nowrap
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set nobackup
set nohlsearch
set cindent
set matchtime=1
set cc=100
set tags=tags;/
filetype plugin indent on
" set guifont=Inconsolata:h16
" https://github.com/adobe/Source-Code-Pro/downloads
set guifont=Source\ Code\ Pro:h15

" Go highligting
set rtp+=/usr/local/go/misc/vim


au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile *.ru set filetype=ruby
au BufRead,BufNewFile *.jad set filetype=java
"
" Octave syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

" colorscheme codeschool
" colorscheme wombat256
" colorscheme CodeFactoryv3
set background=light
colorscheme solarized

" syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_python_checkers = ['pep8']

:map ]l :lnext<CR>
:map [l :lprevious<CR>

command! GitUrl :call system("git-url " . fnamemodify(expand("%"), ":~:.") . "#L" . line("."))

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim


