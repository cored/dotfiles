" Automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc source %

colorscheme default
set background=dark
syntax on

set nocompatible
set encoding=utf-8
filetype plugin indent on
runtime! macros/machit.vim

" use spaces rather then tabs, with a width of 2
set tabstop=2
set shiftwidth=2
set expandtab

" this will show tabs and trailing spaces
"set list
"set listchars=tab:>-,trail:-


" Auto indent after a {
set autoindent
set smartindent

" Linewidth to endless
set textwidth=0

" Do not wrap lines automatically
set nowrap

" Show line numbers by default
set number

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

set ignorecase                  " caseinsensitive searches-
set showmode                    " always show command or insert mode-
set ruler                       " show line and column information-
set showmatch                   " show matching brackets
set formatoptions=tcqor
set whichwrap=b,s,<,>,[,]       " cursors will now wrap
set incsearch

" {{{ tabbing config

" ctrl-w+n creates a new split, so I've mapped ctrl-w+t+n to create a new tab, and ctrl-w+t+t to move to the next tab
noremap <C-W>tn :tabnew<CR>
noremap <C-W>tt :tabnext<CR>

" very few schemes have tab highlighting in yet, so lets set this outselves...
hi TabLine            term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi TabLineFill        term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi TabLineSel         term=reverse  ctermfg=white ctermbg=lightblue guifg=white guibg=blue

" always show the tabline...
set showtabline=2

" }}} tabbing config

" Folding
set foldmethod=indent
set foldlevel=0
set foldnestmax=2
set fillchars=stl:_,stlnc:-,vert:\|,fold:\ ,diff:-
map F :let &fen = !&fen

" Ruby code.
augroup ruby
   autocmd BufReadPre,FileReadPre      *.rb set tabstop=2
   autocmd BufReadPre,FileReadPre      *.rb set expandtab
augroup END

" Java code.
augroup java
   autocmd BufReadPre,FileReadPre      *.java set tabstop=4
   autocmd BufReadPre,FileReadPre      *.java set expandtab
augroup END

" XML Schema goodies
ab xse <xs:element name="" type="" />

" XML Schema Datatypes
ab xss xs:string
ab xsi xs:integer
ab xsb xs:boolean

" Java goodies
ab sysout System.out.println();<esc>hhi
ab main public static void main(String[] args) { }

" Ruby goodies
iab def def<cr><cr>end
iab do do<cr><cr>end
iab each each{\|object\| }
iab eacho each do \|object\|<cr>end
iab eachwithindex each_with_index { \|object, idx\| }
iab eachwithindexo each_with_index do \|object, idx\|<cr>end 
iab inject inject { \|injection, element\| }
iab injeco inject do \|injection, element\|<cr>end

" HTML goodies
ab ac acute;

" Automatically format xml files
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" ANT build.xml files.
augroup xml
  autocmd BufReadPre,FileReadPre      build.xml set tabstop=4
augroup END

" Map keys
:map <BS> bdw
:imap <BS> <Esc>bdwa
:map <CapsLocks> <Ctrl>

" Java IDE
set tags=~/.tags
set complete=.,w,b,u,t,i

" MiniBuffer
" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1 
