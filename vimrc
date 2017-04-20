" Vundle
set nocompatible              " No compatibility with vi
filetype off

set rtp+=~/.vim/bundle/vundle/Vundle.vim
call vundle#rc()

Plugin 'gmarik/Vundle.vim'

" Core Plugins
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" Theme Plugins
Plugin 'bling/vim-airline'
Plugin 'skwp/vim-colors-solarized'
Plugin 'taecilla/fairyfloss.vim'
Plugin 'zanglg/nova.vim'
Plugin 'vim-scripts/ZoomWin'
Plugin 'sjl/badwolf'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'KeitaNakamura/neodark.vim'
Plugin 'dikiaap/minimalist'
Plugin 'davidklsn/vim-sialoquent'
Plugin 'sonjapeterson/1989.vim'

" Tooling Plugins
Plugin 'ngmy/vim-rubocop'
Plugin 'rainerborene/vim-reek'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-abolish'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'xolox/vim-misc'
Plugin 'airblade/vim-gitgutter'
Plugin 'slim-template/vim-slim'
Plugin 'gabebw/vim-spec-runner'
Plugin 'vim-scripts/matchit.zip.git'
Plugin 'sjl/gundo.vim'
Plugin 'Shougo/neocomplete'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Go Plugins
Plugin 'fatih/vim-go'
Plugin 'garyburd/go-explorer'
Plugin 'AndrewRadev/splitjoin.vim'

" Clojure Plugins
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-classpath'
Plugin 'kien/rainbow_parentheses.vim'

" Global settings
syntax enable                 " Syntax highlight
filetype plugin indent on     " Filetype detention
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
set relativenumber
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

" Show invisible characters
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
if strftime("%H") >= 5 && strftime("%H") <= 17
  colorscheme neodark
  set background=dark
else
  colorscheme neodark
  set background=dark
endif
let mapleader = ","         " Leader key is a comma

" Airline
set laststatus=2              " Always show the statusbar
let g:airline_powerline_fonts = 1
let g:airline_detect_paste = 1 " Show paste if in paste mode
let g:airline#extensions#tabline#enabled = 1 " Show airline for the tabs too

" NerdTree
nmap <silent> <leader>n :NERDTreeFind<CR> " Open close nerd tree with ,n
let g:nerdtree_tabs_open_on_console_startup = 0

" NerdTree-Tabs
" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

" Syntastic
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = '▲'
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['html'] }
" mark syntax errors with :signs
let g:syntastic_enable_signs=1
" automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
" show the error list automatically
let g:syntastic_auto_loc_list=1
" check on open and on save
let g:syntastic_check_on_open=1
" Lint for Ruby
let g:syntastic_ruby_chekers = ['mri']

" Tagbar
nnoremap <silent> <leader>T :TagbarToggle<CR>

" Ctrl-P
let g:ctrlp_match_window = 'order:ttb'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = ['ag %s -l --nocolor --hiden -g ""', '.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" Default to filename searches - so that appctrl will find application
" controller
let g:ctrlp_by_filename = 1

" We don't want to use Ctrl-p
let g:ctrlp_map = ',t'
nnoremap <silent> <leader>t :CtrlP<CR>

" Additional mapping for buffer search
nnoremap <silent> <leader>cb :CtrlPBuffer<cr>
nnoremap <silent> <C-b> :CtrlPBuffer<cr>

" Ctrl-Shift-P to clear the cache
nnoremap <silent> <C-P> :ClearCtrlPCache<cr>

map <leader>jm :CtrlP app/models<CR>
map <leader>jc :CtrlP app/controllers<CR>
map <leader>jv :CtrlP app/views<CR>
map <leader>jh :CtrlP app/helpers<CR>
map <leader>jl :CtrlP lib<CR>
map <leader>jp :CtrlP public<CR>
map <leader>js :CtrlP spec<CR>
map <leader>jd :CtrlP db<CR>
map <leader>jC :CtrlP config<CR>
map <leader>jV :CtrlP vendor<CR>
map <leader>jF :CtrlP factories<CR>
map <leader>jT :CtrlP test<CR>

"Ctrl-Shift-(M)ethod - jump to a method (tag in current file)
nnoremap <silent> <C-M> :CtrlPBufTag<CR>

"CtrlP on buffers
nnoremap <leader>b :CtrlPBufTag<cr>

" Fugitive
map <leader>gb :Gblame<CR>
map <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit -v<CR>
map <leader>gpl :Git pull
map <leader>gp :Git push
map <leader>gaa :Git add .<CR>
map <leader>gac :Git add %<CR>

" Gitgutter
hi clear SignColumn
" In vim-ariline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Goodies
autocmd! bufwritepost .vimrc source %
nnoremap <leader>vi <C-w><C-v><C-l>:e ~/.vimrc<cr> " Edit .vimrc
nnoremap <leader>w  :w<cr> " Quick option for saving
nnoremap <leader>q  ZZ<cr> " Quick option for exiting and saving

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
nnoremap gV `[v`]

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

au FocusLost * :wa " Losing focus save

