" Pathogen
runtime bundle/core/pathogen/autoload/pathogen.vim

for path in ["core", "tools", "theme", "scripts"] 
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

" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
imap <C-l> <space>=><space>

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
nnoremap <leader>an :cn<CR>

" NERD_Tree
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/NERDtree.vim
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" Crtl-Shift-T for nerd tree
nmap <C-T> :NERDTreeToggle<CR>

" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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
let g:ctrlp_match_window_bottom = 0

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

" Ctrl-Shift-P to clear the cache
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
autocmd WinEnter * stopinsert
nmap <silent> ,rse :call RunRspecCurrentFileConque()<CR>
" Crlt-Shift-L for RSpec Current Line
nmap <silent> ,rsl :call RunRspecCurrentLineConque()<CR>


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

" Goto file
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/gotofile.vim
nnoremap <silent> ,gf :vertical botright wincmd F<CR>
nnoremap <silent> <C-F> :vertical botright wincmd F<CR>

" Syntastic
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/syntastic.vim
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['html'] }
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_warnings=1
" check on open and on save
let g:syntastic_check_on_open=1
" Lint for Ruby
let g:syntastic_ruby_chekers = ['mri']
" Git commit messages
" http://robots.thoughtbot.com/post/48933156625/5-useful-tips-for-a-better-commit-message
autocmd Filetype gitcommit setlocal spell textwidth=72

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git

" Shamelessly stolen from Gary Bernhardt: https://github.com/garybernhardt/dotfiles
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
  let filenames = split(status, "\n")
  if len(filenames) > 0
    exec "edit " . filenames[0]
    for filename in filenames[1:]
      exec "sp " . filename
    endfor
  end
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

nnoremap ,ocf :OpenChangedFiles<CR>

" neocomplcache
" A beter autocomplete system!

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_smart_case = 1

" default # of completions is 100, that's crazy
let g:neocomplcache_max_list = 5

" words less than 3 letters long aren't worth completing
let g:neocomplcache_auto_completion_start_length = 3

" Map standard Ctrl-N completion to Cmd-Space
inoremap <C-p> <C-n>

" This makes sure we use neocomplcache completefunc instead of
" the one in rails.vim, otherwise this plugin will crap out
let g:neocomplcache_force_overwrite_completefunc = 1

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" Prevent hanging with python: https://github.com/skwp/dotfiles/issues/163
let g:neocomplcache_omni_patterns['python'] = ''

"Abbreviations, trigger by typing the abbreviation and hitting space
iabbrev rlb Rails.logger.banner
iabbrev rld Rails.logger.debug
iabbrev pry! require 'pry'; binding.pry
iabbrev cl! console.log( )<left><left>
"
" Rspec Before
abbr rbf before { }<left><left>

" Conque
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_Color = 2
let g:ConqueTerm_ReadUnfocused = 1 " update conqueterm buffer while we're not looking (for running tests)

" Open up a variety of commands in the ConqueTerm
nmap <silent> <Leader>pp :execute 'ConqueTermSplit pry'<CR>
nmap <silent> <Leader>ml :execute 'ConqueTermSplit sml'<CR>
"
let g:ConqueTerm_SendVisKey = '<Leader>e'

" Autotag
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/autotag.vim
" Seems to have problems with some vim files
let g:autotagExcludeSuffixes="tml.xml.text.txt.vim"

" BufExplorer
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/buffexplorer.vim
map <TAB> :BufExplorer<CR>

" Rspec
" insert a before { } block around a line
nnoremap <silent> \bf ^ibefore { <esc>$a }

" Surround
" https://github.com/skwp/dotfiles/blob/master/vim/plugin/settings/yadr-keymap.vim
"  ," Surround a word with double quotes
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

" move up/down quickly by using Cmd-j, Cmd-k
" which will move us around by functions
"autocmd FileType ruby map <buffer> <D-j> ]m
"autocmd FileType ruby map <buffer> <D-k> [m
"autocmd FileType rspec map <buffer> <D-j> }
"autocmd FileType rspec map <buffer> <D-k> {
"autocmd FileType javascript map <buffer> <D-k> }
"autocmd FileType javascript map <buffer> <D-j> {

"Move back and forth through previous and next buffers
""with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. Remap this to vv and ss
" https://github.com/skwp/dotfiles/blob/master/vim/plugin/settings/yadr-keymap.vim
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" Go to last edit location with ,.
nnoremap ,. '.
