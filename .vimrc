" Pathogen
runtime bundle/core/pathogen/autoload/pathogen.vim

for path in ["core", "tools", "theme"] 
  call pathogen#infect("~/.vim/bundle/". path)
endfor

" Global settings
syntax enable                 " Syntax highlight
filetype plugin indent on     " Filetype detention
set nocompatible              " No compatibility with vi

set laststatus=2              " Always show the statusbar
set modelines=0
set switchbuf=useopen         " Reuse unused buffers
set encoding=utf-8            
set t_Co=256                  " Enable 256-color
set cursorline
set ttyfast                   
set scrolloff=3                
set hidden
set showmode
set showcmd
set number
set backspace=indent,eol,start
set wrap

" Wild settings
set wildmode=list:longest
set wildmenu      
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem " Disable output and VCS files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.dmg " Disable archive files
set wildignore+=*.pdf,*.ai,*.psd,*.doc,*.gdoc,*.jpeg,*.jpg,*.jpeg,*.png,*.gif " Disable archive files
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/* " Ignore bundler and sass cache
set wildignore+=*.swp,*~,._* " Disable temp and backup files
set ruler
set colorcolumn=80,100
set visualbell               " Sssshh!
set undofile                 " Persistent Undo Hisotry
set undodir=~/.vim/undo
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Tab settings
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set list
set listchars=tab:▸\ ,eol:¬

" Search settings
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Theme settings
colorscheme jellybeans
set background=dark
let g:Powerline_symbols='fancy'
let mapleader = ","         " Leader key is a comma

" Goodies
autocmd! bufwritepost .vimrc source %

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>         
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

au FocusLost * :wa " Losing focus save

nnoremap <leader>v V`]

inoremap jj <ESC> " jj same as ESC

nnoremap <Ch> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <leader>fef ggVG=

map <leader>e :quit<CR>

" File editting 
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Merge conflicts markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Adjust view ports 
map <Leader>= <C-w>=

" Fugitive
map <leader>g :Git
map <leader>gb :Gblame<CR>
map <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
map <leader>gpl :Git pull
map <leader>gp :Git push
map <leader>gaa :Git add all<CR>

" Ack
nnoremap <leader>a :Ack

" NERD_Tree
map <Leader>n :NERDTreeTabsToggle<CR>

" ZoomWim
map <leader>zw :ZoomWin<CR>

" Gitv
" Toggle Gitv in browser mode
map <leader>gv :Gitv<CR> 

" Tagbar
nnoremap <silent> <leader>rt :TagbarToggle<CR>

" Toggle relative or absolute number
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" VimRails
map <leader>rm :Rmodel<CR>
map <leader>rc :Rcontroller<CR>

" Ctrl-P
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

nnoremap <leader>. :CtrlPTag<CR>
nnoremap <leader>gb :CtrlPBufTag<cr>

" Run current spec
function! RunSingleSpec()
     exec '!rspec % -l ' . line('.')
endfunction
map <leader>t :call RunSingleSpec()<CR>