nnoremap <leader>v V`]

" Move between last and current file
nnoremap <leader><leader> <c-^>

inoremap jk <ESC> " jk same as ESC

" via: http://www.bestofvim.com/tip/trailing-whitespace/
" Strip trailing whitespace
function! StripTrailingWhitespaces()
  %s/\s\+$//e
endfunction
nnoremap <silent> <Leader>w :call StripTrailingWhitespaces()<CR>

" Automatic remove whitespaces on saving
autocmd FileWritePre    * :call StripTrailingWhitespaces()
autocmd FileAppendPre   * :call StripTrailingWhitespaces()
autocmd FilterWritePre  * :call StripTrailingWhitespaces()
autocmd BufWritePre     * :call StripTrailingWhitespaces()

"https://github.com/skwp/dotfiles/blob/master/vim/settings/yadr-window-killer.vim
" Use Q to intelligently close a window
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

  " We should never bdelete a nerd tree
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif

  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction

nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

" https://github.com/jboner/vim-config/blob/master/vimrc
" Match TODOS and FIXMEs
highlight MyMatchGroup ctermbg=darkred guibg=darkred ctermfg=white guifg=white
syntax match MyMatchGroup /TODO/
syntax match MyMatchGroup /todo/
syntax match MyMatchGroup /FIXME/
syntax match MyMatchGroup /fixme/

" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
imap <C-l> <space>=><space>

" Split window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set splitbelow
set splitright

" Indent the whole file
nmap <leader>fef mmgg=G`m

" Pasting from the splat register
map <leader>p :set paste<CR>o<ESC>"*]p:set nopaste<cr>

" Quicker way to exit without saving
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

" Every time you open a git object using fugitive it creates a new buffer.
" This means that your buffer listing can quickly become swamped with
" fugitive buffers. This prevents this from becomming an issue:
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/vim-fugitive.vim
autocmd BufReadPost fugitive://* set bufhidden=delete

" Ack
nnoremap <leader>a :Ack <cword><CR>
nnoremap <leader>an :cn<CR>
let g:ackprg = 'ag --vimgrep'

" ZoomWim
map <leader>zw :ZoomWin<CR>

" Gitv
" Toggle Gitv in browser mode
map <leader>gv :Gitv<CR>


" VimRails
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/rails.vim
" Better key maps for switching between controller and view
nnoremap ,vv :Rview<cr>
nnoremap ,cc :Rcontroller<cr>

" VimGist
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
map <leader>g :Gist<CR>

" Smart Jump
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/smart_jump_to_tag.vim
" hit ,f to find the definition of the current class
" this uses ctags. the standard way to get this is Ctrl-]
nnoremap <leader>f <C-]>
" use ,F to jump to tag in a vertical split
nnoremap <leader>F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" Goto file
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/gotofile.vim
nnoremap <silent> ,gf :vertical botright wincmd F<CR>
nnoremap <silent> <C-F> :vertical botright wincmd F<CR>

" Git commit messages
" http://robots.thoughtbot.com/post/48933156625/5-useful-tips-for-a-better-commit-message
autocmd Filetype gitcommit setlocal spell textwidth=72

" Spell check for markdown
autocmd Filetype markdown setlocal spell

" Completion for spell check
set complete+=kspell

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

"Abbreviations, trigger by typing the abbreviation and hitting space
iabbrev rlb Rails.logger.banner
iabbrev rld Rails.logger.debug
iabbrev pry! require 'pry'; binding.pry
iabbrev cl! console.log( )<left><left>
"
" Rspec Before
abbr rbf before { }<left><left>

" Open up console
nmap <silent> <Leader>pp :Start pry<CR>

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
autocmd FileType ruby map <buffer> <C-j> ]m
autocmd FileType ruby map <buffer> <C-k> [m
autocmd FileType rspec map <buffer> <C-j> }
autocmd FileType rspec map <buffer> <C-k> {
autocmd FileType javascript map <buffer> <C-k> }
autocmd FileType javascript map <buffer> <C-j> {

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

" Vim-Spec-Runner
" Run current spec
au FileType ruby nmap <Leader>rs <Plug>RunCurrentSpecFile
" Run current spec line
au FileType ruby nmap <Leader>rl <Plug>RunFocusedSpec
"let g:spec_runner_dispatcher = 'Dispatch {command}'
au FileType ruby nmap <Leader>rr <Plug>RunMostRecentSpec
let g:spec_runner_preloader = ''

set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" associate *.es6 with js filetype
au BufRead,BufNewFile *.es6 setfiletype javascript

" use custom js linter from https://github.com/jaxbot/syntastic-react
let g:syntastic_javascript_checkers = ['eslint']

" Tabularize settings
" Tim Pope's alignment for tables
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Folding
set foldenable " enable fold
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent
nnoremap <Space> za

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" Vim-Go
autocmd FileType go nmap <leader>gr <Plug>(go-build)
autocmd FileType go nmap <leader>gt <Plug>(go-test)
autocmd FileType go nmap <leader>bg <Plug>(go-build)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go map <C-n> :cnext<CR>
autocmd FileType go map <C-m> :cprevious<CR>
autocmd FileType go nnoremap <C-m> :cprevious<CR>

autocmd FileType go nmap <Leader>dg <Plug>(go-doc)
autocmd Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
autocmd Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>

let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'deadcode', 'structcheck']
let g:go_dispatch_enabled = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_string_spellcheck = 1

let g:go_autodetect_gopath = 1
let g:go_doc_command = "oracle"

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

function! GoTCurrent()
	execute "Dispatch docker-compose run app go test ./" . expand("%:h")
endfunction
map <leader>gtt :call GoTCurrent() <CR>

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax clojure RainbowParenthesesLoadRound
au Syntax clojure RainbowParenthesesLoadSquare
au Syntax clojure RainbowParenthesesLoadBraces

" Neocomplete
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 1
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" For conceal markers.
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

" RuboCop
nmap <silent> <Leader>rc :RuboCop<CR>
