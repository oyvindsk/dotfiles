
" Inspired by:
"   http://bitbucket.org/ches/dotfiles/src/tip/.vimrc
"

" Standard ..
set nocompatible
syntax enable
set visualbell      " Dont beep, blink
set ignorecase      " Do case insensitive matching
set smartcase       " But if search contains capitals, be sensitive
set nopaste
set enc=utf8

colorscheme desert
set incsearch       " show hits while searching ..
set showmatch       " show matching bracket etc when inserting

" Colors
    "highlight LineNr  term=underline    ctermfg=grey    guifg=grey
    "highlight CursorLine    guibg=Grey10
    
" No hideous pink default autocomplete menu
highlight PMenu gui=bold guibg=#CECECE guifg=#444444

" Use attractive characters to show tabs & trailing spaces
set listchars=tab:»·,trail:·,eol:¬,nbsp:¿


" tabing.. use spaces.. always
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent

set textwidth=100 " for laptopen


" allow backspacing over everything in insert mode
" set backspace=indent,eol,start


" backup files
set backup                    " keep a backup file
set backupdir=~/.backup/      " leave all the droppings in one place



set history=500     " keep more command line history
set ruler           " show the cursor position all the time
set showcmd         " display commands as they're being entered
set scrolloff=3     " Keep some context visible when scrolling
set wildmenu        " Modern completion menu (command line)
" wildmenu does shell-style completion AND tab-through
set wildmode=list:longest,full




" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set modelines=0
set cursorline
set ttyfast
set laststatus=2
set hlsearch        " highlight search term
nnoremap <leader><space> :noh<cr>
nnoremap / /\v
vnoremap / /\v



" set relativenumber
" set undofile



" Let gf open the filename under cursor
nnoremap gf <C-W>gf

" Force :e to become :tabe
cab      e  tabe

" Let test,,, become <test></test>
imap ,,, <esc>bdwa<<esc>pa><cr></<esc>pa><esc>kA

" dont use Q for Ex mode
map Q :q

map <space> i

"  simpler than :make?
" map   <f9>   :!/usr/bin/env php %<CR> 


" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" Let tab autocomplete like ctrl-n and ctrl-p, tries to be smart
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

" Perl
"
" try to fix perl # indenting
inoremap # X#
set iskeyword+=:
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


" LaTex stuff ..
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"   filetype plugin indent on
"   
"   " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
"   " can be called correctly.
"   " set shellslash
"   
"   " IMPORTANT: grep will sometimes skip displaying the file name if you
"   " search in a singe file. This will confuse Latex-Suite. Set your grep
"   " program to always generate a file-name.
"   set grepprg=grep\ -nH\ $*
"   
"   " OPTIONAL: This enables automatic indentation as you type.
"   " covered^ filetype indent on
"   
"   " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
"   " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
"   " The following changes the default filetype back to 'tex':
"   let g:tex_flavor='latex'


