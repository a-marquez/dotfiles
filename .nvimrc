if has('nvim')
  let s:VIM_HOME=$HOME . '/.nvim'
else
  let s:VIM_HOME=$HOME . '/.vim'
endif

syntax enable

set encoding=utf-8

" show numberlines
set number

" show invisible characters
set list
set listchars=space:·,tab:▸-

" set invisible characters color
hi NonText ctermfg=236

" show commands as we type them
set showcmd

" highlight matching brackets
set showmatch

" search ignores case unless an uppercase letter used
set ignorecase
set smartcase

" show first match as search strings are typed
set incsearch


if has('nvim')
  " show all results of substitute command as it is typed
  set inccommand=split
endif

" highlight the search matches
set hlsearch

" use system clipboard
if has('mac')
  set clipboard=unnamed
elseif has('unix')
  set clipboard=unnamedplus
endif

if has("mac")
  set clipboard=unnamed
elseif has("unix")
  set clipboard=unnamedplus
endif


" disable word wrap
set nowrap

" natural split directions
set splitright
set splitbelow

" move swapfiles out of project
let &directory=s:VIM_HOME . '/swap//'

" change diff colors for legibility
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" update vim saving strategy to avoid tool watch issues - https://github.com/webpack/webpack/issues/781
set backupcopy=yes

" provide vertical help commands
cnoremap vh vert h
cnoremap vhelp vert help

" use space for leader
map ; <leader>
map ;; <leader><leader>

" use jj to exit insert mode
inoremap jj <ESC>

" duplicate lines whilst maintaining cursor position
nmap <leader>d mayyp`a
nmap <leader>D mayyP`a

" use leader-6 to edit latest alternate file
map <leader>6 :e #<CR>

" use leader-q for :qa
map <leader>q :qa<CR>

" use leader-w for :w
map <leader>w :w<CR>

" use leader-k for <C-w> similar to tmux TODO: ease into this
noremap <leader>k <C-w>

" use leader-leader for :noh
map <leader><leader> :noh<CR>

" use leader-\ to exit terminal
" tnoremap <leader>\ <C-\><C-n>
tnoremap <ESC> <C-\><C-n>
tnoremap jj <C-\><C-n>

" replace grep with silver searcher - reference: https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" automatic session saving and loading - reference: https://stackoverflow.com/questions/1642611/how-to-save-and-restore-multiple-different-sessions-in-vim/47656092#47656092
function! MakeSession(overwrite)
  let b:sessiondir = s:VIM_HOME . '/sessions' . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  if a:overwrite == 0 && !empty(glob(b:filename))
    return
  endif
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = s:VIM_HOME . "/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" add automatons for when entering or leaving Vim
if(argc() == 0)
  au VimEnter * nested :call LoadSession()
  au VimLeave * :call MakeSession(1)
else
  au VimLeave * :call MakeSession(0)
endif

" vundle
filetype off
" set rtp+=:VIM_HOME . '/bundle/Vundle.vim'
let &rtp.=',' . s:VIM_HOME . '/bundle/Vundle.vim'
call vundle#begin()

" utility essentials
Plugin 'vundlevim/vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'othree/eregex.vim'
Plugin 'roryokane/detectindent'
Plugin 'asheq/close-buffers.vim'

" utility extras
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'godlygeek/tabular.git'
Plugin 'heavenshell/vim-jsdoc'

" syntax
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'digitaltoad/vim-pug'
Plugin 'wavded/vim-stylus'
Plugin 'groenewege/vim-less'
Plugin 'chase/vim-ansible-yaml'
Plugin 'leafgarland/typescript-vim'

call vundle#end()
filetype plugin indent on

" easy motion disable default mappings
let g:EasyMotion_do_mapping = 0

" editorconfig
let g:EditorConfig_max_line_indicator = 'exceeding'

" surround swap punctuations to default to no whitespace
" TODO: fix, doesn't seem to work
" nmap ) (
" nmap } {
" nmap ] [
" nmap > <

" ale
au BufEnter *.js :ALEDisable

let g:ale_linters = {
\  'javascript': ['xo']
\}

let g:ale_fixers = {
\  'javascript': ['xo']
\}

let g:ale_fix_on_save = 1

highlight ALEError ctermbg=Red ctermfg=White
highlight ALEErrorSign ctermbg=Red ctermfg=White

map <leader>l <Plug>(ale_toggle_buffer)
map <leader>L <Plug>(ale_toggle)

" ale enable lint only on save
let g:ale_lint_on_text_changed = 'never'

" tabular mapping
map <leader>u ma:Tabularize/\|<cr>`a

" jsdoc mapping
map <leader>a <Plug>(jsdoc)

" use leader-s for easy motion sneak
map <leader>s <Plug>(easymotion-s2)
nmap <leader>s <Plug>(easymotion-overwin-f2)

" use leader-f/F for easy motion find
map <leader>f <Plug>(easymotion-fl2)
map <leader>F <Plug>(easymotion-Fl2)

" nerdcommenter disable default mappings
let g:NERDCreateDefaultMappings = 0

" nerdcommenter custom mappings
map <leader>cc <Plug>NERDCommenterComment
map <leader>cm <Plug>NERDCommenterMinimal
map <leader>ct <Plug>NERDCommenterToggle
map <leader>cu <Plug>NERDCommenterUncomment

" nerdcommenter add space before delimiters
let g:NERDSpaceDelims = 1

" NERDCommenter align delimiters together
let g:NERDDefaultAlign = 'left'

" always show airline
set laststatus=2

" allow JSX in normal JS files
let g:jsx_ext_required = 0

" gitgutter disable default mappings
let g:gitgutter_map_keys = 0

" gitgutter custom mappings
nmap <S-z> <Plug>GitGutterPrevHunk
nmap <S-x> <Plug>GitGutterNextHunk

" gitgutter stage hunk, intentionally require manual enter
nmap <leader>g :GitGutterStageHunk

" eregex disable by default to take advantage of icm
let g:eregex_default_enable = 0

" ctrlp invoke map TODO: ease into this
" let g:ctrlp_map = '<leader>p'

" ctrlp root marker
let g:ctrlp_root_markers = ['.editorconfig', 'docker-compose.yml', 'package.json']

" ctrlp only automatically switch to open files within the same tab, to treat tabs as separate views
let g:ctrlp_switch_buffer = 'e'

" ctrlp use silver searcher - reference: https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_custom_ignore = { 'dir': 'git$\|build$\|node_modules$' }
endif

" emmet settings
let g:user_emmet_settings = {
\  'javascript.jsx': {
\    'extends': 'jsx',
\    'quote_char': "'"
\  }
\}

" emmet disable jsx className
map <leader>y :let g:user_emmet_settings={}<CR>
