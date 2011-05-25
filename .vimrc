" Standard ..
set nocompatible
syntax enable
colorscheme desert 
set visualbell
set ignorecase
set smartcase
set nopaste

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
filetype off
filetype plugin indent on
set modelines=0
set scrolloff=3
set showcmd
set wildmenu
set wildmode=list:full
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap / /\v
vnoremap / /\v



" set relativenumber
" set undofile



" La gf åpne filen under cursor
nnoremap gf <C-W>gf

" La :e bli :tabe
cab      e  tabe

" Gjør test,,, til <test></test>
imap ,,, <esc>bdwa<<esc>pa><cr></<esc>pa><esc>kA

" dont use Q for Ex mode
map Q :q

" Indent ''riktig''
set autoindent
"set cindent - bruker smartindent i stedet 
set tabstop=4
set shiftwidth=4
set expandtab

map <space> i

" enklere enn :make?
map   <f9>   :!/usr/bin/env php %<CR> 

" Perl
set iskeyword+=:
set smartindent
inoremap # X#
" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1
let perl_fold=1
let perl_fold_blocks=1
" Highlight POD correctly:
let perl_include_pod = 1
" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m


" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" Lar tab være autocomple som ctrl-n og ctrl-p, prøver å være smart ..
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
    elseif "backward" == a:direction
    return "\<c-p>"
    else
    return "\<c-n>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

" nerd tree
let NERDTreeWinPos = "right"

