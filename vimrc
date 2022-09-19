" Vundle
set nocompatible              " No compatibility with vi
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'gmarik/Vundle.vim'

" Core Plugins
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" Theme Plugins
Plugin 'skwp/vim-colors-solarized'
Plugin 'acarapetis/vim-colors-github'
Plugin 'taecilla/fairyfloss.vim'
Plugin 'zanglg/nova.vim'
Plugin 'sjl/badwolf'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'KeitaNakamura/neodark.vim'
Plugin 'dikiaap/minimalist'
Plugin 'davidklsn/vim-sialoquent'
Plugin 'sonjapeterson/1989.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'bling/vim-airline'
Plugin 'morhetz/gruvbox'
Plugin 'dracula/vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'arcticicestudio/nord-vim'

" Tooling Plugins
Plugin 'RRethy/vim-illuminate'
Plugin 'vim-scripts/ZoomWin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-abolish'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'xolox/vim-misc'
Plugin 'airblade/vim-gitgutter'
Plugin 'slim-template/vim-slim'
Plugin 'janko-m/vim-test'
Plugin 'vim-scripts/matchit.zip.git'
Plugin 'sjl/gundo.vim'
Plugin 'honza/vim-snippets'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'bagrat/vim-buffet'
Plugin 'tpope/vim-bundler'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'wakatime/vim-wakatime'
Plugin 'vimwiki/vimwiki'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-rhubarb'
Plugin 'jez/vim-github-hub'
Plugin 'Yggdroot/indentLine'

" Go Plugins
Plugin 'fatih/vim-go'
Plugin 'AndrewRadev/splitjoin.vim'

" Clojure Plugins
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-classpath'
Plugin 'luochen1990/rainbow'

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
set autowrite

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

set termguicolors

if strftime("%H") >= 5 && strftime("%H") <= 17
  let g:gruvbox_contrast_light = "hard"
  set background=light
  colorscheme nord
else
  let g:gruvbox_contrast_dark="soft"
  set background=dark
  colorscheme nord
endif
let mapleader = ","         " Leader key is a comma

" Airline
set laststatus=2              " Always show the statusbar
let g:airline_powerline_fonts = 1
let g:airline_detect_paste = 1 " Show paste if in paste mode
let g:airline#extensions#tabline#enabled = 1 " Show airline for the tabs too
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = 'Errors: '
let g:airline#extensions#ale#warning_symbol = 'Warnings: '

" NerdTree
nmap <silent> <leader>n :NERDTreeFind<CR> " Open close nerd tree with ,n
let g:nerdtree_tabs_open_on_console_startup = 0

" NerdTree-Tabs
" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

" vim-ale
" try to fix the file on save
let g:ale_fix_on_save = 1
" enable signs
let g:ale_set_signs = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '▲'
let g:ale_sign_style_error = '✠✠'
let g:ale_sign_style_warning = '≈≈'

" add color to the gitter bar
let g:ale_change_sign_column_color = 1

" in case a linter fail
let g:ale_cache_executable_check_failures = 1

" error format display
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" do not lint while typing
let g:ale_lint_on_text_changed = 'never'

" linters
let g:ale_linters = { 'javascript': [''], 'ruby': ['rubocop', 'rails_best_practices', 'reek'] }

" fixers

let g:ale_fixers = { 'javascript': [''], 'ruby': ['rubocop'] }

" reek linting
let g:ale_ruby_reek_show_context = 1
let g:ale_ruby_reek_show_wiki_link = 1

" Tagbar
nnoremap <silent> <leader>T :TagbarToggle<CR>

" Ctrl-P
let $FZF_DEFAULT_COMMAND= 'ag -g ""'

" Using FZF for finding files now
nnoremap <silent> <leader>t :Files .<CR>

map <leader>jm :Files app/models<CR>
map <leader>jc :Files app/controllers<CR>
map <leader>jv :Files app/views<CR>
map <leader>jh :Files app/helpers<CR>
map <leader>jS :Files app/services<CR>
map <leader>jl :Files lib<CR>
map <leader>jp :Files public<CR>
map <leader>js :Files spec<CR>
map <leader>jd :Files db<CR>
map <leader>jC :Files config<CR>
map <leader>jV :Files app/view_models<CR>
map <leader>jF :Files test/factories<CR>
map <leader>jt :Files test<CR>

"Ctrl-Shift-(M)ethod - jump to a method (tag in current file)
nnoremap <silent> <C-M> :BTags<CR>

" Buffers lookup
nnoremap <leader>b :Buffers<cr>

" Fugitive
map <leader>gb :Git blame<CR>
map <leader>gs :Git status<CR>
nmap <leader>gd :Git diff<CR>
nmap <leader>gl :Git log<CR>
nmap <leader>gc :Git commit -v<CR>
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
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
" Update sign column every quarter second
set updatetime=250
" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous

" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>GitGutterStageHunk  " git add (chunk)
nmap <Leader>gu <Plug>GitGutterUndoHunk   " git undo (chunk)

" Goodies
" treat words with dash as a word
" https://til.hashrocket.com/posts/t8osyzywau-treat-words-with-dash-as-a-word-in-vim
set iskeyword+=-
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

" list all leader keys mapping
" http://ctoomey.com/posts/an-incremental-approach-to-vim/#know-your-leader
function! ListLeaders()
  silent! redir @a
  silent! nmap <LEADER>
  silent! redir END
  silent! new
  silent! put! a
  silent! g/^s*$/d
  silent! %s/^.*,//
  silent! normal ggVg
  silent! sort
  silent! let lines = getline(1,"$")
endfunction
nnoremap <silent> <Leader>lk :call ListLeaders()<CR>

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
let g:ack_use_dispatch = 1
let g:ackpreview = 1
let g:ack_autofold_results = 1
let g:ackprg = './bin/gack'

" ZoomWim
map <leader>zw :ZoomWin<CR>

" Gitv
" Toggle Gitv in browser mode
map <leader>gv :Gitv<CR>


" VimRails
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/rails.vim
" Better key maps for switching between controller and view
nnoremap ,vv :Eview<cr>
nnoremap ,cc :Econtroller<cr>

" VimGist
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
map <leader>g :Gist<CR>

" Smart Jump
" https://github.com/MarioRicalde/dotfiles/blob/magus/vim/plugin/settings/smart_jump_to_tag.vim
" hit ,f to find the definition of the current class
" this uses ctags. the standard way to get this is Ctrl-]
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
iabbrev epry! require IEx; IEx.pry
iabbrev cl! console.log( )<left><left>
"
" Rspec Before
abbr rbf before { }<left><left>

" Open up console
nnoremap <leader>pp :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'pry'}<CR>

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

" vim-test
let test#strategy = "vtr"

map <Leader>rs :TestFile<CR>
map <Leader>rl :TestNearest<CR>

" vim-vtr
let g:VtrOrientation = "h"
let g:VtrPercentage = 45

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

" vim-Go
autocmd FileType go nmap <leader>gr <Plug>(go-run)
autocmd FileType go nmap <leader>gt <Plug>(go-test)
autocmd FileType go nmap <leader>bg <Plug>(go-build)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)

" move between errors in quick fix
autocmd FileType go map <C-n> :cnext<CR>
autocmd FileType go map <C-m> :cprevious<CR>
autocmd FileType go nnoremap <C-m> :cprevious<CR>

" jumping between files
autocmd FileType go nmap <Leader>dg <Plug>(go-doc)
autocmd Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
autocmd Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" inspecting current file
autocmd FileType go nnoremap <silent> <C-M> :GoDecls<CR>

let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'deadcode']
let g:go_dispatch_enabled = 1

let g:go_list_type = "quickfix"
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
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

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" rainbow Parentheses
let g:rainbow_active = 1

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

" vim-tmux
autocmd VimResized * :wincmd =
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
nnoremap <leader>ta :VtrAttachToPane<cr>
nnoremap <leader>td :VtrDetachRunner<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>
nmap <C-f> :VtrSendLinesToRunner<cr>

" vim-ctrlp-tjump
nnoremap <leader>f :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

" vim-workplace
noremap <Tab> :WSNext<CR>
noremap <S-Tab> :WSPrev<CR>
noremap <Leader><Tab> :WSClose<CR>
noremap <Leader><S-Tab> :WSClose!<CR>
noremap <C-t> :WSTabNew<CR>

cabbrev bonly WSBufOnly"

let g:workspace_powerline_separators = 1
let g:workspace_tab_icon = "\uf00a"
let g:workspace_left_trunc_icon = "\uf0a8"
let g:workspace_right_trunc_icon = "\uf0a9"

" splitjoin
nmap sj :SplitjoinSplit<CR>
nmap sk :SplitjoinJoin<CR>

" vim-mutant
map <Leader>mt :call RunMutationTest()<CR>
map <Leader>nt :call RunNearestMutationTest()<CR>

" vim-fzf
set rtp+=/usr/local/opt/fzf

" rubocop auto correct
" https://blog.dnsimple.com/2018/06/quick-tips-for-practical-rubocop-workflow/
function! RubocopAutocorrect()
  execute "!rubocop -a " . bufname("%")
  call SyntasticCheck()
endfunction

map <silent> <Leader>cop :call RubocopAutocorrect()<cr>")

" vim-rhubarb
nnoremap <Leader>gB :.GBrowse<CR>
" Open visual selection in the browser
vnoremap <Leader>gB :GBrowse<CR>

" vim-indent-line
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
