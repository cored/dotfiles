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
colorscheme solarized
set background=light
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

" Split window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set splitbelow
set splitright

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
map <leader>gb :Gblame<CR>
map <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
map <leader>gpl :Git pull
map <leader>gp :Git push
map <leader>gaa :Git add .<CR>

" Every time you open a git object using fugitive it creates a new buffer.
" This means that your buffer listing can quickly become swamped with
" fugitive buffers. This prevents this from becomming an issue:
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/vim-fugitive.vim
autocmd BufReadPost fugitive://* set bufhidden=delete
" Ack
nnoremap <leader>a :Ack

" NERD_Tree
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/NERDtree.vim
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

" ZoomWim
map <leader>zw :ZoomWin<CR>

" Gitv
" Toggle Gitv in browser mode
map <leader>gv :Gitv<CR> 

" Tagbar
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/tagbar.vim
nnoremap <silent> ,T :TagbarToggle<CR>

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
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/rails.vim
" Better key maps for switching between controller and view
nnoremap ,vv :Rview<cr>
nnoremap ,cc :Rcontroller<cr>

" Ctrl-P
" Settings from: https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/ctrlp.vim
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Default to filename searches - so that appctrl will find application
" controller
let g:ctrlp_by_filename = 1

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlP<CR>

" Additional mapping for buffer search
nnoremap <silent> ,b :CloseSingleConque<CR>:CtrlPBuffer<cr>
nnoremap <silent> <C-b> :CloseSingleConque<CR>:CtrlPBuffer<cr>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <C-P> :ClearCtrlPCache<cr>

map ,jm :CloseSingleConque<CR>:CtrlP app/models<CR>
map ,jc :CloseSingleConque<CR>:CtrlP app/controllers<CR>
map ,jv :CloseSingleConque<CR>:CtrlP app/views<CR>
map ,jh :CloseSingleConque<CR>:CtrlP app/helpers<CR>
map ,jl :CloseSingleConque<CR>:CtrlP lib<CR>
map ,jp :CloseSingleConque<CR>:CtrlP public<CR>
map ,js :CloseSingleConque<CR>:CtrlP spec<CR>
map ,jf :CloseSingleConque<CR>:CtrlP fast_spec<CR>
map ,jd :CloseSingleConque<CR>:CtrlP db<CR>
map ,jC :CloseSingleConque<CR>:CtrlP config<CR>
map ,jV :CloseSingleConque<CR>:CtrlP vendor<CR>
map ,jF :CloseSingleConque<CR>:CtrlP factories<CR>
map ,jT :CloseSingleConque<CR>:CtrlP test<CR>

"Ctrl-Shift-(M)ethod - jump to a method (tag in current file)
nnoremap <silent> <C-M> :CloseSingleConque<CR>:CtrlPBufTag<CR>

nnoremap <leader>b :CtrlPBufTag<cr>

" Vim-Ruby-Conque
" https://github.com/skwp/vim-ruby-conque
" Crlt-Shift-R for RSpec
nmap <silent> <C-R> :call RunRspecCurrentFileConque()<CR>
" Crlt-Shift-L for RSpec Current Line
nmap <silent> <C-L> :call RunRspecCurrentLineConque()<CR>
" ,Crlt-Shift-R for Last conque command
nmap <silent> ,<C-R> :call RunLastConqueCommand()<CR>
autocmd WinEnter * stopinsert

" VimClojure
let vimclojure#HighlightBuiltins=1  " Highlight Clojure's builtins
let vimclojure#ParenRainbow=1       " Rainbow parentheses'!

" VimGist
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
map <leader>g :Gist<CR>

" Smart Jump
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/smart_jump_to_tag.vim
" hit ,f to find the definition of the current class
" this uses ctags. the standard way to get this is Ctrl-]
nnoremap <silent> ,f <C-]>

" use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" Syntastic
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/syntastic.vim
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_warnings=0

" Git commit messages
" http://robots.thoughtbot.com/post/48933156625/5-useful-tips-for-a-better-commit-message
autocmd Filetype gitcommit setlocal spell textwidth=72
